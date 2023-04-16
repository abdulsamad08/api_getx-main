import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textapi/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.put(ApiController());
    return Scaffold(
      body: Obx(() {
        if (apiController.data.isNotEmpty) {
          List<dynamic> data = apiController.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['name']['title']),
                  // debugPrint('');
                  // subtitle: Text(apiController.data[index]['body']),
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
