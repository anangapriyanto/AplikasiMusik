import 'package:flutter/material.dart';

class Song {
  final String name;
  final String singer;
  final String image;
  final String album;
  final String img_album;
  final String file;
  final String lyric;
  final int duration;
  final Color color;
  Song(
      {required this.name,
      required this.singer,
      required this.image,
      required this.album,
      required this.img_album,
      required this.file,
      required this.lyric,
      required this.duration,
      required this.color});
}

List<Song> mostPopular = [
  Song(
      name: "Lip merongnge aludam bandeyo",
      image: "assets/song1.jpg",
      singer: "unkown",
      album: "Dapu Mute",
      img_album: "assets/song1.jpg",
      file: "assets/Lagu1.mp3",
      lyric: "Lip merongnge aludam bandeyo murame kete tulumpe peipre. \n Makna : Pantun lagu tersebut artinya mencium bau-bua sedap dari  keladi muram.  Keladi muram termasuk salah satu keladi yang sangat enak dan sakral sehingga dulu sering digunakan dalam upacara-upacara sakral untuk mendewasakan, menguatkan, memampukan dan memberdayakan orang.",
      duration: 300,
      color: Colors.grey),
  Song(
      name: "Ooo mere kalap",
      image: "assets/song2.jpg",
      singer: "unkown",
      album: "Dapu Mute",
      img_album: "assets/song1.jpg",
      file: "assets/Lagu2.mp3",
      lyric: "Ooo mere kalap talepe gete enge lelimdo gete muru lelimdo. \n Makna : Pantun lagu tersebut tentang buah-buah yang pohon sakral jenis Hanjuang (Cordyline) yang selalu dijadikan sebagai pagar hidup rumah adat. Dalam lagu tersebut mengatakan buah-buah pohon sudah  matang dan sebagian masih muda, artinya adalah orang-orang yang ada di dalam Mem Ati sebagian sudah matang dan sebagian belum sehingga dibutuhkan upaya pemanusiaan melalui proses-proses pendidikan. Untuk masa lalu upaya pemanusiaan melalui pendidikan inisiasi adat, namun untuk saat ini bisa dilakukan melalui pendidikan formal dan nonformal melalui kegiatan-kegiatan kerohaniaan dalam gereja.",
      duration: 252,
      color: Colors.red),
  Song(
      name: "Ngo ooo yale meba",
      image: "assets/song3.jpg",
      singer: "unkown",
      album: "Dapu Mute",
      img_album: "assets/song1.jpg",
      file: "assets/Lagu3.mp3",
      lyric: "Ngo ooo yale meba muna-muna mokone kirip-kirip pepkone yak-yak pep kone.\n Makna : Pantun lagu tersebut tentang membendung sungai Bame (Okbab) untuk menangkap berudu. Bame termasuk salah satu sungai yang penting dalam kehidupan masyarakat setempat. Membendung air artinya membangun solidaritas dan kerja sama  untuk meningkatkan kemakmuran dan kesejahteraan masyarakat.  Sungai Bame dipercaya memiliki kekuatan supranatural sehingga orang bisa cepat menguasai  bahasa Ketengban dengan meminum air sungai tersebut yang diberikan oleh tua-tua adat setempat.",
      duration: 233,
      color: Colors.orange),
  Song(
      name: "Ngo oooooo kik mam",
      image: "assets/song4.jpg",
      singer: "unkown",
      album: "Bar Bara",
      img_album: "assets/song2.jpg",
      file: "assets/Lagu4.mp3",
      lyric: "Ngo oooooo kik mam lambune ya rumkone.\n Makna : Pantun lagu tersebut bercerita tentang perjalanan dewa pantun lagu ke wilayah Ngalum sampai di Okik dan Mamlam (Wilayah Kiwirok) putuskan jembatan dan balik ke  wilayah Ketengban. Putuskan jembatan dan balik ke Ketengban artinya Dewa Pantun membatasi wilayah  yang bisa bermain Limne sampai di Okik dan Mamlam.",
      duration: 525,
      color: Colors.blue),
  Song(
      name: "Ngo ooooo o biteli pasikne",
      image: "assets/song5.jpg",
      singer: "unkown",
      album: "Bar Bara",
      img_album: "assets/song2.jpg",
      file: "assets/Lagu5.mp3",
      lyric: "Ngo ooooo o biteli pasikne batom neng sarap-sarapa ,bikin ware kame kin ware topre lilipre berek - berek pepre. \n Makna : Pantun lagu tersebut artinya bulan mulai terbenam di gunung Biteli Pasikne (wilayah Bime) dan  fajar pagi menyingsing pertanda hari sudah mulai siang. Fajar pagi menyingsing artinya hari baru membawa semangat dan harapan baru untuk mewujudkan kehidupan yang aman, damai dan sejahtera.",
      duration: 525,
      color: Colors.blue),
  Song(
      name: "Ngo ooo neme tani me goupre",
      image: "assets/song6.jpg",
      singer: "unkown",
      album: "Bar Bara",
      img_album: "assets/song2.jpg",
      file: "assets/Lagu6.mp3",
      lyric: "Ngo ooo neme tani me goupre ortara kuembangan bangadinkono. \n Makna : Pantun lagu tersebut artinya ketika hari sudah mulai pagi dan bulan dari arah Bime melewati sungai Tanime tiupan angin pagi melambai-lambai rerumputan. Tiupan angin pagi melambai-lambai rerumputan artinya hari yang baru membawa suka cita dan harapan baru bagi masyarakat setempat.",
      duration: 525,
      color: Colors.blue),
  Song(
      name: "Ngo ooo ooo kemdipunnya",
      image: "assets/song7.jpg",
      singer: "unkown",
      album: "Neyumop",
      img_album: "assets/song3.jpg",
      file: "assets/Lagu7.mp3",
      lyric: "Ngo ooo ooo kemdipunnya  ae  dirip warek mare eee. \n Makna : Pantun lagu tersebut artinya ketika hari sudah mulai pagi wilayah arah bagian hilir sungai fajar mulai menyingsing sebagai tanda hari sudah mulai pagi. Fajar menyingsing artinya  membawa suka cita dan harapan baru bagi masyarakat yang berada di wilayah hilir sungai. Sekaligus sebagai lagu kecintaan dan kebanggaan atas kekayaan dan keindahan alam yang diberikan oleh Naibo kepada mereka.",
      duration: 525,
      color: Colors.blue),
  Song(
      name: "Ngo oooo ooo dapu ma",
      image: "assets/song8.jpg",
      singer: "unkown",
      album: "Neyumop",
      img_album: "assets/song3.jpg",
      file: "assets/Lagu8.mp3",
      lyric: "Ngo oooo ooo dapu ma ngari tam- tam dinipre. \n Makna : Pantun lagu tersebut artinya ketika hari sudah pagi gerombolan burung kakatua mulai beterbangan mencari makan. Lagu tersebut menggambarkan manusia yang ada di wilayah tersebut ketika hari sudah pagi mereka bersuka cita bersama, bekerja sama, saling menyayangi dan saling membantu untuk mewujudkan kemakmuran, kesejahteraan dan kedamaian.",
      duration: 525,
      color: Colors.blue),
];

// List<Song> newRelease = [
//   Song(
//       name: "Lip merongnge aludam bandeyo  murame kete tulumpe peipre",
//       image: "assets/song1.jpg",
//       singer: "abc",
//       album: "aaa aa a a aaaa a a a  aaaaaa",
//       img_album: "assets/song1.jpg",
//       file: "assets/Lagu1.mp3",
//       lyric: "asjhd akhd ahsdkjashdkh aksjdh akhd ",
//       duration: 300,
//       color: Colors.grey),
//   Song(
//       name: "Ooo mere kalap talepe gete enge lelimdo gete muru lelimdo",
//       image: "assets/song2.jpg",
//       singer: "cde",
//       album: "aaa aa a a aaaa a a a  aaaaaa",
//       img_album: "assets/song1.jpg",
//       file: "assets/Lagu2.mp3",
//       lyric: "asjhd akhd ahsdkjashdkh aksjdh akhd ",
//       duration: 252,
//       color: Colors.red),
//   Song(
//       name: "Ngo ooo yale meba muna-muna mokone kirip-kirip pepkone yak-yak pep kone",
//       image: "assets/song3.jpg",
//       singer: "efg",
//       album: "aaa aa a a aaaa a a a  aaaaaa",
//       img_album: "assets/song1.jpg",
//       file: "assets/Lagu3.mp3",
//       lyric: "asjhd akhd ahsdkjashdkh aksjdh akhd ",
//       duration: 233,
//       color: Colors.orange),
//   Song(
//       name: "Ngo oooooo kik mam lambune ya rumkone",
//       image: "assets/song4.jpg",
//       singer: "hij",
//       album: "bbb b b  bbb b bbbb b b b bbbbb",
//       img_album: "assets/song2.jpg",
//       file: "assets/Lagu4.mp3",
//       lyric: "asjhd akhd ahsdkjashdkh aksjdh akhd ",
//       duration: 525,
//       color: Colors.blue),
//   Song(
//       name: "Ngo ooooo o biteli pasikne batom neng sarap-sarapa ,bikin ware kame kin ware topre lilipre berek - berek pepre",
//       image: "assets/song5.jpg",
//       singer: "klm",
//       album: "bbb b b  bbb b bbbb b b b bbbbb",
//       img_album: "assets/song2.jpg",
//       file: "assets/Lagu5.mp3",
//       lyric: "asjhd akhd ahsdkjashdkh aksjdh akhd ",
//       duration: 525,
//       color: Colors.blue),
//   Song(
//       name: "Ngo ooo neme tani me goupre ortara kuembangan bangadinkono",
//       image: "assets/song6.jpg",
//       singer: "nop",
//       album: "bbb b b  bbb b bbbb b b b bbbbb",
//       img_album: "assets/song2.jpg",
//       file: "assets/Lagu6.mp3",
//       lyric: "asjhd akhd ahsdkjashdkh aksjdh akhd ",
//       duration: 525,
//       color: Colors.blue),
//   Song(
//       name: "Ngo ooo ooo kemdipunnya  ae  dirip warek mare eee",
//       image: "assets/song7.jpg",
//       singer: "qrs",
//       album: "bbb b b  bbb b bbbb b b b bbbbb",
//       img_album: "assets/song2.jpg",
//       file: "assets/Lagu7.mp3",
//       lyric: "asjhd akhd ahsdkjashdkh aksjdh akhd ",
//       duration: 525,
//       color: Colors.blue),
//   Song(
//       name: "Ngo oooo ooo dapu ma ngari tam- tam dinipre",
//       image: "assets/song8.jpg",
//       singer: "tuv",
//       album: "bbb b b  bbb b bbbb b b b bbbbb",
//       img_album: "assets/song2.jpg",
//       file: "assets/Lagu8.mp3",
//       lyric: "asjhd akhd ahsdkjashdkh aksjdh akhd ",
//       duration: 525,
//       color: Colors.blue),
// ];