#!/bin/bash
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'
echo -e ${RED}"#######################################################"                                                    
echo -e ${CP}"          _ ____                                       #"
echo -e ${CP}"         | / ___|  ___ __ _ _ __  _ __   ___ _ __      #"
echo -e ${CP}"     __  | \___ \ / __/ _  |  _ \| '_ \ / _ \  __|     #"
echo -e ${CP}"     | |_| |___) | (_| (_| | | | | | | |  __/ |        #"
echo -e ${CP}"      \___/|____/ \___\__,_|_| |_|_| |_|\___|_|        #"
echo -e ${BLUE}"      A FramWork For Scanning JavaScript Files To      #"
echo -e ${BLUE}"          Find API keys, EndPoints etc.                #"
echo -e ${ORANGE}"         Coded By: Machine404                          #"
echo -e ${GREEN}"         https://facebook.com/unknownclay              #"
echo -e ${RED}"#######################################################\n"										
sleep 1
d=$(date +"%b-%d-%y %H:%M")

echo -e ${BLUE}"[+]Installation  Started On:  $d \n"
sleep 1


echo -e ${ORANGE}"[+]Installing SubJs \n"
installing_subjs(){
command -v "subjs" >/dev/null 2>&1

if [ $? -ne 0 ]; then
      GO111MODULE=on go get -u -v github.com/lc/subjs   > /dev/null 2>&1
      else
      echo -e ${CP}"...........subjs already installed.........\n"
  fi
}
installing_subjs
sleep 1
echo -e ${GREEN}"[+]Installing LinkFinder\n "
installing_LinkFinder(){
    if [  -d ~/jstools/LinkFinder ]; then
    
    echo -e ${YELLOW}".............Linkfinder already Exists..................\n"
    else
    
    mkdir -p ~/jstools
    cd ~/jstools
    git clone https://github.com/GerbenJavado/LinkFinder.git
    cd LinkFinde*
    sudo python setup.py install 
    pip3 install -r requirements.txt
    echo -e ${CP}"...........LinkFinder installed Successfully............\n"
    
 fi
}
installing_LinkFinder

sleep 2
echo -e ${PINK}"[+]Installing SecretFinder\n"
installing_SecretFinder(){
     if [ -d ~/jstools/SecretFinder ]; then
     echo -e ${CP}".............SecretFinder already Exists................\n"
     else
    
    mkdir -p ~/jstools
     cd ~/jstools
     git clone https://github.com/m4ll0k/SecretFinder.git
     cd Secret*
     python -m pip install -r requirements.txt 
     pip install -r requirements.txt
     echo -e ${CP}".......SecretFinder installed Successfully..........\n"
 fi
}
installing_SecretFinder
sleep 1
echo -e ${BLUE}"[+]Installing relativ-url-extractor\n"
installing_urlfromjs(){
         if [ -d ~/jstools/relative-url-extractor ]; then
         
         echo -e ${CP}"............relative-url-extractor already Exists..........\n"
         
         else
    
         mkdir -p ~/jstools
         cd ~/jstools
         git clone https://github.com/jobertabma/relative-url-extractor.git
         echo -e ${CP}".......urlfromjs installed Successfully.......\n"
         
         sleep 2
         echo -e ${CNC}".......................Installation Complete :)  Enjoy Hunting!.................."
 fi

}
installing_urlfromjs
