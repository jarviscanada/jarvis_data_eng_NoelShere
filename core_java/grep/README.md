# Introduction
A Java app that mimics Linux grep command which allows users to search matching strings from files.


Discuss the design of each app. What does the app do? What technologies have you used? (e.g. core java, libraries, lambda, IDE, docker, etc..)

# Quick Start
How to use your apps?
1) Build and run program on Intellij
2) Clean maven and compile 
```
mvn clean compile package
```
3) Check jar file
```
jar -tf target/grep-1.0-SNAPSHOT.jar
```
4) To run program, specify jar file | java File | aruguments

```
java -cp target/grep-1.0-SNAPSHOT.jar ca.jrvs.apps.grep.JavaGrepImpliment .*Romeo.*Juliet.* ./data ./out/grep.out
```

# Implemenation

process(): 

listFiles(): 

containsPattern(): 

readLines(): 

writeToFile(): 

## Pseudocode
1) Check for all required arguments 
2) If no errors calls the process function 
3) Process gets the root path of the file including all the lines and calls readLines function and returns each line. That text is sent to a function called containsPattern wich returns T/F, and appends the line/text to an arrayList. At the end of the process function the arraylist is sent to function writetofile.
4) writetofile writes the line of text to the file.


## Performance Issue
(30-60 words)
Discuss the memory issue and how would you fix it


# Test
How did you test your application manually? (e.g. prepare sample data, run some test cases manually, compare result)

The grep app can be tested by compling the project in Intellij. 

# Deployment
How you dockerize your app for easier distribution?

The grep app was deployed using docker.

# Improvement
List three things you can improve in this project.

minimize white spaces 

use Lambda and Stream API
