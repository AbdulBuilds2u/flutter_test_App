// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Center(
//           child: Text(
//             'Profile',
//             style: TextStyle(color: Colors.white, fontSize: 30),
//           ),
//         ),
//         actions: [
//   Padding(
//     padding: const EdgeInsets.only(right: 20),
//     child: IconButton(
//       splashColor: Colors.white.withOpacity(0.5),
//       highlightColor: Colors.white.withOpacity(0.3),
//       icon: const Icon(Icons.logout, color: Colors.white),
//       onPressed: () async {
//         await FirebaseAuth.instance.signOut();
//       },
//     ),
//   ),
// ],
//       ),
//       body:Container(
//   color: Colors.blue[50],
//   child:Padding(
//         padding: const EdgeInsets.only(top: 35),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 65,
//                     backgroundImage: NetworkImage(
//                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsvwZegjrzaNlAP8u7Ql4bo-ceSriet_EnugieSkItjg&s=10',
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   const Text(
//                     'Abdul Ghani',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     '${user?.email}',
//                     style: const TextStyle(fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.all(20),
//                 children: [
//                   ListTile(
//                     leading: const Icon(Icons.person),
//                     title: const Text('Profile'),
//                     trailing: const Icon(Icons.arrow_right),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.settings),
//                     title: const Text('Settings'),
//                     trailing: const Icon(Icons.arrow_right),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.help),
//                     title: const Text('Help & Support'),
//                     trailing: const Icon(Icons.arrow_right),
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              splashColor: Colors.white.withOpacity(0.5),
              highlightColor: Colors.white.withOpacity(0.3),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
          ),
        ],
      ),

      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [

              // User Profile Information
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsvwZegjrzaNlAP8u7Ql4bo-ceSriet_EnugieSkItjg&s=10',
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'Abdul Ghani',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      user?.email ?? 'abdulghani@gmail.com',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

              // Navigation List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [

                    // PROFILE TILE
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          hoverColor: const Color.fromARGB(255, 240, 240, 240).withOpacity(0.15),
                          splashColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                          highlightColor: const Color.fromARGB(255, 221, 221, 221).withOpacity(0.1),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileScreen(),
                              ),
                            );
                          },

                          child: const ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Profile'),
                            trailing: Icon(Icons.arrow_right),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // SETTINGS TILE
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          hoverColor: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.15),
                          splashColor: const Color.fromARGB(255, 223, 223, 223).withOpacity(0.3),
                          highlightColor: const Color.fromARGB(255, 223, 223, 223).withOpacity(0.1),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SettingsScreen(),
                              ),
                            );
                          },

                          child: const ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings'),
                            trailing: Icon(Icons.arrow_right),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // HELP & SUPPORT TILE
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          hoverColor: const Color.fromARGB(255, 245, 245, 245).withOpacity(0.15),
                          splashColor: const Color.fromARGB(255, 221, 221, 221).withOpacity(0.3),
                          highlightColor: const Color.fromARGB(255, 221, 221, 221).withOpacity(0.1),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const HelpScreen(),
                              ),
                            );
                          },

                          child: const ListTile(
                            leading: Icon(Icons.help),
                            title: Text('Help & Support'),
                            trailing: Icon(Icons.arrow_right),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// =================================
// PROFILE SCREEN
// =================================

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Profile'),
      ),

      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.person,
                size: 80,
              ),

              const SizedBox(height: 15),

              const Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(user?.email ?? 'No Email Found'),
            ],
          ),
        ),
      ),
    );
  }
}


// =================================
// SETTINGS SCREEN
// =================================

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Settings'),
      ),

      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.settings,
                size: 80,
              ),

              SizedBox(height: 15),

              Text(
                'Settings Screen',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// =================================
// HELP & SUPPORT SCREEN
// =================================

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Help & Support'),
      ),

      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.help,
                size: 80,
              ),

              SizedBox(height: 15),

              Text(
                'Help & Support Screen',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
