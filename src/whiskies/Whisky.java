package whiskies;

import java.util.ArrayList;

public class Whisky implements java.io.Serializable {
	
	private String id;
	private String name;
	private String region;
	private String country;
	private String type;
	private String info;
	private String imgUrl;
	private double alc;
	private int grade;
	private ArrayList<WhiskyComments> comments;
	private boolean isFavorite;

	/**
	 * Constructs a new whisky.
	 * Also serves as a super class for hardcoded whiskies.
	 * 
	 * @param id the identification String.
	 * @param name the name/title.
	 * @param region the region of origin.
	 * @param country the country of origin.
	 * @param type the type of whisky.
	 * @param info misc. information about the whisky.
	 * @param imgUrl the file path to the image.
	 * @param alc the alcohol by volume.
	 * @param grade the rating.
	 */
	public Whisky(
			String id,
			String name,
			String region,
			String country,
			String type,
			String info,
			String imgUrl,
			double alc,
			int grade
				)
	{
		this.id = id;
		this.name = name;
		this.region = region;
		this.country = country;
		this.type = type;
		this.info = info;
		this.imgUrl = imgUrl;
		this.alc = alc;
		this.grade = grade;
		this.isFavorite = false;
	}

	public Whisky() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public double getAlc() {
		return alc;
	}

	public void setAlc(double alc) {
		this.alc = alc;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		if (grade > 5) {
			grade = 5;
		} else if (grade < 0) {
			grade = 0;
		}
		this.grade = grade;
	}

	public ArrayList<WhiskyComments> getComments() {
		if (comments == null) {
			comments = new ArrayList<>();
		}
		return comments;
	}

	public void addComment(WhiskyComments comment) {
		if (this.comments == null) {
			this.comments = new ArrayList<>();
		}
		this.comments.add(comment);
	}

	public boolean isFavorite() {
		return isFavorite;
	}

	public void setFavorite(boolean isFavorite) {
		this.isFavorite = isFavorite;
	}

}