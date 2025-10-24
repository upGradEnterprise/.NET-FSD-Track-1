class Person
{
      // base class members
      public name: string  = "Scott";
      public age: number  = 25; 
}

class Student extends Person
{
    // child class members 
    public course: string  = "Angular";
    public sid: number  = 0;  

    constructor(sid:number)
    {            
        super();
        this.sid = sid;   
    }

    public showDetails():void
    {
        console.log("Student Id : "+  this.sid);
        console.log("Student Name : "+  this.name);
        console.log("Student Age : "+  this.age);
        console.log("Course Name : "+  this.course);
    }
}

var s1:Student = new Student(465454);
s1.showDetails();

