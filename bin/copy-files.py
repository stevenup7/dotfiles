import glob
from shutil import copyfile, copytree
from inspect import getsourcefile
from pathlib import Path
import os
import hashlib

file_list = {
    ".emacs": "file",
    ".gitconfig": "file",
    ".tmux.conf": "file",
    "bin/.aliases": "file",
    ".emacs.d/sup": "folder",
}

repo = Path(os.path.dirname(getsourcefile(lambda: 0))).parent.absolute()
home = os.path.expanduser("~")


def clear_console():
    command = "clear"
    if os.name in ("nt", "dos"):  # If Machine is running on Windows, use cls
        command = "cls"
    os.system(command)


def file_as_bytes(file):
    with file:
        return file.read()


def getHash(full_path):
    filebytes = file_as_bytes(open(full_path, "rb"))
    return hashlib.md5(filebytes).hexdigest()


def toggle_dry_run(dry_run):
    return not dry_run


def copy_from_computer(dry_run):
    print("------------copying FROM computer------------")

    for f in file_list:
        src = os.path.join(home, f)
        dest = os.path.join(repo, f)
        if file_list[f] == "file":
            if dry_run:
                print(f"copying '{src}' to '{dest}'")
            else:
                print(f"copying '{src}' to '{dest}'")
                copyfile(src, dest)
        else:
            print(f"dir '{src}' to '{dest}'")
            copytree(src, dest, dirs_exist_ok=True)


def copy_if_confirmed(src, dest, dry_run, force=False):
    if force:
        copyfile(src, dest)
    else:
        srchash = getHash(src)
        desthash = getHash(dest)
        if not srchash == desthash:
            if input(f"'{src}' | '{dest}' are not equal copy anyway? y/N") == "y":
                copyfile(src, dest)


def check_for_aliases_in_bashrc():
    bashrc = os.path.join(home, ".bashrc")
    print(bashrc)
    with open(bashrc, "r") as f:
        bashrcontents = f.read()

    if not "bin/.aliases" in bashrcontents:
        print("adding aliases to bashrc")
        with open(bashrc, "a") as f:
            bashrc = f.write(
                "\n# SAU added by dotfiles script\nsource ~/bin/.aliases\n"
            )


def copy_to_computer(dry_run):
    print("------------copying TO computer------------")

    for f in file_list:
        src = os.path.join(repo, f)
        dest = os.path.join(home, f)
        if file_list[f] == "file":
            copy_if_confirmed(src, dest)
        else:
            for root, subdirs, files in os.walk(src):
                for sub_file in files:
                    srcfile = os.path.join(root, sub_file)
                    destfile = srcfile.replace(str(repo), str(home))
                    if srcfile.endswith("#") or srcfile.endswith("~"):
                        print(f"removing emacs file {srcfile}")
                        if not dry_run:
                            os.remove(srcfile)
                    else:
                        copy_if_confirmed(srcfile, destfile, dry_run)

    check_for_aliases_in_bashrc()


def show_menu(dry_run):
    clear_console()
    dry = ""
    if dry_run:
        dry = " [dryrun]"
    menu = f"""
Dotfiles admin script:
home: {home}
repo: {repo}
1) copy dotfiles from repo to your computer {dry}
2) copy dotfiles from your computer to repo {dry}
3) toggle dry run
[all ther keys quit]
"""

    print(menu)
    choice = input("pick an option:")
    if choice == "1":
        copy_to_computer(dry_run)
    elif choice == "2":
        copy_from_computer(dry_run)
    elif choice == "3":
        dry_run = toggle_dry_run(dry_run)
    else:
        exit()
    return dry_run


def init():
    dry_run = False
    while 1:
        dry_run = show_menu(dry_run)


if __name__ == "__main__":
    init()
