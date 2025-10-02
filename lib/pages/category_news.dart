import 'package:flutter/material.dart';
import 'package:trendo/models/show_category.dart';
import 'package:trendo/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 134, 231),

      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 3.7),
                  Text(
                    widget.name.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: categories.length,
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return CaategoryTile(
                      Title: categories[index].title,
                      desc: categories[index].desc,
                      image: categories[index]
                          .urlToImage, // Replace 'imageUrl' with the correct property name from ShowCategoryModel
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CaategoryTile extends StatelessWidget {
  final image, Title, desc;
  CaategoryTile({this.image, this.Title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF007BFF),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[400],
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              Title!,
              maxLines: 2,

              style: TextStyle(
                color: const Color.fromARGB(188, 0, 0, 0),
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 2.0),

          Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              desc!,
              maxLines: 4,

              style: TextStyle(
                color: const Color.fromARGB(151, 0, 0, 0),
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
