import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class BerandaPage extends StatefulWidget {
  final Function(String, String, String, String, String) onSubmit;
  const BerandaPage({super.key, required this.onSubmit});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final nameController = TextEditingController();
  final locController = TextEditingController();
  final jobController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();

  final pink1 = const Color(0xfffce4ec);
  final pink2 = const Color(0xfff8bbd0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: pink2,
        centerTitle: true,
        title: const Text(
          "isi profil kamu 💖",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: Column(
            children: [
              const Icon(Icons.favorite, size: 45, color: Colors.pink),
              const SizedBox(height: 10),
              const Text(
                "form profil ✨",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(height: 25),

              _buildInput(nameController, "nama lengkap", Icons.person),
              _buildInput(locController, "lokasi", Icons.location_on),
              _buildInput(jobController, "profesi", Icons.work),
              _buildInput(emailController, "email", Icons.email),
              _buildInput(hpController, "no hp", Icons.phone),

              const SizedBox(height: 25),

              // tombol gemes
              GestureDetector(
                onTap: _confirmSave,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffff80ab), Color(0xffec407a)],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "simpan sekarang 💌",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(TextEditingController ctrl, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: ctrl,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfffce4ec),
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.pink),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.pink, width: 1),
          ),
        ),
      ),
    );
  }

  void _confirmSave() {
    SimpleAlertDialog.show(
      context,
      buttonsColor: Colors.pink,
      title: AlertTitleText("yakin mau simpan?"),
      content: AlertContentText("data kamu bakal masuk ke profile loh"),
      onConfirmButtonPressed: (ctx) {
        Navigator.pop(ctx);

        widget.onSubmit(
          nameController.text,
          locController.text,
          jobController.text,
          emailController.text,
          hpController.text,
        );

        CherryToast.success(
          title: const Text("profil berhasil di update 💖"),
        ).show(context);
      },
    );
  }
}