import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String? title, image;
  const News({super.key, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),  
          ),
        ),
        SizedBox(
          
          width: 155,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child:
                FancyShimmerImage(boxFit: BoxFit.cover, imageUrl: image ?? ''),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
