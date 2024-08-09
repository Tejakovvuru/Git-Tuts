import { LightningElement, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigationToNewPage extends NavigationMixin(LightningElement) {
    @track firstname;
    @track lastname;
    @track Email;

    handleFirstNameChange(event) {
        this.firstname = event.target.value;
    }

    handleLastNameChange(event) {
        this.lastname = event.target.value;
    }

    handleEmailChange(event) {
        this.Email = event.target.value;
    }

    createContact() {
        const fields = {
            FirstName: this.firstname,
            LastName: this.lastname,
            Email: this.Email
        };

        const recordInput = { apiName: 'Contact', fields };
        
        createRecord(recordInput)
            .then(contact => {
                // Navigate to the newly created contact's detail page
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: contact.id,
                        objectApiName: 'Contact',
                        actionName: 'view',
                    },
                });
            })
            .catch(error => {
                console.error('Error creating contact:', error.body.message);
                // Handle error
            });
    }
}