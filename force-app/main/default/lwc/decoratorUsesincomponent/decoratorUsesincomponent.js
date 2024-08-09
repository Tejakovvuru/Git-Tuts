import { LightningElement, wire, api, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi'; // Example import for Salesforce UI API

export default class DecoratorUsesInComponent extends LightningElement {
    @track greeting = 'Hello, World!';
    @track currentTime;
    @track counter = 0;

    @api name = '';
    @api readOnlyProp = 'Read Only';

    connectedCallback() {
        this.currentTime = new Date().toLocaleTimeString();
        this.updateTime();
    }

    updateTime() {
        setInterval(() => {
            this.currentTime = new Date().toLocaleTimeString();
        }, 1000);
    }

    handleNameChange(event) {
        this.name = event.target.value;
    }

    @wire(getRecord, { recordId: '00QGA00000vinX32AI', fields: ['Name', 'Industry'] })
    wiredData({ error, data }) {
        if (data) {
            // Handle data from wire service
            console.log('Record data:', data);
        } else if (error) {
            // Handle error from wire service
            console.error('Error fetching record:', error);
        }
    }

    @api
    incrementCounter() {
        this.counter++;
    }
}



