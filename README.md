# mta-api
A Ruby wrapper of the NYC Metropolitan Transit Authority (MTA) Real-Time API.

This will query the XML API and return simple Ruby hashes.

## Usage

```
api = MTA::API.new
api.get_service_advisories
```

## Endpoints

#### `.get_service_advisories`
Returns all of the service advisories currently in effect.

#### `.get_lost_property`

Queries the [Lost Property Endpoint](http://advisory.mtanyct.info/LPUWebServices/CurrentLostProperty.aspx) to return a list of lost property categories and their counts.
