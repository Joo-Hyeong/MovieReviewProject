package criForRating;

import lombok.Data;

@Data
public class SearchCriteria extends Criteria {
	private String searchType;
	private String keyword;
	private int movie_num;
	private String id;
	
} //class
