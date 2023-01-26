class ProductDataModel{
  
  String? mini_desc;
  String? meta_title;
  String? name;
  String? article;
  String? img_banner;
  
  ProductDataModel(
      {
        
      this.mini_desc,
      this.meta_title,
      this.name,
      this.article,
      this.img_banner,
      
      });

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
   
    mini_desc =json['mini_desc'];
    meta_title = json['meta_title'];
    name = json['name'];
    article = json['article'];
    img_banner = json['img_banner'];
   
  }
}