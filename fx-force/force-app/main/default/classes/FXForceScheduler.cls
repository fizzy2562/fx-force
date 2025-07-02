global class FXForceScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
        // You can adjust currencies as needed
        FreeCurrencyAPIService.fetchAndStoreRates(new List<String>{'EUR','GBP','JPY'}, 'USD');
    }
}
