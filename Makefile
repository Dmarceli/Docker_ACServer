GREEN=\033[1;32m
YELLOW=\033[1;33m
RED=\033[1;31m
NC=\033[0m

all : files ai build run log

no_ai: files build run log


build :
	@echo "${GREEN}Building Docker image...${NC}"
	@cd srcs && sudo docker build -t ac_server_container .

run :
	@echo "${GREEN}Starting Docker container...${NC}"
	@sudo docker run -p 8081:8081 -p 9600:9600/udp -p 9600:9600 --name ac_server_container -d ac_server_container

stop : 
	@echo "${YELLOW}Stopping Docker container...${NC}"
	@sudo docker stop ac_server_container

clean : 
	@echo "${YELLOW}Cleaning up Docker resources...${NC}"
	@sudo docker system prune -a 

status :
	@echo "${GREEN}Listing Docker containers...${NC}"
	@sudo docker ps -a

bash :
	@echo "${GREEN}Executing container's bash...${NC}"
	@sudo docker exec -it ac_server_container bash

log:
	@sudo docker logs -f ac_server_container

files:
	@read -p "zip_name: " ZIP_NAME; \
		echo "$${GREEN}Copying server content...$${NC}"; \
		./srcs/scripts/server_files_setup.sh "$${ZIP_NAME}"

ai: 
	@echo "${YELLOW}Adjusting AI preferences...${NC}"
	@chmod +x ./srcs/scripts/modify_ai.sh
	@./srcs/scripts/modify_ai.sh
	@echo "${GREEN}Adjusted AI preferences...${NC}"


fclean : stop clean

re : fclean all