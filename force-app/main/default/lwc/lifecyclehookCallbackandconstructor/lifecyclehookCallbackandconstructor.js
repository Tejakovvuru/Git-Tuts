import { LightningElement,api } from 'lwc';

export default class LifecyclehookCallbackandconstructor extends LightningElement {
    @api recordId; 
    accountName;
    accountOwner;
    accountNumber;

    constructor() {
        super(); // Must call super() first in the constructor
        console.log('Constructor called');
        // Initialize variables or perform setup tasks here
        this.accountName = undefined; // Initialize to undefined
        this.accountOwner = undefined; // Initialize to undefined
        this.accountNumber = undefined; // Initialize to undefined
    }

    connectedCallback() {
        console.log('Component connected to the DOM');
        // Fetch account details when component is connected to the DOM
        this.fetchAccountDetails();
    }

    fetchAccountDetails() {
        // Simulate fetching account details from Apex or other sources based on recordId
        // Replace with actual Apex call or data fetching logic
        // For demonstration, set dummy data
        this.accountName = 'Sample Account';
        this.accountOwner = 'John Doe';
        this.accountNumber = 'ACC123456';
    }
}
