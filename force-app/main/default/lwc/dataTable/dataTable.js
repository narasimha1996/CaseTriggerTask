import { LightningElement ,track} from 'lwc';
import getAccountDetails from '@salesforce/apex/accountDetails.getAccountDetails';


const COLUMNS =[{label:'Label', fieldName:'Name', type:'text' },
    {label:'Phone', fieldName:'Phone', type:'phone'},
    {label:'Account Type', fieldName:'Type', type:'Picklist'}

];

// const DATA=[{id:1, name:'John Doe', website :'http://www.salesforce.com/' ,phone:'(557) 120-6338' ,Amount:'$31.00', closeAt:'Mar 6, 2024'},
// {id:2, name:'Jane Smith', website :'http://www.salesforce.com/' ,phone:'(557) 120-6332' ,Amount:'$41.00', closeAt:'Mar 10, 2024'}
// ]
export default class DataTable extends LightningElement {
    @track
    columns=COLUMNS;
    @track
    data;

    @track
    error;

   

    accountDetails(){
        getAccountDetails.then((result)=>{
            this.data =result;
            console.log('Successful data', JSON.parse(data));
        }).catch((error)=>{
            this.error =error;
            console.log('Unsuccessful data', error);
        }
        )

    }
    
    
}