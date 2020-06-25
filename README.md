# Clean Architecture Dojo App

## Running

```
docker-compose up
```

## Project Requirements


Create a JSON REST API to manage leads. The project needs to:
* Create leads
* List Leads
* Lead Score calculator
  - In case the lead has an address, +50 points
  - In case the lead has an email @gmail.com, +5 points
  - In case the lead has a phone number, +75 points

Return the lead score for every lead when listing leads
