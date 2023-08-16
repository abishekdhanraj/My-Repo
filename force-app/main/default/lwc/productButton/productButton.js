import { LightningElement } from 'lwc';

export default class ProductButton extends LightningElement {
    clickedButtonLabel;

    handleClick(event) {
        this.clickedButtonLabel = event.target.label;
    }
}