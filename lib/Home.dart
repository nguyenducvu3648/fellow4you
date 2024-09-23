import 'package:fellow4you/Chat.dart';
import 'package:fellow4you/MyTripsPage.dart';
import 'package:fellow4you/Profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Guide> guides = [
    Guide(
      name: 'Tuan Tran',
      location: 'Danang, Vietnam',
      imageUrl: 'assets/guide1.png',
      reviews: 127,
    ),
    Guide(
      name: 'Emmy',
      location: 'Hanoi, Vietnam',
      imageUrl: 'assets/guide2.png',
      reviews: 89,
    ),
    Guide(
      name: 'Linh Hana',
      location: 'Danang, Vietnam',
      imageUrl: 'assets/guide3.png',
      reviews: 127,
    ),
    Guide(
      name: 'Khai Ho',
      location: 'Ho Chi Minh, Vietnam',
      imageUrl: 'assets/guide4.png',
      reviews: 127,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            // Hình nền
            Image.asset(
              'assets/halong.png',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16, // Khoảng cách từ dưới
              left: 16,
              right: 16,
              child: Text(
                'Book your own private local\nGuide and explore the city',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Hi, where do you want to explore?',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (guides.length / 2).ceil(),
              itemBuilder: (context, index) {
                final startIndex = index * 2;
                final endIndex = (startIndex + 2).clamp(0, guides.length);
                final guidesOnPage = guides.sublist(startIndex, endIndex);

                return Row(
                  children: guidesOnPage.map((guide) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GuideCard(guide: guide),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyTripsPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF00C39A),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class GuideCard extends StatelessWidget {
  final Guide guide;

  GuideCard({required this.guide});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            guide.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  guide.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      guide.location,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    ...List.generate (5, (index) {
                      return Icon(
                        index < (guide.reviews / 20).ceil()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.yellow,
                        size: 16,
                      );
                    }),
                    Text(
                      '(${guide.reviews})',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Guide {
  final String name;
  final String location;
  final String imageUrl;
  final int reviews;

  Guide({required this.name, required this.location, required this.imageUrl, required this.reviews});
}