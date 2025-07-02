public with sharing class FreeCurrencyAPIService {
    private static final String BASE_URL = 'https://api.freecurrencyapi.com/v1/latest';

    // Get API Key from Custom Metadata
    private static String getApiKey() {
        List<FXForce_Settings__mdt> settings = [SELECT API_Key__c FROM FXForce_Settings__mdt LIMIT 1];
        if (!settings.isEmpty()) {
            return settings[0].API_Key__c;
        }
        throw new AuraHandledException('API Key is missing in FXForce_Settings__mdt');
    }

    public static void fetchAndStoreRates(List<String> targetCurrencies, String baseCurrency) {
        String apiKey = getApiKey();
        String symbols = String.join(targetCurrencies, ',');
        String endpoint = BASE_URL + '?apikey=' + apiKey + '&base_currency=' + baseCurrency + '&currencies=' + symbols;

        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            Map<String, Object> payload = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            Map<String, Object> data = (Map<String, Object>) payload.get('data');

            List<FX_Rate__c> rates = new List<FX_Rate__c>();
            for (String currency : data.keySet()) {
                rates.add(new FX_Rate__c(
                    Base_Currency__c = baseCurrency,
                    Target_Currency__c = currency,
                    Rate__c = (Decimal) data.get(currency),
                    Retrieved_On__c = System.now()
                ));
            }
            upsert rates;
        } else {
            throw new AuraHandledException('FX API call failed: ' + res.getBody());
        }
    }
}
