import 'package:ele_pit/provider/provider_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPartPage extends ConsumerWidget {
  const AddPartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('部品追加'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            router.pop();
          },
        ),
      ),
      body: const Center(
        child: Text('部品追加フォーム'),
      ),
    );
  }
}
