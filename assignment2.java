import java.util.Scanner;

// Base Class
class Employee {
    protected String name;
    protected int empId;
    protected double baseSalary;

    // Constructor
    public Employee(String name, int empId, double baseSalary) {
        this.name = name;
        this.empId = empId;
        this.baseSalary = baseSalary;
    }

    // Method to calculate salary (to be overridden)
    public double calculateSalary() {
        return baseSalary;
    }

    // Method to display details
    public void displayDetails() {
        System.out.println("\n----------------------------------------");
        System.out.println("Employee Name  : " + name);
        System.out.println("Employee ID    : " + empId);
        System.out.println("Base Salary    : Rs. " + baseSalary);
        System.out.println("Final Salary   : Rs. " + calculateSalary());
        System.out.println("----------------------------------------");
    }
}

// Derived Class 1
class FullTimeEmployee extends Employee {

    private final double hikePercentage = 50.0;

    public FullTimeEmployee(String name, int empId, double baseSalary) {
        super(name, empId, baseSalary);
    }

    // Overriding calculateSalary
    @Override
    public double calculateSalary() {
        return baseSalary + (baseSalary * hikePercentage / 100);
    }

    @Override
    public void displayDetails() {
        System.out.println("\n========== FULL-TIME EMPLOYEE ==========");
        super.displayDetails();
        System.out.println("Hike Percentage: " + hikePercentage + "%");
    }
}

// Derived Class 2
class InternEmployee extends Employee {

    private final double hikePercentage = 25.0;

    public InternEmployee(String name, int empId, double baseSalary) {
        super(name, empId, baseSalary);
    }

    // Overriding calculateSalary
    @Override
    public double calculateSalary() {
        return baseSalary + (baseSalary * hikePercentage / 100);
    }

    @Override
    public void displayDetails() {
        System.out.println("\n============= INTERN EMPLOYEE =============");
        super.displayDetails();
        System.out.println("Hike Percentage: " + hikePercentage + "%");
    }
}

// Main Class
public class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("***** HIERARCHICAL INHERITANCE DEMO *****");

        // Full-Time Employee Input
        System.out.println("\nEnter Full-Time Employee Details");
        System.out.print("Name: ");
        String ftName = sc.nextLine();

        System.out.print("Employee ID: ");
        int ftId = sc.nextInt();

        System.out.print("Base Salary: ");
        double ftSalary = sc.nextDouble();
        sc.nextLine();

        Employee fullTimeEmp = new FullTimeEmployee(ftName, ftId, ftSalary);

        // Intern Employee Input
        System.out.println("\nEnter Intern Employee Details");
        System.out.print("Name: ");
        String intName = sc.nextLine();

        System.out.print("Employee ID: ");
        int intId = sc.nextInt();

        System.out.print("Base Salary: ");
        double intSalary = sc.nextDouble();

        Employee internEmp = new InternEmployee(intName, intId, intSalary);

        // Display Details
        System.out.println("\n\n===== EMPLOYEE SALARY DETAILS =====");
        fullTimeEmp.displayDetails();
        internEmp.displayDetails();

        System.out.println("\n***** Program Completed Successfully *****");

        sc.close();
    }
}