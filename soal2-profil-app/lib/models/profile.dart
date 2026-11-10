// Data profil, taruh di satu tempat biar gampang diubah.
// Foto ganti file assets/images/profile.jpg dengan foto sendiri.
class Profile {
  final String nama;
  final String nim;
  final String prodi;
  final String kelas;
  final String bio;
  final String email;
  final String hp;
  final String github;
  final String fotoAsset;
  final List<String> skills;
  final List<String> pendidikan;

  const Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
    required this.fotoAsset,
    required this.skills,
    required this.pendidikan,
  });

  // Data awal profil
  factory Profile.defaultProfile() => const Profile(
        nama: 'Rico Adi Pratama',
        nim: '1124160054',
        prodi: 'Teknik Informatika',
        kelas: 'SE 2',
        bio: 'Mahasiswa Teknik Informatika yang suka ngoprek aplikasi '
            'mobile, bot Telegram, dan server.',
        email: 'adipratamarico6@gmail.com',
        hp: '088294832594',
        github: 'snzza',
        fotoAsset: 'assets/images/profile.jpg',
        skills: ['Flutter & Dart', 'Bot Telegram', 'Manajemen VPS & Server'],
        pendidikan: [
          'S1 Teknik Informatika — Institut Teknologi & Bisnis '
              'Bina Sarana Global (2024–sekarang)',
          'SMK Yuppentek 2',
          'SMP Negeri 8 Tangerang',
        ],
      );

  // Bikin salinan dengan beberapa field diganti (dipakai habis edit profil)
  Profile copyWith({
    String? nama,
    String? nim,
    String? prodi,
    String? kelas,
    String? bio,
    String? email,
    String? hp,
    String? github,
    String? fotoAsset,
    List<String>? skills,
    List<String>? pendidikan,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      github: github ?? this.github,
      fotoAsset: fotoAsset ?? this.fotoAsset,
      skills: skills ?? this.skills,
      pendidikan: pendidikan ?? this.pendidikan,
    );
  }
}
