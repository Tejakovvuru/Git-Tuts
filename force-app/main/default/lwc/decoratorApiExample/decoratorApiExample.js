import { LightningElement ,api} from 'lwc';

export default class DecoratorApiExample extends LightningElement {
    @api recordid ;
    @api Name;
    @api Email;
    @api Phone ;
}