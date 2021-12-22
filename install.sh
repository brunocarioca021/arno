#!/usr/bin/env bash

#/**
# * Defina srcdir, pode ser global (/usr/local ou /usr/local/src)
# * ou local ($HOME/.local) para instalação das ferramentas
# */
export srcdir='/usr/local'
export bindir="$srcdir/bin"
VERSION=0.0.1
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
  apt -y install python3-pip apt-transport-https curl

  print_message 'Ferramenta em script Bash Completa para Bug bounty ou Pentest ! Vai poupar seu Tempo na hora de configurar sua máquina para trabalhar.'
  printf "\n${CBold}${CFGWhite}=====================================================>${CReset}\n\n"
  print_message 'Deseja Atualizar seu Linux? o tempo pode variar de acordo com sua máquina.'
  PS3="Por favor selecione uma opção : "
  select opt in yes no;do
    case $opt in
      yes)
        printf '\natualizando..\n'
        apt -y upgrade
        python3 -m pip install --upgrade pip
        if grep -iq kali /etc/issue; then
          apt -y install kali-linux-default
        fi
        break
        ;;
      no) printf "\n\n${CBold}${CFGYellow}[${CFGRed}+${CFGYellow}] continuando com a instalação...${CReset}\n"
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
    printf 'ERROR: Não foi possível instalar %s\n' "$1"
    return 1
  fi
  git -C "$srcdir" clone "$repo"
  if [[ $app ]]; then
    ln -sf "$srcdir/${1#*/}/$app" "$bindir/$app"
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

banner
load_ansi_colors
[[ $1 == @(-h|--help|help) ]] && { echo MSG; exit 0; }
[[ $1 == @(-v|--version) ]] && { echo $VERSION; exit 0; }
if [[ 0 != $EUID ]]; then
  printf 'Necessário executar esse script com privilégios de administrador!\nExecute:\n$ sudo ./%s\n' "$BASENAME"
  exit 1
fi

tools=(
  ProgressBar
  Brave
  Pyrit
  Go
  AwsCli
  Aquatone
)
selection="$*"
if [[ $# == 0 ]]; then
  selection="${tools[*]}"
fi

init_install
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
        print_message 'Instalando Pyrit.'
        git_install 'hacker3983/pyrit-installer'
        bash "$srcdir/pyrit-installer/install.sh" 2>&- 1>&2
        ;;
      go)
        if [[ -z "$GOPATH" ]]; then
          printf "\nInstalando Golang\n"
          apt -y install golang-go
          if [[ ! -d "$srcdir/go" ]]; then
            wget -O /tmp/go1.17.5.linux-amd64.tar.gz https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
            tar -C "$srcdir" -zxvf /tmp/go1.17.5.linux-amd64.tar.gz
          fi
          export GOROOT="$srcdir/go"
          export GOPATH="$HOME/go"
          export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
          sudo -H -E -u $SUDO_USER bash -c '
          if ! grep -qE "GOPATH|GOROOT" $HOME/.profile; then
            cat <<EOT >> $HOME/.profile

GOROOT=$srcdir/go
GOPATH=\$HOME/go
PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH
EOT
fi
'
        fi
        ;;
      awscli)
        #Não se esqueça de configurar as credenciais da AWS!
        print_message 'Não se esqueça de configurar as credenciais da AWS!'
        apt -y install awscli
        print_message 'Não se esqueça de configurar as credenciais da AWS!'
        ;;
      aquatone)
        print_message 'Instalando Aquatone'
        go get github.com/michenriksen/aquatone
        wget -O /tmp/aquatone_linux_amd64_1.7.0.zip https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip > /dev/null
        unzip -d "$srcdir/aquatone" /tmp/aquatone_linux_amd64_1.7.0.zip > /dev/null
        ln -sf "$srcdir/aquatone/aquatone" "$bindir/"
        printf "done\n"
        ;;
    esac
  fi
done
