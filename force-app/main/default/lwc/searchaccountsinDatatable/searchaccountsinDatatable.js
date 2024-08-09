import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/Accountsearch.getAccounts';
export default class Accountsearch extends LightningElement {
    @track searchKey = '';
    @track searchResults = [];
    @track error;
    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }
    handleSearch() {
        searchAccounts({ searchKey: this.searchKey })
            .then(result => {
                this.searchResults = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error.body.message;
                this.searchResults = [];
            });
    }
}






























    