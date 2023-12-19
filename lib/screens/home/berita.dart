class berita {
  String judul, sumber, deskripsi, image;

  berita(
      {required this.judul,
      required this.sumber,
      required this.deskripsi,
      required this.image});
}

List<berita> dataBerita = [
  berita(
      judul: 'Ini 4 Tingkatan Status Gunung Berapi dan Cara Mitigasinya',
      sumber: 'bubub',
      deskripsi:
          'Gunung berapi memiliki empat tingkatan status keaktifan. Di tiap level memiliki makna berbeda dan mitigasinya pun berbeda jika terjadi erupsi. Setiap negara menerapkan sistem tingkatan status peringatan dalam menganalisa aktivitas vulkanik gunung berapi berbeda-beda. Indonesia sendiri menerapkan tingkatan status gunung api mulai dari terendah level 1 aktif normal, hingga paling bahaya level 4 awas. Berikut ini penjelasan dari masing-masing level tingkatan status gunung berapi di Indonesia, yang dilansir berbagai sumber resmi seperti BVPMBG, Indonesia Baik, dan BPPTKG ESDM.',
      image: 'assets/Berita1.jpeg'),
  berita(
      judul:
          '4 Alasan Kamu Harus Mendaki Gunung Rinjani, Nomor 4 Bikin Takjub!',
      sumber: 'ipan',
      deskripsi:
          'Gunung Rinjani termasuk ke dalam Taman Nasional Gunung Rinjani (TNGR) yang amat dijaga kelestariannya dan dikelola keberlangsungannya oleh pemerintah. Gunung dengan tinggi 3.724 mdpl ini menduduki peringkat nomor 3 pada ranking top 7 gunung tertinggi di Indonesia.  Dengan fakta tersebut dan keindahan alamnya yang begitu eksotis membuat banyak pendaki baik dari dalam negeri hingga luar negeri tertarik untuk menginjakkan kaki di puncak gunung ini.',
      image: 'assets/Berita2.jpeg'),
  berita(
      judul:
          'Gunung Marapi Semburkan Awan Abu Seminggu Setelah Letusan Mematikan',
      sumber: 'itu abid',
      deskripsi:
          'Gunung Marapi menyemburkan awan abu setinggi setengah kilometer ke langit pada hari Rabu (13/12), kata Pusat Vulkanoli dan Mitigasi Bencana Geologi (PVMBG), seminggu setelah letusan gunung itu merenggut nyawa 23 pendaki.Gunung setinggi 2.891 meter yang merupakan salah satu gunung berapi paling aktif di pulau Sumatera, meletus sekitar pukul 6 pagi waktu setempat pada Rabu pagi dan pada siang hari, kata Hendra Gunawan, kepala PVMBG.Letusan itu, katanya, relatif kecil mengingat aktivitasnya belakangan ini. Namun, kewaspadaan terhadap gunung berapi tersebut tetap berada pada tingkat tertinggi kedua.Rekaman gambar yang dilihat Reuters menunjukkan awan besar abu abu-abu mengepul dari kawah Marapi, dan warga sekitar melakukan aktivitas sehari-hari dari jarak yang aman.',
      image: 'assets/Berita3.jpeg')
];
