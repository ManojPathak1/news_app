import 'package:flutter/material.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

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
            body: ViewPagerTemplate()));
  }
}

class ViewPagerTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new PageView.builder(
          scrollDirection: Axis.vertical,
          reverse: false,
          controller: PageController(viewportFraction: 1.0),
          itemCount: 10,
          physics: ScrollPhysics(),
          pageSnapping: true,
          itemBuilder: (BuildContext context, int index) {
            return Text("Hello $index");
          },
      )
      );
  }

  void pageViewController() {

  }
}

class NewsTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Image.network(
            'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg'),
        new Text(
            "Vespa launches all-new limited-edition black scooter, Vespa Notte at a special introductory price. Also, avail ₹10,000 worth benefits on Notte & the whole Vespa and Aprilia range. The benefits include free insurance, free accessory, free RSA in addition to Paytm Mall benefits up to ₹5000* or zero cost EMI* or low down payment of ₹3999*")
      ],
    );
  }
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Loading");
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1272e100399c44bfbe91b64998809de0');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Source {
  final String id;
  final String name;
  Source({ this.id, this.name });
}

class ArticleList {
  final List articleList;
  ArticleList({ this.articleList });
  factory ArticleList.fromJson(Map<String, dynamic> json) {
    var articles = json['articles']['value'];
    articles.forEach((elem) => {
    });
    return ArticleList();
  }
}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt
  });
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
