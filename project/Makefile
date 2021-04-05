help:		## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

common:
	@sh -x components/common.sh

frontend:	 ## Install Frontend Component For Roboshop
    @sh components/frontend.sh

catalogue:   ## Install Catalogue Component For Roboshop
    @sh components/catalogue.sh

