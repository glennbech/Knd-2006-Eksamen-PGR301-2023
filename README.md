# Knd-2006-Eksamen-PGR301-2023

## Oppgave 1
## A. SAM & GitHub actions workflow
For å få github action til å kjøre på din fork må du legge inn
 - AWS_ACCESS_KEY_ID
 - AWS_SECRET_ACCESS_KEY
som secrets.
Så kan du gjøre en liten endring i koden som å legge inn en kommentar et sted. Deretter:
 - git add "din fil" 
 - git commit -m"din melding"
 - git push
Så kan du gå inn i actions på repositoriet og se at actionen kjører.
I steget "Run sam deploy --no-confirm-changeset --no-fail-on-empty-changeset --stack-name kandidat2006-sam-app --capabilities CAPABILITY_IAM --region eu-west-1"
vil du få en link til funksjonen. MERK: denne går gjennom en gateway som har en maks timout på 29 sekunder, når jeg testet ble funksjonen noen ganger ferdig før og andre ikke. 
Prøvde å sette timeouten på lambdaen til 5 min, men det hjalp ikke på gatewayen forståelig nok.. Under er en direkte link til lambdaen samt apiet gjennom gatewayen. 

API endpoint (gjennom gateway): [Link](https://tvf1d8yjia.execute-api.eu-west-1.amazonaws.com/Prod/hello)
Direkte link til lambda: [Link](https://gcwivjsicibb7jvi4urcicgnze0rdtrd.lambda-url.eu-west-1.on.aws/)

## B. Docker container.
Funker som den skal, du kan også bruke min bucket:
docker run -e AWS_ACCESS_KEY_ID=XXX -e AWS_SECRET_ACCESS_KEY=YYY -e BUCKET_NAME=kandidat2006 kjellpy
