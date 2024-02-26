import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sugar_mill_app/constants.dart';

class ViewImageInternet extends StatefulWidget {
  final String url;
  const ViewImageInternet({super.key, required this.url});

  @override
  // ignore: library_private_types_in_public_api
  _ViewImageInternet createState() => _ViewImageInternet();
}

class _ViewImageInternet extends State<ViewImageInternet> {
  late Future<http.Response> _imageResponse;

  @override
  void initState() {
    super.initState();
    _imageResponse = http.get(
      Uri.parse('$apiBaseUrl/${widget.url}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<http.Response>(
        future: _imageResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading image'));
          } else if (!snapshot.hasData || snapshot.data!.statusCode != 200) {
            return const Center(child: Text('Image not available'));
          } else {
            return Center(
              child: Image.memory(
                snapshot.data!.bodyBytes,
                fit: BoxFit.contain,
              ),
            );
          }
        },
      ),
    );
  }
}
