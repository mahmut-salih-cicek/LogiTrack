import 'package:flutter/material.dart';
import '../../../../core/design/spacing.dart';
import '../../domain/entities/dashboard_stats.dart';
import '../../../loads/presentation/pages/loads_list_page.dart';
import '../pages/problems_page.dart';
import '../pages/add_load_page.dart';

class DispatcherBottomSheet extends StatelessWidget {
  final DashboardStats stats;

  const DispatcherBottomSheet({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.12,
      maxChildSize: 0.85,
      snap: true,
      snapSizes: const [0.12, 0.35, 0.85],
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((255 * 0.1).round()),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: CustomScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // Drag handle
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 4),
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Operasyon Özeti',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${stats.activeLoads} aktif iş • ${stats.onlineDrivers} sürücü online',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Add Load Button
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF10B981), Color(0xFF059669)],
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF10B981).withAlpha(40),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => _navigateToAddLoad(context),
                                borderRadius: BorderRadius.circular(12),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.add, color: Colors.white, size: 20),
                                      SizedBox(width: 6),
                                      Text(
                                        'Yeni İş',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // KPI Cards
                    Builder(
                      builder: (ctx) => Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.md,
                          AppSpacing.md,
                          AppSpacing.md,
                          AppSpacing.md,
                        ),
                        child: _buildKPICards(ctx),
                      ),
                    ),
                    
                  ],
                ),
              ),
              
              // Aktif İşler Header + Loads List (no spacing between them)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Aktif İşler Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Aktif İşler',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF111827),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981).withAlpha(30),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${stats.activeLoads} iş',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF059669),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // Loads List
                      const LoadsListPage(),
                    ],
                  ),
                ),
              ),

              // Bottom padding for FAB
              const SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToProblems(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ProblemsPage()),
    );
  }

  void _navigateToAddLoad(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddLoadPage()),
    );
  }

  Widget _buildKPICards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildKPICard(
            'Zamanında',
            '${stats.onTimePercentage}%',
            Icons.schedule,
            const Color(0xFF10B981),
            const Color(0xFFECFDF5),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: GestureDetector(
            onTap: () => _navigateToProblems(context),
            child: _buildKPICard(
              'Problemler',
              '${stats.exceptionsCount}',
              Icons.warning_amber_rounded,
              const Color(0xFFEF4444),
              const Color(0xFFFEE2E2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKPICard(
    String label,
    String value,
    IconData icon,
    Color iconColor,
    Color backgroundColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: iconColor.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: 24),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

