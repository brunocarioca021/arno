#!/bin/bash

echo -e "\n\033[1m\033[37m[\033[31m+\033[37m] Ferramenta em script Bash Completa para Bug bounty ou Pentest ! Vai poupar 90% do seu Tempo na hora de configurar sua máquina para trabalhar. "
echo -e "\n\033[1m\033[37m=====================================================> "

echo -e "\n\n"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Deseja Atualizar seu Linux ? o tempo pode variar de acordo com sua máquina."
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}";do break;done
case $choice in
yes) 		echo "atualizando.."
		sudo apt-get -y install kali-linux-default
		sudo apt-get -y update
		sudo apt-get -f install
		sudo apt -y full-upgrade
		sudo apt -y dist-upgrade
		;;

no) echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] continuando com a instalação..."
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
sudo pip3 install requests
sudo pip3 install wfuzz
sudo gem install typhoeus
sudo gem install opt_parse_validator

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing Brave"
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
echo "done"

echo -e "Installing Pyrit"
git clone https://github.com/hacker3983/pyrit-installer
cd pyrit-installer
sudo bash install.sh
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
echo "done"

#install go
if [[ -z "$GOPATH" ]];then
echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Parece que go não está instalado, gostaria de instalá-lo agora ?"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
					sudo tar -xvf go1.17.3.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Por favor, instale go e execute novamente este script"
					echo "Abortando instalação..."
					exit 1
					;;
	esac	
done
fi


#Não se esqueça de configurar as credenciais da AWS!
echo -e "\n\033[1m\033[31m[\033[35m+\033[31m] Não se esqueça de configurar as credenciais da AWS!"
sudo apt-get install -y awscli
echo -e "\n\033[1m\033[31m[\033[35m+\033[31m] Não se esqueça de configurar as credenciais da AWS!"


#criando uma pasta de ferramentas em ~/
mkdir ~/tools
cd ~/tools/

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Installing Aquatone"
go get github.com/michenriksen/aquatone
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip
sudo cp aquatone /usr/local/bin | rm -rf aquatone_linux_amd64_1.7.0.zip
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Installing Gau"
GO111MODULE=on go get -u -v github.com/lc/gau
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Installing Subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Installing Httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Installing Gobuster"
go install github.com/OJ/gobuster/v3@latest
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Installing Assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Installing waybackurls"
go get -u github.com/tomnomnom/waybackurls
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Installing GF"
go get -u github.com/tomnomnom/gf
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd ~/tools/Sublist3r
sudo chmod +x * && sudo python3 setup.py install
pip install -r requirements.txt
ln -sf sublist3r.py /usr/bin/sublist3r
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing takeover"
git clone https://github.com/m4ll0k/takeover.git
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd ~/tools/wpscan
sudo chmod +x *
sudo gem install bundler && bundle install --without test
cd ~/tools/wpscan/bin && sudo cp wpscan /usr/local/bin
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/dirsearch
sudo chmod +x * && sudo python3 setup.py install
pip3 install -r requirements.txt
ln -sf dirsearch.py /usr/bin/dirsearch
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/knock
sudo python3 setup.py install
pip3 install -r requirements.txt
ln -sf knockpy.py /usr/bin/knockpy
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing Infoga"
git clone https://github.com/m4ll0k/Infoga.git
cd ~/tools/Infoga
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
pip2 install -r requirements.txt
python setup.py install
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing GitTools"
git clone https://github.com/internetwache/GitTools.git
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing anonsurf"
git clone https://github.com/Und3rf10w/kali-anonsurf.git
cd ~/tools/kali-anonsurf
sudo chmod +x installer.sh
sudo ./installer.sh
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing ParamSpider"
git clone https://github.com/devanshbatham/ParamSpider
cd ~/tools/ParamSpider
pip3 install -r requirements.txt
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing theHarvester"
git clone https://github.com/laramies/theHarvester
cd ~/tools/theHarvester/bin && sudo cp theHarvester /usr/local/bin
docker build -t theharvester .
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing Patterns"
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
mv ~/Gf-Patterns/*.json ~/.gf
rm -rf GF-Patterns
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] installing SocialFish"
git clone https://github.com/UndeadSec/SocialFish.git
sudo apt-get install python3 python3-pip python3-dev -y
cd ~/tools/SocialFish
python3 -m pip install -r requirements.txt
cd ~/tools/
echo "done"

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##ESTE ARQUIVO QUEBRA MASSAS E PRECISA SER LIMPO
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"

cd ~/go/bin && sudo cp * /usr/local/bin/

echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Done! Todas as ferramentas estão configuradas em ~/tools"
ls -Slha
echo -e "\n\033[1m\033[31m[\033[35m+\033[31m] Uma última vez: não se esqueça de configurar as credenciais da AWS em ~/.aws/!"

packages_list=(aircrack-ng aireplay-ng airmon-ng airodump-ng awk curl hostapd iwconfig lighttpd
macchanger mdk3 unzip xterm openssl rfkill strings fuser)
function pkgscheck_flux() {
	for pkg in "${packages_list[@]}"
	do
		echo -e "\033[1m\033[33m[\033[31m+\033[33m] Checking for $pkg\033[0m"
		sleep 1
		if ! hash $pkg 2>/dev/null; then
			echo -e "\033[1m\033[31mNot Found\033[0m"
			apt-get install $pkg -y
		else
			echo -e "\033[1m\033[32mFound\033[0m"
		fi
	done
	echo -e "\033[1m\033[33m[\033[31m+\033[33m] Checking for dhcpd\033[0m"
	if ! hash dhcpd 2>/dev/null;then
		echo -e "\033[1m\033[31mNot Found\033[0m"
		echo -e "\033[1mInstalling \033[31mdhcpd\033[0m"
		apt-get install isc-dhcp-server -y
	else
		echo -e "\033[1m\033[32mFound\033[0m"
	fi
}
# Verifique a fonte em sources.list se não a adiciona a sources.list
username=$(whoami)
if [ $username != "root" ];then
	echo -e "\033[1m\033[31mPlease run this script as the user root try doing sudo bash install.sh"
	exit
fi
echo -e "\033[1m\033[33m[\033[31m+\033[33m] Checking for source in sources.list"
source="deb http://ftp.debian.org/debian/ stretch main contrib non-free"
path="/etc/apt/sources.list"
found=0
while read line; do
	if [ "$line" == "$source" ];then
		found=1;
		echo -e "\033[1m\033[32mFound\033[0m"
		break
	fi
done < $path

if [ $found != 1 ];then
	echo -e "\033[1m\033[31mNot Found \033[0m";echo "Adding $source to $path";echo $source >> $path;
fi

git="/usr/bin/git"
python="/usr/bin/python"
piperror="/usr/bin/python2: No module named pip"
pip=$(python2 -m pip 2>&1)
nmap="/usr/bin/nmap"
phpcgi="/usr/bin/php-cgi"
echo -e "\033[1m\033[33m[\033[31m+\033[33m] Checking for git"
sleep 5
if [ -x $git ];then
	echo -e "\033[1m\033[32mFound\033[0m"
else
	echo -e "\033[1m\033[31mNot Found\033[0m"
	echo -e "\033[1mInstalling \033[31mgit\033[0m"
	apt-get install git -y
fi
echo -e "\033[1m\033[33m[\033[31m+\033[33m] Checking for python2"
sleep 5
if [ -f $python ];then
	echo -e "\033[1m\033[32mFound\033[0m"
else
	echo -e "\033[1m\033[31mNot Found\033[0m"
	echo -e "\033[1mInstalling \033[31mpython2\033[0m"
	apt-get install python2 -y
fi
echo -e "\033[1m\033[33m[\033[31m+\033[33m] Checking for python2-pip"
sleep 5
if [ "$pip" != "$piperror" ];then
	echo -e "\033[1m\033[32mFound\033[0m"
else
	echo -e "\033[1m\033[31mNot Found\033[0m"
	echo -e "\033[1mInstalling \033[31mpython2-pip\033[0m"
	#curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
	python2 incase/get-pip.py
fi
echo -e "\033[1m\033[33m[\033[31m+\033[33m] Checking for nmap"
sleep 5
if [ -f $nmap ];then
	echo -e "\033[1m\033[32mFound\033[0m"
else
	echo -e "\033[1m\033[31mNot Found\033[0m"
	echo -e "\033[1mInstalling \033[31mnmap\033[0m"
	apt-get install nmap -y
fi
echo -e "\033[1m\033[33m[\033[31m+\033[33m] Checking for php-cgi"
sleep 5
if [ -f $phpcgi ];then
	echo -e "\033[1m\033[32mFound\033[0m"
else
	echo -e "\033[1m\033[31mNot Found\033[0m"
	echo -e "\033[1mInstalling \033[31mphp-cgi\033[0m"
	apt-get install php-cgi -y
fi
# Instale as dependências do Fluxion
pkgscheck_flux
echo -e "\033[1m\033[33mUpdating \033[33mand \033[33mUpgrading\033[0m"
# apt-get update -y && apt-get upgrade -y
apt-get purge libpython2* -y && apt-get install python -y
echo -e "\033[1mReinstalling \033[31mpython2\033[0m"
apt-get install python2 -y
echo -e "\033[1mInstalling \033[31mpython2.7-dev, \033[31mlibssl-dev\033[0m, \033[31mzlib1g-dev\033[0m, and \033[31mlibpcap-dev\033[0m"
apt-get install python2.7-dev libssl-dev zlib1g-dev libpcap-dev -y
echo -e "\033[1mRemoving \033[31mpyrit\033[0m"
apt-get remove --purge pyrit && rm -r /usr/local/lib/python2.7/dist-packages/cpyrit/
echo -e "\033[1mInstalling \033[31mlibpq-dev\033[0m"
apt-get install libpq-dev -y
echo -e "\033[1mInstalling \033[31msetuptools, \033[31mpsycopg2 \033[0mand \033[31mscapy\033[0m"
pip install setuptools psycopg2 scapy && apt-get install python-scapy -y
echo -e "\033[1m\033[32mDownloading \033[31mPyrit\033[0m"
printf '\033]2;Downloading Pyrit\a'

# Install Pyrit
if [ ! -d Pyrit ];then
	git clone https://github.com/JPaulMora/Pyrit
fi
sed -i "s/COMPILE_AESNI/COMPILE_AESNIX/" Pyrit/cpyrit/_cpyrit_cpu.c
cd Pyrit && python2 setup.py clean && python2 setup.py build && python2 setup.py install

echo -e "\033[1m\033[31mInstallation finished\033[0m"
printf '\033]2; Installation finished\a'

sudo apt-get -y update
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo updatedb

#limpar tela
echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Deseja limpar a sua tela?"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}";do break;done
case $choice in
yes) echo "limpando tela";printf
 clear;;
 
no) echo -e "\n\033[1m\033[33m[\033[35m+\033[33m] Ótimo Trabalho\nSaindo da instalação...";;
esac
