class resep {
  String name, htm, tutorial, image;

  resep(
      {required this.name,
      required this.htm,
      required this.tutorial,
      required this.image});
}

List<resep> dataResep = [
  resep(
      name: 'Nunung Hidayat',
      htm: 'Jawir',
      tutorial:
          '1. Mixer butter, margarine dan gula halus kira-kira 1 menit lalu masukkan kuning telur, mixer sebentar saja, asal rata, cukupkan 2. Ayak tepung dan baking powder lalu masukkan ke adonan, aduk rata gunakan spatula 3. Terakhir masukkan nestum, aduk rata 4. Siapkan loyang anti lengket atau alasi loyang dgn baking paper, bentuk bulat lalu pipihkan atau bentuk sesuai selera, beri topping kacang almond 5. Panggang dengan suhu 150 DC selama 20 menit.',
      image: 'assets/nestumcookies.jpeg')
];
