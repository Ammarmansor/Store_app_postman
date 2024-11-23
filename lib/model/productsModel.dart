class ProductsModel {
  final double price;
  final int id;
  final String title, description, image;
  final RatingModel? ratingModel;
  ProductsModel(
    
      {
      required  this.ratingModel,
        required this.id,
      required this.price,
      required this.title,
      required this.description,
      required this.image});

  factory ProductsModel.fromjson(jsondata) {
    return ProductsModel(
      id: jsondata['id'],
      price: jsondata['price'] is int
          ? (jsondata['price'] as int).toDouble()
          : jsondata['price'],
      title: jsondata['title'],
      description: jsondata['description'],
      image: jsondata['image']?? 'https://www.google.com/imgres?q=image&imgurl=https%3A%2F%2Fnext-images.123rf.com%2Findex%2F_next%2Fimage%2F%3Furl%3Dhttps%3A%2F%2Fassets-cdn.123rf.com%2Findex%2Fstatic%2Fassets%2Ftop-section-bg.jpeg%26w%3D3840%26q%3D75&imgrefurl=https%3A%2F%2Fwww.123rf.com%2F&docid=uT_3T5CYcMSvLM&tbnid=nqZ8izo17eo08M&vet=12ahUKEwjvtPeAlPKJAxXK1QIHHVL0JjkQM3oECGsQAA..i&w=3840&h=2628&hcb=2&ved=2ahUKEwjvtPeAlPKJAxXK1QIHHVL0JjkQM3oECGsQAA',
      ratingModel: RatingModel.fromjson(jsondata['rating'] ?? {
      'rate': 0.0,
       'count': 0
      }),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(jsondata) {
    return RatingModel(rate: jsondata['rate'].toDouble(), count: jsondata['count']);
  }
}
