import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:location/location.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Ramayana',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            /* new Scaffold(
            appBar: new AppBar(title: new Text("News")),
            body: FutureBuilder<List>(
              future: fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ViewPagerTemplate(articles: snapshot.requireData);
                }
                return Loader();
              },
            )) */
            MainApp());
  }
}

class Location extends StatefulWidget {
  @override
  LocationState createState() => new LocationState();
}

class LocationState extends State<Location> {
  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;
  
}

class MainApp extends StatelessWidget {
  final PageController pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            child: new PageView.builder(
      controller: pageController,
      physics: new NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return new Content(pageController);
      },
    )));
  }
}

class Content extends StatelessWidget {
  final PageController pageController;
  Content(this.pageController);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(child: new PageView.builder(
            itemBuilder: (BuildContext context, int index) {
          return Text("Content");
        })),
        new QuickNavigate()
      ],
    ));
  }
}

class QuickNavigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: 100.0,
      decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.9)]),
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Text 1"),
                        Text("Text 2")
                      ],
                    )
                  )
                ],
              )
    ));
  }
}

class Modal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: EdgeInsets.all(30.0),
      decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.9)]),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Text("Select"),
        new Expanded(
          child: new SingleChildScrollView(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
                new Text("ashdjkhfkjashfjkahsdkjfh"),
              ],
            )
          )
        )
      ]),
    ));
  }
}

class ChooseCategories extends StatelessWidget {
  final PageController pageController;
  ChooseCategories(this.pageController);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
      children: <Widget>[
        new Text('Choose Category'),
        Categories(pageController)
      ],
    ));
  }
}

class Categories extends StatefulWidget {
  final PageController pageController;
  Categories(this.pageController);
  @override
  CategoriesState createState() => new CategoriesState(pageController);
}

class CategoriesState extends State<Categories> {
  final categories = ["Politics", "Entertainment", "Solve", "Cast"];
  final selected = [];
  final PageController pageController;
  CategoriesState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new SingleChildScrollView(
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buildCategories())));
  }

  List<GestureDetector> buildCategories() {
    var list = new List<GestureDetector>();
    categories.forEach((val) => list.add(new GestureDetector(
        onTap: () {
          pageController.animateToPage(1,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        child: new Container(
          height: 150.0,
          margin: EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.9)]),
          child: new Center(child: Text("Balakanda")),
        ))));
    return list;
  }
}

class ViewPagerTemplate extends StatelessWidget {
  final List articles;
  ViewPagerTemplate({this.articles});
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new PageView.builder(
      scrollDirection: Axis.vertical,
      reverse: false,
      controller: PageController(viewportFraction: 1.0),
      itemCount: this.articles.length,
      physics: ScrollPhysics(),
      pageSnapping: true,
      itemBuilder: (BuildContext context, int index) {
        return NewsTemplate(article: this.articles[index]);
      },
    ));
  }
}

class SecondScreen extends StatelessWidget {
  final String url;
  SecondScreen({this.url});
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
        appBar: new AppBar(title: Text("Detail")), url: this.url);
  }
}

class NewsTemplate extends StatelessWidget {
  final Article article;
  NewsTemplate({this.article});
  @override
  Widget build(BuildContext context) {
    final Widget assetImage = new Container(
      height: 200.0,
      decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            image: new AssetImage('images/default.jpg'),
            fit: BoxFit.cover,
          )),
    );
    final Widget imageWidget = (this.article.urlToImage != null)
        ? Image.network(this.article.urlToImage,
            height: 250.0, fit: BoxFit.cover)
        : assetImage;
    final String text =
        (this.article.description != null) ? this.article.description : "";
    final String title = this.article.title;
    return new GestureDetector(
        onHorizontalDragEnd: (DragEndDetails drag) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondScreen(url: this.article.url)),
          );
        },
        child: Column(
          children: <Widget>[
            imageWidget,
            Container(
                child: Column(
                  children: <Widget>[
                    Text(title,
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                    Text(text,
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 17.0,
                            color: Colors.grey))
                  ],
                ),
                padding: EdgeInsets.all(10.0))
          ],
        ));
  }
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Loading");
  }
}

List<Article> compute(String body) {
  final articleList = json.decode(body);
  var a = articleList['articles'];
  var article = a.map<Article>((article) => Article.fromJson(article)).toList();
  return article;
}

Future<List<Article>> fetchNews() async {
  final response = await http.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1272e100399c44bfbe91b64998809de0');

  if (response.statusCode == 200) {
    return compute(response.body);
    // If the call to the server was successful, parse the JSON
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Source {
  final String id;
  final String name;
  Source({this.id, this.name});
}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt});
  factory Article.fromJson(Map<String, dynamic> json) {
    var source = json["source"];
    return Article(
        source: new Source(id: source["id"], name: source["name"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"]);
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
