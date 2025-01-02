void main() {
  StudentManagementSystem stms = StudentManagementSystem();
  stms.run();
}

abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {

  }
}


class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateAverageScore() {
    return courseScores.isEmpty ? 0.0 : courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void displayCoursesTaught() {
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }
}


class StudentManagementSystem {
  void run() {

    Student student = Student("John Doe", 20, "123 Main St", "S001", "A", [90, 85, 82]);


    Teacher teacher = Teacher("Mrs. Smith", 35, "456 Oak St", "T001", ["Math", "English", "Bangla"]);

    // Print Student Information
    print('Student Information:');
    student.displayRole();
    print('Name: ${student.getName}');
    print('Age: ${student.getAge}');
    print('Address: ${student.getAddress}');
    print('Average Score: ${student.calculateAverageScore().toStringAsFixed(2)}');

    // Print Teacher Information
    print('\nTeacher Information:');
    teacher.displayRole();
    print('Name: ${teacher.getName}');
    print('Age: ${teacher.getAge}');
    print('Address: ${teacher.getAddress}');
    teacher.displayCoursesTaught();
  }
}


