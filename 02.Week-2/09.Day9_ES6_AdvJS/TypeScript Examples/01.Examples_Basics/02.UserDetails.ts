var uname:string  = "Scott";
var email:string  = "scott@gmail.com";
var age:number  = 25;
var isValidUser:boolean = true;


// age = "Hello";   // error

console.log("User Name  :" + uname);
console.log("User Email  :" + email);
console.log("User Age  :" + age);
console.log("Is Valid User :" + isValidUser);


// ES6/7 :      Template String or String literals
console.log("------------------------------------------------");

// var strOutput = "User Details  Name : "+ uname +  ", Email : "+ email + ", Age : "+ age + ", Is Valid User : "+ isValidUser;
var strOutput = `User Details  Name : ${uname}, Email : ${email}, Age : ${age}, Is Valid User : ${isValidUser}`; 
console.log(strOutput);

