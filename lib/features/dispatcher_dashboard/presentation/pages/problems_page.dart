import 'package:flutter/material.dart';
import '../../../../core/design/spacing.dart';

class ProblemsPage extends StatelessWidget {
  const ProblemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final problems = [
      {
        'id': 'P001',
        'loadNumber': 'TRK-2024-001',
        'driver': 'Mehmet Demir',
        'type': 'Gecikme',
        'description': 'Bursa OSB teslimatında 45dk gecikme',
        'priority': 'high',
        'time': '2 saat önce',
      },
      {
        'id': 'P002',
        'loadNumber': 'TRK-2024-004',
        'driver': 'Can Öztürk',
        'type': 'Araç Arızası',
        'description': 'Lastik patlaması - Ankara yolu',
        'priority': 'critical',
        'time': '5 saat önce',
      },
      {
        'id': 'P003',
        'loadNumber': 'TRK-2024-005',
        'driver': 'Emre Yıldız',
        'type': 'Eksik Evrak',
        'description': 'CMR belgesi eksik - Müşteri bekliyor',
        'priority': 'medium',
        'time': '1 gün önce',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Problemler',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.md),
        itemCount: problems.length,
        separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          final problem = problems[index];
          return _buildProblemCard(context, problem);
        },
      ),
    );
  }

  Widget _buildProblemCard(BuildContext context, Map<String, dynamic> problem) {
    final priorityColor = problem['priority'] == 'critical'
        ? const Color(0xFFDC2626)
        : problem['priority'] == 'high'
            ? const Color(0xFFEA580C)
            : const Color(0xFFFBBF24);

    final priorityText = problem['priority'] == 'critical'
        ? 'KRİTİK'
        : problem['priority'] == 'high'
            ? 'YÜKSEK'
            : 'ORTA';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: priorityColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: priorityColor.withAlpha(30),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: priorityColor, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      problem['type'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: priorityColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: priorityColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    priorityText,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.numbers, size: 16, color: Color(0xFF6B7280)),
                    const SizedBox(width: 6),
                    Text(
                      problem['loadNumber'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.person_outline, size: 16, color: Color(0xFF6B7280)),
                    const SizedBox(width: 6),
                    Text(
                      problem['driver'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  problem['description'],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF374151),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      problem['time'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Problem ${problem['id']} çözülüyor...'),
                            backgroundColor: const Color(0xFF10B981),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text(
                        'Çöz',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

