package dto;

public class PageAble {
    private String search;

    private int page;

    private int totalItems;

    private int totalPages;

    private String nameField;

    private String sortBy;

    private String category;

    public PageAble(String search, int page, int totalItems, String nameField, String sortBy, String category) {
        this.search = search;
        this.page = page;
        this.totalItems = totalItems;
        this.nameField = nameField;
        this.sortBy = sortBy;
        this.category = category;
    }

    public PageAble(String search, int page, int totalItems) {
        this.search = search;
        this.page = page;
        this.totalItems = totalItems;
    }

    public PageAble(String search, int page, int totalItems, String nameField, String sortBy) {
        this.search = search;
        this.page = page;
        this.totalItems = totalItems;
        this.nameField = nameField;
        this.sortBy = sortBy;
    }

    public PageAble(String search, int page, int totalItems, int totalPages) {
        this.search = search;
        this.page = page;
        this.totalItems = totalItems;
        this.totalPages = totalPages;
    }

    public PageAble() {

    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(int totalItems) {
        this.totalItems = totalItems;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public String getNameField() {
        return nameField;
    }

    public void setNameField(String nameField) {
        this.nameField = nameField;
    }

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }
}
