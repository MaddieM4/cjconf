RELEASE := $(shell cat scripts/release)
VERSION := $(shell cat scripts/version)

all : scripts/version docs
	scripts/mkpackage.sh

control : scripts/version
	sed "s/VERSION/Version: $(VERSION)/" < scripts/control_template > debian/DEBIAN/control
	
scripts/version : scripts/release
	echo "0.5-$(RELEASE)" > scripts/version

docs : doc/cjconf-add-default.txt doc/cjconf-get.txt doc/cjconf-print.txt doc/cjconf-set.txt doc/cjdlog.txt \
     doc/cjconf-add.txt doc/cjconf-make.txt doc/cjconf-remove.txt doc/cjdinfo.txt doc/cjdrouted.txt
	scripts/makedoc.sh
