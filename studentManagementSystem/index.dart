import 'dart:io';
// Student class 
class Student {
  String name;
  int id;
  List<String> courses = []; // List of enrolled courses
  double _gpa = 0.0; // Encapsulated

  Student(this.name, this.id);

  // enroll in a course
  void enrollCourse(String course) {
    if (!courses.contains(course)) {
      courses.add(course);
      print('$name has enrolled in $course.');
    } else {
      print('$name is already enrolled in $course.');
    }
  }

  // drop a course 
  void dropCourse(String course) {
    if (courses.contains(course)) {
      courses.remove(course);
      print('$name has dropped $course.');
    } else {
      print('$name is not enrolled in $course.');
    }
  }

  // Private calculate GPA (Encapsulation)
  void _calculateGPA() {
    _gpa = (courses.length * 0.5) + 2.0; // Dummy logic for GPA calculation
  }

  // Public method to get GPA (GPA is updated before returning)
  double getGPA() {
    _calculateGPA();
    return _gpa;
  }
}

List<Student> students = []; //Store all student here --

void main() {
  while (true) {
    // User Display the Option first
    print('\nStudent Management System');
    print('1. Add Student');
    print('2. Enroll Course');
    print('3. Drop Course');
    print('4. View Students');
    print('5. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    // User input method switch Case here to implement the function  ------------------------------------------FN
    switch (choice) {
      case '1':
        addStudent(); 
        break;
      case '2':
        enrollCourse();
        break;
      case '3':
        dropCourse();
        break;
      case '4':
        viewStudents(); 
        break;
      case '5':
        print('Exiting...');
        return; 
      default:
        print('Invalid option, please try again.');
    }
  }
}

// Add the Student in Fn -----------------------------------------------------------------FN 1st
void addStudent() {
  stdout.write('Enter student name: ');
  String? name = stdin.readLineSync();
  stdout.write('Enter student ID: ');
  int? id = int.tryParse(stdin.readLineSync() ?? '');

  if (name != null && name.isNotEmpty && id != null) {
    students.add(Student(name, id));
    print('Student added!');
  } else {
    print('Invalid input, please try again.');
  }
}

// Enroll the Course FN------------------------------------------------------------------------FN 2nd
void enrollCourse() {
  viewStudents(); // Show students before selection
  stdout.write('Enter student number: ');
  int? index = int.tryParse(stdin.readLineSync() ?? '');
  if (index != null && index > 0 && index <= students.length) {
    stdout.write('Enter course name: ');
    String? course = stdin.readLineSync();
    if (course != null && course.isNotEmpty) {
      students[index - 1].enrollCourse(course);
    } else {
      print('Invalid course name.');
    }
  } else {
    print('Invalid student number.');
  }
}

// Drop Student Fn Here ----------------------------------------------------------------------------------FN 3rd
void dropCourse() {
  viewStudents(); // Show students before selection
  stdout.write('Enter student number: ');
  int? index = int.tryParse(stdin.readLineSync() ?? '');
  if (index != null && index > 0 && index <= students.length) {
    stdout.write('Enter course name to drop: ');
    String? course = stdin.readLineSync();
    if (course != null && course.isNotEmpty) {
      students[index - 1].dropCourse(course);
    } else {
      print('Invalid course name.');
    }
  } else {
    print('Invalid student number.');
  }
}

// View All Student Details Here------------------------------------------------------------------------------------FN 4th
void viewStudents() {
  if (students.isEmpty) {
    print('No students available.');
  } else {
    print('\nStudent List:');
    for (int i = 0; i < students.length; i++) {
      print(
        '${i + 1}. Name: ${students[i].name}, ID: ${students[i].id}, Courses: ${students[i].courses}, GPA: ${students[i].getGPA()}',
      );
    }
  }
}
