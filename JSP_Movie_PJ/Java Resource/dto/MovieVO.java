package dto;

public class MovieVO {
	private String title;
	private int age_limit;
	private String movie_time;
	private int seat;
	private int reserved;
	private String id;
	private String poster;
	
	public MovieVO(String title, int age_limit, String movie_time, int seat, int reserved, String id) {
		this.title=title;
		this.age_limit=age_limit;
		this.movie_time=movie_time;
		this.seat=seat;
		this.reserved=reserved;
		this.id=id;
	}
	public MovieVO(String poster) {
		this.poster=poster;
	}
	
	public MovieVO(String title,int age_limit,String movie_time,int seat,int reserved,String id,String poster) {
		this.title=title;
		this.age_limit=age_limit;
		this.movie_time=movie_time;
		this.seat=seat;
		this.reserved=reserved;
		this.id=id;
		this.poster=poster;
	}
	
	
	public String getTitle() {
		return title;
	}
	public String getMovie_Time() {
		return movie_time;
	}
	public int getSeat() {
		return seat;
	}
	public int getReserved() {
		return reserved;
	}
	public int getAge_Limit() {
		return age_limit;
	}
	public String getId() {
		return id;
	}
	public String getPoster() {
		return poster;
	}
	
}