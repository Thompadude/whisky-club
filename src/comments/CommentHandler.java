package comments;

import java.util.ArrayList;
import java.util.List;

public class CommentHandler {

	List<String> comments = new ArrayList<>();

	public List<String> getComments() {
		return comments;
	}

	public void addComment(String comment) {
		if (this.comments != null || !(this.comments.isEmpty())) {
			this.comments.add(comment);
		} else {
			this.comments = new ArrayList<String>();
			this.comments.add(comment);
		}
	}

}