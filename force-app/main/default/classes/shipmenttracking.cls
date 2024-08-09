public with sharing class shipmenttracking {
    @AuraEnabled(cacheable=true)
    public static String getShipmentStatus(Id recordId) {
        try {
            // Query the Shipment record using the provided record ID
            Shipment__c shipment = [SELECT Name, Tracking_Number__c FROM Shipment__c WHERE Id = :recordId LIMIT 1];
            // Check if the Shipment record is found
            system.debug('shipment query'+ shipment );
            if (shipment == null) {
                throw new AuraHandledException('Shipment record cannot be found.');
            }
            // Get the tracking number and check if it's not empty
            String trackingNumber = String.valueOf(shipment.Tracking_Number__c);
            system.debug('trackingNumber'+ trackingNumber);
            if (String.isEmpty(trackingNumber)) {
                throw new AuraHandledException('Tracking number cannot be found or is empty.');
            }
            // Prepare the HTTP request to the mock shipping status service
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://merzcommunities--mel.sandbox.my.salesforce-sites.com/services/apexrest/mockShipmentStatus?trackingNumber=' + trackingNumber);
            request.setMethod('GET');
            // Send the HTTP request
            HttpResponse response = http.send(request);
            // Check the response status code
            if (response.getStatusCode() == 200) {
                return response.getBody();
            } else {
                throw new AuraHandledException('Error: ' + response.getStatus());
            }
        } catch (Exception e) {
            System.debug('Error in getShipmentStatus: ' + e.getMessage());
            throw new AuraHandledException('An unexpected error occurred. Please try again later.');
        }
    }
}