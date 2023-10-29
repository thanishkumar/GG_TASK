import 'package:flutter/material.dart';
import 'package:gg_interview_task/Models/data.dart';
import 'package:gg_interview_task/Provider/data_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DataProvider data_provider = context.watch<DataProvider>();
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Title(
            child: Text(
              'DATA',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.deepPurpleAccent),
      ),
      body: ListView.builder(
        itemCount: data_provider.data.length,
        itemBuilder: (context, index) {
          Datum data = data_provider.data[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white54),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ID :${data.id}'),
                  Text('CreatedAt :${data.createdAt.toString()}'),
                  Text('UpdatedAt :${data.createdAt.toString()}'),
                  Text('Deleted ? ${data.isDeleted.toString()}'),
                  Image(
                      image: NetworkImage(data.url),
                      errorBuilder: (context, error, stackTrace) {
                        return LimitedBox(
                            maxWidth: 40,
                            maxHeight: 40,
                            child: CircularProgressIndicator());
                      },
                      height: MediaQuery.of(context).size.height / 3),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
