import 'package:flutter/material.dart';
import 'package:trendo/models/article_model.dart';
import 'package:trendo/pages/article_view.dart';
import 'package:trendo/pages/category_news.dart';
import 'package:trendo/services/news.dart';

// Define CategoryModel if not already defined elsewhere
class CategoryModel {
  final String name;
  final String imagePath;

  CategoryModel({required this.name, required this.imagePath});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool loading = true;

  // Categories data
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Business', 'image': 'assets/images/news1.jpg', 'fontSize': 12.0},
    {
      'name': 'Entertainment',
      'image': 'assets/images/news2.jpg',
      'fontSize': 10.0,
    },
    {'name': 'Science', 'image': 'assets/images/news3.jpg', 'fontSize': 12.0},
    {'name': 'Sports', 'image': 'assets/images/news1.jpg', 'fontSize': 12.0},
    {
      'name': 'Technology',
      'image': 'assets/images/news2.jpg',
      'fontSize': 10.0,
    },
  ];

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 239, 247),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Trend",
                  style: TextStyle(
                    color: Color(0xFF007BFF),
                    fontSize: 44,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  "o",
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 44,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Hottest News",
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            SizedBox(height: 16),

            Container(
              height: 310,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: articles.length >= 10
                    ? 5
                    : (articles.length / 2)
                          .ceil(), // First half for hottest news
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 16), // Add gap between cards
                    child: GestureDetector(
                      onTap: () {
                        if (articles[index].url != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticleView(blogUrl: articles[index].url!),
                            ),
                          );
                        }
                      },
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.grey.withOpacity(0.3),
                        child: Container(
                          width: 280, // Fixed width for horizontal cards
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image section
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Container(
                                  height: 140,
                                  width: 280, // Match the card width
                                  child: articles[index].urlToImage != null
                                      ? Image.network(
                                          articles[index].urlToImage!,
                                          fit: BoxFit.cover,
                                          loadingBuilder:
                                              (
                                                context,
                                                child,
                                                loadingProgress,
                                              ) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Container(
                                                  height: 140,
                                                  color: Colors.grey[200],
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                          color: Color(
                                                            0xFF007BFF,
                                                          ),
                                                        ),
                                                  ),
                                                );
                                              },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Container(
                                                  height: 140,
                                                  color: Colors.grey[200],
                                                  child: Icon(
                                                    Icons.image_not_supported,
                                                    color: Colors.grey[400],
                                                    size: 40,
                                                  ),
                                                );
                                              },
                                        )
                                      : Container(
                                          height: 140,
                                          color: Colors.grey[200],
                                          child: Icon(
                                            Icons.image_not_supported,
                                            color: Colors.grey[400],
                                            size: 40,
                                          ),
                                        ),
                                ),
                              ),

                              // Content section
                              Container(
                                height: 160,
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      articles[index].title ??
                                          "No title available",
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Color(0xFF1A1A1A),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      articles[index].desc ??
                                          "No description available",
                                      maxLines: 4,
                                      style: TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 32),

            // Explore Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Explore",
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            SizedBox(height: 16),

            Container(
              height: 130, // Increased from 110 to accommodate larger circles
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return CategoryCircle(
                    name: category['name'],
                    imagePath: category['image'],
                    fontSize: category['fontSize'],
                    isLast: index == _categories.length - 1,
                  );
                },
              ),
            ),

            SizedBox(height: 0),

            // Trending News Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Trending News",
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Trending News Cards - Dynamic from API
            Container(
              height: 400, // Fixed height for vertical scrolling
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: articles.length >= 10
                    ? 5
                    : (articles.length / 2)
                          .floor(), // Second half for trending news
                itemBuilder: (context, index) {
                  // Calculate the actual index for the second half of articles
                  int actualIndex = articles.length >= 10
                      ? index +
                            5 // Start from index 5 if we have 10+ articles
                      : index +
                            (articles.length / 2)
                                .ceil(); // Start from middle if less than 10

                  return GestureDetector(
                    onTap: () {
                      if (articles[actualIndex].url != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleView(
                              blogUrl: articles[actualIndex].url!,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Image on the left
                          Container(
                            width: 100,
                            height: 110,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              child: articles[actualIndex].urlToImage != null
                                  ? Image.network(
                                      articles[actualIndex].urlToImage!,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Container(
                                              color: Colors.grey[200],
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Color(0xFF007BFF),
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[200],
                                              child: Icon(
                                                Icons.image_not_supported,
                                                color: Colors.grey[400],
                                                size: 30,
                                              ),
                                            );
                                          },
                                    )
                                  : Container(
                                      color: Colors.grey[200],
                                      child: Icon(
                                        Icons.image_not_supported,
                                        color: Colors.grey[400],
                                        size: 30,
                                      ),
                                    ),
                            ),
                          ),

                          // Content on the right
                          Expanded(
                            child: Container(
                              height: 110,
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    articles[actualIndex].title ??
                                        "No title available",
                                    style: TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    articles[actualIndex].desc ??
                                        "No description available",
                                    style: TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Add some bottom spacing
          ],
        ),
      ),
    );
  }
}

// Reusable Category Circle Widget
class CategoryCircle extends StatelessWidget {
  final String name;
  final String imagePath;
  final double fontSize;
  final bool isLast;

  const CategoryCircle({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.fontSize,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(name: name.toLowerCase()),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: isLast ? 0 : 24),
        child: Column(
          children: [
            Container(
              width: 100, // Increased from 80 to 100
              height: 100, // Increased from 80 to 100
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10, // Slightly increased shadow
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Stack(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 150, // Updated to match container
                      height: 150, // Updated to match container
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                fontSize + 1, // Slightly increased font size
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
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
  final image, categoryname;
  CaategoryTile({this.image, this.categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(name: categoryname),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                image,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(color: Colors.black26),
              child: Center(
                child: Text(
                  categoryname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
