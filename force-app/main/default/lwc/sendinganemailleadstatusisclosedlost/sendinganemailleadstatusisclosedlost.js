import { LightningElement } from 'lwc';
import sendEmail from '@salesforce/apex/sendemailtolead.sendEmail';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';

export default class SendingAnEmailLeadStatusIsClosedLost extends LightningElement {
    channelName = '/event/LeadStatusChangeEvent__e';
    subscription = null;

    connectedCallback() {
        // Register error listener
        onError(error => {
            console.error('EMP API error', JSON.stringify(error));
        });

        // Subscribe to event
        this.subscribeToEvent();
    }

    subscribeToEvent() {
        // Callback invoked whenever a message is received
        const messageCallback = response => {
            console.log('Received event:', JSON.stringify(response));
            // Call Apex method to send email when event is received
            this.sendEmail();
        };

        // Subscribe to the platform event
        subscribe(this.channelName, -1, messageCallback)
            .then(response => {
                console.log('Subscribed to channel:', this.channelName);
                this.subscription = response;
            })
            .catch(error => {
                console.error('Error subscribing to channel:', JSON.stringify(error));
            });
    }

    sendEmail() {
        // Call Apex method to send email when Lead status is Closed - Converted
        sendEmail({ leadIds: [] }) // Pass any necessary parameters here
            .then(result => {
                console.log('Email sent successfully:', result);
                // Handle any post-email logic here
            })
            .catch(error => {
                console.error('Error sending email:', error);
                // Handle error or exception
            });
    }

    disconnectedCallback() {
        // Unsubscribe from event upon component destruction
        if (this.subscription) {
            unsubscribe(this.subscription, response => {
                console.log('Unsubscribed from channel:', this.channelName);
            });
        }
    }
}
