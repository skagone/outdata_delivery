
# Open Items

1. agree on 10 degree and 2 degree approach
2. dance-card viz folium notebook
3. path_param extent viewer folium notebook


# Project website
- sphinx based
- nginx from a docker container
- run on ship0
- use port 8080 
- searchable
- document cheatsheets - etc
- one stop shop - easier to find - shared etc

### Actions
- mimic this makefile

```
Image=tbutzer/sphinx
html:
	docker run\
           -v `pwd`:/home \
           ${Image} sphinx-build source build/html

webServer:
	docker run --name et-web -p 80:80 -v `pwd`/build/html:/usr/share/nginx/html:ro -d nginx


git:
	(cd /opt/et && make)

```


# Infrastructure

### Three Machines

## machines

| system alias | ip  | description |
| ------ |-- | ----------- |
| ship0   | 10.12.68.246  | mini-pangeo development/only box and project website |
| steff1 | 10.12.69.188 |  t3a.2xlarge - for running simple models |
| bigship    |10.12.69.45 |  m5a.4xlarge - for big jobs like mosaic ing chips |

## start and stop

- need to transition this activity to Gabe
- pinstance needs to be setup on ship0
- need a policy for stopping these


# Training and Transition Plan - tony as consultant from tony as developer

- infrastructure
- chip to COG mosaic run
- etm code to gabe repo


# Data off of S3

- in: data stays - its necessary and relatively small
- out: data always nuked as soon as we can
- enduser: data 
	- to the denali
	- to the netapp; until Gabriel has his own account
	- Kristi Kline seemed ok with this approach
- document notes on removing data with aws s3 rm --recursive --dry
- gather all cheat sheets into project website

# Git repo consolidation

- replicate basin to cloud-veg-et-v2
	- fix etm and etops
	- migrate etm and etops to gabe-parish repo
	- its named cloud - should be cloud only code - emphasis in cloud - de-emphasis on local
- rename basin to cloud-veg-et-basin-legacy
- remove cloud-veg-et-continent
