GREEN=\033[1;32m
YELLOW=\033[1;33m
RED=\033[1;31m
NC=\033[0m

all : files ai compose run log

no_ai: files compose run log

compose:
	@echo "${GREEN}Building and starting Docker container using Docker Compose...${NC}"
	@docker compose up -d

stop : 
	@echo "${YELLOW}Stopping Docker container...${NC}"
	@docker compose down

clean : 
	@echo "${YELLOW}Cleaning up Docker resources...${NC}"
	@docker system prune -a 

status :
	@echo "${GREEN}Listing Docker containers...${NC}"
	@docker ps -a

bash :
	@echo "${GREEN}Executing container's bash...${NC}"
	@docker exec -it ac_server_container bash

log:
	@docker compose logs -f

files:
	@read -p "zip_name: " ZIP_NAME; \
		echo "$${GREEN}Copying server content...$${NC}"; \
		./AssettoCorsa_Server/scripts/server_files_setup.sh "$${ZIP_NAME}"

ai: 
	@echo "${YELLOW}Adjusting AI preferences...${NC}"
	@chmod +x ./AssettoCorsa_Server/scripts/modify_ai.sh
	@./AssettoCorsa_Server/scripts/modify_ai.sh
	@echo "${GREEN}Adjusted AI preferences...${NC}"

fclean : stop clean

re : fclean all
