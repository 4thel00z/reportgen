#
# Licensed under the GPL-3 License
#
# Author: Mohamed Mustapha Tahrioui aka. ransomware aka. 4thel00z (4thel00z@gmail.com)
#
# The intention of this software is to render PDFs to a format of choice in one line
#
#! /bin/bash

set -e
filename=$(basename -- "$1")
outfilename=$(basename -- "$2")
echo "Copying over $filename, if: \n\t$1 and\n\t$filename\nare not the same"
`[[ $filename -ef $1 ]] || cp $1 $filename`
tmp_dir=$(mktemp -d -t reportgen-XXXXXXXXXX)

if [ $# -eq 2 ]
then
	docker run -v="$PWD/$filename:/data/$filename" -v "$tmp_dir:/data/"  --rm -t ransomwarezz/reportgen:latest $filename $outfilename
else
	shift
	shift
	docker run -v="$PWD/$filename:/data/$filename" $@ -v "$tmp_dir:/data/" --rm -t ransomwarezz/reportgen:latest $filename $outfilename
fi

mv $tmp_dir/$outfilename $outfilename
rm -rf $tmp_dir
