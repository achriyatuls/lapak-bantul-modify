import 'package:flutter/material.dart';

class PajakKendaraanPage extends StatelessWidget {
  const PajakKendaraanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pajak Kendaraan'),
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
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.directions_car, color: Colors.blue[700], size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pajak Kendaraan Bermotor',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Pajak yang dikenakan atas kepemilikan dan/atau penguasaan kendaraan bermotor.',
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
              'Layanan Kendaraan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003566),
              ),
            ),
            const SizedBox(height: 12),
            ...[
              (Icons.search, 'Cek Pajak Kendaraan', 'Cek tagihan berdasarkan nomor polisi'),
              (Icons.payment, 'Bayar Pajak', 'Bayar pajak kendaraan bermotor online'),
              (Icons.assignment_turned_in, 'Cek Status STNK', 'Periksa status perpanjangan STNK'),
              (Icons.history, 'Riwayat Pembayaran', 'Lihat histori pembayaran kendaraan'),
              (Icons.notifications_active, 'Pengingat Jatuh Tempo', 'Aktifkan notifikasi pajak kendaraan'),
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
