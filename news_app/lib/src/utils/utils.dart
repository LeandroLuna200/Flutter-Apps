import 'package:flutter/cupertino.dart';
import 'package:news_app/src/models/new_models.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, Article article) async =>
    await canLaunch(article.url)
        ? await launch(article.url)
        : throw 'Could not launch $article.url';
