#!/usr/bin/python3
#  _   ___  __
# | | | \ \/ /      Prayag Jain | Hax Guru
# | |_| |\  /       YouTube: https://youtube.com/c/haxguru
# |  _  |/  \       GitHub: https://github.com/Prayag2
# |_| |_/_/\_\      Email: haxguru2@gmail.com
#
# This script will let you install your favourite theme in WPS-Office

# Imports #
import os, urllib.request


# Variables #
wps_path = "/var/lib/flatpak/app/com.wps.Office/x86_64/stable/active/files/extra/wps-office/office6/skins/"
download_url = ""


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


def main():
    
    # printing intro
    deco(r''' _   ___  __
| | | \ \/ /      Prayag Jain | Hax Guru
| |_| |\  /       YouTube: https://youtube.com/c/haxguru
|  _  |/  \       GitHub: https://github.com/Prayag2
|_| |_/_/\_\      Email: haxguru2@gmail.com
''')
    
    # Checking if WPS-Office (flatpak version) exists
    if not os.path.exists(wps_path):
        deco("WPS Office is either not installed or you have a different version.\nPlease note that this script will only work with the FLATPAK version of WPS-Office.\nRun: flatpak install com.wps.Office", top=False)
    else:
        
        

# Run #
if __name__ == '__main__':
    main()