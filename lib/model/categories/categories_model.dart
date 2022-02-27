class CategoriesModel {
  bool? status;
  CategoriesData? data;

  CategoriesModel.fromJson(dynamic json) {
    status = json['status'];
    data = CategoriesData.fromJson(json['data']);
  }
}

class CategoriesData {
  int? currentPage;
  List<CategoriesDataInfo>? data;

  CategoriesData.fromJson(dynamic json) {
    currentPage = json['current_page'];
    // json['data'].forEach((e){
    //   data?.add(CategoriesDataInfo.fromJson(json['data']));
    // });

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoriesDataInfo.fromJson(v));
      });
    }
  }
}

class CategoriesDataInfo {
  int? id;
  String? name;
  String? image;

  CategoriesDataInfo.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }
}
