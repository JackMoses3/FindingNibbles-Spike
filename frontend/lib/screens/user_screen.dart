import 'package:flutter/material.dart';
import '../services/user_service.dart';
import 'assign_dietary_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserService _userService = UserService();
  final _formKey = GlobalKey<FormState>();
  List<dynamic> _users = [];
  String name = '';
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final users = await _userService.getUsers();
    setState(() {
      _users = users;
    });
  }

  Future<void> createUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _userService.createUser(
        name: name,
        email: email,
        password: password,
      );
      fetchUsers();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('User created')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Form to create a user
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    onSaved: (val) => name = val ?? '',
                    validator:
                        (val) => val == null || val.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    onSaved: (val) => email = val ?? '',
                    validator:
                        (val) => val == null || val.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (val) => password = val ?? '',
                    validator:
                        (val) => val == null || val.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: createUser,
                    child: const Text('Create User'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'All Users',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['email']),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssignDietaryScreen(),
                  ),
                );
              },
              child: const Text('Assign Dietary Requirement'),
            ),
          ],
        ),
      ),
    );
  }
}
