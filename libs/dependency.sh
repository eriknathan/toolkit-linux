# Carregando lib das cores e títulos
source libs/details.sh
source start.sh

TIME=1

function _dependency () {
	while true; do
		_title "INSTALAÇÃO DE DEPENDÊNCIAS"
		# Menu de Opções
		echo -e "${COR_VERDE}[01]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Instalar o CURL"
		echo -e "${COR_VERDE}[02]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Instalar o Docker"
		echo -e "${COR_VERDE}[03]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Instalar o Docker Compose"
		echo -e "${COR_VERDE}[04]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Instalar o Python"
		echo -e "${COR_VERDE}[05]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Instalar o PIP (Python)"
		echo -e "${COR_VERDE}[00]${COR_RESET} ${COR_MAGENTE}>>${COR_RESET} Voltar para o Início."
		_line
		
		read -p "Escolha uma opção: " option
		_line
    
    case $option in
        01)
            echo -e "${COR_VERDE}Instalando o Curl...${COR_RESET}"
				sleep $TIME
		            sudo apt install curl -y
            ;;
        02)
            echo -e "${COR_VERDE}Instalando o Docker...${COR_RESET}"
				sleep $TIME
		        echo -e "${COR_CIANO}Baixando Binário do Docker${COR_RESET}"
                sleep 0.5
                    curl -fsSL https://get.docker.com -o libs/docker/get-docker.sh && \
                    sudo sh libs/docker/get-docker.sh && \
                echo -e "${COR_CIANO}Startando Servico do Docker${COR_RESET}"
                sleep 0.5
                    sudo systemctl enable docker && \
                    sleep 0.3
                    sudo systemctl start docker.socket && \
                    sleep 0.3
                    sudo systemctl start docker.service && \
                    sleep 0.3
                echo -e "${COR_CIANO}Adicionando grupo do docker ao Usário${COR_RESET}"
                sleep 1
                    sudo usermod -a -G docker $USER
                sleep 0.2
            ;;
        03)
            echo -e "${COR_VERDE}Instalando o Docker Compose...${COR_RESET}"
				sleep $TIME
		        echo -e "${COR_CIANO}Atualizando o sistema...${COR_RESET}"
                sleep 0.5
                    sudo apt-get update
                echo -e "${COR_CIANO}Instalando o docker compose...${COR_RESET}"
                sleep 0.5
                    sudo apt-get install docker-compose-plugin
            ;;
        04)
            echo -e "${COR_VERDE}Instalando o Python...${COR_RESET}"
				sleep $TIME
                    echo -e "${COR_CIANO}Instalando o Python...${COR_RESET}"
                    sleep 0.5
                    sudo apt-get install python3.9
            ;;
        05)
            echo -e "${COR_VERDE}Instalando o Pip Python...${COR_RESET}"
				sleep $TIME
                    echo -e "${COR_CIANO}Atualizando o Sistema${COR_RESET}"
                    sleep 0.5
                        sudo apt-get update
                    echo -e "${COR_CIANO}Instalando o pip...${COR_RESET}"
                    sleep 0.5
                        sudo apt-get install python3-pip
                    echo -e "${COR_CIANO}Versão do PIP instalada${COR_RESET}"
                    sleep 0.5
                        pip --version
                    sleep 0.5
                    echo -e "${COR_CIANO}Instlando a lib psuil${COR_RESET}"
                        pip install psutil
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