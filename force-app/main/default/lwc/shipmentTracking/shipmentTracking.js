import { LightningElement, api, track } from 'lwc';
import getShipmentStatus from '@salesforce/apex/shipmenttracking.getShipmentStatus';

export default class ShipmentTracking extends LightningElement {
    @api recordId;
    @track shipmentStatus;
    @track error;

    connectedCallback() {
        if (this.recordId) {
            this.fetchShipmentStatus();
        }
    }

    fetchShipmentStatus() {
        getShipmentStatus({ recordId: this.recordId })
            .then(result => {
                this.shipmentStatus = result;
                this.error = undefined;
            })
            .catch(error => {
                this.shipmentStatus = undefined;
                this.error = error.body.message;
            });
    }
}

