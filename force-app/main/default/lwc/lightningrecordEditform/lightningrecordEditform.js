import { LightningElement,api } from 'lwc';

export default class LightningrecordEditform extends LightningElement {
    @api recordId ='500GA00001U64XXYAZ'
    handleSuccess(event) {
        console.log('Record saved', event.detail.id);
}
}