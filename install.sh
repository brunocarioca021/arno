#!/usr/bin/env bash

cd ~/
git clone --quiet https://github.com/NRZCode/progressbar.git > /dev/null
cp -r progressbar ~/.local > /dev/null

# ANSI Colors
function load_ansi_colors() {
  # @C FG Color
  #    |-- foreground color
  export CReset='\e[m' CFGBlack='\e[30m' CFGRed='\e[31m' CFGGreen='\e[32m' \
    CFGYellow='\e[33m' CFGBlue='\e[34m' CFGPurple='\e[35m' CFGCyan='\e[36m' \
    CFGWhite='\e[37m'
  # @C BG Color
  #    |-- background color
  export CBGBlack='\e[40m' CBGRed='\e[41m' CBGGreen='\e[42m' CBGYellow='\e[43m' \
    CBGBlue='\e[44m' CBGPurple='\e[45m' CBGCyan='\e[46m' CBGWhite='\e[47m'
  # @C Attribute
  #    |-- text attribute
  export CBold='\e[1m' CFaint='\e[2m' CItalic='\e[3m' CUnderline='\e[4m' \
    CSBlink='\e[5m' CFBlink='\e[6m' CReverse='\e[7m' CConceal='\e[8m' \
    CCrossed='\e[9m' CDoubleUnderline='\e[21m'
}

banner() {
  echo ' █████╗ ██████╗ ███╗   ██╗ ██████╗ 
██╔══██╗██╔══██╗████╗  ██║██╔═══██╗
███████║██████╔╝██╔██╗ ██║██║   ██║
██╔══██║██╔══██╗██║╚██╗██║██║   ██║
██║  ██║██║  ██║██║ ╚████║╚██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝'
}

banner
load_ansi_colors

printf "\n\033[1m\033[37m[\033[31m+\033[37m] Ferramenta em script Bash Completa para Bug bounty ou Pentest ! Vai poupar seu Tempo na hora de configurar sua máquina para trabalhar.${CReset} "
printf "\n\033[1m\033[37m=====================================================>${CReset} "

printf "\n\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Deseja Atualizar seu Linux ? o tempo pode variar de acordo com sua máquina.${CReset}\n"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}";do break;done
case $choice in
yes) 		printf "\natualizando..\n"
		sudo apt-get -y install kali-linux-default
		sudo apt-get -y update
		sudo apt-get -f install
		sudo apt -y full-upgrade
		sudo apt -y dist-upgrade
		;;

no) printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] continuando com a instalação...${CReset}\n"
;;
	esac


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y perl libio-socket-ssl-perl libdbd-sqlite3-perl libclass-dbi-perl libio-all-lwp-perl
sudo apt-get install -y libparallel-forkmanager-perl libredis-perl libalgorithm-combinatorics-perl
sudo apt-get install -y cvs subversion git bzr mercurial
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev python2-dev python2 python-dev-is-python3
sudo apt-get install -y ruby-ffi-yajl
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y nmap
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt-get install -y docker.io
sudo apt-get install -y parsero
sudo apt-get install -y apache2
sudo apt-get install -y amass
sudo apt-get install -y ssh
sudo apt-get install -y tor
sudo apt-get install -y privoxy
sudo apt-get install -y wifite
sudo apt-get install -y proxychains4
sudo apt-get install -y hashcat
sudo apt-get install -y aptitute
sudo apt-get install -y synaptic
sudo apt-get install -y lolcat
sudo apt install python3.9-venv
sudo apt install dialog
sudo apt -y install exploitdb
sudo apt -y install exploitdb-papers
sudo apt -y install exploitdb-bin-sploits
sudo apt -y install reaver
sudo apt -y install bats
sudo pip3 install argparse >/dev/null 2>/dev/null
sudo pip3 install osrframework >/dev/null 2>/dev/null
sudo pip3 install osrframework --upgrade
sudo pip install one-lin3r
sudo pip3 install py-altdns==1.0.2
sudo pip3 install requests
sudo pip3 install wfuzz
sudo pip3 install holehe
sudo gem install typhoeus
sudo gem install opt_parse_validator

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando Brave${CReset}\n"
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
printf "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
printf "done\n\n"

{
  git clone --quiet https://github.com/hacker3983/pyrit-installer "$HOME/.local/pyrit-installer"
  sudo bash "$HOME/.local/pyrit-installer/install.sh" >/dev/null 2>/dev/null
} >/dev/null 2>/dev/null &
pid=$!

message='Instalando Pyrit.'
while :; do
  signal='/ - \ |'
  for s in $signal; do
    printf "${CBold}${CFGBlue}[${CFGPurple}%s${CFGBlue}] %s\r" "$s" "$message"
    sleep .08
  done
  ps -p $pid > /dev/null || break
done
printf '\nDone!\n'

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando bash_profile aliases from recon_profile${CReset}\n"
git clone --quiet https://github.com/nahamsec/recon_profile.git > /dev/null
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
printf "done"

#install go
if [[ -z "$GOPATH" ]];then
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Parece que go não está instalado, gostaria de instalá-lo agora ?\n${CReset}"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					printf "\nInstalando Golang\n"
					wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz 
					sudo tar -xvf go1.17.3.linux-amd64.tar.gz >/dev/null 2>/dev/null
					sudo cp -r go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					printf 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					printf 'export GOPATH=$HOME/go'	>> ~/.bash_profile
					printf 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					printf "Por favor, instale go e execute novamente este script"
					printf "Abortando instalação..."
					exit 1
					;;
	esac
done
fi


#Não se esqueça de configurar as credenciais da AWS!
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Não se esqueça de configurar as credenciais da AWS!${CReset}\n"
sudo apt-get install -y awscli
printf "${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Não se esqueça de configurar as credenciais da AWS!${CReset}\n"


#criando uma pasta de ferramentas em ~/
mkdir -p ~/{tools,.local/bin}
if ! grep -q '.local/bin' $HOME/.profile; then
  cat <<EOF >> $HOME/.profile
# set PATH so it includes user's private bin if it exists
if [ -d "\$HOME/.local/bin" ] ; then
    PATH="\$HOME/.local/bin:\$PATH"
fi
EOF
fi
cd ~/tools/

aquatone="/usr/local/bin/aquatone"
gau="/usr/local/bin/gau"
subfinder="/usr/local/bin/subfinder"
httpx="/usr/local/bin/httpx"
gobuster="/usr/local/bin/gobuster"
waybackurls="/usr/local/bin/waybackurls"
assetfinder="/usr/local/bin/assetfinder"
gf="/usr/local/bin/gf"
httprobe="/usr/local/bin/httprobe"
unfurl="/usr/local/bin/unfurl"
sublist3r="/usr/bin/sublist3r"
knockpy="/usr/bin/knockpy"

# Aquatone
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando Aquatone${CReset}\n"
if [ -f $aquatone ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"	
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando Aquatone${CReset}\n"
go get github.com/michenriksen/aquatone
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip > /dev/null
unzip aquatone_linux_amd64_1.7.0.zip > /dev/null
sudo cp aquatone /usr/local/bin | rm -rf aquatone_linux_amd64_1.7.0.zip
fi
printf "done\n"

# Gau
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando Gau${CReset}\n"
if [ -f $gau ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"	
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando Gau${CReset}\n"
GO111MODULE=on go get -u -v github.com/lc/gau
fi
printf "done\n"

# Subfinder
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando Subfinder${CReset}\n"
if [ -f $subfinder ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando Subfinder${CReset}\n"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
fi
printf "done\n"

# Httpx
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando Httpx${CReset}\n"
if [ -f "$httpx" ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando Httpx${CReset}\n"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
fi
printf "done\n"

# Gobuster
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando Gobuster${CReset}\n"
if [ -f $gobuster ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando Gobuster${CReset}\n"
go install github.com/OJ/gobuster/v3@latest
fi
printf "done\n"

# Assetfinder
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando Assetfinder${CReset}\n"
if [ -f $assetfinder ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando Assetfinder${CReset}\n"
go get -u github.com/tomnomnom/assetfinder
fi
printf "done\n"

# Waybackurls
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando waybackurls${CReset}\n"
if [ -f $waybackurls ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando waybackurls${CReset}\n"
go get -u github.com/tomnomnom/waybackurls
fi
printf "done\n"

# GF
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando GF${CReset}\n"
if [ -f $gf ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando GF${CReset}\n"
go get -u github.com/tomnomnom/gf
printf 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
fi
printf "done\n"

# Httprobe
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando httprobe${CReset}\n"
if [ -f $httprobe ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando httprobe${CReset}\n"
go get -u github.com/tomnomnom/httprobe
fi
printf "done\n"

# Unfurl
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando unfurl${CReset}\n"
if [ -f $unfurl ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando unfurl${CReset}\n"
go get -u github.com/tomnomnom/unfurl
fi
printf "done\n"

# Sublist3r
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando Sublist3r${CReset}\n"
if [ -f $sublist3r ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGBlue}[${CFGRed}+${CFGBlue}] Instalando Sublist3r${CReset}\n"
git clone --quiet https://github.com/aboul3la/Sublist3r.git > /dev/null
cd ~/tools/Sublist3r
sudo chmod +x * && sudo python3 setup.py install
pip install -r requirements.txt
ln -sf sublist3r.py /usr/bin/sublist3r
cd ~/tools/
fi
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando takeover${CReset}\n"
git clone --quiet https://github.com/m4ll0k/takeover.git > /dev/null
sudo chmod +x * && sudo python3 setup.py install
ln -sf takeover.py /usr/bin/takeover
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando wpscan${CReset}\n"
git clone --quiet https://github.com/wpscanteam/wpscan.git > /dev/null
cd ~/tools/wpscan
sudo chmod +x *
sudo gem install bundler && bundle install --without test
cd ~/tools/wpscan/bin && sudo cp wpscan /usr/local/bin
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando dirsearch${CReset}\n"
cd /usr/share
git clone --quiet https://github.com/maurosoria/dirsearch.git > /dev/null
cd /usr/share/dirsearch
sudo chmod +x * && sudo python3 setup.py install
pip3 install -r requirements.txt
ln -sf dirsearch.py /usr/bin/dirsearch
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando sqlmap${CReset}\n"
git clone --quiet --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev > /dev/null
cd ~/tools/
printf "done\n"

# Knock
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Checando knock${CReset}\n"
if [ -f $knockpy ];then
	printf "\n\n${CBold}${CFGGreen}Encontrado${CReset}\n"
else
	printf "\n${CBold}${CFGRed}Não Encontrado${CReset}\n"
	printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando knockpy${CReset}\n"
git clone --quiet https://github.com/guelfoweb/knock.git > /dev/null
cd ~/tools/knock
sudo chmod +x * && sudo python3 setup.py install
pip3 install -r requirements.txt
ln -sf knockpy.py /usr/bin/knockpy
cd ~/tools/
fi
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando Infoga${CReset}\n"
git clone --quiet https://github.com/m4ll0k/Infoga.git > /dev/null
cd ~/tools/Infoga
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py > /dev/null
python get-pip.py
pip2 install -r requirements.txt
sudo chmod +x * && python setup.py install
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando GitTools${CReset}\n"
git clone --quiet https://github.com/internetwache/GitTools.git > /dev/null
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando massdns${CReset}\n"
git clone --quiet https://github.com/blechschmidt/massdns.git > /dev/null
cd ~/tools/massdns/bin
sudo cp ~/go/bin
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando anonsurf${CReset}\n"
git clone --quiet https://github.com/Und3rf10w/kali-anonsurf.git > /dev/null
cd ~/tools/kali-anonsurf
sudo chmod +x installer.sh
sudo ./installer.sh
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando ParamSpider${CReset}\n"
git clone --quiet https://github.com/devanshbatham/ParamSpider > /dev/null
cd ~/tools/ParamSpider
pip3 install -r requirements.txt
ln -sf $PWD/paramspider.py /usr/bin/
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando theHarvester${CReset}\n"
git clone --quiet https://github.com/laramies/theHarvester > /dev/null
cd ~/tools/theHarvester/bin && sudo cp theHarvester /usr/local/bin && cd ~/tools/theharvester
pip3 install -r requirements.txt
sudo chmod +x * && sudo python3 setup.py install
docker build -t theharvester .
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando Patterns${CReset}\n"
git clone --quiet https://github.com/1ndianl33t/Gf-Patterns > /dev/null
mkdir ~/.gf
mv ~/Gf-Patterns/*.json ~/.gf
rm -rf GF-Patterns
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Instalando SocialFish${CReset}\n"
git clone --quiet https://github.com/UndeadSec/SocialFish.git > /dev/null
sudo apt-get install python3 python3-pip python3-dev -y
cd ~/tools/SocialFish
python3 -m pip install -r requirements.txt
cd ~/tools/
printf "done\n"

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] downloading Seclists${CReset}\n"
git clone --quiet https://github.com/danielmiessler/SecLists.git > /dev/null
cd ~/tools/SecLists/Discovery/DNS/
##ESTE ARQUIVO QUEBRA MASSAS E PRECISA SER LIMPO
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
printf "done\n"

cd ~/go/bin && sudo cp * /usr/local/bin/

printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Done! Todas as ferramentas estão configuradas em ~/tools${CReset}\n"
ls -Slha
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Uma última vez: não se esqueça de configurar as credenciais da AWS em ~/.aws/!${CReset}\n"

printf "${CBold}${CFGRed}Installation finished${CReset}"
printf '\033]2; Installation finished\a'

sudo apt-get -y update > /dev/null
sudo apt-get -y autoremove > /dev/null
sudo apt-get -y autoclean > /dev/null
sudo updatedb

#limpar tela
printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Deseja limpar a sua tela?${CReset}\n"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}";do break;done
case $choice in
yes) printf "limpando tela";printf
 clear;;

no) printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] Ótimo Trabalho\nSaindo da instalação...${CReset}\n";;
esac
