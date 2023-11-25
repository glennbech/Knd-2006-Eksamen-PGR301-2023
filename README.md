# Knd-2006-Eksamen-PGR301-2023

## Oppgave 1
## A. SAM & GitHub actions workflow
For å få github action til å kjøre på din fork må du legge inn
 - AWS_ACCESS_KEY_ID
 - AWS_SECRET_ACCESS_KEY

som secrets. Det finner du her: https://github.com/"DITT BRUKERNAVN"/"DITT REPO"/settings/secrets/actions
Du trenger også brukernavn og en github token når du skal pushe til forken din. Det finner du [her](https://github.com/settings/tokens/new)
Så kan du gjøre en liten endring i koden som å legge inn en kommentar et sted. Deretter:
 - git add "din fil" 
 - git commit -m"din melding"
 - git push
 
Så kan du gå inn i actions på repositoriet og se at actionen kjører.
I steget "Sam deploy" vil du få en link til funksjonen. MERK: denne går gjennom en gateway som har en maks timout på 29 sekunder, når jeg testet ble funksjonen noen ganger ferdig før og andre ikke. 
Prøvde å sette timeouten på lambdaen til 5 min, men det hjalp ikke på gatewayen forståelig nok.. Under er en direkte link til lambdaen samt apiet gjennom gatewayen. 

API endpoint (gjennom gateway): [Link](https://tvf1d8yjia.execute-api.eu-west-1.amazonaws.com/Prod/hello)

Direkte link til lambda: [Link](https://gcwivjsicibb7jvi4urcicgnze0rdtrd.lambda-url.eu-west-1.on.aws/)

## B. Docker container.
Funker som den skal, du kan også bruke min bucket:
docker run -e AWS_ACCESS_KEY_ID=XXX -e AWS_SECRET_ACCESS_KEY=YYY -e BUCKET_NAME=kandidat2006 kjellpy

## Oppgave 2
## A. Dockerfile

Kjør med dine aws credentials: 
 - docker build -t ppe . 
 - docker run -p 8080:8080 -e AWS_ACCESS_KEY_ID=XXX -e AWS_SECRET_ACCESS_KEY=YYY -e BUCKET_NAME=kjellsimagebucket ppe

eller min bucket:
 - docker run -p 8080:8080 -e AWS_ACCESS_KEY_ID=XXX -e AWS_SECRET_ACCESS_KEY=YYY -e BUCKET_NAME=kandidat2006 ppe

test applikasjon:
 - curl localhost:8080/scan-ppe?bucketName=kjellsimagebucket

eller min:
 - curl localhost:8080/scan-ppe?bucketName=kandidat2006

## B. Actions -> ecr
![screenshot av ecr images hvor den nyeste har tagen "latest"](/img/ecr_screenshot.png)

## Oppgave 3
## A. 
Har forbedret koden ved å trekke ut hardkodede verdier i variabler, og gitt nesten alle defaults utenom hvilket image som skal kjøres. Dette inputter jeg i workflowfilen.

## B.
Jeg husket ikke helt hvilken bucket vi brukte i forelesningen så lagde bare min egen for å bruke som backend til terraform.

For å få action til å kjøre hos deg må du ha AWS_ACCESS_KEY_ID og AWS_SECRET_ACCESS_KEY i secretsene dine. Deretter en liten kommentar et sted i koden for så å:
 - git add "din fil" 
 - git commit -m"din melding"
 - git push
 
Så vil du se at den kjører i actions taben.
