GIT=$(shell which git)
TAR=$(shell which tar)
RM=$(shell which rm)
CURL=$(shell which curl)
CP=$(shell which cp)
CHOWN=$(shell which chown)

init:
	$(GIT) clone https://github.com/livedoor/datasets.git datasets
	$(TAR) zxvf datasets/ldgourmet.tar.gz -C datasets

clean:
	$(RM) -rf datasets

/tmp/restaurants.csv:
	$(CP) datasets/restaurants.csv /tmp/restaurants.csv
	sudo $(CHOWN) elasticsearch:elasticsearch /tmp/restaurants.csv

river: /tmp/restaurants.csv
	$(CURL) -sXPUT 'http://192.168.33.10:9200/ldgourmet' -d @json/schema.json && \
		$(CURL) -sXPUT 'http://192.168.33.10:9200/_river/restaurants_river_csv/_meta' -d @json/river.json
