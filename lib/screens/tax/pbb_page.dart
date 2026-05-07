import 'package:flutter/material.dart';

class PbbPage extends StatelessWidget {
  const PbbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pajak Bumi & Bangunan'),
        backgroundColor: const Color(0xFF003566),
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoCard(
              icon: Icons.landscape,
              title: 'Apa itu PBB?',
              description:
                  'Pajak Bumi dan Bangunan (PBB) adalah pajak yang dikenakan atas kepemilikan atau pemanfaatan bumi dan/atau bangunan.',
              color: Colors.orange[50]!,
              iconColor: Colors.orange,
            ),
            const SizedBox(height: 16),
            const Text(
              'Layanan PBB',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003566),
              ),
            ),
            const SizedBox(height: 12),
            _MenuCard(
              icon: Icons.search,
              title: 'Cek Tagihan PBB',
              subtitle: 'Lihat tagihan PBB berdasarkan NOP',
              onTap: () {},
            ),
            _MenuCard(
              icon: Icons.payment,
              title: 'Bayar PBB',
              subtitle: 'Lakukan pembayaran PBB secara online',
              onTap: () {},
            ),
            _MenuCard(
              icon: Icons.history,
              title: 'Riwayat Pembayaran',
              subtitle: 'Lihat histori pembayaran PBB Anda',
              onTap: () {},
            ),
            _MenuCard(
              icon: Icons.download,
              title: 'Unduh SPPT',
              subtitle: 'Unduh Surat Pemberitahuan Pajak Terutang',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final Color iconColor;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, color: Colors.black54, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
        onTap: onTap,
      ),
    );
  }
}
