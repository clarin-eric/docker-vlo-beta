#!/usr/bin/sh

NAME="vlo-beta"
IMAGE="docker.clarin.eu/vlo-beta:1.0.4"
HOST_LOGS="/var/log/docker/vlo-beta"

# Show help message
function show_help {
    echo ""
    echo "Usage:"
    echo ""
    echo "  sh run.sh [-i|-s|-h]"
    echo ""
    echo "      -i, --importer      Run importer"
    echo "      -s, --service       Start the vlo service (tomcat + webapp deployed)"
    echo "      -h, --help          Show this help"
    echo ""
}

# Run the SOLR importer
function run_importer {
    echo "Running importer"
    docker \
        run \
        -ti \
        --rm \
        -v /Users/wilelb/vlo-data:/srv/vlo-data/ \
        -e "STATSD_PREFIX=vlo.local.test" \
        $IMAGE \
        /opt/importer.sh
}

# Run the docker container
function run_service {
    echo "Running service"
    echo "    stopping ${NAME}"
    docker stop $NAME
    echo "    removing ${NAME}"
    docker rm $NAME
    echo "    running  ${NAME}"
    docker run -d \
        --name $NAME \
        -p 8080:8080 \
        -e "SOLR_DATA=/opt/solr-data" \
        -e "STATSD_PREFIX=vlo.local.test" \
        -v /Users/wilelb/vlo-data:/srv/vlo-data \
        -v ${HOST_LOGS}:/var/log/tomcat8 \
        $IMAGE
}

# Parse command line arguments
if [ "$#" -ne 1 ]; then
    echo ""
    echo "ERROR: Incorrect number of argument supplied"
    show_help
    exit 1
else
    for i in "$@"
    do
    case $i in
        -i|--importer)
            run_importer
            exit 0
        ;;
        -s|--service)
            run_service
            exit 0
        ;;
        -h|--help)
            show_help
            exit 0
        ;;
        *)
            echo ""
            echo "ERROR: Unkown option supplied"
            show_help
            exit 1
        ;;
    esac
    done
fi