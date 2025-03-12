import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:io';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/mainmenu': (context) => MainMenuPage(),
        '/mental_health': (context) => MentalHealthPage(),
        '/academic': (context) => AcademicPage(),
        '/finance': (context) => FinanceScreen(),
        '/media_social': (context) => MediaSocialPage(),
        '/media_social_post': (context) => MediaSocialPost(),
        '/e_learning': (context) => ELearningPage(),
        '/JadwalKuliahPage': (context) => JadwalKuliahPage(),
        '/todo': (context) => ToDoPage(),
        '/message_upi': (context) => MessageUpiPage(),
        '/message_chat_upi': (context) => MessageChatPage(),
        '/notification': (context) => NotificationPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landing Page", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFF6F0FA),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: const Color.fromARGB(255, 162, 165, 168)),
                child: Text(
                  'List Fitur',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              buildMenuItem(Icons.folder, "Main Menu", context, '/mainmenu'),
              buildMenuItem(Icons.favorite, "Mental Health", context, '/mental_health'),
              buildMenuItem(Icons.school, "Academic", context, '/academic'),
              buildMenuItem(Icons.money, "Finance", context, '/finance'),
              buildMenuItem(Icons.chat, "Media Social - Melihat Postingan Orang", context, '/media_social'),
              buildMenuItem(Icons.chat, "Media Social - Post Foto, Video, dll", context, '/media_social_post'),
              buildMenuItem(Icons.computer, "E-Learning", context, '/e_learning'),
              buildMenuItem(Icons.check, "Jadwal Kuliah", context, '/JadwalKuliahPage'),
              buildMenuItem(Icons.check, "To-Do", context, '/todo'),
              Divider(),
              buildMenuItem(Icons.message, "Message - Upi", context, '/message_upi'),
              buildMenuItem(Icons.message, "Message - Chat", context, '/message_chat_upi'),
              buildMenuItem(Icons.notifications, "Notification", context, '/notification'),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Gambar Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"), // Pastikan file ada di folder assets
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten di atas gambar
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "QUIZ 1",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Kelompok 6",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Untuk List Fitur Ada Di Navbar/Drawer.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title, BuildContext context, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: TextStyle(color: Colors.black54)),
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}

class MainMenuPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.favorite, 'title': 'Mental Health'},
    {'icon': Icons.school, 'title': 'Academic'},
    {'icon': Icons.attach_money, 'title': 'Finance'},
    {'icon': Icons.public, 'title': 'Media Social'},
    {'icon': Icons.computer, 'title': 'E-Learning'},
    {'icon': Icons.list, 'title': 'To-Do'},
    {'icon': Icons.message, 'title': 'Messenger'},
    {'icon': Icons.notifications, 'title': 'Notification'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Menu", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Gambar dari assets
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/image10.jpg', // Pastikan sesuai dengan path di assets
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 10),

          // Menu Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_ios, size: 16),
              SizedBox(width: 5),
              Text("MENU", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),

          SizedBox(height: 10),

          // Grid Menu
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: menuItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          padding: EdgeInsets.all(15),
                          child: Icon(menuItems[index]['icon'], size: 30, color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Text(menuItems[index]['title'], textAlign: TextAlign.center),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman placeholder untuk menu
class PlaceholderPage extends StatelessWidget {
  final String title;
  PlaceholderPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman utama
          },
        ),
      ),
      body: Center(child: Text("This is the $title Page")),
    );
  }
}

class MentalHealthPage extends StatefulWidget {
  @override
  _MentalHealthPageState createState() => _MentalHealthPageState();
}

class _MentalHealthPageState extends State<MentalHealthPage> {
  double happinessLevel = 50; // Default happiness level
  bool showDropdown = false;
  String? selectedPsychologist;

  List<String> psychologists = [
    "Dr. Seto Mulyadi, S.Psi.,M.Si",
    "Prof. Dr. R Slamet Imam Santoso",
    "Dra. Niniek L Karim",
    "Prof. Dr. Sawitri Supardi Sadarjoen",
    "Dra. Roslina Verauli M.Psi",
  ];

  List<TextSpan> getHappinessMessage() {
    if (happinessLevel < 30) {
      return [
        TextSpan(
          text: "Your responses suggest you might be experiencing thoughts of self-harm. If you need urgent assistance, please contact a professional. ",
          style: TextStyle(color: Colors.black87),
        ),
        TextSpan(
          text: "Call this number for help 08123456789",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ];
    } else if (happinessLevel < 60) {
      return [
        TextSpan(
          text: "You might be feeling a little down. Try talking to someone you trust.",
          style: TextStyle(color: Colors.black87),
        ),
      ];
    } else {
      return [
        TextSpan(
          text: "You're feeling good! Keep up the positive mindset.",
          style: TextStyle(color: Colors.black87),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mental Health"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bagian pertanyaan dengan slider
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "How you feeling today?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
                      Expanded(
                        child: Slider(
                          value: happinessLevel,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          onChanged: (value) {
                            setState(() {
                              happinessLevel = value;
                            });
                          },
                        ),
                      ),
                      Icon(Icons.sentiment_very_satisfied, color: Colors.green),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Happiness Level Indicator
            Text(
              "Your Happiness Level is:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[100],
              ),
              child: Text(
                "${happinessLevel.round()}%",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),

            SizedBox(height: 20),

            // Pesan sesuai tingkat kebahagiaan dengan Bold untuk nomor telepon
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: getHappinessMessage(),
                style: TextStyle(fontSize: 14),
              ),
            ),

            Spacer(),

            // Tombol untuk mencari psikolog (Dropdown)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    showDropdown = !showDropdown;
                  });
                },
                icon: Icon(Icons.search, color: Colors.white),
                label: Text("Seek Psychologist", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            if (showDropdown)
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text("Select a psychologist"),
                  value: selectedPsychologist,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedPsychologist = newValue;
                      showDropdown = false;
                    });
                  },
                  items: psychologists.map((String psychologist) {
                    return DropdownMenuItem<String>(
                      value: psychologist,
                      child: Text(psychologist),
                    );
                  }).toList(),
                ),
              ),

            if (selectedPsychologist != null)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Selected Psychologist: $selectedPsychologist",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AcademicPage extends StatefulWidget {
  @override
  _AcademicPageState createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  double ipk = 2.54;
  int totalSks = 44;
  List<Course> courses = [
    Course("MK123 - Jaringan Komputer", 3, "C+", "2024-1"),
    Course("MK324 - Algoritma Pemrograman", 4, "B", "2023-2"),
    Course("MK122 - Sistem Operasi", 3, "A", "2023-1"),
    Course("MK111 - Kalkulus", 4, "B-", "2022-2"),
    Course("MK020 - Sistem Informasi", 2, "A-", "2022-1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Academic"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IPK Score
            Text(
              "Your IPK Score:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent[100],
              ),
              child: Text(
                ipk.toStringAsFixed(2),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),

            SizedBox(height: 10),

            // Total SKS
            Text(
              "Total SKS Kumulatif: $totalSks",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // Sort Button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.sort, color: Colors.black54),
                SizedBox(width: 5),
                Text(
                  "Sort By Semester",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 10),

            // List of Courses
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseTile(course: courses[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model untuk Course
class Course {
  final String name;
  final int sks;
  final String grade;
  final String semester;

  Course(this.name, this.sks, this.grade, this.semester);
}

// Widget untuk Expandable Tile
class CourseTile extends StatefulWidget {
  final Course course;

  CourseTile({required this.course});

  @override
  _CourseTileState createState() => _CourseTileState();
}

class _CourseTileState extends State<CourseTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text(
          widget.course.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jumlah SKS: ${widget.course.sks}", style: TextStyle(fontSize: 14)),
                Text("Nilai: ${widget.course.grade}", style: TextStyle(fontSize: 14)),
                Text("Tahun Semester: ${widget.course.semester}", style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FinanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Keuangan"),
        actions: [
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Text("Pengelolaan Keuangan Mahasiswa"),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFinanceCard("Pemasukkan", "Rp.45.000.000"),
                buildFinanceCard("Pengeluaran", "Rp.10.000.000"),
              ],
            ),
            SizedBox(height: 16),
            Text("Statistik Keuangan Hemat atau Tidak", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              height: 200,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
              ),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 2021),
                        FlSpot(1, 2021),
                        FlSpot(2, 2022),
                        FlSpot(3, 2022),
                        FlSpot(4, 2023),
                        FlSpot(5, 2024),
                        FlSpot(6, 2025),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                    ),
                  ],
                  borderData: FlBorderData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          List<String> dates = ["Nov 23", "24", "25", "26", "27", "28", "30"];
                          if (value.toInt() >= 0 && value.toInt() < dates.length) {
                            return Text(dates[value.toInt()], style: TextStyle(fontSize: 12));
                          }
                          return Text("");
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Histori Pemasukkan dan Pengeluaran", style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: [
                  buildTransactionItem("Isi Saldo", "30 Nov 2025 • 19.00", "Rp. 50.000", true),
                  buildTransactionItem("Kirim ke Alexander", "29 Nov 2025 • 15.00", "Rp. 80.000", false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFinanceCard(String title, String amount) {
    return Expanded(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(amount, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTransactionItem(String title, String date, String amount, bool isIncome) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          isIncome ? Icons.arrow_downward : Icons.arrow_upward,
          color: Colors.white,
        ),
        backgroundColor: isIncome ? Colors.green : Colors.red,
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class MediaSocialPage extends StatefulWidget {
  @override
  _SocialMediaPageState createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<MediaSocialPage> {
  int selectedTab = 1; // Default: "For You"

  List<Post> posts = [
    Post(
      profileName: "marcohenriko",
      date: "26 Oktober 2023",
      imageUrl: "assets/image6.jpg",
      description: "Pemandangan yang indah",
      likes: 21,
      comments: 4,
    ),
    Post(
      profileName: "fzbayer",
      date: "2 hrs ago",
      imageUrl: "",
      description:
          "Hallo semuanya bagaimana cara pake sosmed ini tolong ajari aku",
      likes: 6,
      comments: 18,
    ),
    Post(
      profileName: "Oscar",
      date: "1 day ago",
      imageUrl: "",
      description: "Hari ini aku mau UTS tolong kasih aku kunci jawaban donggg heheheh",
      likes: 0,
      comments: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Media", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Tab Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTab("Following", 0),
              _buildTab("For you", 1),
              _buildTab("Favorites", 2),
            ],
          ),

          Divider(),

          // Post Feed
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostWidget(post: posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: selectedTab == index ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
          if (selectedTab == index)
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 3,
              width: 50,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}

// Model untuk Post
class Post {
  final String profileName;
  final String date;
  final String imageUrl;
  final String description;
  final int likes;
  final int comments;

  Post({
    required this.profileName,
    required this.date,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.comments,
  });
}

// Widget untuk Postingan
class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.profileName, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(post.date, style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),

          SizedBox(height: 10),

          // Post Image (jika ada)
          if (post.imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(post.imageUrl),
            ),

          SizedBox(height: 10),

          // Post Description
          Text(post.description),

          SizedBox(height: 10),

          // Likes & Comments
          Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 5),
              Text("${post.likes} likes"),
              SizedBox(width: 20),
              Icon(Icons.comment),
              SizedBox(width: 5),
              Text("${post.comments} comments"),
            ],
          ),

          Divider(),
        ],
      ),
    );
  }
}

class MediaSocialPost extends StatefulWidget {
  @override
  _SocialMediaPostPageState createState() => _SocialMediaPostPageState();
}

class _SocialMediaPostPageState extends State<MediaSocialPost> {
  File? _image;
  String _selectedCategory = "Terbaru";
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Warna putih agar terlihat
          onPressed: () => Navigator.pop(context), // Kembali ke halaman utama
        ),
        title: Text("Postingan Baru", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {}, // Tambahkan logika untuk "Selanjutnya"
            child: Text("Posting", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Gambar Unggahan
          _image != null
              ? Image.file(_image!,
                  width: double.infinity, height: 250, fit: BoxFit.cover)
              : Image.asset(
                  'assets/image7.jpg', // Ganti dengan gambar assets di proyek
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),

          // Dropdown Kategori + Tombol Pilih Gambar
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  dropdownColor: Colors.black,
                  value: _selectedCategory,
                  items: ["Terbaru", "Video", "Favorit"]
                      .map((category) => DropdownMenuItem<String>(
                            value: category,
                            child:
                                Text(category, style: TextStyle(color: Colors.white)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add_photo_alternate, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Input Caption
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: TextField(
                controller: _captionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Caption",
                  hintText: "Caption",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => _captionController.clear(),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class ELearningPage extends StatefulWidget {
  @override
  _ELearningPageState createState() => _ELearningPageState();
}

class _ELearningPageState extends State<ELearningPage> {
  String? selectedCourse;
  String? selectedMeeting;
  final ItemScrollController _scrollController = ItemScrollController();

  final List<String> courses = [
    "Alpro 1",
    "Alpro 2",
    "Struktur Data",
    "DPBO",
    "Game Dev",
    "Machine Learning",
  ];

  final Map<String, List<String>> meetings = {
    "Alpro 1": ["Pertemuan 1", "Pertemuan 2", "Pertemuan 3", "Pertemuan 4", "Pertemuan 5"],
    "Alpro 2": ["Pertemuan 1", "Pertemuan 2", "Pertemuan 3"],
    "Struktur Data": ["Pertemuan 1", "Pertemuan 2"],
  };

  final Map<String, List<String>> materials = {
    "Pertemuan 1": ["Python Learning", "C++ Learning"],
    "Pertemuan 2": ["Java Learning", "PHP Learning"],
    "Pertemuan 3": ["HTML & CSS", "Flutter"],
  };

  void _selectCourse(String course) {
    setState(() {
      selectedCourse = course;
      selectedMeeting = null;
    });
    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.scrollTo(index: 1, duration: Duration(milliseconds: 500));
    });
  }

  void _selectMeeting(String meeting) {
    setState(() {
      selectedMeeting = meeting;
    });
    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.scrollTo(index: 2, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Learning"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ScrollablePositionedList.builder(
        itemCount: 3,
        itemScrollController: _scrollController,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildCoursesSection();
          } else if (index == 1 && selectedCourse != null) {
            return _buildMeetingsSection();
          } else if (index == 2 && selectedMeeting != null) {
            return _buildMaterialsSection();
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildCoursesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Pembelajaran"),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _selectCourse(courses[index]),
              child: Card(
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book, size: 50, color: Colors.grey[700]),
                    SizedBox(height: 8),
                    Text(courses[index], style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Updated today", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMeetingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Pertemuan"),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: meetings[selectedCourse]?.length ?? 0,
          itemBuilder: (context, index) {
            String meeting = meetings[selectedCourse]![index];
            return ListTile(
              leading: Icon(Icons.video_library, color: Colors.grey[700]),
              title: Text(meeting),
              trailing: Icon(Icons.more_vert),
              onTap: () => _selectMeeting(meeting),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMaterialsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Materi"),
        Column(
          children: materials[selectedMeeting]!.map((material) => ExpansionTile(
                title: Text(material),
                children: [Padding(padding: EdgeInsets.all(8.0), child: Text("Isi Materi"))],
              )).toList(),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Divider(thickness: 2, color: Colors.black),
        ],
      ),
    );
  }
}

class JadwalKuliahPage extends StatefulWidget {
  @override
  _JadwalKuliahPageState createState() => _JadwalKuliahPageState();
}

class _JadwalKuliahPageState extends State<JadwalKuliahPage> {
  int selectedDay = 1;
  final List<String> days = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];

  final Map<int, List<Map<String, dynamic>>> schedule = {
    1: [
      {"time": "07.00-8.40  ", "course": "Kosong", "color": 0xFFA5D6A7, "stripColor": 0xFF2E7D32},
      {"time": "8.40-9.30    ", "course": "Kosong", "color": 0xFFA5D6A7, "stripColor": 0xFF2E7D32},
      {"time": "9.30-12.00  ", "course": "PROVIS-C-302", "color": 0xFFD98324, "stripColor": 0xFF4E342E},
      {"time": "13.00-15.30", "course": "Kosong", "color": 0xFFA5D6A7, "stripColor": 0xFF2E7D32},
      {"time": "15.30-18.00", "course": "ANDAL-C-103", "color": 0xFF64B5F6, "stripColor": 0xFF1E88E5},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Kuliah", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(days.length, (index) {
                return Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.star, color: selectedDay == index ? Colors.black : Colors.grey),
                      onPressed: () {
                        setState(() {

                        });
                      },
                    ),
                    Text(days[index], style: TextStyle(fontWeight: selectedDay == index ? FontWeight.bold : FontWeight.normal)),
                  ],
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Waktu", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Mata Kuliah", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: schedule[selectedDay]?.length ?? 0,
              itemBuilder: (context, index) {
                var item = schedule[selectedDay]![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(item["time"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(item["color"]),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 5,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(item["stripColor"]),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                  child: Text(
                                    item["course"]!,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

    List<Map<String, dynamic>> tasks = [
    {
      "title": "QUIZ PROVIS",
      "deadline": DateTime(2025, 3, 12),
      "description": "Buat UI Mobile Sederhana",
      "priority": 5,
    },
    {
      "title": "Tugas Big Data",
      "deadline": DateTime(2025, 3, 17),
      "description": "Ada di link grup",
      "priority": 3,
    },
    {
      "title": "UTS Big Data",
      "deadline": DateTime(2025, 3, 31),
      "priority": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To-Do"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: (day) {
                return tasks.where((task) => isSameDay(task["deadline"], day)).toList();
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                bool isDeadline = tasks.any((task) => isSameDay(task["deadline"], date));
                
                if (isDeadline) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Warna merah penuh
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${date.day}', // Tetap menampilkan angka tanggal
                      style: TextStyle(
                        color: Colors.white, // Angka tanggal jadi putih agar terlihat
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sort By Priority", style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.list),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: Checkbox(value: false, onChanged: (value) {}),
                    title: Text(tasks[index]["title"], style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Deadline: ${tasks[index]["deadline"].day} Maret ${tasks[index]["deadline"].year}"),
                                if (tasks[index].containsKey("description"))
                                  Text(tasks[index]["description"], style: TextStyle(fontSize: 12)),
                              ],
                            ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(tasks[index]["priority"], (i) => Icon(Icons.star, color: Colors.blue)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class MessageUpiPage extends StatefulWidget {
  @override
  _MessengerPageState createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessageUpiPage> {
  String searchQuery = "";

  List<Map<String, String>> searchResults = [
    {"name": "Budi Setiawan", "desc": "Undergraduate Student UPI", "avatar": "assets/image9.jpg"},
    {"name": "Budi Hadiono", "desc": "Dosen UPI - Ilmu Komputer", "avatar": "assets/image8.jpg"},
  ];

  List<Map<String, String>> messages = [
    {"name": "Budi Setiawan", "time": "1d", "message": "", "avatar": "assets/image9.jpg"},
    {"name": "Budi Hadiono", "time": "2d", "message": "Liked your comment", "avatar": "assets/image8.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Messenger", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Filter Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("Unread", true),
                _buildFilterButton("Group", false),
                _buildFilterButton("Archive", false),
                _buildFilterButton("Pinned", false),
              ],
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                suffixIcon: Icon(Icons.close, color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Search Results
          if (searchQuery.isNotEmpty)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 5),
                ],
              ),
              child: Column(
                children: searchResults.map((result) {
                  return ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(result["avatar"]!)),
                    title: Text(result["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(result["desc"]!),
                  );
                }).toList(),
              ),
            ),
          // Messages List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var msg = messages[index];
                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(msg["avatar"]!)),
                  title: Text(msg["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(msg["message"]!, style: TextStyle(color: Colors.black54)),
                  trailing: Text(msg["time"]!, style: TextStyle(color: Colors.black54)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: isActive ? Colors.white : Colors.black),
      ),
    );
  }
}

class MessageChatPage extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {"text": "Assalamualaikum pak. Saya Umarex dengan NIM 2400598 kelas C1. Pak ingin bertanya mengenai pendaftaran gelatik.", "isSender": true},
    {"text": "Pak untuk pendaftaran di form, kan disertai portofolio juga. Apakah wajib portofolionya?", "isSender": true},
    {"text": "Wa'alaikum salam wr wb. Itu opsional. Kalau belum punya ga perlu, tapi kalau dari SMA/SMK pernah dapat, boleh dimasukan.", "isSender": false},
    {"text": "apakah boleh mengikuti lebih dari satu lomba🙏?", "isSender": true},
    {"text": "Sudah saya umumkan di grup, silahkan boleh.", "isSender": false},
    {"text": "ntuk dospem kita harus isi ulang link pendaftaran lagi untuk mengisi dospem nya atau langsung saja ke spreadsheets nya pak🙏🏻?", "isSender": true},
    {"text": "Kalau file excel yang saya minta diisi itu untuk data prodi, tapi kalau pendaftaran itu harus ke link yang diberikan oleh UPI melalui surat Gelatik 2025 UPI.", "isSender": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("assets/image8.jpg"), // Ganti dengan foto profil
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Budi Hadiono", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text("Active 1 day ago", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.call, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.videocam, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length + 1,
              itemBuilder: (context, index) {
                if (index == 3) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Nov 30, 2023, 9:41 AM", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                  );
                }
                var message = messages[index > 3 ? index - 1 : index];
                return Align(
                  alignment: message["isSender"] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: message["isSender"] ? Colors.black : Colors.grey[300],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      message["text"],
                      style: TextStyle(
                        color: message["isSender"] ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.camera_alt, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.image, color: Colors.grey),
                SizedBox(width: 10),
                Icon(Icons.send, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int selectedTab = 0; // Index untuk tab yang dipilih
  final List<String> tabs = ["All", "Ongoing", "History"];

  final List<Map<String, dynamic>> notifications = [
    {
      "title": "QUIZ PROVIS",
      "deadline": "12 Maret 2025",
      "desc": "Buat UI Mobile Sederhana",
      "color": Colors.red, // Warna lebih terang
      "category": "Today"
    },
    {
      "title": "UTS Big Data",
      "deadline": "31 Maret 2025",
      "color": Colors.amber,
      "category": "Later"
    },
    {
      "title": "Tugas 2 Big Data",
      "deadline": "17 Maret 2025",
      "color": Colors.amber,
      "category": "Later"
    },
    {
      "title": "Tugas 1 Big Data",
      "desc": "Buatkan Dokumentasi Hadoop",
      "color": Colors.green,
      "category": "Previously"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notification", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // TAB MENU
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(tabs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        tabs[index],
                        style: TextStyle(
                          fontWeight: selectedTab == index ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      if (selectedTab == index)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          height: 2,
                          width: 40,
                          color: Colors.black,
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                buildSection("Today"),
                buildNotification("QUIZ PROVIS", "Deadline: 12 Maret 2025", "Buat UI Mobile Sederhana", Colors.red[200]!),
                buildSection("Later"),
                buildNotification("UTS Big Data", "Deadline: 31 Maret 2025", "", Colors.amber[200]!),
                buildNotification("Tugas 2 Big Data", "Deadline: 17 Maret 2025", "", Colors.amber[200]!),
                buildSection("Previously"),
                buildNotification("Tugas 1 Big Data", "", "Buatkan Dokumentasi Hadoop", Colors.green[200]!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan kategori
  Widget buildSection(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  // Widget untuk notifikasi card dengan teks hitam
  Widget buildNotification(String title, String deadline, String desc, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
          if (deadline.isNotEmpty)
            Text(deadline, style: TextStyle(fontSize: 14, color: Colors.black)),
          if (desc.isNotEmpty)
            Text(desc, style: TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}


