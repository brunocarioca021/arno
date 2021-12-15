#!/usr/bin/env bash

banner() {
  echo '  █████╗ ██████╗ ███╗   ██╗ ██████╗ 
██╔══██╗██╔══██╗████╗  ██║██╔═══██╗
███████║██████╔╝██╔██╗ ██║██║   ██║
██╔══██║██╔══██╗██║╚██╗██║██║   ██║
██║  ██║██║  ██║██║ ╚████║╚██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝'
}

banner

printf "\n\033[1m\033[37m[\033[31m+\033[37m] Ferramenta em script Bash Completa para Bug bounty ou Pentest ! Vai poupar seu Tempo na hora de configurar sua máquina para trabalhar. "
printf "\n\033[1m\033[37m=====================================================> "

printf "\n\n"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Deseja Atualizar seu Linux ? o tempo pode variar de acordo com sua máquina.\n"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}";do break;done
case $choice in
yes) 		printf "atualizando.."
		sudo apt-get -y install kali-linux-default
		sudo apt-get -y update
		sudo apt-get -f install
		sudo apt -y full-upgrade
		sudo apt -y dist-upgrade
		;;

no) printf "\n\033[1m\033[33m[\033[35m+\033[33m] continuando com a instalação...\n"
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
sudo apt-get install -y dirsearch
sudo apt-get install -y lolcat
sudo apt install python3.9-venv
sudo apt install dialog
sudo apt -y install exploitdb
sudo apt -y install exploitdb-papers
sudo apt -y install exploitdb-bin-sploits
sudo apt -y install reaver
sudo pip3 install argparse
sudo pip3 install osrframework
sudo pip3 install osrframework --upgrade
sudo pip install one-lin3r
sudo pip3 install py-altdns==1.0.2
sudo pip3 install requests
sudo pip3 install wfuzz
sudo pip3 install holehe
sudo gem install typhoeus
sudo gem install opt_parse_validator

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Brave"
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
printf "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
printf "done"

printf "Instalando Pyrit"
git clone https://github.com/hacker3983/pyrit-installer
cd pyrit-installer
sudo bash install.sh
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
printf "done"

#install go
if [[ -z "$GOPATH" ]];then
printf "\n\033[1m\033[33m[\033[35m+\033[33m] Parece que go não está instalado, gostaria de instalá-lo agora ?"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					printf "Instalando Golang"
					wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
					sudo tar -xvf go1.17.3.linux-amd64.tar.gz
					sudo mv go /usr/local
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
printf "\n\033[1m\033[31m[\033[35m+\033[31m] Não se esqueça de configurar as credenciais da AWS!"
sudo apt-get install -y awscli
printf "\n\033[1m\033[31m[\033[35m+\033[31m] Não se esqueça de configurar as credenciais da AWS!"


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

# Aquatone
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando Aquatone\n"
if [ -f $aquatone ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"	
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Aquatone\n"
go get github.com/michenriksen/aquatone
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip
sudo cp aquatone /usr/local/bin | rm -rf aquatone_linux_amd64_1.7.0.zip
fi
printf "done\n"

# Gau
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando Gau\n"
if [ -f $gau ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"	
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Gau\n"
GO111MODULE=on go get -u -v github.com/lc/gau
fi
printf "done\n"

# Subfinder
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando Subfinder\n"
if [ -f $subfinder ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Subfinder\n"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
fi
printf "done\n"

# Httpx
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando Httpx\n"
if [ -f "$httpx" ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Httpx\n"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
fi
printf "done\n"

# Gobuster
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando Gobuster\n"
if [ -f $gobuster ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Gobuster\n"
go install github.com/OJ/gobuster/v3@latest
fi
printf "done\n"

# Assetfinder
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando Assetfinder\n"
if [ -f $assetfinder ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Assetfinder\n"
go get -u github.com/tomnomnom/assetfinder
fi
printf "done\n"

# Waybackurls
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando waybackurls\n"
if [ -f $waybackurls ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando waybackurls\n"
go get -u github.com/tomnomnom/waybackurls
fi
printf "done\n"

# GF
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando GF\n"
if [ -f $gf ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando GF\n"
go get -u github.com/tomnomnom/gf
printf 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
fi
printf "done\n"

# Httprobe
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando httprobe"
if [ -f $httprobe ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando httprobe\n"
go get -u github.com/tomnomnom/httprobe
fi
printf "done\n"

# Unfurl
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando unfurl\n"
if [ -f $unfurl ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando unfurl\n"
go get -u github.com/tomnomnom/unfurl
fi
printf "done\n"

# Sublist3r
printf "\n\033[1m\033[33m[\033[31m+\033[33m] Checando Sublist3r\n"
if [ -f $sublist3r ];then
	printf "\n\033[1m\033[32mEncontrado\033[0m\n"
else
	printf "\n\033[1m\033[31mNão Encontrado\033[0m\n"
	printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Sublist3r\n"
git clone https://github.com/aboul3la/Sublist3r.git
cd ~/tools/Sublist3r
sudo chmod +x * && sudo python3 setup.py install
pip install -r requirements.txt
ln -sf sublist3r.py /usr/bin/sublist3r
cd ~/tools/
fi
printf "done\n"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando takeover"
git clone https://github.com/m4ll0k/takeover.git
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd ~/tools/wpscan
sudo chmod +x *
sudo gem install bundler && bundle install --without test
cd ~/tools/wpscan/bin && sudo cp wpscan /usr/local/bin
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/dirsearch
sudo chmod +x * && sudo python3 setup.py install
pip3 install -r requirements.txt
ln -sf dirsearch.py /usr/bin/dirsearch
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/knock
sudo python3 setup.py install
pip3 install -r requirements.txt
ln -sf knockpy.py /usr/bin/knockpy
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Infoga"
git clone https://github.com/m4ll0k/Infoga.git
cd ~/tools/Infoga
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
pip2 install -r requirements.txt
python setup.py install
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando GitTools"
git clone https://github.com/internetwache/GitTools.git
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando anonsurf"
git clone https://github.com/Und3rf10w/kali-anonsurf.git
cd ~/tools/kali-anonsurf
sudo chmod +x installer.sh
sudo ./installer.sh
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando ParamSpider"
git clone https://github.com/devanshbatham/ParamSpider
cd ~/tools/ParamSpider
pip3 install -r requirements.txt
ln -sf $PWD/paramspider.py /usr/bin/
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando theHarvester"
git clone https://github.com/laramies/theHarvester
cd ~/tools/theHarvester/bin && sudo cp theHarvester /usr/local/bin
docker build -t theharvester .
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Karma"
git clone https://github.com/decoxviii/karma.git
cd ~/tools/karma
sudo -H pip3 install -r requirements.txt
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando Patterns"
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
mv ~/Gf-Patterns/*.json ~/.gf
rm -rf GF-Patterns
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Instalando SocialFish"
git clone https://github.com/UndeadSec/SocialFish.git
sudo apt-get install python3 python3-pip python3-dev -y
cd ~/tools/SocialFish
python3 -m pip install -r requirements.txt
cd ~/tools/
printf "done"

printf "\n\033[1m\033[33m[\033[35m+\033[33m] downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##ESTE ARQUIVO QUEBRA MASSAS E PRECISA SER LIMPO
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
printf "done"

cd ~/go/bin && sudo cp * /usr/local/bin/

printf "\n\033[1m\033[33m[\033[35m+\033[33m] Done! Todas as ferramentas estão configuradas em ~/tools"
ls -Slha
printf "\n\033[1m\033[31m[\033[35m+\033[31m] Uma última vez: não se esqueça de configurar as credenciais da AWS em ~/.aws/!"

packages_list=(aircrack-ng aireplay-ng airmon-ng airodump-ng awk curl hostapd iwconfig lighttpd
macchanger mdk3 unzip xterm openssl rfkill strings fuser)
function pkgscheck_flux() {
	for pkg in "${packages_list[@]}"
	do
		printf "\033[1m\033[33m[\033[31m+\033[33m] Checando for $pkg\033[0m"
		sleep 1
		if ! hash $pkg 2>/dev/null; then
			printf "\033[1m\033[31mNot Found\033[0m"
			apt-get install $pkg -y
		else
			printf "\033[1m\033[32mFound\033[0m"
		fi
	done
	printf "\033[1m\033[33m[\033[31m+\033[33m] Checando for dhcpd\033[0m"
	if ! hash dhcpd 2>/dev/null;then
		printf "\033[1m\033[31mNot Found\033[0m"
		printf "\033[1mInstalando \033[31mdhcpd\033[0m"
		apt-get install isc-dhcp-server -y
	else
		printf "\033[1m\033[32mFound\033[0m"
	fi
}
# Verifique a fonte em sources.list se não a adiciona a sources.list
username=$(whoami)
if [ $username != "root" ];then
	printf "\033[1m\033[31mPlease run this script as the user root try doing sudo bash install.sh"
	exit
fi
printf "\033[1m\033[33m[\033[31m+\033[33m] Checando for source in sources.list"
source="deb http://ftp.debian.org/debian/ stretch main contrib non-free"
path="/etc/apt/sources.list"
found=0
while read line; do
	if [ "$line" == "$source" ];then
		found=1;
		printf "\033[1m\033[32mFound\033[0m"
		break
	fi
done < $path

if [ $found != 1 ];then
	printf "\033[1m\033[31mNot Found \033[0m";printf "Adding $source to $path";printf $source >> $path;
fi

git="/usr/bin/git"
python="/usr/bin/python"
piperror="/usr/bin/python2: No module named pip"
pip=$(python2 -m pip 2>&1)
nmap="/usr/bin/nmap"
phpcgi="/usr/bin/php-cgi"
printf "\033[1m\033[33m[\033[31m+\033[33m] Checando for git"
sleep 5
if [ -x $git ];then
	printf "\033[1m\033[32mFound\033[0m"
else
	printf "\033[1m\033[31mNot Found\033[0m"
	printf "\033[1mInstalando \033[31mgit\033[0m"
	apt-get install git -y
fi
printf "\033[1m\033[33m[\033[31m+\033[33m] Checando for python2"
sleep 5
if [ -f $python ];then
	printf "\033[1m\033[32mFound\033[0m"
else
	printf "\033[1m\033[31mNot Found\033[0m"
	printf "\033[1mInstalando \033[31mpython2\033[0m"
	apt-get install python2 -y
fi
printf "\033[1m\033[33m[\033[31m+\033[33m] Checando for python2-pip"
sleep 5
if [ "$pip" != "$piperror" ];then
	printf "\033[1m\033[32mFound\033[0m"
else
	printf "\033[1m\033[31mNot Found\033[0m"
	printf "\033[1mInstalando \033[31mpython2-pip\033[0m"
	#curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
	python2 incase/get-pip.py
fi
printf "\033[1m\033[33m[\033[31m+\033[33m] Checando for nmap"
sleep 5
if [ -f $nmap ];then
	printf "\033[1m\033[32mFound\033[0m"
else
	printf "\033[1m\033[31mNot Found\033[0m"
	printf "\033[1mInstalando \033[31mnmap\033[0m"
	apt-get install nmap -y
fi
printf "\033[1m\033[33m[\033[31m+\033[33m] Checando for php-cgi"
sleep 5
if [ -f $phpcgi ];then
	printf "\033[1m\033[32mFound\033[0m"
else
	printf "\033[1m\033[31mNot Found\033[0m"
	printf "\033[1mInstalando \033[31mphp-cgi\033[0m"
	apt-get install php-cgi -y
fi
# Instale as dependências do Fluxion
pkgscheck_flux
printf "\033[1m\033[33mUpdating \033[33mand \033[33mUpgrading\033[0m"
# apt-get update -y && apt-get upgrade -y
apt-get purge libpython2* -y && apt-get install python -y
printf "\033[1mReInstalando \033[31mpython2\033[0m"
apt-get install python2 -y
printf "\033[1mInstalando \033[31mpython2.7-dev, \033[31mlibssl-dev\033[0m, \033[31mzlib1g-dev\033[0m, and \033[31mlibpcap-dev\033[0m"
apt-get install python2.7-dev libssl-dev zlib1g-dev libpcap-dev -y
printf "\033[1mRemoving \033[31mpyrit\033[0m"
apt-get remove --purge pyrit && rm -r /usr/local/lib/python2.7/dist-packages/cpyrit/
printf "\033[1mInstalando \033[31mlibpq-dev\033[0m"
apt-get install libpq-dev -y
printf "\033[1mInstalando \033[31msetuptools, \033[31mpsycopg2 \033[0mand \033[31mscapy\033[0m"
pip install setuptools psycopg2 scapy && apt-get install python-scapy -y
printf "\033[1m\033[32mDownloading \033[31mPyrit\033[0m"
printf '\033]2;Downloading Pyrit\a'

# Install Pyrit
if [ ! -d Pyrit ];then
	git clone https://github.com/JPaulMora/Pyrit
fi
sed -i "s/COMPILE_AESNI/COMPILE_AESNIX/" Pyrit/cpyrit/_cpyrit_cpu.c
cd Pyrit && python2 setup.py clean && python2 setup.py build && python2 setup.py install

printf "\033[1m\033[31mInstallation finished\033[0m"
printf '\033]2; Installation finished\a'

sudo apt-get -y update
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo updatedb

#limpar tela
printf "\n\033[1m\033[33m[\033[35m+\033[33m] Deseja limpar a sua tela?"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}";do break;done
case $choice in
yes) printf "limpando tela";printf
 clear;;

no) printf "\n\033[1m\033[33m[\033[35m+\033[33m] Ótimo Trabalho\nSaindo da instalação...";;
esac
