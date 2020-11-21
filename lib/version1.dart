import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Color(0xFF7F3BA3),
          leading: IconButton(
            iconSize: 30,
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.menu_rounded,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            // ignore: todo
            //TODO: indicatorSize: TabBarIndicatorSize.tab, make it to be the length of text label
            indicatorWeight: 4,
            labelPadding: EdgeInsets.only(top: 10.0),
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  'Designer',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(text: 'Category'),
              Tab(text: 'Attention'),
            ],
          ),
        ),
        body: ReusableCard(),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 400,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            ImageColumn(),
            CenterColumn(),
            RankColumn(),
          ],
        ),
      ),
    );
  }
}

class RankColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Icon(
            Icons.more_horiz,
            size: 30,
          ),
          SizedBox(height: 20),
          Text(
            '1',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text('Ranking'),
        ],
      ),
    );
  }
}

class CenterColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('David Borg'),
                  SizedBox(height: 5),
                  Text('Title: Flying wings'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('2342'),
                  Text('Popularity'),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text('4736'),
                  Text('Like'),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text('2342'),
                  Text('Followed'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: FlutterLogo(
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
