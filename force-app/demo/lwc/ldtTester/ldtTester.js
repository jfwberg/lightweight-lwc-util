import { LightningElement } from 'lwc';

// Custom Utils
import {handleError}      from 'c/util';

// Apex Methods
import getTestTable       from '@salesforce/apex/LdtTesterLwcCtrl.getTestTable';


export default class CodeMirrorTester extends LightningElement {

    // Indicator if load is complete
    loaded =  false;

    // Loading variable for the spinner
	loading =  false;

    // Lightning data table
    ldt;

    // Fetch table data
    connectedCallback(){        
        this.handleGetTestTable();
    }

    // Call Apex
    handleGetTestTable(){
        try{
            this.loading = true;

            // Execute apex
            getTestTable()
            .then(apexResponse => {
                this.ldt = apexResponse;
                this.loaded = true;
            })
            .catch(error => {
                this.loaded = false;
                handleError(error);
            })
            .finally(()=>{
                this.loading = false;
            });
        }catch(error){
            this.loading = false;
            this.loaded  = false;
            handleError(error);
        }
    }

    handleRowAction(event) {
        try{
            const row    = event.detail.row;
            const action = event.detail.action;
            
            switch(action.name) {
                case 'sso_login':
                    alert('Action sso_login');
                break;
                case 'set_password':
                    alert('Action set_password');
                break;
                case 'set_color':
                    alert('Action set_color');
                break;
            }
        }catch(error){
            handleError(error);
        }
    }
}