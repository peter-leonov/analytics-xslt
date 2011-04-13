#!/bin/bash

ONLINE="yes"
PERIOD=90

PROFILE_ID=9038802
STAT_DIR=/www/inshaker/htdocs/stat
VISITS_XML=$STAT_DIR/visitors/data.xml
CITIES_XML=$STAT_DIR/cities/data.xml
BROWSERS_XML=$STAT_DIR/browsers/data.xml
BROWSERS_PLAIN_XML=$STAT_DIR/browsers-plain/data.xml

if [[ $1 = "offline" ]]; then
	echo "Working offline"
	ONLINE=""
fi

# dates

if date --date "1970-01-01" >/dev/null 2>&1; then
	# GNU date
	stamp2date (){
		# based on http://www.unix.com/tips-tutorials/31944-simple-date-time-calulation-bash.html
		date --date "1970-01-01 $1 sec" "+%Y-%m-%d"
	}
elif date -r 0 >/dev/null 2>&1; then
	# FreeBSD date
	stamp2date (){
		date -r $1 "+%Y-%m-%d"
	}
fi

NOW=$(date "+%s")
DAY=$((3600 * 24))
END=$(($NOW - 2 * $DAY))
START=$(($END - $PERIOD * $DAY))
START_DATE=$(stamp2date $START)
END_DATE=$(stamp2date $END)
echo Getting stats from $START_DATE to $END_DATE


# authorization

if [ ! -f data/auth_token.txt ]; then
	echo "ERROR: data/auth_token.txt file is missing" 1>&2
	exit 1
fi
AUTH_TOKEN=$(cat data/auth_token.txt)


# reports

report (){
	MY_NAME=$1
	MY_QUERY=$2
	MY_RESULTS=$3
	MY_FILE=$4
	
	echo "reporting $MY_NAME"
	FEED_URI="https://www.google.com/analytics/feeds/data?ids=ga:$PROFILE_ID&$MY_QUERY&start-date=$START_DATE&end-date=$END_DATE&max-results=$MY_RESULTS&prettyprint=true"
	if [[ $ONLINE = "yes" ]]; then
		rm -f $MY_NAME.xml
		echo "  downloading..."
		mkdir -p data
		curl "$FEED_URI" -s --header "Authorization: GoogleLogin Auth=$AUTH_TOKEN" > data/$MY_NAME.xml
	fi
	if cat data/$MY_NAME.xml | grep "<?xml" >/dev/null; then
		echo "  processing..."
		xsltproc $MY_NAME.xsl data/$MY_NAME.xml > $MY_FILE
	else
		echo "ERROR: file has a wrong format or does not exist \"$MY_NAME.xml\"" 1>&2
	fi
}

report "visits" "dimensions=ga:date&metrics=ga:visits,ga:pageviews" $PERIOD $VISITS_XML
report "cities" "dimensions=ga:region&metrics=ga:visits&sort=-ga:visits" 4 $CITIES_XML
report "browsers" "dimensions=ga:browser,ga:browserVersion&metrics=ga:visits&sort=-ga:visits" 2500 $BROWSERS_XML
report "browsers-plain" "dimensions=ga:browser&metrics=ga:visits&sort=-ga:visits" 6 $BROWSERS_PLAIN_XML
# https://www.google.com/analytics/feeds/data?ids=ga:9038802&dimensions=ga:browser&metrics=ga:visits&sort=-ga:visits&start-date=2009-07-23&end-date=2009-10-21&max-results=1000