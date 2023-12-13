# Carregando lib das cores e títulos
source libs/details.sh
source toolkit.sh

TIME=1

function _atualization () {
	while true; do
		_title "ATUALIZAÇÃO DO SISTEMA"
		# Menu de Opções
		echo -e "${COR_VERDE}[01]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Verificar repositório do sistema."
		echo -e "${COR_VERDE}[02]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Mostrar atualizações do sistema."
		echo -e "${COR_VERDE}[03]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Instalar atualizações do sistema."
		echo -e "${COR_VERDE}[04]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Limpar o sistema."
		echo -e "${COR_VERDE}[05]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Remover pacotes não necessários."
		echo -e "${COR_VERDE}[00]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Voltar para o Início."
		_line
		
		read -p "Escolha uma opção: " option
		_line
    
    case $option in
        01)
            echo -e "${COR_VERDE}Verificando o sistema por atualizações...${COR_RESET}"
				sleep $TIME
				sudo apt update
            ;;
		02)
            echo -e "${COR_VERDE}Mostrando as atualizações do sistema...${COR_RESET}"
                sleep $TIME
                sudo apt list --upgradable
            ;;
		03)
            echo -e "${COR_VERDE}Instalando atualizações do sistema...${COR_RESET}"
				sleep $TIME
                sudo apt upgrade -y
            _docker
            ;;
		04)
            echo -e "${COR_VERDE}Limpando o sistema...${COR_RESET}"
                sleep $TIME
				sudo apt clean
                sudo apt autoclean
            ;;
		05)
            echo -e "${COR_VERDE}Removendo pacotes desnecessários do sistema...${COR_RESET}"
                sleep $TIME
                sudo apt autoremove -y
            ;;
		00)
            echo -e "${COR_VERDE}Volando pro início...${COR_RESET}"
			sleep $TIME
			clear
            toolkit_linux
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