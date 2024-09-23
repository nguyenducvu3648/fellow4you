import 'package:fellow4you/SignUp.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fellow4U Login',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/login': (context) => LoginPage(), // Ensure this route is linked to the correct page
        '/signup':(context) => SignUpPage()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF00C39A), // Teal color matching the image
        child: Stack(
          children: <Widget>[
            // Background images
            Positioned(
              top: 50,
              right: 20,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white60.withOpacity(0.6), // Darker green tint
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  'assets/cloud2.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 10,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white60.withOpacity(0.6), // Darker green tint
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  'assets/plane.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/earth.png',
                width: 150,
                height: 150,
              ),
            ),
            Positioned(
              bottom: 70,
              left: 80,
              child: Row(
                children: [
                  Image.asset(
                    'assets/tree.png',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 20), // Space between the tree and hat
                  Image.asset(
                    'assets/hat.png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/Logo.png',
                    width: 200,
                    height: 80,
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}