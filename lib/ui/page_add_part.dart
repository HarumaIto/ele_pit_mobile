import 'package:ele_pit/provider/provider_router.dart';
import 'package:ele_pit/provider/view_model/view_model_add_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPartPage extends ConsumerWidget {
  const AddPartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final state = ref.watch(addPartViewModelProvider);
    AddPartViewModel notifier() => ref.watch(addPartViewModelProvider.notifier);
    final nameController = TextEditingController();
    final quantityController = TextEditingController();
    final locationController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '部品名'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: '数量'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: '保管場所'),
            ),
            const SizedBox(height: 32),
            Center(
              child: Consumer(
                builder: (context, ref, _) {
                  return ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () async {
                            final name = nameController.text;
                            final quantity =
                                int.tryParse(quantityController.text) ?? 0;
                            final location = locationController.text;
                            await notifier().savePart(
                              name: name,
                              quantity: quantity,
                              location: location,
                            );
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('部品 "$name" を追加しました')),
                              );
                              router.pop();
                            }
                          },
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('追加'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
