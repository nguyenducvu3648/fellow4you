import 'package:flutter/material.dart';
import 'Home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          color: Color(0xFF00C39A), // Nền màu xanh lá cây
          child: Stack(
            children: [
              // Phần nền trắng với đường cong tròn hơn
              Positioned(
                top: MediaQuery.of(context).size.height * 0.11, // Điều chỉnh vị trí bắt đầu của phần trắng
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(130),
                      topRight: Radius.circular(130),
                    ),
                  ),
                ),
              ),
              // Nội dung chính
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40),
                    // Nút quay lại
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Logo ứng dụng
                    Align(
                      alignment: Alignment.topLeft, // Di chuyển logo sang bên trái
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30), // Thêm khoảng cách từ bên trái

                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Color(0xFF00C39A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/Logo.png',
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35), // Khoảng cách giữa logo và tiêu đề
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Welcome back, Yoo Jin',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF00C39A),
                      ),
                    ),
                    SizedBox(height: 40),
                    // Trường Email
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Trường Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {
                          // Xử lý quên mật khẩu
                        },
                      ),
                    ),
                    SizedBox(height: 34),
                    ElevatedButton(
                      child: Text('SIGN IN'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF00C39A),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Xử lý đăng nhập
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                    ),
                    SizedBox(height: 24),
                    Text(
                      'or sign in with',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton('assets/facebook_icon.png', Colors.blue),
                        SizedBox(width: 16),
                        _socialButton('assets/kakao_icon.png', Colors.yellow),
                        SizedBox(width: 16),
                        _socialButton('assets/line_icon.png', Colors.green),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF00C39A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            // Xử lý đăng ký
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String assetName, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          assetName,
          width: 35,
          height: 35,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading image: $assetName');
            print('Error details: $error');
            return Icon(Icons.error, color: Colors.white);
          },
        ),
      ),
    );
  }
}