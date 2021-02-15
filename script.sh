#!/usr/bin/python3
#  _   ___  __
# | | | \ \/ /      Prayag Jain | Hax Guru
# | |_| |\  /       YouTube: https://youtube.com/c/haxguru
# |  _  |/  \       GitHub: https://github.com/Prayag2
# |_| |_/_/\_\      Email: haxguru2@gmail.com
#
# This script will let you install your favourite skin in WPS Office
# I do NOT own any skin. 
# These skins were created by Kingsoft and were only available in Windows and Mac.


# Imports #
import os, urllib.request, shutil


# Variables #
wps_path = "/var/lib/flatpak/app/com.wps.Office/x86_64/stable/active/files/extra/wps-office/office6/skins"
skins=['All Green', 'Dark (Buggy)', 'Green Cat', 'Green Soldiers', 'Midnight Gray', 'Office-like', 'Pink', 'Pink 2', 'Blocky', 'Modern', 'Teacher', 'Yellow Autumn', 'Yellow Cat']


# Functions #
def deco(text, top=True, bottom=True):
    '''
    INPUT: Text
    OUTPUT: Decorated text
    '''
    len_text = len(text)
    decorator = (70 if len_text > 70 else len_text)*'~'
    
    if top:
        print(decorator)
    print(text)
    if bottom:
        print(decorator)


def deco_input(text, top=True, bottom=True):
    deco(text, top, bottom)
    return input(": ")


def install_skin(skins, index, remove_old_backup=False, backup=True):
    chosen_skin='-'.join(skins[index-1].split(' ')).lower()

    print("Installing skin...")
    shutil.copytree(f".skins/{chosen_skin}", f"{wps_path}/{chosen_skin}")
    
    if remove_old_backup:
        shutil.rmtree('.skins/backup')

    if os.path.exists(f"{wps_path}/2019white") and backup:
        shutil.copytree(f"{wps_path}/2019white", ".skins/backup/")

    shutil.rmtree(f"{wps_path}/2019white")

    os.rename(f"{wps_path}/{chosen_skin}", f"{wps_path}/2019white")
    deco("Skin installed. Make sure to choose '2019white' skin in the skin center. Please restart WPS Office to see changes.")


def main():
    
    # printing intro
    deco(r''' _   ___  __
| | | \ \/ /      Prayag Jain | Hax Guru
| |_| |\  /       YouTube: https://youtube.com/c/haxguru
|  _  |/  \       GitHub: https://github.com/Prayag2
|_| |_/_/\_\      Email: haxguru2@gmail.com
''')
    
    # Checking if WPS Office (flatpak version) exists
    if not os.path.exists(wps_path):
        deco("WPS Office is either not installed or you have a different version.\nPlease note that this script will only work with the FLATPAK version of WPS-Office.\nRun: flatpak install com.wps.Office", top=False)

    else:
        print(f"Choose a skin:")
        for i, text in enumerate(skins):
            print(f"{i+1}) {text}")
        
        index = int(input("Enter skin number: "))
        confirm = input(f"Do you really want to install \"{skins[index - 1]}\"? (y/n): ")

        if confirm == 'y':
            install_skin(skins, index)
        else:
            print("Aborting...")
        

# Run #
if __name__ == '__main__':
    if os.path.exists('.skins/backup'):
        backup_ask = deco_input("Backup skin found! Would you like to restore your old skin? (y/n): ")

        if backup_ask == 'y':
            install_skin(['backup'], 1, remove_old_backup=True, backup=False)
            deco("Skin restored!", top=False)

        elif backup_ask == 'n':
            continue_confirm = deco_input("This will delete the old backup. Are you sure you want to continue? (y/n): ")
            if continue_confirm == 'y':
                shutil.rmtree('.skins/backup')
                main()
            else:
                deco('Aborting setup...')
                quit()
    else:
        main()