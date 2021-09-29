package criForWish;

import lombok.Data;

@Data
public class SearchCriteria extends Criteria {
	private String searchType;
	private String keyword;
	private String id;
	
} //class
