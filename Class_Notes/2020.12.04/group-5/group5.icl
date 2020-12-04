module group5

import Queue

// type synonyms

// :: Person :== (String, Int)

// Start = Hossam

/* 5
A good person is the person who never lies, so let's test this quote, we have list of people, each person has name
and list of the names of the people that he lies to, 
your task is to get the people who can say the truth to all the people in the given list 
list can be empty if all the people did lie.
Example : goodPeople [{fake_name = "Rafaat Ismail", peopleToLie = ["Adel"]},{fake_name = "Lucifier", peopleToLie = ["Rafaat Ismail"]}
Output : [{fake_name = "Rafaat Ismail", peopleToLie = ["Adel"]}] because Adel is not on the given list.
note : Of course we will consider fake names for this expirement so all the names here are fictional.
*/

::Person = {fake_name :: String, peopleToLie :: [String]}

canLie :: Person [Person] -> Bool
canLie p l = isEmpty [x \\ x <- l | isMember x.fake_name p.peopleToLie]

goodPeople :: [Person] -> [Person]
goodPeople l = filter (\x = canLie x l) l

// Start = goodPeople [{fake_name = "Rafaat Ismail", peopleToLie = ["Adel","Maggi"]} ,{fake_name = "Lucifier", peopleToLie = ["Adel","Rafaat Ismail"]},{fake_name = "elkenona", peopleToLie = ["Adel","Lucifier"]}] // [{fake_name = "Rafaat Ismail", peopleToLie = ["Adel","Maggi"]}]
// Start = goodPeople [{fake_name = "Alaa Abdelazim", peopleToLie = ["Brnadt","Shelby"]},{fake_name = "Bartaleaa", peopleToLie = ["Alaa Abdelazim","Shelby"]},{fake_name = "Shelby", peopleToLie = ["Bartaleaa"]}] // []

/*
A teacher in a high school is trying to choose the student of the year, in his/her school
so let's help him doing that, the teacher want the student to have the highest gpa.
The teacher is adding 0.1 to the gpa if the student was good.
*/

::Status = Good | Bad

::Student = {student_name :: String, gpa :: Real, status :: Status}

instance == Status
    where
        (==) Good Good = True
        (==) Bad Bad = True
        (==) _ _ = False

changeGpa :: Student -> Student
changeGpa s
| s.status == Good = {s & gpa = s.gpa + 0.1}
= s

// instance < Student
//     where  
//      (<) a b = (<) (changeGpa a).gpa (changeGpa b).gpa 

// bestStudent :: [Student] -> Student
// bestStudent l = maxList l

bestStudent l = hd [a \\ a <- l | a.gpa == maxlist here]
    where
        here = [(changeGpa a).gpa \\ a<-l]



// Start = bestStudent [{student_name = "Khalid Walid", gpa = 4.0, status = Good},{student_name = "Peter", gpa = 3.7, status = Good},{student_name = "Yoko", gpa = 2.9, status = Bad}] // {student_name = "Khalid Walid", gpa = 4.0, status = Good}
// Start = bestStudent [{student_name = "Khalid Walid", gpa = 3.7, status = Bad},{student_name = "Peter", gpa = 3.7, status = Good},{student_name = "Yoko", gpa = 2.9, status = Bad}] // {student_name = "Peter", gpa = 3.7, status = Good}
