(function(){
	var Pagination = function(key, currentPage, sortType){
		this.key = key;
		this.currentPage = currentPage;
		this.sortType = sortType;
	};
	Pagination.prototype = {
		key : "",
		currentPage : 1,
		sortType : "",
	}
})(jQuery)