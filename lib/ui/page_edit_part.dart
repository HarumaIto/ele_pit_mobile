import 'package:ele_pit/provider/provider_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPartPage extends ConsumerWidget {
  const EditPartPage({super.key, required this.part});

  final Map<String, dynamic>? part;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('部品編集'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            router.pop();
          },
        ),
      ),
      body: Center(
        child: Text('部品編集フォーム: ${part?['name']}'),
      ),
    );
  }
}
