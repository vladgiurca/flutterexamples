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
List<Color> startColours = [
  Color(0xFF81C4EF),
  Color(0xFFF5B367),
  Color(0xFFEC6794),
  Color(0xFFCA79F2),
  Color(0xFF6AE6CE),
];
List<Color> endColours = [
  Color(0xFF7B9DF7),
  Color(0xFFEC9C5D),
  Color(0xFFE85975),
  Color(0xFF9780F4),
  Color(0xFF68E1B8),
];

LinearGradient buildLinearGradient(Color startColour, Color endColour) {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [startColour, endColour],
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: buildLinearGradient(
                Color(0xFFDC6CF6),
                Color(0xFFAC4DF1),
              ),
            ),
          ),
          backgroundColor: Color(0xFF7F3BA3),
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: IconButton(
              iconSize: 30,
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.menu_rounded,
                ),
                onPressed: () {},
              ),
            ),
          ],
          bottom: TabBar(
            // ignore: todo
            //TODO: indicatorSize: TabBarIndicatorSize.tab, make it to be the length of text label
            // DONE !!!
            indicatorWeight: 4,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
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
              rankNumber: (index + 1).toString(),
              singerName: singerNames[index],
              songTitle: songTitles[index],
              startColour: startColours[index],
              endColour: endColours[index],
            );
          },
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.image,
      this.rankNumber,
      this.singerName,
      this.songTitle,
      this.startColour,
      this.endColour});
  final Color startColour;
  final Color endColour;
  final ImageProvider image;
  final String rankNumber;
  final String singerName;
  final String songTitle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15),
          width: 400,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: endColour,
                offset: Offset(1.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
            gradient: buildLinearGradient(startColour, endColour),
          ),
          child: ContainerContent(
            image: image,
            singerName: singerName,
            songTitle: songTitle,
            rankNumber: rankNumber,
          ),
        ),
        OpacityCircle(),
      ],
    );
  }
}

class ContainerContent extends StatelessWidget {
  const ContainerContent({
    Key key,
    @required this.image,
    @required this.singerName,
    @required this.songTitle,
    @required this.rankNumber,
  }) : super(key: key);

  final ImageProvider<Object> image;
  final String singerName;
  final String songTitle;
  final String rankNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class OpacityCircle extends StatelessWidget {
  final LinearGradient buildLinearGradient;

  const OpacityCircle({Key key, this.buildLinearGradient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -160,
      top: -20,
      child: Container(
        width: 250.0,
        height: 250.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
          // gradient: buildLinearGradient,
          // can't make that lineargradient inside circle..:(
        ),
      ),
    );
  }
}

class RankColumn extends StatelessWidget {
  final String rankNo;

  const RankColumn({
    Key key,
    this.rankNo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
        ),
        child: Column(
          children: [
            Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(height: 10),
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
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
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
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            CircleAvatar(
              // backgroundColor: Colors.white,
              radius: 30,
              backgroundImage: image,
            ),
          ],
        ),
      ),
    );
  }
}
