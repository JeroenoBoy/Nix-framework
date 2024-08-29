weather=`curl -s "wttr.in/?format=3" | sed "s/^.*, //"`
country=`echo "$weather" | sed "s/:.*//"`
temprature=`echo "$weather" | sed "s/^.*  //"`
emoji=`echo "$weather" | sed "s/^.*: //" | sed "s/  .*$//"`

echo "{\"country\":\"$country\",\"temprature\":\"$temprature\",\"emoji\":\"$emoji\"}"
