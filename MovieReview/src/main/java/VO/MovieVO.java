package VO;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MovieVO {
	
	private int movie_num;
	private String movie_title;
	private String director;
	private String release;
	private String posterfile;
	private MultipartFile posterfilef;
	private String trailer;
	private String like;
	private int rate_avg;
}
