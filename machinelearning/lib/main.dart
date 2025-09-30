import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machine Learning Short Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const CourseScreen(),
    const PracticeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Course"),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: "Practice"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// -------------------- COURSE SCREEN --------------------
class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  final List<Map<String, String>> modules = const [
    {
      "title": "Introduction to ML",
      "desc": "Understand what Machine Learning is and its real-world uses.",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/b/bb/Artificial_intelligence_icon.png"
    },
    {
      "title": "Data & Preprocessing",
      "desc": "Learn about datasets, cleaning, and preparing data for ML.",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/e/e8/Data_visualization_process_v1.png"
    },
    {
      "title": "ML Algorithms",
      "desc": "Explore algorithms like Regression, Decision Trees, and SVMs.",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/5/52/Decision_Tree.jpg"
    },
    {
      "title": "Neural Networks",
      "desc": "Introduction to Deep Learning and Neural Networks.",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/4/46/Colored_neural_network.svg"
    },
    {
      "title": "Hands-on Projects",
      "desc": "Build real ML applications with Python & TensorFlow.",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/2/2d/Tensorflow_logo.svg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ML Short Course")),
      body: ListView.builder(
        itemCount: modules.length,
        itemBuilder: (context, index) {
          final module = modules[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  module["img"]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 50);
                  },
                ),
              ),
              title: Text(
                module["title"]!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(module["desc"]!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Opening: ${module["title"]}"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// -------------------- PRACTICE SCREEN --------------------
class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(title: Text("Practice Zone")),
      body: Center(
        child: Text(
          "Coding Challenges & Quizzes Coming Soon!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// -------------------- PROFILE SCREEN --------------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Text(
          "User Profile & Progress Tracking",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
