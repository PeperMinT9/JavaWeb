package study.dto;

public class PhotoDto {
    private int idx;
    private String photo_name;
    private int photo_price;
    private String photo_img;
    private String pub_date;

    public PhotoDto() {
        super();
    }

    public PhotoDto(String photo_name, int photo_price, String photo_img, String pub_date) {
        this.photo_name = photo_name;
        this.photo_price = photo_price;
        this.photo_img = photo_img;
        this.pub_date = pub_date;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getPhoto_name() {
        return photo_name;
    }

    public void setPhoto_name(String photo_name) {
        this.photo_name = photo_name;
    }

    public int getPhoto_price() {
        return photo_price;
    }

    public void setPhoto_price(int photo_price) {
        this.photo_price = photo_price;
    }

    public String getPhoto_img() {
        return photo_img;
    }

    public void setPhoto_img(String photo_img) {
        this.photo_img = photo_img;
    }

    public String getPub_date() {
        return pub_date;
    }

    public void setPub_date(String pub_date) {
        this.pub_date = pub_date;
    }
}
