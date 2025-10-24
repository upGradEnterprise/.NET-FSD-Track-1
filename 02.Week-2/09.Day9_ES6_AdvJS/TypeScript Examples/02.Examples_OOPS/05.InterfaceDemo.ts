interface IPerson
{
    fname:string;
    lname:string;
    age:number;

    printDetails():void;     
}


class Customer implements IPerson
{
    public fname:string = "Ravi";
    public lname:string = "Kiran";
    public age:number = 25;
    public city:string  = "Hyd";

    public printDetails():void
    {
        console.log("Customer First Name  : "  + this.fname);
        console.log("Customer Last Name  : "  + this.lname);
        console.log("Customer Age  : "  + this.age);
        console.log("City Name   : "  + this.city);
    }
}


var custObj:Customer = new Customer();
custObj.printDetails(); 