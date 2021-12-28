#!/usr/bin/env bash

#/**
# * Defina srcdir, pode ser global (/usr/local ou /usr/local/src)
# * ou local ($HOME/.local) para instalação das ferramentas
# */
VERSION=0.0.2
DIRNAME=${BASH_SOURCE[0]%/*}
BASENAME=${BASH_SOURCE[0]##*/}

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

#/**
# * in_array — Check if a value exists in an array
# * @param $1           wanted value
# * @param $2,$3,$4...  array of values
# * @return             returns TRUE if searched value is found in array
# *                     if value is not found returns FALSE
# */
function in_array() {
  local needle=$1 haystack
  printf -v haystack '%s|' "${@:2}"
  [[ "$needle" == @(${haystack%|}) ]]
}

print_message() {
  if [[ $* ]]; then
    message_fmt="\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] %s${CReset}\n"
    printf "$message_fmt" "$*"
  fi
}

init_install() {
  mkdir -p "$srcdir"
  apt update
  # REQUIREMENTS
  apt -y install python3-pip apt-transport-https curl libcurl4-openssl-dev libssl-dev jq ruby-full libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev perl libio-socket-ssl-perl libdbd-sqlite3-perl libclass-dbi-perl libio-all-lwp-perl libparallel-forkmanager-perl libredis-perl libalgorithm-combinatorics-perl cvs subversion git bzr mercurial build-essential libssl-dev libffi-dev python2-dev python2 python-dev-is-python3 ruby-ffi-yajl python-setuptools libldns-dev git nmap rename docker.io parsero apache2 amass ssh tor privoxy wifite proxychains4 hashcat aptitude synaptic lolcat python3.9-venv dialog golang-go exploitdb exploitdb-papers exploitdb-bin-sploits graphviz virtualenv reaver bats
  sudo $SUDO_OPT pip3 install argparse osrframework py-altdns==1.0.2 requests wfuzz holehe twint
  sudo $SUDO_OPT pip install one-lin3r bluto dnspython requests win_unicode_console colorama
  gem install typhoeus opt_parse_validator blunder wpscan

  print_message 'Ferramenta em script Bash Completa para Bug bounty ou Pentest ! Vai poupar seu Tempo na hora de configurar sua máquina para trabalhar.'
  printf "\n${CBold}${CFGWhite}=====================================================>${CReset}\n\n"
  print_message 'Deseja Atualizar seu Linux? o tempo pode variar de acordo com sua máquina.'
  PS3="Por favor selecione uma opção : "
  select opt in yes no;do
    case $opt in
      yes)
        printf '\natualizando..\n'
        apt -y upgrade
        sudo $SUDO_OPT pip3 install --upgrade pip
        sudo $SUDO_OPT pip3 install --upgrade osrframework
        break
        ;;
      no) print_message 'continuando com a instalação...'
        break
        ;;
      *) printf '\nOpção inválida\n'
    esac
  done
}

git_install() {
  local repo="$giturl/$1"
  local app="$2"
  if [[ -d "$srcdir/${1#*/}" ]]; then
    printf 'WARNING: O diretório %s já existe. Não foi possível executar git clone %s\n' "$1" "$1"
    return 1
  fi
  git -C "$srcdir" clone -q "$repo"
  if [[ $app ]]; then
    chmod +x "$srcdir/${1#*/}/$app"
    ln -sf "$srcdir/${1#*/}/$app" "$bindir/${app##*/}"
  fi
}

banner() {
  echo ' █████╗ ██████╗ ███╗   ██╗ ██████╗
██╔══██╗██╔══██╗████╗  ██║██╔═══██╗
███████║██████╔╝██╔██╗ ██║██║   ██║
██╔══██║██╔══██╗██║╚██╗██║██║   ██║
██║  ██║██║  ██║██║ ╚████║╚██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝'
}

export srcdir=${srcdir:-/usr/local}
export bindir=${bindir:-$srcdir/bin}

banner
load_ansi_colors
[[ $1 == @(-h|--help|help) ]] && { echo MSG; exit 0; }
[[ $1 == @(-v|--version) ]] && { echo $VERSION; exit 0; }
if [[ 0 != $EUID ]]; then
  printf 'Necessário executar esse script com privilégios de administrador!\nExecute:\n$ sudo ./%s\n' "$BASENAME"
  exit 1
fi
SUDO_OPT="-H -E -u $SUDO_USER"

tools=(
  ProgressBar
  Brave
  Pyrit
  Go
  AwsCli
  Aquatone
  Ngrok
  Sherlock
  ZPhisher
#  pwndb
#  phoneinfoga
#  twitter-info
#  sayhello
#  osintgram
#  seeker
#  saycheese
#  anon-sms
#  sublist3r
#  takeover
#  dirsearch
#  sqlmap
#  knock
#  Infoga
#  gittools
#  massdns
#  anonsurf
#  paramspider
#  theHarvester
#  gf-patterns
#  socialfish
#  seclists
)
selection="$*"
if [[ $# == 0 ]]; then
  selection="${tools[*]}"
fi

#init_install #@debug
giturl='https://github.com'
for tool in $selection; do
  if in_array "${tool,,}" "${tools[@],,}"; then
    case ${tool,,} in
      progressbar)
        git_install 'NRZCode/progressbar' 'ProgressBar.sh'
        ;;
      brave)
        print_message 'Instalando Brave'
        curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo 'deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main' > /etc/apt/sources.list.d/brave-browser-release.list
        apt update
        apt -y install brave-browser
        printf 'done\n\n'
        ;;
      pyrit)
        print_message 'Instalando Pyrit'
        git_install 'hacker3983/pyrit-installer'
        bash "$srcdir/pyrit-installer/install.sh"
        ;;
      ngrok)
        print_message 'Instalando ngrok'
        # Install 1
        wget -qO /tmp/ngrok-stable-linux-amd64.tgz https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
        tar -C "$bindir" -zxvf /tmp/ngrok-stable-linux-amd64.tgz

        # Install 2
        #wget -qO /etc/apt/trusted.gpg.d/ngrok.asc https://ngrok-agent.s3.amazonaws.com/ngrok.asc
        #echo 'deb https://ngrok-agent.s3.amazonaws.com buster main' > /etc/apt/sources.list.d/ngrok.list
        #apt update
        #apt install ngrok
        ;;
      sherlock)
        print_message 'Instalando sherlock'
        git_install 'sherlock-project/sherlock' 'sherlock/sherlock.py'
        sudo $SUDO_OPT pip3 install -r "$srcdir/sherlock/requirements.txt"
        ;;
      zphisher)
        print_message 'Instalando zphisher'
        git_install 'htr-tech/zphisher'
        ;;
      pwndb)
        print_message 'Instalando pwndb'
        git_install 'davidtavarez/pwndb'
        virtualenv venv
        source venv/bin/activate
        pip install -r "$srcdir/pwndb/requirements.txt"
        ;;
      phoneinfoga)
        print_message 'Instalando phoneinfoga'
        curl -sSL https://raw.githubusercontent.com/sundowndev/phoneinfoga/master/support/scripts/install | bash
        ;;
      twitter-info)
        print_message 'Instalando Twitter-info'
        git_install 'D4Vinci/Twitter-Info'
        ;;
      sayhello)
        print_message 'Instalando sayhello'
        git_install 'd093w1z/sayhello.git'
        ;;
      osintgram)
        print_message 'Instalando Osintgram'
        git_install 'Datalux/Osintgram'
        python3 -m venv venv
        pip install -r "$srcdir/Osintgram/requirements.txt"
        ;;
      seeker)
        print_message 'Instalando seeker'
        git_install 'thewhiteh4t/seeker'
        ;;
      saycheese)
        print_message 'Instalando saycheese'
        git_install 'hangetzzu/saycheese'
        ;;
      anon-sms)
        print_message 'Instalando Anon-SMS'
        git_install 'HACK3RY2J/Anon-SMS'
        ;;
      the-endorser)
        print_message 'Instalando the-endorser'
        git_install 'eth0izzle/the-endorser'
        pip3 install -r "$srcdir/the-endorser/requirements.txt"
        ;;
      sublist3r)
        print_message 'Instalando Sublist3r'
        git_install 'aboul3la/Sublist3r'
        pip install -r "$srcdir/Sublist3r/requirements.txt"
        python3 "$srcdir/Sublist3r/setup.py" install
        ln -sf "$srcdir/Sublist3r/sublist3r.py" /usr/bin/sublist3r
        ;;
      takeover)
        print_message 'Instalando takeover'
        git_install 'm4ll0k/takeover'
        chmod +x * | python3 "$srcdir/takeover/setup.py" install
        ln -sf "$srcdir/takeover/takeover.py" /usr/bin/takeover
        ;;
      dirsearch)
        print_message 'Instalando dirsearch'
        git_install 'maurosoria/dirsearch'
        pip3 install -r "$srcdir/dirsearch/requirements.txt"
        python3 "$srcdir/dirsearch/setup.py" install
        ln -sf "$srcdir/dirsearch/dirsearch.py" /usr/bin/dirsearch
        ;;
      sqlmap)
        print_message 'Instalando sqlmap'
        git_install 'sqlmapproject/sqlmap' sqlmap-dev
        ;;
      knock)
        print_message 'Instalando knock'
        git_install 'guelfoweb/knock'
        pip3 install -r "$srcdir/knock/requirements.txt"
        python3 "$srcdir/knock/setup.py" install
        ln -sf "$srcdir/knock/knockpy.py" /usr/bin/knockpy
        ;;
      infoga)
        print_message 'Instalando Infoga'
        git_install 'm4ll0k/Infoga'
        wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
        pip3 install -r "$srcdir/Infoga/requirements.txt"
        python3 "$srcdir/Infoga/setup.py" install
        ;;
      gittools)
        print_message 'Instalando GitTools'
        git_install 'internetwache/GitTools'
        ;;
      massdns)
        print_message 'Instalando massdns'
        git_install 'blechschmidt/massdns'
        make "$srcdir/massdns/"
        cp "$srcdir/massdns/bin/massdns" /usr/local/bin
        ;;
      anonsurf)
        print_message 'Instalando anonsurf'
        git_install 'Und3rf10w/kali-anonsurf'
        ./installer.sh "$srcdir/kali-anonsurf/"
        ;;
      paramspider)
        print_message 'Instalando ParamSpider'
        git_install 'devanshbatham/ParamSpider'
        pip3 install -r "$srcdir/ParamSpider/requirements.txt"
        ln -sf $PWD/paramspider.py /usr/bin/
        ;;
      theHarvester)
        print_message 'Instalando theHarvester'
        git_install 'laramies/theHarvester'
        pip3 install -r "$srcdir/theHarvester/requirements.txt"
        python3 "$srcdir/theHarvester/setup.py" install
        docker -t build "$srcdir/theHarvester/" theharvester .
        cp "$srcdir/theHarvester/bin/theHarvester" /usr/local/bin
        ;;
      gf-patterns)
        print_message 'Instalando Gf-Patterns'
        git_install '1ndianl33t/Gf-Patterns'
        mkdir ~/.gf
        mv "$srcdir/Gf-Patterns/*.json" ~/.gf && rm -rf "$srcdir/Gf-Patterns"
        ;;
      socialfish)
        print_message 'SecLists SocialFish'
        git_install 'UndeadSec/SocialFish'
        python3 -m pip install -r "$srcdir/SocialFish/requirements.txt"
        ;;
      seclists)
        print_message 'Instalando SecLists'
        git_install 'danielmiessler/SecLists.git'
        ##ESTE ARQUIVO QUEBRA MASSAS E PRECISA SER LIMPO
        cat "$srcdir/SecLists/Discovery/DNS/dns-Jhaddix.txt" | head -n -14 > clean-jhaddix-dns.txt
        ;;
      go)
        if [[ -z "$GOPATH" ]]; then
          printf "\nInstalando Golang\n"
          apt -y install golang-go
          if [[ ! -d "$srcdir/go" ]]; then
            wget -O /tmp/go1.17.5.linux-amd64.tar.gz https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
            tar -C "$srcdir" -zxvf /tmp/go1.17.5.linux-amd64.tar.gz
          fi
          sudo $SUDO_OPT bash <<'EOC'
if ! grep -qE "GOPATH|GOROOT" $HOME/.profile; then
  cat <<EOT >> $HOME/.profile

GOROOT=$srcdir/go
GOPATH="\$HOME/go"
PATH="\$GOPATH/bin:\$GOROOT/bin:\$PATH"
EOT
fi
if [[ zsh == ${SHELL##*/} ]] && ! grep -q '.profile' $HOME/.zprofile; then
  cat <<EOT >> $HOME/.zprofile
emulate sh
if [ -r $HOME/.profile ]; then
  . $HOME/.profile
fi
emulate zsh
EOT
fi
EOC
        fi
        print_message 'Instalando Ferramentas em GO'
        sudo $SUDO_OPT bash <<EOC
go get github.com/michenriksen/aquatone
go get -u -v github.com/lc/gau
go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/waybackurls
go get -u github.com/tomnomnom/gf
go get -u github.com/tomnomnom/httprobe
go get -u github.com/tomnomnom/unfurl
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/OJ/gobuster/v3@latest
EOC
        ;;
      awscli)
        #Não se esqueça de configurar as credenciais da AWS!
        print_message 'Não se esqueça de configurar as credenciais da AWS!'
        apt -y install awscli
        print_message 'Não se esqueça de configurar as credenciais da AWS!'
        ;;
    esac
  fi
done
