import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final File? img;
  const DisplayImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: ClipRRect(
        // For rounded upper right corner and left corner in imageview
        borderRadius: BorderRadius.circular(18),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: img == null
                    ? SizedBox(
                        height: 248,
                        width: 248,
                        child: Image.network(
                          'https://img.freepik.com/free-psd/qatar-world-cup_187299-11254.jpg?w=740&t=st=1659709678~exp=1659710278~hmac=9e8b2eda45877d39587ed87e3073d43dd7bd43f8eaece5dceb0adfca5fa4ae87',
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: double.infinity,
                        ),
                      )
                    : Image.file(img!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}