class Student
{
    public sid:number = 0;
    public sname:string  = "";
    public age:number  = 0;

    constructor(sid:number, sname:string = "", age:number = 0)
    {
        this.sid = sid;
        this.sname = sname;
        this.age = age;
    }
  

    public showDetails():void
    {
        console.log("Student Id : " + this.sid);
        console.log("Student Name : " + this.sname);
        console.log("Student Age : " + this.age);
        console.log("----------------------------");
    }
}


let s1:Student = new Student(46545);
let s2:Student = new Student(46545, "Scott");
let s3:Student = new Student(46545, "Scott", 25);
// let s4:Student = new Student(46545, "", 25);

s1.showDetails();
s2.showDetails();
s3.showDetails();
