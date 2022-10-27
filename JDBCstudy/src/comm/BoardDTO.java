package comm;

public class BoardDTO {

	private int num;
	private String title;
	private String content;
	
	public BoardDTO() {

	}

	public BoardDTO(int int1, String string, String string2) {
		// TODO Auto-generated constructor stub
		num = int1;
		title = string;
		content = string2;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", content=" + content + "]";
	}
	
}
