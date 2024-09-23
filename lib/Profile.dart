import 'package:flutter/material.dart';
import 'Chat.dart';
import 'Home.dart';
import 'MyTripsPage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 16,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            title: Text(
              'Yoo Jin',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.settings, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: _buildProfileHeader(),
          ),
          SliverToBoxAdapter(
            child: _buildPhotoSection(),
          ),
          SliverToBoxAdapter(
            child: _buildJourneySection(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildProfileHeader() {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30), // Remove the top margin
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.transparent, // Keep it transparent
          ),
          child: Column(
            children: [
              SizedBox(height: 10), // Remove the space for the profile image
              Text(
                'Yoo Jin',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Adjust as needed for visibility
                ),
              ),
              SizedBox(height: 4),
              Text(
                'yoojin@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            'My Photos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return _buildPhotoItem();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoItem() {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/picture1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildJourneySection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Journeys',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildJourneyCard(
            images: [
              'assets/picture5.png',
              'assets/picture6.png',
              'assets/picture7.png',
            ],
            title: 'Memorable Journeys',
            location: 'Various Locations',
            date: 'Multiple Dates',
            likes: 234,
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyCard({
    required List<String> images,
    required String title,
    required String location,
    required String date,
    required int likes,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: images.map((img) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(4),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius .circular(8),
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Likes: $likes',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyTripsPage()),
              );
            },
          ),
          SizedBox(width: 48), // Spacer for FloatingActionButton
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
    );
  }
}
