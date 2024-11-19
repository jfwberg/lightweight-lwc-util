import { LightningElement } from 'lwc';

export default class CodeMirrorTester extends LightningElement {

    // CodeMirror Always set some default values
    codemirrorClass     = 'ta';
    codemirrorLoaded	= false;
    codemirrorMode		= 'text/x-sql';
    codemirrorSize		= {width : '100%', height: 250};
    codemirrorTheme		= 'default';
    codemirrorValue     = 'SELECT Id FROM Account WHERE Name = \'My Account\' LIMIT 1';

    // Actions that run once the code mirror windows has been loaded and added to the DOM
    handleCodemirrorLoaded(){
        this.codemirrorLoaded = true;
    }

    // Handle any updates in case the theme changes
    handleModeChange(event) {
        this.codemirrorMode = event.detail;
    }

    // Handle any updates in case the theme changes
    handleThemeChange(event) {
        this.codemirrorTheme = event.detail;
    } 
}