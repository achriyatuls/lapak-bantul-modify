import 'package:flutter/material.dart';

class LayananKelilingPage extends StatelessWidget {
  const LayananKelilingPage({super.key});

  static const _jadwal = [
    _JadwalData(
      hari: 'Senin',
      lokasi: 'Kecamatan Bantul',
      alamat: 'Jl. Jendral Sudirman No. 1, Bantul',
      jam: '08.00 - 12.00',
    ),
    _JadwalData(
      hari: 'Selasa',
      lokasi: 'Kecamatan Sewon',
      alamat: 'Balai Desa Bangunharjo, Sewon',
      jam: '08.00 - 12.00',
    ),
    _JadwalData(
      hari: 'Rabu',
      lokasi: 'Kecamatan Kasihan',
      alamat: 'Kantor Kecamatan Kasihan, Tirtonirmolo',
      jam: '08.00 - 12.00',
    ),
    _JadwalData(
      hari: 'Kamis',
      lokasi: 'Kecamatan Banguntapan',
      alamat: 'Kantor Kecamatan Banguntapan',
      jam: '08.00 - 12.00',
    ),
    _JadwalData(
      hari: 'Jumat',
      lokasi: 'Kecamatan Pleret',
      alamat: 'Balai Desa Wonokromo, Pleret',
      jam: '08.00 - 11.00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan Keliling'),
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
                gradient: const LinearGradient(
                  colors: [Color(0xFF003566), Color(0xFF0077CC)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.directions_bus, color: Colors.white, size: 28),
                      SizedBox(width: 10),
                      Text(
                        'Layanan Pajak Keliling',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Kami hadir langsung di kecamatan Anda setiap minggu. Bayar pajak tanpa harus ke kantor pusat.',
                    style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Jadwal Layanan Minggu Ini',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003566),
              ),
            ),
            const SizedBox(height: 12),
            ..._jadwal.map((j) => _JadwalCard(data: j)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.amber, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Jadwal dapat berubah sewaktu-waktu. Hubungi kami untuk informasi terkini.',
                      style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone, color: Color(0xFF003566)),
                label: const Text(
                  'Hubungi Kami',
                  style: TextStyle(
                    color: Color(0xFF003566),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF003566)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JadwalData {
  final String hari;
  final String lokasi;
  final String alamat;
  final String jam;

  const _JadwalData({
    required this.hari,
    required this.lokasi,
    required this.alamat,
    required this.jam,
  });
}

class _JadwalCard extends StatelessWidget {
  final _JadwalData data;

  const _JadwalCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF003566),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  data.hari.substring(0, 3),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.lokasi,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.alamat,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                Text(
                  data.jam,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
