#!/bin/bash

# Grabs all translatable strings in python files

[ -f messages.pot ] && rm messages.pot
[ -f messages/messages.pot ] && cp messages/messages.pot .

FILE=''

cd src

for file in `find . -path ./mutagen -prune -false -o -name "*.py"`; do
	echo "${file:2}"
    	FILES="$FILES ${file:2}";
done


#xgettext -L Python --msgstr-prefix="_(u" --msgstr-suffix=")" -a $FILES
xgettext -d src --keyword="_:1" -o ../messages.pot $FILES

[ -f ../messages/messages.pot.sav ] && rm ../messages/messages.pot.sav
[ -f ../messages/messages.pot ] && mv ../messages/messages.pot ../messages/messages.pot.sav

mv ../messages.pot ../messages/
