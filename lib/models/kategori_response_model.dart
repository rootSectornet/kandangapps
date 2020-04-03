class CategoryModel {
  int idCategory;
  String placeId;
  String title;
  String subtitle;
  String description;
  String images;

  CategoryModel({this.idCategory, this.placeId, this.title, this.subtitle, this.description, this.images});

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      idCategory: json['id_category'],
      placeId: json['place_id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      images: json['images']
    );
  }

}

class CategoryResponseModel {
  int code;
  String message;
  List<CategoryModel> data;
  int total;

  CategoryResponseModel({this.code, this.message, this.data, this.total});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json){
    
    return CategoryResponseModel(
      code: json['code'],
      message: json['message'],
      data: json['total'] != 0 ? parsedCategory(json) : [],
      total: json['total']
    );
  }

  static List<CategoryModel> parsedCategory(jsonCategory) {
    var data = jsonCategory['data'] as List;

    List<CategoryModel> categoryList = data.map((data) => CategoryModel.fromJson(data)).toList();
    return categoryList;
  }
}
