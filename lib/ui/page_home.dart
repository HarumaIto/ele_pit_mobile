import 'package:ele_pit/provider/provider_router.dart';
import 'package:ele_pit/provider/view_model/view_model_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('部品一覧'),
      ),
      body: state.when(
        data: (value) {
          return ListView.builder(
            itemCount: value.parts.length,
            itemBuilder: (context, index) {
              final part = value.parts[index];
              return ListTile(
                title: Text(part.name),
                subtitle: Text('数量: ${part.quantity} / 場所: ${part.location}'),
                onTap: () {
                  router.push('/edit_part', extra: part);
                },
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text('Error: $error'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
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
