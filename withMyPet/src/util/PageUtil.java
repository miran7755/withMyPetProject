package util;

public class PageUtil {

	public static int getStartPage(int currentPage, int cntPerPageGroup) {
		return ((int) Math.floor( (double)(currentPage-1)/ cntPerPageGroup ) * cntPerPageGroup + 1);
	}

	public static int getEndPage(int currentPage, int cntPerPageGroup) {
		return ((int)Math.ceil((double)currentPage / cntPerPageGroup )*cntPerPageGroup);
	}
}
