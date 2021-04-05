help:		## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

common:
	@sh -x components/common.sh

frontend:	 common ## Install Frontend Component For Roboshop
    @sh components/frontend.sh

catalogue:   common ## Install Catalogue Component For Roboshop
    @sh components/catalogue.sh

