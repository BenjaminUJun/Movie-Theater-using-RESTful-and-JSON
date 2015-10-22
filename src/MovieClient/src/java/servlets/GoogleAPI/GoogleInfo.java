package servlets.GoogleAPI;

public class GoogleInfo {
	private String title;
	private String link;
	private String snippet;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getSnippet() {
		return snippet;
	}
	public void setSnippet(String snippet) {
		this.snippet = snippet;
	}	
        public GoogleInfo(String title, String link, String snippet) {
            
		super();
		setTitle(title);
		setLink(link);
		setSnippet(snippet);
	}
}
