import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/presentation/providers/stats_provider.dart';
import 'package:provider/provider.dart';

class KissStats extends StatelessWidget {
  const KissStats({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatsProvider>();

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFFEDB3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFC928).withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tu marcador',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: const Color(0xFF493900),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _StatItem(
                icon: Icons.favorite_rounded,
                label: 'Intentos',
                value: stats.opportunities,
                color: const Color(0xFFE5A900),
              ),
              _StatItem(
                icon: Icons.heart_broken_rounded,
                label: 'Fallos',
                value: stats.losses,
                color: const Color(0xFFE57373),
              ),
              _StatItem(
                icon: Icons.emoji_events_rounded,
                label: 'Ganados',
                value: stats.wins,
                color: const Color(0xFF43A047),
              ),
              _StatItem(
                icon: Icons.emoji_emotions_rounded,
                label: 'Besos',
                value: stats.kisses,
                color: const Color(0xFFEC6A83),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 19, color: color),
          ),
          const SizedBox(height: 6),
          Text(
            '$value',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: const Color(0xFF493900),
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: const Color(0xFF86774D),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
