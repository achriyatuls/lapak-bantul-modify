import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft, // Aligns text to the left
          child: Text('Beranda'),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/Ellipse6.png'),
            onPressed: () {
              // Handle button press
            },
          ),
        ],

        centerTitle: false,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 24.0,
                  ),
                  width: double.infinity,
                  height: 217.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF003566),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "LaPak Bantul",
                              style: TextStyle(
                                fontSize: 28,
                                color: Color(0xFFE9E7E5),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Pusat Layanan Pajak Terpadu",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFE9E7E5),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.yellow[500],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: Image.asset(
                          "assets/images/Group10.png",
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          Expanded(
            child: GridView.count(
              primary: false,
              shrinkWrap: false,
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                // Panggil fungsi atau buat widget menu
                _buildMenuItem("Pajak Bumi", Colors.orange[100]!),
                const Icon(Icons.developer_board, size: 24.0),
                _buildMenuItem("Pajak Kendaraan", Colors.blue[100]!),
                _buildMenuItem("Pajak Usaha", Colors.green[100]!),
                _buildMenuItem("Lainnya", Colors.purple[100]!),
                _buildMenuItem("informasi", Colors.purple[100]!),
                _buildMenuItem("four box", Colors.purple[100]!),
              ],
              // children: <Widget>[
              //   Container(
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: Colors.teal[100],
              //       borderRadius: BorderRadius.circular(30),
              //     ),

              //     child: const Text("PBB"),
              //   ),
              //   Container(
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: Colors.teal[200],
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     // color: Colors.teal[200],
              //     child: const Text('BPHTB'),
              //   ),
              //   Container(
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: Colors.teal[300],
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     // color: Colors.teal[300],
              //     child: const Text('Rekap'),
              //   ),
              //   Container(
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: Colors.teal[400],
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     //color: Colors.teal[400],
              //     child: const Text('Layanan Keliling'),
              //   ),
              //   Container(
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: Colors.teal[500],
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     //color: Colors.teal[500],
              //     child: const Text('icon'),
              //   ),
              //   Container(
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: Colors.teal[600],
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     //color: Colors.teal[600],
              //     child: const Text('BOX'),
              //   ),
              // ],
            ),
          ),
          // ),
        ],
      ),
      // ),
      // ),
    );
  }

  //merapikan gridview karena berulang
  // Fungsi pembantu agar kode lebih bersih
  Widget _buildMenuItem(String title, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
