// Usage of constants
const MAX:number = 100;
console.log("The value of MAX : " + MAX);
// MAX  = 101;   // error


// Array destructring
let ar1:number[]  = [10, 20, 30];

/*
let x:number = ar1[0];
let y:number = ar1[1];
let z:number = ar1[2];
*/

let [x,y,z] = ar1;
console.log(`X = ${x}, y = ${y}, z = ${z}`);





// Unlimited Parameters / Rest / Spread Attribute
function sum(...ar:number[]):void
{
    let total:number = 0;

    // block scope
    for (let i:number = 0; i < ar.length; i++)
    {
        total = total + ar[i];
    }    

    // console.log("The value of i : " + i);  // error
    console.log("Sum Result  : " + total);
}





sum(10);
sum(10, 20, 30);
sum(10, 20, 30, 40, 50, 60, 70);
sum(10, 20);
sum(10, 20, 30, 40, 50, 60, 70, 80, 90);
