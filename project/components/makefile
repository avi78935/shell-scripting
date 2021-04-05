help:		## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

common:
	@sh components/common.sh

catalogue:	common ## Install Catalogue Component for RoboShop Project
	@sh components/catalogue.sh

cart:		common ## Install Cart Component for RoboShop Project
	@sh components/cart.sh

frontend:	common ## Install Frontend Web Component for RoboShop Project
	@sh components/frontend.sh
