package model;

public class Product {
    private String name;
    private int id;
    private double price;
    private String description;
    private String dateOfManufacture;
    private String address;

    public Product(){
    }

    public Product(int id,String name, double price, String description, String dateOfManufacture,String address) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.dateOfManufacture = dateOfManufacture;
        this.address=address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDateOfManufacture() {
        return dateOfManufacture;
    }

    public void setDateOfManufacture(String dateOfManufacture) {
        this.dateOfManufacture = dateOfManufacture;

    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
