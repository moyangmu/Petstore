package dto;

public class Hero {
    private int id;
    private String name;
    private String tag;
    private String img;
    private int price;
    private int stock;
    private String description;
    private long weight;

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

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getWeight() {
        return weight;
    }

    public void setWeight(long weight) {
        this.weight = weight;
    }

    public Hero(int id, String name, String tag, String img, int price, int stock, String description, long weight) {
        this.id = id;
        this.name = name;
        this.tag = tag;
        this.img = img;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.weight = weight;
    }
}
