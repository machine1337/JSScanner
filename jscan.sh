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
function jsrecondesign(){
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
echo -e ${RED}"#######################################################"
}
d=$(date +"%b-%d-%y %H:%M")
function jsrecon_single(){
clear
jsrecondesign

echo -e -n ${BLUE}"\n[+] Enter Single domain (e.g target.com): " 
           read domain
mkdir -p $domain
echo -e ${BLUE}"\n[+] JavaScript Recon Started On:- $d "
sleep 2
echo -e ${CP}"\n[+] Checking Service on domains:- "
echo "$domain" | httpx -threads 30 -o $domain/httpx.txt
sleep 1
echo -e ${GREEN}"\n[+] Subjs Started:- "
cat $domain/httpx.txt | subjs | tee $domain/subjs.txt
sleep 1
echo -e ${YELLOW}"\n[+] LinkFinder Started:- "
while read url ; do echo -e "\n\n ............URL: " $url ".........." ; python3 ~/jstools/LinkFinder/linkfinder.py -i $url -o cli; done <"$domain/subjs.txt" | tee $domain/linkfinder.txt
echo -e ${CPO}"\n[+] Extracting URLS:- "
while read url; do echo -e "\n\n.........URL: " $url "......."; curl -s $url | ruby ~/jstools/relative*/extract.rb --url ; done < "$domain/subjs.txt" | tee $domain/urlfromjs.txt
sleep 1

echo -e ${BLUE}"\n[+] Searching For Secrets in JS Files"
sleep 1
 while read url; do python3 ~/jstools/Secret*/SecretFinder.py -i $url -o cli ; done < "$domain/subjs.txt" | tee $domain/secretfinder.txt
}

function jsrecon_massive(){
clear
jsrecondesign
echo -e -n ${YELLOW}"\n[+] Enter path of multiple domains list (e.g target.com): "
read host
echo -e ${BLUE}"\n[+] JavaScript Recon Started On:- $d "
for domain in $(cat $host)
do
mkdir -p $domain
sleep 1
echo -e ${CP}"\n[+] Checking Service on domains:- "
echo "$domain" | httpx -threads 30 -o $domain/httpx.txt
sleep 1
echo -e ${GREEN}"\n[+] Subjs Started:- "
cat $domain/httpx.txt | subjs | tee $domain/subjs.txt
sleep 1
echo -e ${YELLOW}"\n[+] LinkFinder Started:- "
while read url ; do echo -e "\n\n ............URL: " $url ".........." ; python3 ~/jstools/LinkFinder/linkfinder.py -i $url -o cli; done <"$domain/subjs.txt" | tee $domain/linkfinder.txt
sleep 1
echo -e ${CPO}"\n[+] Extracting URLS:- "
while read url; do echo -e "\n\n.........URL: " $url "......."; curl -s $url | ruby ~/jstools/relative*/extract.rb --url ; done < "$domain/subjs.txt" | tee $domain/urlfromjs.txt
sleep 1

echo -e ${BLUE}"\n[+] Searching For Secrets in JS Files"
sleep 1
 while read url; do python3 ~/jstools/Secret*/SecretFinder.py -i $url -o cli ; done < "$domain/subjs.txt" | tee $domain/secretfinder.txt
done
}

menu(){
clear
jsrecondesign
echo -e -n ${YELLOW}"\n[*] Which Type of JS recon u want to Perform\n "
echo -e "${NC}[${CG}"1"${NC}]${CNC} Single Target Recon"
echo -e " ${NC}[${CG}"2"${NC}]${CNC} List of Domains"
echo -e " ${NC}[${CG}"3"${NC}]${CNC} Exit"
echo -n -e ${RED}"\n[+] Select: "
        read js_play
                if [ $js_play -eq 1 ]; then
                        jsrecon_single
                elif [ $js_play -eq 2 ]; then
                        jsrecon_massive
                elif [ $js_play -eq 3 ]; then
                      exit
                fi
}
menu
