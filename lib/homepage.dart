import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livenews/model.dart';
import 'package:livenews/stateManager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController newsController = Get.find<NewsController>();

  String category = 'business';
  String newsChannel = 'bbc-news';

  Future<void> _refresh() async {
    Get.find<NewsController>().getNewsBycategory(category);
    Get.find<NewsController>().getNewsBychannel(newsChannel);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daily Day',
            style: GoogleFonts.adamina(letterSpacing: .6, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _refresh();
              },
              icon: const Icon(Icons.refresh),
            )
          ],
          elevation: 5,
        ),
        drawer: buildCustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<NewsController>(
                builder: (newsController) {
                  if(newsController.getNewsInprogess){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else {
                    return SizedBox(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newsController.newsData.articles?.length ?? 0,
                      itemBuilder: (context, index) {
                        Articles article =
                        newsController.newsData.articles![index];

                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                Image.network(
                                  article.urlToImage ?? '',
                                  width: 150,
                                  height: 97,
                                  fit: BoxFit.cover,
                                ),

                                const SizedBox(height: 8.0),
                                // Subtitle
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    article.title ?? '',
                                    style: const TextStyle(fontSize: 10.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                  }
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: GetBuilder<NewsController>(
                builder: (newsController) {
                  if(newsController.getNewsInprogess){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else {
                    return SingleChildScrollView(
                    child: Container(
                      color: Colors.lightGreen,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: newsController.newsData.articles?.length ?? 0,
                        itemBuilder: (context, index) {
                          Articles article =
                          newsController.newsData.articles![index];

                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                Image.network(
                                  article.urlToImage ?? '',
                                  width: 150,
                                  height: 97,
                                  fit: BoxFit.cover,
                                ),

                                const SizedBox(width: 8.0),
                                // Subtitle
                                Expanded(
                                  child: SizedBox(
                                    width: 100,
                                    child: Text(
                                      article.description ?? '',
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/profile_image.jpg"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle Home item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle Settings item tap
            },
          ),
        ],
      ),
    );
  }
}

class NewsArticle {
  String title;
  String imageUrl;
  String subtitle;

  NewsArticle(
      {required this.title, required this.imageUrl, required this.subtitle});
}
