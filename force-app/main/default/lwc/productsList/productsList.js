import { LightningElement, api } from "lwc";
import ram from '@salesforce/resourceUrl/myRam';
import keyboard from '@salesforce/resourceUrl/keyboard';
export default class ProductsList extends LightningElement {
	
	@api products = [
		
		
		{
			
			Id: 1,
			img:'images/ram.jpeg',
			productName: "Test 1",
			Display_Price__c: 100,
			Quantity: 1,
			Name: "Test"
		},
	
	
		{
			Id: 2,
			img:'images/keyboard.jpeg',
				
			productName: "Test ",
			Display_Price__c: 100,
			Quantity: 1,
			Name: "Test 2"
		},
		{
			Id: 3,
			ImageUrl__c:
				"/sfc/servlet.shepherd/version/download/0682w000003XwEnAAK",
			productName: "Test 1",
			Display_Price__c: 100,
			Quantity: 1,
			Name: "Test 3"
		},
		{
			Id: 4,
			ImageUrl__c:
				"/sfc/servlet.shepherd/version/download/0682w000003XwEnAAK",
			productName: "Test 1",
			Display_Price__c: 100,
			Quantity: 1,
			Name: "Test 4"
		},
		{
			Id: 5,
			ImageUrl__c:
				"/sfc/servlet.shepherd/version/download/0682w000003XwEnAAK",
			productName: "Test 1",
			Display_Price__c: 100,
			Quantity: 1,
			Name: "Test 5"
		}
	];
}