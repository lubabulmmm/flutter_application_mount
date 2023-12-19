class gunung {
  String name, rating, lokasi, deskripsi, image;
  bool isFavorite;

  gunung({
    required this.name,
    required this.rating,
    required this.lokasi,
    required this.deskripsi,
    required this.image,
    this.isFavorite = false,
  });
}

List<gunung> dataResep = [
  gunung(
      name: 'Gunung Bromo',
      lokasi: 'Jawa Timur',
      rating: '10',
      deskripsi: 'apa aja pokoknya',
      image: 'assets/Gbromo.jpg'),
  gunung(
      name: 'Gunung Kerinci',
      lokasi: 'Jawa Timur',
      rating: '14',
      deskripsi: 'apa aja pokoknya',
      image: 'assets/Gkerinci.jpg'),
  gunung(
      name: 'Gunung Rinjani',
      lokasi: 'Jawa Timur',
      rating: '20',
      deskripsi: 'apa aja pokoknya',
      image: 'assets/Grinjani.jpg'),
  gunung(
      name: 'Gunung Slamet',
      lokasi: 'Jawa Timur',
      rating: '9',
      deskripsi: 'apa aja pokoknya',
      image: 'assets/Gslamet.jpg')
];
