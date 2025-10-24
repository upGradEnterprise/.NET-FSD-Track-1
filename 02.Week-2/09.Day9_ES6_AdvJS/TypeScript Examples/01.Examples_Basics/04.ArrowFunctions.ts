function twoMultiple(x:number) :  number
{
    return x * 2;
}


var ar1:number[]  =  [1,2,3,4,5];

// 1. Callback using named functions
var ar2:number[] =  ar1.map(Math.sqrt);
var ar3:number[] =  ar1.map(twoMultiple);


// 2. Callback using Anonymous functions
var ar4:number[] =  ar1.map(function(x:number)
{
    return x * 5;
});

// 3. Callback using Arrow functions
var ar5:number[] =  ar1.map( (x) =>
{
    return x * 10;
});

var ar6:number[] =  ar1.map( x => x * 11 );


console.log(ar1);
console.log(ar2);
console.log(ar3);
console.log(ar4);
console.log(ar5);
console.log(ar6);


