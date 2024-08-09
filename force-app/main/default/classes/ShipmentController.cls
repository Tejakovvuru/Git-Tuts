public with sharing class ShipmentController {
    @AuraEnabled
    public static void createShipment(String status, String trackingNumber, String ownerName) {
        Shipment newShipment = new Shipment();
        newShipment.Status = status;
        newShipment.TrackingNumber = trackingNumber;
        newShipment.Owner_Name__c = ownerName; // Adjust this to the correct field name for the owner
        insert newShipment;
    }
}
