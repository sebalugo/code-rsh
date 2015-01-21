# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: 'ruby', logo_url: "ruby_logo.png" , description: "Dynamic, reflective, object-oriented, general-purpose programming language. Designed for programmer productivity and fun, following the principles of good user interface design.")
Category.create(name: 'java', logo_url: "java_logo.png" , description: "Concurrent, and object-oriented,specifically designed to have as few implementation dependencies as possible, write once, run anywhere.")
Category.create(name: 'js', logo_url: "js_logo.png" , description: "Dynamic computer programming language. Most commonly used as part of web browsers, whose implementations allow client-side scripts to interact with the user.")
Category.create(name: 'python', logo_url: "js_logo.png" , description: "Widely used general-purpose, high-level programming language.Its design philosophy emphasizes code readability, and its syntax allows programmers to express concepts in just a few lines.")

categoryR = Category.find_by_name("ruby")
categoryR.courses.create(name: 'Ruby course #1' ,description:"Ruby simple class example" ,code:"class Mabel
  
  def initialize(v)
    @val = v
  end

  def set(v)
    @val = v
  end

  def get
    return @val
  end

  puts 'Mabel es la mejor'

end")
categoryR.courses.create(name: 'Ruby course #2' ,description:"Ruby simple class example" ,code:"class Mabel
  
  def initialize(v)
    @val = v
  end

  def set(v)
    @val = v
  end

  def get
    return @val
  end

  puts 'Mabel es la mejor'

end")
categoryR.courses.create(name: 'Ruby course #3' ,description:"Ruby simple for loop example" ,code:"class Mabel
  
  def initialize(v)
    @val = v
  end

  def set(v)
    @val = v
  end

  def get
    return @val
  end

  puts 'Mabel es la mejor'

end")
categoryJs = Category.find_by_name("js")
categoryJs.courses.create(name: 'Js course #1' ,description:"Js sample course #1" ,code:'
function myFunction() {
    var str = document.getElementById("example").innerHTML; 
    var txt = str.replace("intec","INTEC");
    document.getElementById("example").innerHTML = txt;
    }')
categoryJs.courses.create(name: 'Js course #2' ,description:"Js sample course #2" ,code:'
var a=0,b=1,c;
document.write("Fibonacci");
while (b<=10)
{
document.write(c);
document.write("<br/>");
c=a+b;
a=b;
b=c;
}')
categoryJs.courses.create(name: 'Js course #3' ,description:"Js sample course #3" ,code:'
var firstname, secondname, result
    firstname = prompt("Enter first name")
    secondname = prompt("Enter last name")
    result = firstname + secondname  // + means "join" here
    alert("hello, " + result)')

categoryJava = Category.find_by_name("java")
categoryJava.courses.create(name: 'Java course #1' ,description:"Java sample course #1" ,code:'
public class MyFirstJavaProgram {

    public static void main(String []args) {
       System.out.println("Hello World");
    }
} 
	')
categoryJava.courses.create(name: 'Java course #2' ,description:"Java sample course #2" ,code:'
public class StringCompareEmp{
   public static void main(String args[]){
      String str = "Hello World";
      String anotherString = "hello world";
      Object objStr = str;

      System.out.println( str.compareTo(anotherString) );
      System.out.println( str.compareToIgnoreCase(anotherString) );
      System.out.println( str.compareTo(objStr.toString()));
   }
}
	')
categoryJava.courses.create(name: 'Java course #3' ,description:"Java sample course #3" ,code:'
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
   public static void main(String args[]) {
      String a[] = { "A", "E", "I" };
      String b[] = { "O", "U" };
      List list = new ArrayList(Arrays.asList(a));
      list.addAll(Arrays.asList(b));
      Object[] c = list.toArray();
      System.out.println(Arrays.toString(c));
   }
}
	')

categoryPython = Category.find_by_name("python")

categoryPython.courses.create(name: 'Python course #1' ,description:"Python sample course #1" ,code:"
parents, babies = (1, 1)
while babies < 100:
    print 'This generation has {0} babies'.format(babies)
    parents, babies = (babies, parents + babies)
")
categoryPython.courses.create(name: 'Python course #2' ,description:"Python sample course #2" ,code:"
friends = ['john', 'pat', 'gary', 'michael']
for i, name in enumerate(friends):
    print 'iteration {iteration} is {name}'.format(iteration=i, name=name)
")
categoryPython.courses.create(name: 'Python course #3' ,description:"Python sample course #3" ,code:"
def greet(name):
    print 'Hello', name
greet('Jack')
greet('Jill')
greet('Bob')
")


User.create( username: "seba" , email: "sebalugo@gmail.com", password:"seba" , password_confirmation: "seba" )

userS =  User.find_by_username("seba");
21.times{userS.scores.create(:points => 40+rand(100),:time => 5+rand(40) , :wpm => 100+rand(20) , :course_id =>1+rand(3))}
21.times{userS.matches.create(:category => "ruby",:winner => "seba") }

User.create( username: "juan" , email: "juan@hotmail.com", password:"juan" , password_confirmation: "juan" )
userS =  User.find_by_username("juan");
15.times{userS.scores.create(:points => 40+rand(100),:time => 5+rand(40) , :wpm => 50+rand(40) , :course_id =>1+rand(3))}
15.times{userS.matches.create(:category => "ruby",:winner => "seba") }