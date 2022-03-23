# wait-for-200

Wait for HTTP 200 then exit

## Environment variables

- **URL** - URL to wait for (default: www.google.com)
- **TIMEOUT** - timeout in seconds (default: 600)

## Usage

```shell
docker run --rm -e URL=http://test.com -e TIMEOUT=200 wait-for-200
```
