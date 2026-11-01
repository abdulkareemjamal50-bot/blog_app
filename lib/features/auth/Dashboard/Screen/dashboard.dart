import 'package:firebase/features/blog/presentation/blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 20),
          CircleAvatar(
            backgroundColor: Color(0xFF4F46E5),
            child: Text("M", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 15),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Iyanda ",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Welcome back! Here's your progress.",
              style: GoogleFonts.poppins(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "Overview",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => BlogScreen())),
                  child: _card("Courses", "8", Icons.book),
                ),
                const SizedBox(width: 12),
                _card("Projects", "12", Icons.folder),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                _card("Completed", "5", Icons.check_circle),
                const SizedBox(width: 12),
                _card("Certificates", "4", Icons.workspace_premium),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              "My Progress",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Flutter Development", style: GoogleFonts.poppins()),

                  const SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: 0.7,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF4F46E5),
                    backgroundColor: Colors.grey.shade200,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "70% completed",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "Recent Activity",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _activity(Icons.check_circle, "Completed Flutter course"),

            _activity(Icons.folder, "Created a new project"),

            _activity(Icons.workspace_premium, "Earned a certificate"),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF4F46E5),
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Projects"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  static Widget _card(String title, String number, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF4F46E5)),

            const SizedBox(height: 10),

            Text(
              number,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  static Widget _activity(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF4F46E5)),

          const SizedBox(width: 15),

          Text(text, style: GoogleFonts.poppins(fontSize: 13)),
        ],
      ),
    );
  }
}
