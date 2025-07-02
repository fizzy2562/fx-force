# fx force

A Salesforce unmanaged package to fetch and store the latest exchange rates using freecurrencyapi.com.

<a href="https://githubsfdeploy.herokuapp.com/app/githubdeploy?owner=fizzy2562&repo=fx-force&path=force-app">
  <img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png" 
       alt="Deploy to Salesforce" />
</a>

---

## Setup

1. Deploy the package to your Salesforce org (using the button above, Salesforce DX, SFDX CLI, or Metadata API).
2. Make sure the custom metadata record FXForce_Settings__mdt exists with your API Key (provided by default).
3. Assign permissions for users to read/write FX_Rate__c.
4. (Optional) Schedule FXForceScheduler to run hourly/daily.

## Manual Test

In Developer Console, run:
```apex
FreeCurrencyAPIService.fetchAndStoreRates(new List<String>{{'EUR','GBP','JPY'}}, 'USD');
```

---

## Deploy Button Details

The "Deploy to Salesforce" button above uses the official [githubsfdeploy](https://github.com/afawcett/githubsfdeploy) tool to deploy the `force-app` directory in this repository directly to your Salesforce org. You can specify branch/tag using `&ref=main` if needed.

If you have issues, be sure the path and branch in the button link match your repository structure and active branch.

---

## Troubleshooting

- If you get a Salesforce error, confirm your org has API access (Developer, Enterprise, or higher editions).
- If the button doesn't work, try deploying using SFDX CLI:

  ```sh
  sfdx force:source:deploy -p force-app
  ```

- More info at [andyinthecloud.com](https://andyinthecloud.com/2024/08/19/new-job-a-tool-update-and-a-bit-of-coding-reflection/)

---
