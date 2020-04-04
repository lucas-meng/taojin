package cn.wmyskxz.pojo;

public class Carousel {
	
	private int carousel_id;
	
	private String carousel_imgs;
	
	private String click_imgs;
	
	public int getCarousel_id() {
		return carousel_id;
	}
	public void setCarousel_id(int carousel_id) {
		this.carousel_id = carousel_id;
	}
	public String getCarousel_imgs() {
		return carousel_imgs;
	}
	public void setCarousel_imgs(String carousel_imgs) {
		this.carousel_imgs = carousel_imgs;
	}
	public String getClick_imgs() {
		return click_imgs;
	}
	public void setClick_imgs(String click_imgs) {
		this.click_imgs = click_imgs;
	}
	@Override
	public String toString() {
		return "Carousel [carousel_id=" + carousel_id + ", carousel_imgs=" + carousel_imgs + ", click_imgs="
				+ click_imgs + "]";
	}
	
}
