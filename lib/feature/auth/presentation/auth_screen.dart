import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/widgets/custom_bottom.dart';
import 'package:taskati/feature/auth/data/models/user_model.dart';
import 'package:taskati/feature/auth/presentation/cubit/cubit/auth_cubit_cubit.dart';
import 'package:taskati/gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    print("🟡 Checking permissions...");
    await [Permission.camera, Permission.photos, Permission.storage].request();

    print("🟢 Permissions status:");
    print("Camera: ${await Permission.camera.status}");
    print("Photos: ${await Permission.photos.status}");
    print("Storage: ${await Permission.storage.status}");
  }

  Future<void> openCamera() async {
    print("📸 Trying to open camera...");
    try {
      final status = await Permission.camera.request();
      print("🔹 Camera permission status: $status");

      if (status.isGranted) {
        print("✅ Permission granted, launching camera...");
        final pickedPhoto = await picker.pickImage(source: ImageSource.camera);
        print("📷 Picker returned: $pickedPhoto");

        if (pickedPhoto != null) {
          setState(() => photo = pickedPhoto);
          print("✅ Photo captured: ${photo!.path}");
        } else {
          print("⚠️ No photo captured (picker returned null)");
        }
      } else {
        print("❌ Camera permission denied");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('صلاحية الكاميرا مرفوضة')));
      }
    } catch (e) {
      print("❌ Camera error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('حدث خطأ أثناء فتح الكاميرا: $e')));
    }
  }

  Future<void> openGallery() async {
    print("🖼️ Trying to open gallery...");
    try {
      final status = await Permission.photos.request();
      print("🔹 Gallery permission status: $status");

      if (status.isGranted) {
        print("✅ Permission granted, opening gallery...");
        final pickedPhoto = await picker.pickImage(source: ImageSource.gallery);
        print("🖼️ Picker returned: $pickedPhoto");

        if (pickedPhoto != null) {
          setState(() => photo = pickedPhoto);
          print("✅ Photo selected: ${photo!.path}");
        } else {
          print("⚠️ No image selected (picker returned null)");
        }
      } else {
        print("❌ Gallery permission denied");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('صلاحية الوصول للصور مرفوضة')),
        );
      }
    } catch (e) {
      print("❌ Gallery error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('حدث خطأ أثناء فتح المعرض: $e')));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: photo != null
                    ? FileImage(File(photo!.path))
                    : null,
                child: photo == null
                    ? Image.asset(
                        Assets.images.noProfilePicture.path,
                        height: 160,
                        width: 160,
                      )
                    : null,
              ),
              const SizedBox(height: 20),
              CustomBottom(onTap: openCamera, title: "📷 Upload from Camera"),
              const SizedBox(height: 20),
              CustomBottom(
                onTap: openGallery,
                title: "🖼️ Upload from Gallery",
              ),

              const Divider(height: 80),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              BlocListener<AuthCubitCubit, AuthCubitState>(
                listener: (context, state) {
                  if (state is SaveUserSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.homeScreen,
                      (e) => false,
                    );
                  }
                },
                child: const SizedBox.shrink(),
              ),
              CustomBottom(
                onTap: () {
                  context.read<AuthCubitCubit>().saveUserData(
                    UserModel(
                      image: photo?.path ?? "",
                      name: nameController.text,
                    ),
                  );
                },
                title: "💾 Save",
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
