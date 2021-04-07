help:		## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

common:
	@sh -x components/common.sh

catalogue:	common ## Install Catalogue Component for RoboShop Project
	@sh components/catalogue.sh

cart:		common ## Install Cart Component for RoboShop Project
	@sh components/cart.sh

frontend:	common ## Install Frontend Web Component for RoboShop Project
	@sh components/frontend.sh

mongodb:	common ## Install MongoDB Component for RoboShop Project
	@sh components/mongodb.sh

redis:	common ## Install Redis Component for RoboShop Project
	@sh components/redis.sh

user:	common ## Install Redis Component for RoboShop Project
	@sh components/user.sh

mysql:	common ## Install Redis Component for RoboShop Project
	@sh components/mysql.sh

shipping:	common ## Install Redis Component for RoboShop Project
	@sh components/shipping.sh

rabbitmq:	common ## Install Redis Component for RoboShop Project
	@sh components/rabbitmq.sh

payment:	common ## Install Redis Component for RoboShop Project
	@sh components/payment.sh