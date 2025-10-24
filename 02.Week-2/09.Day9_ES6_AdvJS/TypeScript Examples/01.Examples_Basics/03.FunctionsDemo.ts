function getMessage():void
{
     console.log("Welcome to TypeScript");
}

function greeting(uname:string):void
{
    console.log("Welcome to " + uname);
}

function add(x:number, y:number):number
{
    return x + y;
}


// Default Parameters
function getTotal(price:number,  qty:number = 1) : void
{
    let total:number = 0;
    total = price * qty; 
    console.log(`Price  : ${price}, Quantity  : ${qty}, Total Amount  : ${total}`);
}



// Function calling
getMessage();
getMessage();
console.log("----------------------------");
greeting("Scott");
greeting("Smith");
console.log("----------------------------");
let result  =  add(10,20);
console.log("Addition Result : " + result);

console.log("----------------------------");
getTotal(2500,3);
getTotal(1500);