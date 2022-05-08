class Pagination{
  int totalItems;
  int totalPages;
  int currentPage;
  int limit;

  Pagination({required this.currentPage, required this.limit, required this.totalItems, required this.totalPages});

  Pagination.fromJson(Map<dynamic,dynamic> json)
    : totalItems = json['totalItems'],
      totalPages = json['totalPages'],
      currentPage = json['currentPage'],
      limit = json['limit'];

  Map<dynamic,dynamic> toJson() => <dynamic,dynamic>{
    'totalItems': totalItems,
    'totalPages': totalPages,
    'currentPage': currentPage,
    'limit': limit,
  };
}