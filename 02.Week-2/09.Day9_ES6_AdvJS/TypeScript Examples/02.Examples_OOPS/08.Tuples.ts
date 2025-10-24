// Tuples in typescript

//var mytuple = [1020, "Printer"]; 
var mytuple:[number, string] = [1020, "Printer"];
console.log("Items before push " + mytuple.length)    // returns the tuple size 


mytuple.push(12);                              		// append value to the tuple 
mytuple.push("Hello");                        	// append value to the tuple 
// mytuple.push(false);                           // error 
console.log("Items after push " + mytuple.length) 
console.log(mytuple);
console.log("--------------------------");

console.log("Items before pop " + mytuple.length) 
let x:any = mytuple.pop();
console.log(x +" popped from the tuple") // removes and returns the last item  
console.log("Items after pop " + mytuple.length);
console.log(mytuple);