import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String nama, lokasi, profesi, email, hp;
  const ProfilePage({
    super.key,
    required this.nama,
    required this.lokasi,
    required this.profesi,
    required this.email,
    required this.hp,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isShowDetail = false;

  final pink1 = const Color(0xfff8bbd0);
  final pink2 = const Color(0xffffe4ec);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 70),

            Text(widget.nama,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink)),
            const SizedBox(height: 5),

            Text(widget.lokasi,
                style: const TextStyle(
                    fontSize: 15, color: Colors.black54)),

            Text(widget.profesi,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.pinkAccent,
                    fontStyle: FontStyle.italic)),

            const SizedBox(height: 25),

            _buildStatCard(),
            const SizedBox(height: 25),

            // tombol
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                ),
                onPressed: () =>
                    setState(() => isShowDetail = !isShowDetail),
                icon: Icon(isShowDetail
                    ? Icons.favorite
                    : Icons.favorite_border),
                label: Text(
                  isShowDetail
                      ? "tutup detail yaa"
                      : "lihat detailnya yuk 💖",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),

            if (isShowDetail) _buildDetailList(),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [pink1, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        Positioned(
          bottom: -60,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5))
              ],
            ),
            child: const CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1570483358100-6d222cdea6ff?w=500'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.pink.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _stat("Project", "16"),
          Container(height: 30, width: 1, color: Colors.grey[300]),
          _stat("Followers", "2308"),
        ],
      ),
    );
  }

  Widget _stat(String label, String val) => Column(
        children: [
          Text(val,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink)),
          const SizedBox(height: 5),
          Text(label,
              style: const TextStyle(
                  fontSize: 13, color: Colors.black54)),
        ],
      );

  Widget _buildDetailList() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.pink.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("informasi pribadi 💌",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.pink)),

          const SizedBox(height: 10),
          const Divider(),

          _tile(Icons.person, "Nama", widget.nama),
          _tile(Icons.location_on, "Lokasi", widget.lokasi),
          _tile(Icons.work, "Profesi", widget.profesi),
          _tile(Icons.email, "Email", widget.email),
          _tile(Icons.phone, "WhatsApp", widget.hp),
        ],
      ),
    );
  }

  Widget _tile(IconData i, String title, String value) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.pink.withOpacity(0.2),
          child: Icon(i, color: Colors.pink),
        ),
        title: Text(title,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        subtitle: Text(value,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      );
}