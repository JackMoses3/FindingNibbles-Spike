import 'package:flutter/material.dart';
import '../services/dietary_service.dart';

class AssignDietaryScreen extends StatefulWidget {
  const AssignDietaryScreen({super.key});

  @override
  State<AssignDietaryScreen> createState() => _AssignDietaryScreenState();
}

class _AssignDietaryScreenState extends State<AssignDietaryScreen> {
  final DietaryService _dietaryService = DietaryService();

  List<dynamic> _users = [];
  List<dynamic> _dietaries = [];
  int? _selectedUserId;
  int? _selectedDietaryId;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final users = await _dietaryService.getUsers();
    final dietaries = await _dietaryService.getDietaryRestrictions();

    setState(() {
      _users = users;
      _dietaries = dietaries;
      _loading = false;
    });
  }

  Future<void> assign() async {
    if (_selectedUserId != null && _selectedDietaryId != null) {
      await _dietaryService.assignRestrictionToUser(
        _selectedUserId!,
        _selectedDietaryId!,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dietary restriction assigned!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Assign Dietary Requirement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(labelText: 'Select User'),
              items:
                  _users
                      .map(
                        (user) => DropdownMenuItem<int>(
                          value: user['id'],
                          child: Text(user['name']),
                        ),
                      )
                      .toList(),
              onChanged: (value) => setState(() => _selectedUserId = value),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                labelText: 'Select Dietary Restriction',
              ),
              items:
                  _dietaries
                      .map(
                        (diet) => DropdownMenuItem<int>(
                          value: diet['id'],
                          child: Text(diet['name']),
                        ),
                      )
                      .toList(),
              onChanged: (value) => setState(() => _selectedDietaryId = value),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: assign, child: const Text('Assign')),
          ],
        ),
      ),
    );
  }
}
