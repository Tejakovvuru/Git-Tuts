import { LightningElement, api } from 'lwc';
import updateLeadsStatus from '@salesforce/apex/updatetheleadsstatus.updateLeadsStatus';

export default class LeadStatusUpdate extends LightningElement {
    @api recordId; // Expose recordId as an API property

    handleSuccess(event) {
        const recordId = event.detail.id;
        console.log('Record saved with Id:', recordId);

        // Call Apex method to update Lead status
        updateLeadsStatus({ leadIds: [recordId] })
            .then(result => {
                console.log('Lead status updated successfully');
                // Handle success scenario if needed
            })
            .catch(error => {
                console.error('Error updating Lead status:', error);
                // Handle error scenario if needed
            });
    }
}