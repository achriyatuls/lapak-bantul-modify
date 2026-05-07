import 'package:flutter/material.dart';

class PajakUsahaPage extends StatelessWidget {
  const PajakUsahaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pajak Usaha'),
        backgroundColor: const Color(0xFF003566),
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.store, color: Colors.green[700], size: 32),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pajak Usaha & Retribusi',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Pengelolaan pajak dan retribusi daerah untuk pelaku usaha di Kabupaten Bantul.',
                          style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Jenis Pajak Usaha',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003566),
              ),
            ),
            const SizedBox(height: 12),
            ...[
              (Icons.restaurant, 'Pajak Hotel & Restoran', 'Kelola pajak perhotelan dan rumah makan'),
              (Icons.theater_comedy, 'Pajak Hiburan', 'Pajak pertunjukan dan hiburan'),
              (Icons.campaign, 'Pajak Reklame', 'Pajak pemasangan reklame & papan iklan'),
              (Icons.lightbulb, 'Pajak Penerangan Jalan', 'Pajak penggunaan tenaga listrik'),
              (Icons.water, 'Pajak Air Tanah', 'Pajak pengambilan air bawah tanah'),
              (Icons.assignment, 'Pendaftaran Wajib Pajak', 'Daftarkan usaha Anda sebagai wajib pajak'),
            ].map(
              (item) => _buildMenuCard(
                icon: item.$1,
                title: item.$2,
                subtitle: item.$3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF003566).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF003566), size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
