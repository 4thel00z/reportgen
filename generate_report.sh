#
# Licensed under the GPL-3 License
#
# Author: Mohamed Mustapha Tahrioui aka. ransomware aka. 4thel00z (4thel00z@gmail.com)
#
# The intention of this software is to provide a simple go http service boilerplate for myself
# and others who are interested in using my software non-commercially or commercialy.
#
#! /bin/sh

if [ "$#" -ne 2 ]; then
	echo "usage: $0 <input.md> <output.format>"
	exit
fi


pandoc $1 -o $2 \
--template /usr/share/pandoc/data/templates/eisvogel.latex \
--from markdown+yaml_metadata_block+raw_html \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=section \
--highlight-style tango
