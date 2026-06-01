// lib/presentation/animals/widgets/photo_gallery.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../domain/animals/entities/animal_listing.dart';
import 'dart:io';

class PhotoGallery extends StatefulWidget {
  final List<String> photoUrls;
  final List<String> photoLocalPaths;
  final AnimalSpecies species;

  const PhotoGallery({
    super.key,
    required this.photoUrls,
    required this.photoLocalPaths,
    required this.species,
  });

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> allPhotos = [...widget.photoUrls, ...widget.photoLocalPaths];

    if (allPhotos.isEmpty) {
      return Container(
        color: Colors.grey.shade200,
        child: Center(
          child: Text(
            widget.species.icon,
            style: const TextStyle(fontSize: 80),
          ),
        ),
      );
    }

    return Stack(
      children: [
        PageView.builder(
          itemCount: allPhotos.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final photoPath = allPhotos[index];
            if (photoPath.startsWith('http')) {
              return CachedNetworkImage(
                imageUrl: photoPath,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            } else {
              return Image.file(
                File(photoPath),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              );
            }
          },
        ),
        if (allPhotos.length > 1)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                allPhotos.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
