import { LightningElement ,track, wire} from 'lwc';
import getCon from '@salesforce/apex/FetchingContacts.getCon';

const COLUMNS=[
    {label:'Contact First Name', fieldName:'FirstName'},
    {label:'Contact Last Name', fieldName:'LastName'},
    ]
export default class SearchContacts extends LightningElement {

  
    @track searchTerm='';
    @track conList;
    @track erorr;

    columns=COLUMNS;

    searchHandler(event){
        this.searchTerm = event.target.value;
        
    }



    // @wire(getCon,{searchTerm :'$searchTerm'})
    // SearchData({data,error}){
    //     if(data){
    //         this.conList = JSON.stringify(data);
    //         console.log(data);
    //     }else
    //     if(error){
    //         alert('error Msg',error);
    //     }

    // }
    clickHandler(event){
        event.preventDefault();
        this.getContactList();
    }

     getContactList(){
         getCon({searchTerm :this.searchTerm}).then(result=>{
            this.conList = result;
            console.log(this.conList);
            this.erorr =undefined;
        }).catch(error  =>{
            this.conList = undefined;
            this.erorr =error;
            alert('error Msg',this.erorr);
        })
    }

   
   

}