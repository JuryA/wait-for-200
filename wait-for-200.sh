#!/bash
# -*- coding: utf-8 -*-

timeout="${TIMEOUT:-600}"
url="${URL:-www.google.com}"

# pure bash sleep 
sleep() {
  # shellcheck disable=SC2015,SC2162
  coproc read -t "$1" && wait "$!" || true
}

timeout()
{
	local cmd_pid sleep_pid retval

	(shift; "$@") &   # shift out sleep value and run rest as command in background job
	cmd_pid=$!

	(sleep "$1"; kill "$cmd_pid" 2>/dev/null) &
	sleep_pid=$!

	wait "$cmd_pid"
	retval=$?
	kill "$sleep_pid" 2>/dev/null

	return "$retval"
}

echo "Waiting up to $timeout seconds for HTTP 200 from $url"
if timeout "$timeout" curl --output /dev/null --silent --max-time "$timeout" --head --fail "$url"; then
  echo 'OK'
else
  echo "ERROR: Timed out wating for HTTP 200 from $url" >&2
  exit 1
fi
