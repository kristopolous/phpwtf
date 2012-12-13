install:
	[ -e ~/bin ] || mkdir ~/bin
	rm -f ~/bin/phpwtf
	cp phpwtf ~/bin
	bunzip2 reference.bz2
	cp reference ~/.phpwtf-cache
	bzip2 -9 reference
