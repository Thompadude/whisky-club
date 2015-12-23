package main;

/**
 * Handles text content in about.jsp
 */

public class AboutText {

	public String getAboutHeadline() {
		return "About Us";
	}

	public String getAboutText() {
		return "This web page is part of a school project.<br>"
				+ "Made by <a href=\"mailto:patrik_andersson1985@hotmail.com\">Patrik Andersson</a>"
				+ " and <a href=\"mailto:thompa.lansing@gmail.com\">Thomas Lansing</a>.";
	}

}
