// ignore_for_file: prefer_const_constructors

import 'package:chat_app/repo/image_reprosratory.dart';
import 'package:flutter/material.dart';

import '../modal/image_model.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final Function(String) onImageSelecter;
  NetworkImagePickerBody({super.key, required this.onImageSelecter});
  final Imagereposratory _imagerepo = Imagereposratory();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: FutureBuilder<List<pixelforimage>>(
          future: _imagerepo.getNetworkImages(),
          builder: (BuildContext context,
              AsyncSnapshot<List<pixelforimage>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onImageSelecter(snapshot.data![index].urlSmallSize);
                    },
                    child: Image.network(snapshot.data![index].urlSmallSize),
                  );
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width * 0.5),
              );
              // return Image.network(snapshot.data![0].urlSmallSize);
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text('This is an error: ${snapshot.error}'),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
