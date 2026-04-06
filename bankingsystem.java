import java.io.*;
import java.util.*;

class BankException extends Exception {
    BankException(String msg) {
        super(msg);
    }
}

class Customer {
    int cid;
    String cname;
    double amount;

    Customer(int cid, String cname, double amount) throws BankException {

        if (cid < 1 || cid > 20)
            throw new BankException("CID must be between 1 and 20");

        if (amount < 1000)
            throw new BankException("Minimum balance must be 1000");

        if (amount <= 0)
            throw new BankException("Amount must be positive");

        this.cid = cid;
        this.cname = cname;
        this.amount = amount;
    }

    void deposit(double amt) throws BankException {
        if (amt <= 0)
            throw new BankException("Deposit must be positive");

        amount += amt;
    }

    void withdraw(double amt) throws BankException {
        if (amt > amount)
            throw new BankException("Insufficient balance");

        amount -= amt;
    }

    void display() {
        System.out.println(cid + " " + cname + " " + amount);
    }
}

public class Main{
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        ArrayList<Customer> list = new ArrayList<>();

        int choice;

        do {
            System.out.println("\n--- MENU ---");
            System.out.println("1. Create Account");
            System.out.println("2. Deposit");
            System.out.println("3. Withdraw");
            System.out.println("4. Display All");
            System.out.println("5. Exit");

            choice = sc.nextInt();

            try {
                switch (choice) {

                    case 1:
                        System.out.print("Enter CID: ");
                        int cid = sc.nextInt();

                        System.out.print("Enter Name: ");
                        String name = sc.next();

                        System.out.print("Enter Amount: ");
                        double amt = sc.nextDouble();

                        Customer c = new Customer(cid, name, amt);
                        list.add(c);

                        BufferedWriter bw = new BufferedWriter(new FileWriter("customer.txt", true));
                        bw.write(cid + " " + name + " " + amt);
                        bw.newLine();
                        bw.close();

                        System.out.println("Account created!");
                        break;

                    case 2:
                        System.out.print("Enter CID: ");
                        int d_id = sc.nextInt();

                        Customer d_cust = findCustomer(list, d_id);

                        if (d_cust == null)
                            throw new BankException("Customer not found");

                        System.out.print("Enter deposit amount: ");
                        double d_amt = sc.nextDouble();

                        d_cust.deposit(d_amt);
                        System.out.println("Deposit successful!");
                        break;

                    case 3:
                        System.out.print("Enter CID: ");
                        int w_id = sc.nextInt();

                        Customer w_cust = findCustomer(list, w_id);

                        if (w_cust == null)
                            throw new BankException("Customer not found");

                        System.out.print("Enter withdraw amount: ");
                        double w_amt = sc.nextDouble();

                        w_cust.withdraw(w_amt);
                        System.out.println("Withdraw successful!");
                        break;

                    case 4:
                        for (Customer cust : list) {
                            cust.display();
                        }
                        break;

                    case 5:
                        System.out.println("Exiting...");
                        break;
                }

            } catch (BankException e) {
                System.out.println("Error: " + e.getMessage());

            } catch (IOException e) {
                System.out.println("File error");

            } catch (Exception e) {
                System.out.println("Invalid input");
            }

        } while (choice != 5);

        sc.close();
    }


    static Customer findCustomer(ArrayList<Customer> list, int cid) {
        for (Customer c : list) {
            if (c.cid == cid)
                return c;
        }
        return null;
    }
}