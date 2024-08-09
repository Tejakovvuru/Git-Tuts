import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';

export default class AccountDetail extends LightningElement {
   @api recordId;
   account;
   error;

   
   @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD, INDUSTRY_FIELD, TYPE_FIELD] })
   wiredRecord({ error, data }) {
       if (data) {
           this.account = {
               Name: data.fields.Name.value,
               Industry: data.fields.Industry.value,
               Type: data.fields.Type.value,
              
               // Add more fields as needed
           };
           this.error = undefined;
       } else if (error) {
           this.error = error;
           this.account = undefined;
       }
   }
}
