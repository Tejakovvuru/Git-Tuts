import { LightningElement } from 'lwc';
import deleteancaserecords from '@salesforce/apex/deleteancaserecords.deleteCasesWithNewStatus';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DeleteTheCaseRecords extends LightningElement {

    handleDelete() {
        deleteancaserecords()
            .then(result => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: result,
                        variant: 'success'
                    })
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting cases',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }
}