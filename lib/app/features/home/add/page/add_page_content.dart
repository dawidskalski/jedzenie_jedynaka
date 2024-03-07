import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jedzenie_jedynaka/app/domain/repositories/meal_repository.dart';
import 'package:jedzenie_jedynaka/app/domain/widgets/timer_widget/timer_widget.dart';
import 'package:jedzenie_jedynaka/app/features/home/add/cubit/add_cubit.dart';

class AddPageContent extends StatefulWidget {
  const AddPageContent({
    required this.onSave,
    super.key,
  });

  final Function onSave;

  @override
  State<AddPageContent> createState() => _AddPageContentState();
}

class _AddPageContentState extends State<AddPageContent> {
  var rating = 0.0;
  var dishNameController = '';
  var recipController = '';
  var descriptionController = '';
  int hour = 0;
  int minute = 0;

  var getImageURL = '';
  XFile? pickImage;

  Future<void> uploadPhotoMethod(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      await uploadFileToStorage(file);
      setState(() {
        pickImage = file;
      });
    }
  }

  Future<void> uploadFileToStorage(XFile file) async {
    String uniqueUploadFileName =
        DateTime.now().microsecondsSinceEpoch.toString();

    Reference referenceToStoragePanel = FirebaseStorage.instance.ref();
    Reference referenceToCreateFolderInStoragePanel =
        referenceToStoragePanel.child('images');
    Reference referenceToUploadImage =
        referenceToCreateFolderInStoragePanel.child(uniqueUploadFileName);

    await referenceToUploadImage.putFile(
        File(file.path), SettableMetadata(contentType: 'image/jpeg'));

    getImageURL = await referenceToUploadImage.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(MealRepository()),
      child: BlocListener<AddCubit, AddState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                  children: [Icon(Icons.cancel), Text('Something went wrong')],
                ),
              ),
            );
          }
        },
        child: BlocBuilder<AddCubit, AddState>(
          builder: (context, state) {
            return ListView(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            if (pickImage == null)
                              const Image(
                                image: AssetImage('images/avatar.jpg'),
                                height: 250,
                                width: 250,
                              ),
                            if (pickImage != null)
                              Image(
                                image: FileImage(
                                  File(pickImage!.path),
                                ),
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            Positioned(
                              bottom: -25,
                              right: -10,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (builder) => SizedBox(
                                        height: 140,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Column(
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        uploadPhotoMethod(
                                                            ImageSource.camera);
                                                      },
                                                      icon: const Icon(
                                                        Icons.photo_camera,
                                                        size: 50,
                                                        color: Colors.amber,
                                                      )),
                                                  const Text('Aparat')
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Column(
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        uploadPhotoMethod(
                                                            ImageSource
                                                                .gallery);
                                                      },
                                                      icon: const Icon(
                                                        Icons.photo,
                                                        size: 50,
                                                        color: Colors.amber,
                                                      )),
                                                  const Text('Galeria')
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              dishNameController = value;
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              label: const Text('Nazwa')),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              descriptionController = value;
                            });
                          },
                          minLines: 1,
                          maxLines: 2,
                          decoration: InputDecoration(
                            label: const Text('Opis'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              recipController = value;
                            });
                          },
                          minLines: 1,
                          maxLines: 4,
                          decoration: InputDecoration(
                            label: const Text('Przepisz'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (builder) => TimerWidget(
                                  hour: hour,
                                  minute: minute,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.purpleAccent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    hour == 0 || minute == 0
                                        ? 'Czas Przygotowania'
                                        : '$hour :godz.  $minute min.',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.schedule,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Slider(
                                value: rating,
                                min: 0.0,
                                max: 5.0,
                                divisions: 10,
                                onChanged: (currentValue) {
                                  setState(() {
                                    rating = currentValue;
                                  });
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 27,
                                  color: Colors.amber,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: dishNameController.isEmpty
                              ? null
                              : () {
                                  context.read<AddCubit>().addDish(
                                        dishName: dishNameController,
                                        description: descriptionController,
                                        imgURL: getImageURL,
                                        rating: rating,
                                        recip: recipController,
                                        hour: hour,
                                        minute: minute,
                                      );

                                  setState(() {
                                    rating = 0;
                                  });
                                  widget.onSave();
                                },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: const Text(
                            'Dodaj',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
