import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;
  const FullScreen({super.key, required this.imageurl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setWallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    // Handle result if needed (e.g., show a snackbar or alert dialog)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.network(widget.imageurl),
            ),
          ),
          InkWell(
            onTap: () async {
              await setWallpaper();
              // Optionally show a confirmation or a message to the user
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Wallpaper set successfully')),
              );
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text(
                  'Set Wallpaper',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
