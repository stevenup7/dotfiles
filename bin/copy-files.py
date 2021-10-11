import glob
from shutil import copyfile, copytree
from inspect import getsourcefile
from pathlib import Path
import os
import hashlib

def file_as_bytes(file):
    with file:
        return file.read()

def getHash(full_path):
    filebytes = file_as_bytes(open(full_path, 'rb'))
    return hashlib.md5(filebytes).hexdigest()

file_list = {
    ".emacs": "file",
    ".gitconfig": "file",
    ".tmux.conf": "file",
    "bin/.aliases": "file",
    ".emacs.d/sup": "folder"
}
repo = Path(os.path.dirname(getsourcefile(lambda:0))).parent.absolute()
home = os.path.expanduser('~')

def copy_from_computer():
    print("------------copying FROM computer------------")

    for f in file_list:
        src = os.path.join(home, f)
        dest = os.path.join(repo, f)
        if file_list[f] == "file":
            print(f"copying '{src}' to '{dest}'")
            copyfile(src, dest)
        else:
            print(f"dir '{src}' to '{dest}'")
            copytree(src, dest, dirs_exist_ok=True)

def copy_if_confirmed(src, dest, force=False):
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
    print (bashrc)
    with open(bashrc, "r") as f:
        bashrcontents = f.read()
        
    if not "bin/.aliases" in bashrcontents:
        print( "adding aliases to bashrc")
        with open(bashrc, "a") as f:
            bashrc = f.write("\n# SAU added by dotfiles script\nsource ~/bin/.aliases\n" )
        
            
def copy_to_computer():
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
                        print (f"removing emacs file {srcfile}")
                        os.remove(srcfile)
                    else:
                        copy_if_confirmed (srcfile, destfile)
                    
    check_for_aliases_in_bashrc()
    
    
def init():
    menu = f"""
Dotfiles admin script {home} {repo} 
1) copy dotfiles from repo to your computer 
2) copy dotfiles from your computer to repo"""
    print (menu)
    choice = input("pick an option:")
    if choice == "1":
        copy_to_computer()
    elif choice == "2":
        copy_from_computer()
    else:
        exit()
        
if __name__ == "__main__":
    init()
