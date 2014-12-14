#!/bin/sh
#sed s/CKSUM64/`curl http://ftp2.eu.openbsd.org/pub/OpenBSD/snapshots/amd64/SHA256 2> /dev/null | grep install..\.iso | cut -d' ' -f4`/ template.json.tmpl | \
#sed s/CKSUM32/`curl http://ftp2.eu.openbsd.org/pub/OpenBSD/snapshots/i386/SHA256 2> /dev/null | grep install..\.iso | cut -d' ' -f4`/ > template.json
sed s/CKSUM64/`curl http://ftp5.eu.openbsd.org/ftp/pub/OpenBSD/snapshots/amd64/SHA256 2> /dev/null | grep install..\.iso | cut -d' ' -f4`/ template.json.tmpl | \
sed s/CKSUM32/`curl http://ftp5.eu.openbsd.org/ftp/pub/OpenBSD/snapshots/i386/SHA256 2> /dev/null | grep install..\.iso | cut -d' ' -f4`/ > template.json
