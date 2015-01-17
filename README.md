## Elasticsearch Tutorial Box

### Description
Try several things

### Procedure

```shell
# Vagrant start
$ vagrant up web1
$ vagrant up web2

# Login to web1
$ vagrant ssh web1

# Download livedoor gourmet data
$ cd /vagrant
$ make init

# create index and river
$ make river

# If you try to search, then access http://192.168.33.10/:9200/_plugin/head/
```
