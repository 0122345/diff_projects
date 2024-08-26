import 'dart:async';
import 'dart:math';

// ignore: camel_case_types
class RandomImage {
  final int id;
  final String name;
  final String image;

  RandomImage({
    required this.id,
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory RandomImage.fromMap(Map<String, dynamic> map) {
    return RandomImage(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }
}

List<RandomImage> getRandomImageList() {
  List<RandomImage> images = [
    RandomImage(
      id: 1,
      name: 'sukuna',
      image: 'assets/images/Ant-Man.jpeg',
    ),
    RandomImage(
      id: 2,
      name: 'indian god',
      image: 'assets/images/Ashwatthama.jpeg',
    ),
    RandomImage(
      id: 3,
      name: 'basket ball',
      image: 'assets/images/ball.jpeg',
    ),
    RandomImage(
      id: 4,
      name: 'battle',
      image: 'assets/images/battle.jpeg',
    ),
    RandomImage(
      id: 5,
      name: 'bat',
      image: 'assets/images/Dabi _ My Hero Academia.jpeg',
    ),
    RandomImage(
      id: 6,
      name: 'dark',
      image: 'assets/images/dark.jpeg',
    ),
    RandomImage(
      id: 7,
      name: 'demon',
      image: 'assets/images/demon.jpeg',
    ),
    RandomImage(
      id: 8,
      name: 'domain',
      image: 'assets/images/domain.jpeg',
    ),
    RandomImage(
      id: 9,
      name: 'Gojo',
      image: 'assets/images/Gojo satoru art 4k wallpaper.jpeg',
    ),
    RandomImage(
      id: 10,
      name: 'Satoru',
      image: 'assets/images/GOJO SATORU.jpeg',
    ),
    RandomImage(
      id: 11,
      name: 'Izuki',
      image: 'assets/images/Izuki.jpeg',
    ),
    RandomImage(
      id: 12,
      name: 'Satoro',
      image: 'assets/images/satoro gojo.jpeg',
    ),
    RandomImage(
      id: 13,
      name: 'Satoru',
      image: 'assets/images/Satoru Gojo  jujutsu kaisen.jpeg',
    ),
    RandomImage(
      id: 14,
      name: 'Satoru(1)',
      image: 'assets/images/Satoru Gojo.jpeg',
    ),
    RandomImage(
      id: 15,
      name: 'Mc',
      image: 'assets/images/mc.jpeg',
    ),
    RandomImage(
      id: 16,
      name: 'Naruto',
      image: 'assets/images/naruto.jpeg',
    ),
    RandomImage(
      id: 17,
      name: 'yoo',
      image: 'assets/images/yoo.jpeg',
    ),
    RandomImage(
      id: 18,
      name: 'slayer',
      image: 'assets/images/slayer.jpeg',
    ),
    RandomImage(
      id: 19,
      name: 'Steph',
      image: 'assets/images/Steph Curry A3 poster size.jpeg',
    ),
    RandomImage(
      id: 20,
      name: 'Sukuna',
      image: 'assets/images/Sukuna.jpeg',
    ),
    RandomImage(
      id: 21,
      name: 'villia',
      image: 'assets/images/villia.jpeg',
    ),
    RandomImage(
      id: 22,
      name: 'wallpaper',
      image: 'assets/images/wallpaper.jpeg',
    ),
    RandomImage(
      id: 23,
      name: 'wolfboy',
      image: 'assets/images/wolfboy.jpeg',
    ),
    RandomImage(
      id: 24,
      name: 'yoshikune',
      image: 'assets/images/yoshikune.jpeg',
    ),
    RandomImage(
      id: 25,
      name: 'Yuta',
      image: 'assets/images/Yuta.jpeg',
    ),
    RandomImage(
      id: 26,
      name: 'zenitsu',
      image: 'assets/images/zenitsu.jpeg',
    ),
  ];
  return images;
}

class RandomImageDisplay {
  late Timer _timer;
  late RandomImage _currentImage;
  final List<RandomImage> _imageList = getRandomImageList();

  RandomImage get currentImage => _currentImage;

  void startRandomImageDisplay(Function(RandomImage) onImageChange) {
    _currentImage = _getRandomImage();
    onImageChange(_currentImage);

    _timer = Timer.periodic( const Duration(seconds: 5), (timer) {
      _currentImage = _getRandomImage();
      onImageChange(_currentImage);
    });
  }

  void stopRandomImageDisplay() {
    _timer.cancel();
  }

  RandomImage _getRandomImage() {
    final random = Random();
    return _imageList[random.nextInt(_imageList.length)];
  }
}
