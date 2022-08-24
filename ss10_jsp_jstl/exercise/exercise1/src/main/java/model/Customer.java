package model;

public class Customer {
    private int id;
    private String name;
    private String dayOfBirth;
    private String address;
    private String photo;

    public Customer() {
    }

    public Customer(int id, String name, String dayOfBirth, String address, String photo) {
        this.id = id;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.address = address;
        this.photo = photo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}

