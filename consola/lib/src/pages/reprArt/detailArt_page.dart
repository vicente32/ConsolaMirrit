import 'package:flutter/material.dart';

class DetailArtPage extends StatefulWidget {
  static final String routName = 'detailArt';

  @override
  _DetailArtPageState createState() => _DetailArtPageState();
}

class _DetailArtPageState extends State<DetailArtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Articulo detallado'),
    ),);
  }
}
