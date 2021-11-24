#!/bin/bash

echo "${red}
	________              ___________                  ___       _______ __________      
	___  __ \_____ _________  /___  /______________    __ |     / /__  /____(_)_  /_____ 
	__  /_/ /  __  /_  __ \  __/_  __ \  _ \_  ___/    __ | /| / /__  __ \_  /_  __/  _ \
	_  ____// /_/ /_  / / / /_ _  / / /  __/  /        __ |/ |/ / _  / / /  / / /_ /  __/
	/_/     \__,_/ /_/ /_/\__/ /_/ /_/\___//_/         ____/|__/  /_/ /_//_/  \__/ \___/
${reset}"

echo -e "\n\n\n\n"

echo -e "\n\n\nDeseja Atualizar seu Linux ?"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}";do break;done
case $choice in
yes) 		echo "atualizando.."
		sudo apt-get -y install kali-linux-default
		sudo apt-get -y update
		sudo apt -y full-upgrade
		sudo apt -y dist-upgrade
		;;

no) echo -e "\n\ncontinuando com a instalação..."
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
sudo apt install python3.9-venv
sudo apt -y install exploitdb
sudo apt -y install exploitdb-papers
sudo apt -y install exploitdb-bin-sploits
sudo pip3 install argparse
sudo pip install one-lin3r
sudo pip3 install requests
sudo pip3 install wfuzz
sudo gem install typhoeus
sudo gem install opt_parse_validator

echo "installing Brave"
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
echo "done"

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
echo "done"

#install go
if [[ -z "$GOPATH" ]];then
echo "Parece que go não está instalado, gostaria de instalá-lo agora ?"
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
echo "Não se esqueça de configurar as credenciais da AWS!"
sudo apt-get install -y awscli
echo "Não se esqueça de configurar as credenciais da AWS!"



#criando uma pasta de ferramentas em ~/
mkdir ~/feijoada
cd ~/feijoada/

#install aquatone (ferramenta para inspeção visual de sites em uma grande quantidade de hosts)
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

#install gau (busca URLs conhecidos no Open Threat Exchange da AlienVault , no Wayback Machine e no Common Crawl para qualquer domínio)
echo "Installing Gau"
GO111MODULE=on go get -u -v github.com/lc/gau
echo "done"

#install subfinder (ferramenta de descoberta de subdomínio que descobre subdomínios válidos)
echo "Installing Subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "done"

#install httpx (httpx é um rápido e multi-purpose HTTP kit de ferramentas permite executar vários probers)
echo "Installing Httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "done"

#install gobuster (ferramenta usada para força bruta)
echo "Installing Gobuster"
go install github.com/OJ/gobuster/v3@latest
echo "done"

#install assetfinder (Encontre domínios e subdomínios potencialmente relacionados a um determinado domínio.)
echo "Installing Assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

#install httprobe (Faça uma lista de domínios e verifique se há servidores http e https em funcionamento.)
echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

#install unfurl (Retire pedaços de URLs fornecidos em stdin)
echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

#install waybackurls (Aceite domínios delimitados por linha em stdin, busque URLs conhecidos da Wayback Machine)
echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

#analisar URLs relativos de arquivos JavaScript. descobrir facilmente solicitações AJAX
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/feijoada/
echo "done"

#Ferramenta para enumerar subdomínios de sites usando OSINT.
echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/feijoada/
echo "done"

#Veil-Evasion é uma ferramenta projetada para gerar cargas úteis metasploit que contornam as soluções antivírus comuns
echo "installing Veil-Evasion"
git clone https://github.com/Veil-Framework/Veil-Evasion.git
cd ~/feijoada/
echo "done"

echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/feijoada/
echo "done"

#configure uma página no serviço que está sendo usado e aponte sua página para esse subdomínio
echo "installing takeover"
git clone https://github.com/m4ll0k/takeover.git
cd ~/feijoada/
echo "done"

#WordPress Security Scanner
echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/feijoada/wpscan/bin && sudo cp wpscan /usr/local/bin
cd ~/feijoada/
echo "done"

#Scanner de caminho da web
echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
pip3 install -r requirements.txt
cd ~/feijoada/
echo "done"

#Um script Ruby para força bruta para baldes AWS s3 usando diferentes permutações.
echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/feijoada/
echo "done"

#Scanner HTTP básico que enumera hosts virtuais em um determinado endereço IP
echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/feijoada/
echo "done"

#Detecção e exploração de falhas de injeção SQL e controle de servidores de banco de dados
echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/feijoada/
echo "done"

#Ferramenta python3 projetada para enumerar rapidamente subdomínos
echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/feijoada/
echo "done"

#Ferramenta python3 projetada para enumerar rapidamente subdomínos
echo "installing Infoga"
git clone https://github.com/m4ll0k/Infoga.git
cd Infoga
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
pip2 install -r requirements.txt
python setup.py install
cd ~/feijoada/
echo "done"

#Script em Bash que automatiza algumas tarefas de reconhecimento e coleta de informações
echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/feijoada/
echo "done"

#Repositório contém três pequenos scripts python / bash usados para a pesquisa Git.
echo "installing GitTools"
git clone https://github.com/internetwache/GitTools.git
cd ~/feijoada/
echo "done"

#Resolvedor de stub de DNS simples de alto desempenho
echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/feijoada/massdns
make
cd ~/feijoada/
echo "done"

echo "installing anonsurf"
git clone https://github.com/Und3rf10w/kali-anonsurf.git
cd ~/feijoada/kali-anonsurf
sudo chmod +x installer.sh
sudo ./installer.sh
cd ~/feijoada/
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/feijoada/asnlookup
pip install -r requirements.txt
cd ~/feijoada/
echo "done"

#Encontra parâmetros de arquivos da web do domínio inserido
echo "installing ParamSpider"
git clone https://github.com/devanshbatham/ParamSpider
cd ~/feijoada/ParamSpider
pip3 install -r requirements.txt
cd ~/feijoada/
echo "done"

#ferramenta reúne e-mails, nomes, subdomínios, IPs e URLs usando varias fontes de dados públicas
echo "installing theHarvester"
git clone https://github.com/laramies/theHarvester
cd ~/feijoada/theHarvester/bin && sudo cp theHarvester /usr/local/bin
docker build -t theharvester .
cd ~/feijoada/
echo "done"

#Ripar sistemas de controle de versão acessíveis pela web (Ele pode extrair repositórios mesmo quando a navegação no diretório está desligada.)
echo "installing dvcs-ripper"
git clone https://github.com/kost/dvcs-ripper.git
cd ~/feijoada/
echo "done"

#inserir usuario e senha do git
echo "installing shellphish"
git clone https://github.com/thelinuxchoice/shellphish
cd ~/feijoada/
echo "done"

#falta
echo "installing SocialFish"
git clone https://github.com/UndeadSec/SocialFish.git
sudo apt-get install python3 python3-pip python3-dev -y
python3 -m pip install -r requirements.txt
cd ~/feijoada/
echo "done"

#crtndtry usa várias fontes diferentes para criar uma lista de subdomínios raiz
echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
cd ~/feijoada/
echo "done"

#
echo "installing maskphish"
git clone https://github.com/jaykali/maskphish
cd ~/feijoada/
echo "done"

#crtndtry usa várias fontes diferentes para criar uma lista de subdomínios raiz
echo "installing phoneinfoga"
curl -sSL https://raw.githubusercontent.com/sundowndev/phoneinfoga/master/support/scripts/install | bash
sudo mv ./phoneinfoga /usr/bin/phoneinfoga
cd ~/feijoada/
echo "done"

#coleção de vários tipos de listas
echo "downloading Seclists"
cd ~/feijoada/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/feijoada/SecLists/Discovery/DNS/
##ESTE ARQUIVO QUEBRA MASSAS E PRECISA SER LIMPO
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/feijoada/
echo "done"


cd ~/go/bin && sudo cp * /usr/local/bin/

echo -e "\n\n\n\n\n\n\n\n\nDone! Todas as ferramentas estão configuradas em ~/feijoada"
ls -Slha
echo "\n\n\n\n\n\n\n\n\nUma última vez: não se esqueça de configurar as credenciais da AWS em ~/.aws/!"

sudo apt-get -y update
sudo apt-get -y autoremove
sudo apt-get -y autoclean

#limpar tela
echo -e "\n\n\nDeseja limpar a sua tela?"
PS3="Por favor selecione uma opção : "
choices=("yes" "no")
select choice in "${choices[@]}";do break;done
case $choice in
yes) echo "limpando tela";printf
 clear;;
 
no) echo -e "\n\nOtimo Trabalho\nSaindo da instalação...";;
esac