class MyStack<T>
{ 	
	private data:T[] = new Array<T>();

	push(value: T)
	{		
        console.log("" + value + " pushed to stack");
        this.data.push(value);
	}	
	
	pop():T
	{
		return this.data.pop();
	}
}


let s1:MyStack<number> = new MyStack<number>();
s1.push( 10  );
s1.push( 20  );
console.log("**************************");
let x:number = 0;

x = s1.pop();
console.log(x + " pop from stack");

x = s1.pop();
console.log(x + " pop from stack");

console.log("----------------------------");
 
let s2:MyStack<string> = new MyStack<string>();
s2.push("Angular");
s2.push("React");
s2.push("VueJS");
s2.push("NodeJS");
// s2.push("Hi");
console.log("**************************");

let y:string = s2.pop();

while(y != undefined)
{
    console.log(y + " pop from stack");
    y = s2.pop();
}



