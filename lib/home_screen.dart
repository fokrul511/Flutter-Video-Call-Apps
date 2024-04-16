import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_call_apps/call_page.dart';
import 'package:flutter_video_call_apps/dev.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => DeveloperInfo(),
                    ));
              },
              icon: Icon(Icons.info_outline_rounded))
        ],
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text('Free Video Call'),
      ),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "userName";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'UserName',
                ),
                controller: userController,
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLength: 4,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "userId";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserId',
                ),
                controller: userIdController,
              ),
              const SizedBox(height: 10),
              const Text(
                "Shere With Friend Your UserId❣",
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Call"),
        icon: const Icon(Icons.video_call),
        onPressed: () {
          if (_globalKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CallPage(
                  userName: userController.text,
                  callID: userIdController.text,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
