#!/usr/bin/env bash

VERSION=1.0.1
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

system_update() {
  if [[ ! $is_updated ]]; then
    apt update && is_updated=1
  fi
}

check_dependencies() {
  if ! type -t ProgressBar.sh &>-; then
    git_install "https://github.com/NRZCode/progressbar" "ProgressBar.sh" 2>&-
  fi
}

init_install() {
  mkdir -p "$srcdir"
  system_update
  # REQUIREMENTS
  if [[ ! -f $HOME/.local/.arno_init_install_successful ]]; then
    apt -y install python3-pip apt-transport-https curl libcurl4-openssl-dev libssl-dev jq ruby-full libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev perl libio-socket-ssl-perl libdbd-sqlite3-perl libclass-dbi-perl libio-all-lwp-perl libparallel-forkmanager-perl libredis-perl libalgorithm-combinatorics-perl cvs subversion git bzr mercurial build-essential libssl-dev libffi-dev python2-dev python2 python-dev-is-python3 ruby-ffi-yajl python-setuptools libldns-dev git nmap rename docker.io parsero apache2 amass joomscan uniscan ssh tor privoxy wifite proxychains4 hashcat aptitude synaptic lolcat python3.9-venv dialog golang-go exploitdb exploitdb-papers exploitdb-bin-sploits graphviz virtualenv reaver bats
    sudo $SUDO_OPT pip3 install argparse osrframework py-altdns==1.0.2 requests wfuzz holehe twint bluto
    sudo $SUDO_OPT pip install one-lin3r bluto dnspython requests win_unicode_console colorama
    gem install typhoeus opt_parse_validator blunder wpscan
    mkdir -p "$HOME/.local"
    > $HOME/.local/.arno_init_install_successful
  fi

  print_message 'Ferramenta em script Bash Completa para Bug bounty ou Pentest ! Vai poupar seu Tempo na hora de configurar sua máquina para trabalhar.'
  printf "\n${CBold}${CFGWhite}=====================================================>${CReset}\n\n"
  print_message 'Deseja Atualizar seu Linux? o tempo pode variar de acordo com sua máquina.'
  PS3="Por favor selecione uma opção : "
  select opt in yes no; do
    case $opt in
      yes)
        printf '\natualizando..\n'
        apt -y full-upgrade
        sudo $SUDO_OPT pip3 install --upgrade pip
        sudo $SUDO_OPT pip3 install --upgrade osrframework
        apt -y autoremove
        break
        ;;
      no) print_message 'continuando com a instalação...'
        break
        ;;
      *) printf '\nOpção inválida\n'
    esac
  done
}

cfg_listsections() {
  local file=$1
  grep -oP '(?<=^\[)[^]]+' "$file"
}

read_package_ini() {
  local sec url script post_exec
  if [[ ! -f "$DIRNAME/src/NRZCode/bash-ini-parser/bash-ini-parser" ]]; then
    mkdir -p "$DIRNAME/src/NRZCode"
    git -C src/NRZCode clone -q https://github.com/NRZCode/bash-ini-parser
  fi
  source "$DIRNAME/src/NRZCode/bash-ini-parser/bash-ini-parser"
  cfg_parser "$inifile"
  while read sec; do
    unset url script post_exec
    cfg_section_$sec 2>&-
    tools[${sec,,}]="$url|$script|$post_exec"
  done < <(cfg_listsections "$inifile")
}

git_install() {
  local repo=$1
  local app=$2
  local cmd=$3
  if [[ -d "$srcdir/${repo##*/}" ]]; then
    printf 'WARNING: O diretório %s já existe.\nNão foi possível executar git clone %s\n' "$srcdir/${repo##*/}" "${repo}" 1>&2
    return 1
  fi
  git_clone="git -C '$srcdir' clone -q '$repo'"
  if type -t ProgressBar.sh &>-; then
    ProgressBar.sh "$git_clone"
  else
    bash -c "$git_clone"
  fi
  if [[ $app ]]; then
    [[ -f "$srcdir/${repo##*/}/$app" ]] && chmod +x "$srcdir/${repo##*/}/$app"
    ln -sf "$srcdir/${repo##*/}/$app" "$bindir/${app##*/}"
  fi
  if [[ -r "$srcdir/${repo##*/}/requirements.txt" ]]; then
    cd "$srcdir/${repo##*/}"
    sudo $SUDO_OPT pip3 install -r requirements.txt
  fi
  if [[ -r "$srcdir/${repo##*/}/setup.py" ]]; then
    cd "$srcdir/${repo##*/}"
    sudo python3 setup.py install
  fi
  [[ $cmd ]] && bash -c "$cmd"
}

banner() {
  local logo=' █████╗ ██████╗ ███╗   ██╗ ██████╗
██╔══██╗██╔══██╗████╗  ██║██╔═══██╗
███████║██████╔╝██╔██╗ ██║██║   ██║
██╔══██║██╔══██╗██║╚██╗██║██║   ██║
██║  ██║██║  ██║██║ ╚████║╚██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝'
  [[ -x /usr/games/lolcat ]] &&
    /usr/games/lolcat <<< "$logo" ||
    echo "$logo"
}

#/**
# * Defina srcdir, e bindir através de variáveis de ambiente
# * de modo global (/usr/local ou /usr/local/src)
# * ou local ($HOME/.local) para instalação das ferramentas
# * Ex:
# * $ export srcdir=/usr/local/src
# * $ export bindir=/usr/bin
# * $ sudo ./install.sh
# */
export srcdir=${srcdir:-/usr/local}
export bindir=${bindir:-$srcdir/bin}
inifile="$DIRNAME/package.ini"

banner
load_ansi_colors
[[ $1 == @(-h|--help|help) ]] && { echo MSG; exit 0; }
[[ $1 == @(-v|--version) ]] && { echo $VERSION; exit 0; }
if [[ 0 != $EUID ]]; then
  printf 'Necessário executar esse script com privilégios de administrador!\nExecute:\n$ sudo ./%s\n' "$BASENAME"
  exit 1
fi
export SUDO_OPT="-H -E -u $SUDO_USER"
check_dependencies

declare -A tools=(
  [brave]=
  [ngrok]=
  [go]=
  [awscli]=
  [phoneinfoga]=
  [rustscan]=
)
read_package_ini

selection="$*"
if [[ $# == 0 ]]; then
  selection="${!tools[*]}"
fi

init_install
for tool in ${selection,,}; do
  tool_list=${!tools[*]}
  if in_array "$tool" ${tool_list,,}; then
    IFS='|' read url script post_exec <<< "${tools[$tool]}"
    print_message "Instalando $tool"
    [[ $url ]] && git_install "$url" "$script" "$post_exec"
    case $tool in
      brave)
        curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo 'deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main' > /etc/apt/sources.list.d/brave-browser-release.list
        apt update
        apt -y install brave-browser
        printf 'done\n\n'
        ;;
      ngrok)
        wget -qO /etc/apt/trusted.gpg.d/ngrok.asc https://ngrok-agent.s3.amazonaws.com/ngrok.asc
        echo 'deb https://ngrok-agent.s3.amazonaws.com buster main' > /etc/apt/sources.list.d/ngrok.list
        apt update
        apt -y install ngrok
        printf 'done\n\n'
        ;;
      phoneinfoga)
        curl -sSL https://raw.githubusercontent.com/sundowndev/phoneinfoga/master/support/scripts/install | bash
        mv ./phoneinfoga "$bindir/phoneinfoga"
        ;;
      osintgram)
        cat <<EOF > "$bindir/osintgram.sh"
#!/usr/bin/env bash
echo 'Usage: osintgram.sh <target username> --command <command>'
if [[ \$# -gt 0 ]]; then
  python3 "$srcdir/Osintgram/main.py" \$*
fi
EOF
        chmod +x "$bindir/osintgram.sh"
        ;;
      theHarvester)
        docker -t build "$srcdir/theHarvester/" theharvester .
        ;;
      seclists)
        ##ESTE ARQUIVO QUEBRA MASSAS E PRECISA SER LIMPO
        head -n -14 "$srcdir/SecLists/Discovery/DNS/dns-Jhaddix.txt" > clean-jhaddix-dns.txt
        ;;
      go)
        print_message 'Instalando Golang'
        system_update
        apt -y install golang-go
        print_message 'Instalando Ferramentas em GO'
        export GOBIN=$bindir
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
        ;;
      awscli)
        #Não se esqueça de configurar as credenciais da AWS!
        print_message 'Não se esqueça de configurar as credenciais da AWS!'
        apt -y install awscli
        print_message 'Não se esqueça de configurar as credenciais da AWS!'
        ;;
      rustscan)
        wget -qO /tmp/rustscan_2.0.1_amd64.deb https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
        dpkg -i /tmp/rustscan_2.0.1_amd64.deb
        ;;
    esac
  fi
done
