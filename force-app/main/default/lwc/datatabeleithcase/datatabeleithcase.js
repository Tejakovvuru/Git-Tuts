import { LightningElement, wire, track } from 'lwc';
import getcases from '@salesforce/apex/caserecords.getcases';

export default class Datatabeleithcase extends LightningElement {
    @track data;
    @track columns = [
        { label: 'Case Name', fieldName: 'Name', type: 'text' },
        { label: 'Priority', fieldName: 'Priority', type: 'text' },
        { label: 'Status', fieldName: 'Status', type: 'text' }
    ];
    error;

    @wire(getcases)
    wiredCases({ error, data }) {
        if (data) {
            this.data = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }
}
 