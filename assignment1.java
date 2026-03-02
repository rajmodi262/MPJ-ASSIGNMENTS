import java.util.*;

class Student {
    private String name;
    private int rollNo;
    private int[] marks;
    private double percentage;
    private char grade;

    // Constructor
    public Student(String name, int rollNo, int[] marks) {
        this.name = name;
        this.rollNo = rollNo;
        this.marks = marks;
        calculateResult();
    }

    // Method to calculate percentage and grade
    private void calculateResult() {
        int total = 0;
        for (int m : marks) {
            total += m;
        }

        percentage = total / (double) marks.length;

        if (percentage >= 75)
            grade = 'A';
        else if (percentage >= 60)
            grade = 'B';
        else if (percentage >= 50)
            grade = 'C';
        else
            grade = 'F';
    }

    // Getter Methods
    public double getPercentage() {
        return percentage;
    }

    public int getTotalMarks() {
        int total = 0;
        for (int m : marks) {
            total += m;
        }
        return total;
    }

    public int[] getMarks() {
        return marks;
    }

    // Display student details
    public void display() {
        System.out.println("\n---------------------------------");
        System.out.println("Name       : " + name);
        System.out.println("Roll No    : " + rollNo);

        System.out.print("Marks      : ");
        for (int m : marks) {
            System.out.print(m + " ");
        }

        System.out.println("\nTotal Marks: " + getTotalMarks());
        System.out.println("Percentage : " + String.format("%.2f", percentage) + "%");
        System.out.println("Grade      : " + grade);
        System.out.println("---------------------------------");
    }
}

public class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of students: ");
        int n = sc.nextInt();

        Student[] students = new Student[n];

        int[] subjectTotals = new int[5];
        double classTotalPercentage = 0;

        // Input
        for (int i = 0; i < n; i++) {
            sc.nextLine();
            System.out.println("\nEnter details for Student " + (i + 1));

            System.out.print("Name: ");
            String name = sc.nextLine();

            System.out.print("Roll No: ");
            int roll = sc.nextInt();

            int[] marks = new int[5];
            System.out.println("Enter marks for 5 subjects:");

            for (int j = 0; j < 5; j++) {
                System.out.print("Subject " + (j + 1) + ": ");
                marks[j] = sc.nextInt();
                subjectTotals[j] += marks[j];
            }

            students[i] = new Student(name, roll, marks);
            classTotalPercentage += students[i].getPercentage();
        }

        // Display All Students
        System.out.println("\n========= STUDENT RESULTS =========");
        for (Student s : students) {
            s.display();
        }

        // Find Topper
        Student topper = students[0];
        for (int i = 1; i < n; i++) {
            if (students[i].getPercentage() > topper.getPercentage()) {
                topper = students[i];
            }
        }

        // Class Statistics
        System.out.println("\n========= CLASS STATISTICS =========");

        double classAverage = classTotalPercentage / n;
        System.out.println("Class Average Percentage: " + 
                           String.format("%.2f", classAverage) + "%");

        System.out.println("\nSubject-wise Average Marks:");
        for (int i = 0; i < 5; i++) {
            double avg = subjectTotals[i] / (double) n;
            System.out.println("Subject " + (i + 1) + " Average: " + 
                               String.format("%.2f", avg));
        }

        System.out.println("\nTopper of the Class:");
        topper.display();

        System.out.println("\n====================================");

        sc.close();
    }
}