import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_flutter/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 80,
              right: 80,
              bottom: 40,
              top: 160,
            ),
            child: Image.asset('lib/images/coconut.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Rasakan Minuman Sehat & Segar dari kelapa pilihan.',
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 24),
          Text('Fresh Coconut', style: TextStyle(color: Colors.grey)),
          const Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomeScreen(),));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text('Get Ready', style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
