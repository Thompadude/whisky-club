package whiskies;

public class Talisker extends Whisky {

	public Talisker() {
		super("talisker", "Talisker", "Islay Whisky", "Scotland", "Single Malt Whisky",

				"Released in 2004, this bottling was aged for around five "
						+ "years before being finished in a quarter cask for several "
						+ "months, the size of the cask is quite small, thus does not "
						+ "require such a long maturation. This remains a truly great achievement from Laphroaig."

		, "../images/laphroaigquartercask.jpg", 48, 0);
	}
	
	/*
	 	Whisky talisker = new Whisky();
		talisker.setId("talisker");
		talisker.setName("Talisker");
		talisker.setRegion("Isle of Skye");
		talisker.setCountry("Scotland");
		talisker.setType("Single Malt Whisky");
		talisker.setImgUrl("talisker.jpg");
		talisker.setInfo("Write some info here please");
		talisker.setAlc(45.8);
		talisker.setGrade(0);
	 */

}