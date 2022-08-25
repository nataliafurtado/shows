.PHONY=help

ROOT_DIR = $(realpath .)

PACKAGE = packages micro_app state_management entities design_system home show_details shows

pub-get: 
	@for i in $(PACKAGE); do \
		cd $$i && flutter pub get && cd ..; \
	done
clean:
	@for i in $(PACKAGE); do \
		echo "Cleaning $$i"; \
		cd $$i && flutter clean && cd ..; \
	done



