GREEN=\033[1;32m
YELLOW=\033[1;33m
RED=\033[1;31m
NC=\033[0m

all : build run

build : 
	@echo "${GREEN}Building Docker image...${NC}"
	@cd srcs && sudo docker build -t ac_server_container .

run :
	@echo "${GREEN}Starting Docker container...${NC}"
	@sudo docker run --name ac_server_container -d ac_server_container

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

fclean : stop clean

re : clean all