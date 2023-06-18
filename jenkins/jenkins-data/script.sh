!/bin/bash
NAME=$1
LASTNAME=$2
SHOW=$3

if [ "$SHOW" = 'true' ]; then
	echo "hello, $NAME $LASTNAME"
else
	echo "If you wannat see the name, then please mark the show option"
fi
# FIRST_NAME=$1
# SECOND_NAME=$2
# LAST=$3
# echo "hello $FIRST_NAME $SECOND_NAME $LAST"
