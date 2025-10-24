class Student
{
    public sid:number = 54654;
    public sname:string  = "Scott";

    public showDetails():void
    {
        console.log("Student Id : " + this.sid);
        console.log("Student Name : " + this.sname);
    }
}


let stObj:Student = new Student();
stObj.showDetails();
