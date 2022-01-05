component greetings {
       function helloWorld(){
             var myGreeting="Hello World!";
             return myGreeting;
       }
}

<cfset greet=new greetings()>
<cfoutput>#greet.helloWorld()#</cfoutput>

<cfscript>
       x = 0;
       do {
              x++;
               WriteOutput(x & " "); // 1 2 3 4 5 6 7 8 9 10
             } while (x < 10); 
</cfscript>

<cfscript>
 
       myStruct={};
       myStruct.key1="John"; // Using dot notation
       myStruct["key2"]="Paul"; // Using associative array notation
       WriteOutput(myStruct.key1 & "<br/>"); // John
       WriteOutput(myStruct.key2); // Paul
 
</cfscript>

<cfscript>
 
       myStructLiteral={};
       myStructLiteral={key1="one",key2="two"}; // Using literal syntax
       WriteOutput(mystructLiteral.key1 & "<br/>"); // one
       WriteOutput(mystructLiteral.key2); // two
 
</cfscript>

<cfscript>
 
     for (i=1;i <=10; i++) {
     myResult=i^2;
     WriteOutput(myResult);
    }
 
</cfscript>

<cfscript>
       x = 0;
       while (x < 10) {
             x++;
             WriteOutput(x & " "); // 1 2 3 4 5 6 7 8 9 10
       }
</cfscript>
//Post-condition loops
//In this type of loop, the statements enclosed inside the do {} will execute irrespective of the condition.

do {

     // statements

} while (condition);

For example,

//1,2,3,4,5,6,7

<cfscript>
       x = 0;
       do {
              x++;
               WriteOutput(x & " "); // 1 2 3 4 5 6 7 8 9 10
             } while (x < 10); 
</cfscript>
Array loops
You can iterate over each element in an array. For example,

for (element in [1,2,3,4,5]){

    WriteOutput(element); // Outputs 12345

}

Struct loops
You can iterate over each struct member and apply struct operations. For example,

myStruct={a=1,b=2,c=3,d=4,e=5};

for (key in myStruct){

     WriteOutput(#key# & ":" & #myStruct[key]#); // Outputs a:1 b:2…

}

//List loops
//You can iterate over each element in a list. For example,

myList="a,b,c,d,e";

for (element in myList){

     WriteOutput(element); // Outputs abcde

}

<!--- Data handling in ColdFusion --->
<!--- Handling record sets in databases is a key component of ColdFusion. ColdFusion has built in support for many databases including MS SQL, MySQL, Oracle, Derby, and Postgres. --->

<!--- You can use <cfquery> and call a SQL statement using a datasource .  --->
//A datasource i s the collection of settings you can use to communicate with a database, such as, database type, sever, port, tablespace, o r database, username a nd password.

//For example,

// 1,2,3,4,5,6

<cfquery name="myQuery" datasource="cfdocexamples">
       SELECT FIRSTNAME,LASTNAME 
       FROM EMPLOYEE
       WHERE SALARY>50000 AND CONTRACT='Y'
</cfquery>
<cfdump var="#myQuery#" >

//You can also use QueryExecute within cfscript to query a table. For example,

//1,2,3,4,5,6,7,8,9

<cfscript>
 
     myResult=QueryExecute("SELECT FIRSTNAME,LASTNAME FROM EMPLOYEES WHERE DEPARTMENT='Sales' AND LOCATION in (?,?)",["Newton","San Francisco"],
 
     {datasource="cfdocexamples"});
 
     WriteDump(myResult);
 
</cfscript>

//Update the Application.cfc as follows:

component{

     this.name="artgallery";

     this.ormEnabled=true;

     this.datasource="cfartgallery";

}

//There is a list of ORM-related configuration for your CFC. Find it here.

//Next, map an object to a database and define the persistence, as shown below:

component persistent="true"{

     property name="artistid" generator="increment";

     property firstname;

     property lastname;

}

//Create a ColdFusion page to list all artists with first and last names, as shown below:

<cfscript>

     myArtists=EntityLoad("Artists");

     WriteDump(myArtists);

</cfscript>


