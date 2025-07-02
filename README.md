# fx force

A Salesforce unmanaged package to fetch and store the latest exchange rates using freecurrencyapi.com.

[![Deploy to Salesforce](https://github.com/afawcett/githubsfdeploy/raw/master/deploy.png)](https://githubsfdeploy.herokuapp.com/app/githubdeploy?owner=fizzy2562&repo=fx-force)


## Setup

1. Deploy the package to your Salesforce org (using Salesforce DX, SFDX CLI, or Metadata API).
2. Make sure the custom metadata record FXForce_Settings__mdt exists with your API Key (provided by default).
3. Assign permissions for users to read/write FX_Rate__c.
4. (Optional) Schedule FXForceScheduler to run hourly/daily.

## Manual Test

In Developer Console, run:
```apex
FreeCurrencyAPIService.fetchAndStoreRates(new List<String>{'EUR','GBP','JPY'}, 'USD');
```
