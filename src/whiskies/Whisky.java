package whiskies;

import java.util.ArrayList;

import managers.WhiskyComments;

public class Whisky {
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

	/**
	 * Whisky super class.
	 * 
	 * @param id
	 *            is a unique String to identify the whisky.
	 * @param imgUrl
	 *            is the path to the photo.
	 * @param alc
	 *            is the alcoholic percentage.
	 * @param grade
	 *            is a user defined grade from a scale of 1 to 5.
	 */

	public Whisky(String id, String name, String region, String country, String type, String info, String imgUrl,
			double alc, int grade) {
		this.id = id;
		this.name = name;
		this.region = region;
		this.country = country;
		this.type = type;
		this.info = info;
		this.imgUrl = imgUrl;
		this.alc = alc;
		this.grade = grade;
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

}