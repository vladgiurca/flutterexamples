import 'package:flutter/material.dart';

final kBoldWhiteColor =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
final kSmallWhiteColor = TextStyle(color: Colors.white, fontSize: 12);

List<String> singerNames = [
  'David Borg',
  'Lucy',
  'Jerry Cool West',
  'Bold',
  'Italic'
];
List<String> songTitles = [
  'Flying wings',
  'Growing up trouble',
  'Sculptor\s diary',
  'Illustration of litte girl',
  'Morena'
];
List<Color> colours = [
  Colors.blue,
  Colors.amber,
  Colors.red,
  Colors.purple,
  Colors.cyan
];

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
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: singerNames.length,
          itemBuilder: (context, index) {
            return ReusableCard(
              image: AssetImage('assets/images/pic${index + 1}.jpg'),
              colour: colours[index],
              rankNumber: (index + 1).toString(),
              singerName: singerNames[index],
              songTitle: songTitles[index],
            );
          },
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.colour,
      this.image,
      this.rankNumber,
      this.singerName,
      this.songTitle});
  final Color colour;
  final ImageProvider image;
  final String rankNumber;
  final String singerName;
  final String songTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: 400,
      height: 130,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colour,
            offset: Offset(1.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            ImageColumn(
              image: image,
            ),
            CenterColumn(
              singerName: singerName,
              songTitle: songTitle,
            ),
            RankColumn(rankNo: rankNumber),
          ],
        ),
      ),
    );
  }
}

class RankColumn extends StatelessWidget {
  final String rankNo;

  const RankColumn({Key key, this.rankNo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Icon(
            Icons.more_horiz,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Text(
            rankNo,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text('Ranking', style: kSmallWhiteColor),
        ],
      ),
    );
  }
}

class CenterColumn extends StatelessWidget {
  final String singerName;
  final String songTitle;

  const CenterColumn({Key key, this.singerName, this.songTitle})
      : super(key: key);
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
                  Text(singerName, style: kBoldWhiteColor),
                  SizedBox(height: 5),
                  Text('Title: $songTitle', style: kBoldWhiteColor),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('2342', style: kBoldWhiteColor),
                  Text('Popularity', style: kSmallWhiteColor),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text('4736', style: kBoldWhiteColor),
                  Text('Like', style: kSmallWhiteColor),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text('2342', style: kBoldWhiteColor),
                  Text('Followed', style: kSmallWhiteColor),
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
  final ImageProvider image;
  ImageColumn({this.image});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            CircleAvatar(
              // backgroundColor: Colors.white,
              radius: 25,
              backgroundImage: image,
            ),
          ],
        ),
      ),
    );
  }
}
