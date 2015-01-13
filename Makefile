GIT=$(shell which git)
TAR=$(shell which tar)
RM=$(shell which rm)

init:
	$(GIT) clone https://github.com/livedoor/datasets.git datasets
	$(TAR) zxvf datasets/ldgourmet.tar.gz -C datasets

clean:
	$(RM) -f datasets/*.csv
