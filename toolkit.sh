#!/usr/bin/env bash
#
# install_kubenetes.sh - Instalação do Kubernetes no Ubuntu 22.04 LTS
#
# Autor: Erik Nathan | GitHub: @eriknathan
# ------------------------------------------------------------------------- #
# Descrição:
#  --------------------------------------------------------------
#  Observações:
#
# ------------------------------------------------------------------------- #
# Testado em:
#   bash 5.1.16
# ------------------------------------------------------------------------- #

# -------------------------------- IMPORTAÇÕES -------------------------------- #
source libs/details.sh
source libs/atualization.sh
source libs/_help.sh
# ------------------------------------------------------------------------- #
TIME=1
# -------------------------------- FUNÇÕES -------------------------------- #
function trapped () {
	echo -e "${COR_VERMELHO}Erro na linha $1${COR_RESET}"
	exit 1
}
trap 'trapped $LINENO' ERR

# FUNÇÃO PRINCIPAL
function toolkit_linux () {
	clear
	while true; do
		_title "TOOLKIT - Linux"
		echo -e "${COR_VERMELHO}Scripted Developed By :${COR_RESET} ${COR_AMARELO}Erik Nathan - @erik.devops | Github: @eriknathan${COR_RESET}"
		_line
		# Menu de Opções
		echo -e "${COR_VERDE}[01]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Atualização do Sistema."
		echo -e "${COR_VERDE}[00]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Sair."
		_line
		
		read -p "Escolha uma opção: " option
		_line
    
    case $option in
        01)
            echo -e "${COR_VERDE}Atualização do Sistema.${COR_RESET}"
			sleep $TIME
			clear
            _atualization
            ;;
		00)
            echo -e "${COR_VERDE}Saindo do Sistema.${COR_RESET}"
			sleep $TIME
			clear
            exit
            ;;
        *)
            echo -e "${COR_VERMELHO}Opção inválida. Por favor, escolha uma opção válida.${COR_RESET}"
            ;;
    esac
    
	_line
    read -p "Pressione Enter para continuar..."
	clear
done

}
# ------------------------------------------------------------------------- #

# -------------------------------- EXECUÇÃO -------------------------------- #
while [ -n "$1" ]; do
	case "$1" in
		-h|--help)                _help;          exit ;;
		*)                        _error "$1"          ;; 
	esac
done

toolkit_linux