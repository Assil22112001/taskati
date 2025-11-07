import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/theme/app_text_style.dart';
import 'package:taskati/core/theme/cubit/cubit/theme_cubit.dart';
import 'package:taskati/core/widgets/custom_bottom.dart';
import 'package:taskati/feature/home/data/repo/home_repo.dart';
import 'package:taskati/feature/home/presentation/widgets/task_item.dart';
import 'package:taskati/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Text(
                    HomeRepo.getUserData()?.name ?? "",
                    style: AppTextStyle.font20Bold,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: Image.file(
                      File(HomeRepo.getUserData()?.image ?? ""),
                    ).image,
                  ),
                  Switch(
                    value:
                        context.read<ThemeCubit>().appTheme == ThemeData.dark(),
                    onChanged: (v) {
                      context.read<ThemeCubit>().changeTheme();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      DateFormat("EEEE,dd MMMM yyyy").format(DateTime.now()),
                      style: AppTextStyle.font20Bold,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: CustomBottom(
                      onTap: () async {
                        await Navigator.pushNamed(
                          context,
                          Routes.addTaskScreen,
                        );
                        setState(() {});
                      },

                      title: "Add Task",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Visibility(
                visible: tasks.isNotEmpty,
                child: Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        TaskItem(task: tasks[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: tasks.length,
                  ),
                ),
                replacement: Lottie.asset(Assets.images.emptyTask),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
