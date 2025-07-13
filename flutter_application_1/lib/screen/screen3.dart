import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<dynamic> users = [];
  int page = 1;
  final int perPage = 6;
  bool isLoading = false;
  bool hasMore = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
    _scrollController.addListener(_onScroll);
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isLoading) return;

    if (isRefresh) {
      page = 1;
      hasMore = true;
    }

    setState(() => isLoading = true);

    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> fetchedUsers = data['data'];

      setState(() {
        if (isRefresh) {
          users = fetchedUsers;
        } else {
          users.addAll(fetchedUsers);
        }

        final totalPages = data['total_pages'] ?? 2;
        if (page >= totalPages) {
          hasMore = false;
        } else {
          page++;
        }
      });
    } else {
      debugPrint('Failed to load users');
    }

    setState(() => isLoading = false);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !isLoading &&
        hasMore) {
      fetchUsers();
    }
  }

  Future<void> _onRefresh() async {
    await fetchUsers(isRefresh: true);
  }

  void _onUserTap(Map<String, dynamic> user) {
    final fullName = '${user['first_name']} ${user['last_name']}';
    Navigator.pop(context, fullName);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildUserItem(Map<String, dynamic> user) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user['avatar']),
      ),
      title: Text(
        '${user['first_name']} ${user['last_name']}',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        user['email'],
        style: GoogleFonts.poppins(),
      ),
      onTap: () => _onUserTap(user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 55, 57, 60),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 29, 31, 31),
              Color.fromARGB(255, 235, 235, 235)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: users.isEmpty && !isLoading
              ? Center(
                  child: Text(
                    'No Data Available',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: users.length + (hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < users.length) {
                      final user = users[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: buildUserItem(user),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  },
                ),
        ),
      ),
    );
  }
}
