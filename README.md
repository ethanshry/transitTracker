# Transit Tracker

I want to have fun learning how to write visualization software while simultaniously learning more about using AWS services and the AWS CLI, which has led me to this project.

The goal is to have a serverless service which will allow consumers to consume information about MTBA vehicles. Consumers will be able to view the current state of MTBA vehicles, both in raw numbers and on a map. They will also have access to historic runs of these queries.

## High Level Design

## Data Sourcing

All data will be sourced from the [MTBA API](https://www.mbta.com/developers/v3-api).

Initial data requests will be made to the DataRequest lambda, which will determine whether data exists in the DynamoDB cache already or whether it needs to be newly processed. Data requests will be in the following format:

```json
{
  "requester": "UI|MapMaker", # allows notification of data readiness for MapMaker
  "requestedDataTimestamp": UNIX_TIMESTAMP
}
```

## Data Requests

## 

