import 'package:ele_pit/provider/view_model/view_model_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  AuthPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authViewModelProvider);
    final notifier = ref.read(authViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.value?.isLogin == true ? 'ログイン' : '新規登録'),
      ),
      body: state.when(
        data: (data) => Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'メールアドレス'),
                    validator: (v) => v == null || v.isEmpty ? 'メールアドレスを入力してください' : null,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'パスワード'),
                    obscureText: true,
                    validator: (v) => v == null || v.length < 6 ? '6文字以上で入力してください' : null,
                  ),
                  if (!data.isLogin) ...[
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordConfirmController,
                      decoration: const InputDecoration(labelText: 'パスワード（確認用）'),
                      obscureText: true,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return '確認用パスワードを入力してください';
                        }
                        if (v != _passwordController.text) {
                          return 'パスワードが一致しません';
                        }
                        return null;
                      },
                    ),
                  ],
                  if (data.error.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(data.error, style: const TextStyle(color: Colors.red)),
                  ],
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;
                      await notifier.handleButtonPressed(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    },
                    child: Text(data.isLogin ? 'ログイン' : '新規登録'),
                  ),
                  TextButton(
                    onPressed: () {
                      notifier.toggleLogin();
                      _passwordController.clear();
                      _passwordConfirmController.clear();
                    },
                    child: Text(data.isLogin
                        ? 'アカウントをお持ちでない方はこちら'
                        : 'すでにアカウントをお持ちの方はこちら'),
                  ),
                ],
              ),
            ),
          ),
        ),
        error: (error, stack) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}