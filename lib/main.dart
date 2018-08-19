import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
            appBar: new AppBar(title: new Text("News")),
            body: FutureBuilder<List>(
              future: fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ViewPagerTemplate(articles: snapshot.requireData);
                }
                return Loader();
              },
            )));
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
  SecondScreen({ this.url });
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
              appBar: new AppBar(
                title: Text("Web View")
              ),
              url: this.url
            );
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
          MaterialPageRoute(builder: (context) => SecondScreen(url: this.article.url)),
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
