#!/bash
# -*- coding: utf-8 -*-

timeout="${TIMEOUT:-600}"
url="${URL:-www.google.com}"

echo "Waiting up to $timeout seconds for HTTP 200 from $url"
curl --output /dev/null \
	--insecure \
	--location \
	--silent --verbose --head  \
	--fail \
	--connect-timeout 5 \
	--retry 999 \
	--retry-max-time 0 \
	--retry-delay 0 \
	--retry-all-errors \
	--max-time "$timeout" \
	"$@" \
	"$url" >& /dev/stdout