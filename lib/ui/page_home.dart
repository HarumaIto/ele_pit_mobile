import 'package:ele_pit/provider/provider_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    // 仮の部品データ
    final parts = [
      {'name': '抵抗 10kΩ', 'quantity': 20, 'location': '引き出しA'},
      {'name': 'LED 赤', 'quantity': 50, 'location': 'ケースB'},
      {'name': 'コンデンサ 100uF', 'quantity': 10, 'location': '棚C'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('部品一覧'),
      ),
      body: ListView.builder(
        itemCount: parts.length,
        itemBuilder: (context, index) {
          final part = parts[index];
          return ListTile(
            title: Text(part['name'] as String),
            subtitle: Text('数量: ${part['quantity']} / 場所: ${part['location']}'),
            onTap: () {
              router.push('/edit_part', extra: part);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          router.push('/add_part');
        },
        tooltip: '部品を追加',
        child: const Icon(Icons.add),
      ),
    );
  }
}
