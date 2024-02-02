import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/core/services/server.dart';
import 'package:mobile_exam/screens/home/bloc.dart';

class ViewState extends base.ViewState {
  Map<String, dynamic> data;

  ViewState({required this.data});

  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Center(
              child: Text(
            data['count'].toString(),
            style: const TextStyle(fontSize: 40),
          )),
          const SizedBox(height: 20),
          Image.network(data['image']),
          const SizedBox(height: 20),
          Text(data['message']),
          IconButton(
              onPressed: () {
                context.server.addToCount(1);
              },
              icon: const Icon(
                Icons.add,
                size: 40,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}
