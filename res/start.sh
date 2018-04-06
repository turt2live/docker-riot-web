#!/bin/sh

PORT=80
RIOT_VERSION=v0.14.0-rc.4

function usage()
{
    echo "Runs a riot-web server"
    echo ""
    echo "/start.sh"
    echo "\t-h --help"
    echo "\t--port=$PORT"
    echo "\t--riot-version=$RIOT_VERSION"
    echo ""
}

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --port)
            PORT=$VALUE
            ;;
        --riot-version)
            RIOT_VERSION=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

echo "Downloading riot-web $RIOT_VERSION"
cd /tmp
wget "https://github.com/vector-im/riot-web/releases/download/$RIOT_VERSION/riot-$RIOT_VERSION.tar.gz" -O riot.tar.gz

echo "Unpacking riot-web"
rm -rf /www
mkdir -p /www
tar -zxvf riot.tar.gz --strip-components=1 -C /www

echo "Starting nginx on port $PORT"
sed -i "s/NOMAD_HTTP_PORT/$PORT/g" /etc/nginx/nginx.conf
nginx