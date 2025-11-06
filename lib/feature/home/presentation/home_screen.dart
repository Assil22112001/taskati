import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/feature/home/data/repo/home_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(HomeRepo.getUserData()?.name??""),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: Image.file(
                      File(HomeRepo.getUserData()?.image??""),
                    ).image,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
