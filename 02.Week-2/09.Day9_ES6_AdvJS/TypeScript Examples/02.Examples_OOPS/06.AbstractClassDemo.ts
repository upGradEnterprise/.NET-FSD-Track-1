abstract class Person 
{
    public name: string;
    
    constructor(name: string) {
        this.name = name;
    }

    display(): void{
        console.log("Name  : " + this.name);
    }

    // abstract method
    abstract find(string): Person;
}

class Employee extends Person { 
    empCode: number;
    
    constructor(name: string, code: number) { 
        super(name); // must call super()
        this.empCode = code;
    }

    find(name:string): Person { 
        // logic to find employee        
        return new Employee(name, 1);
    }
}

let empObj1: Person = new Employee("James", 10256);
empObj1.display(); //James

let empObj2: Person = empObj1.find('Steve');
empObj2.display(); 