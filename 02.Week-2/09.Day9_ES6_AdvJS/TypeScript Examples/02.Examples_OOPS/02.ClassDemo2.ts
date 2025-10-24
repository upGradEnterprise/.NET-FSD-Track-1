class Student
{
    public sid:number = 0;
    public sname:string  = "";

    public showDetails():void
    {
        console.log("Student Id : " + this.sid);
        console.log("Student Name : " + this.sname);
    }
}


let stObj1:Student = new Student();
stObj1.sid = 54654;
stObj1.sname = "Smith";
stObj1.showDetails();



let stObj2:Student = new Student();
stObj2.sid = 64564;
stObj2.sname = "Sandy";
stObj2.showDetails();


