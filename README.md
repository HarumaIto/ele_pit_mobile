---

# エレパーツ (EleParts)

## 概要

「エレパーツ」は、電子工作愛好家のための、部品を「見える化」し効率的に管理するためのモバイルアプリです。手持ちの電子部品がどこにあるか分からず探すのに時間を費やしたり、重複して購入してしまったりする課題を解決します。直感的な UI と将来的な AI サジェスト機能で、部品管理のストレスを軽減し、あなたの電子工作ライフをより楽しく、スピーディーにします。

## 特徴 (MVP)

- **直感的な部品登録**: スマートフォンで部品の写真を撮影・選択し、部品名、数量、保管場所を簡単に登録できます。
- **視覚的な部品一覧**: 登録した部品は写真付きのグリッド形式で表示され、「パッと見て」どこに何があるか、どれくらいあるかが一目で分かります。
- **リアルタイム更新**: 新しく登録された部品や変更がすぐに一覧に反映されます。
- **シンプルで使いやすい UI**: ライトユーザー層をターゲットに、複雑な機能や専門用語を排除し、誰でも直感的に操作できるデザインを目指しています。

---

## 技術スタック

「エレパーツ」は、以下のモダンな技術スタックで構築されています。

- **フロントエンド (モバイルアプリ)**: **Flutter (Dart)**
  - 単一コードベースで iOS/Android 両方に対応
  - 高い UI 表現力とパフォーマンス
- **バックエンド**: **Python (FastAPI)**
  - AI/機械学習との高い親和性 (将来的な AI サジェスト機能のため)
  - 高速な API 開発
- **データベース**: **Firebase Firestore (NoSQL)**
  - 柔軟なデータモデルとリアルタイム同期
- **ストレージ**: **Firebase Storage**
  - 部品写真などの画像ファイルを安全かつスケーラブルに保存
- **認証**: **Firebase Authentication (Google 認証)**
  - 手軽に信頼性の高い認証サービスを利用

---

## 開発環境のセットアップ

### 1\. Flutter 環境の準備

1.  **Flutter SDK のインストール**:
    公式ドキュメント ([https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)) に従って、Flutter SDK をダウンロードし、環境パスを設定してください。
2.  **`flutter doctor` の実行**:
    ターミナルで `flutter doctor` を実行し、不足しているツールがあれば指示に従ってインストールしてください（Android Studio, Xcode, VS Code など）。
3.  **VS Code 拡張機能のインストール**:
    Visual Studio Code を使用する場合、「**Flutter**」と「**Dart**」の拡張機能をインストールしてください。

### 2\. Python 環境の準備

1.  **Python のインストール**:
    Python 3.x を公式ウェブサイト ([https://www.python.org/downloads/](https://www.python.org/downloads/)) からダウンロードし、インストール時に「Add Python to PATH」にチェックを入れてください。
2.  **仮想環境の作成と有効化**:
    プロジェクトのバックエンドディレクトリで以下を実行します。
    ```bash
    python -m venv venv
    # Windows
    .\venv\Scripts\activate
    # macOS/Linux
    source venv/bin/activate
    ```
3.  **FastAPI および Uvicorn のインストール**:
    仮想環境を有効化した状態で以下を実行します。
    ```bash
    pip install fastapi uvicorn[standard]
    ```
4.  **VS Code 拡張機能のインストール**:
    Visual Studio Code を使用する場合、「**Python**」の拡張機能をインストールしてください。

### 3\. Firebase / Google Cloud プロジェクトの設定

1.  **Firebase プロジェクトの作成**:
    - Firebase コンソール ([https://console.firebase.google.com/](https://console.firebase.google.com/)) にアクセスし、新しいプロジェクトを作成してください（例: `ele-parts-XXXXX`）。
2.  **Firebase CLI のインストール**:
    Node.js (npm) がインストールされていることを確認し、以下を実行します。
    ```bash
    npm install -g firebase-tools
    firebase login
    ```
3.  **Flutter アプリと Firebase の連携**:
    Flutter プロジェクトのルートディレクトリで以下を実行し、指示に従って作成した Firebase プロジェクトを選択します。
    ```bash
    dart pub global activate flutterfire_cli
    flutterfire configure
    ```
4.  **Firestore Database の設定**:
    Firebase コンソールで「Build」→「Firestore Database」を選択し、データベースを「本番環境モードで開始」または「テストモードで開始」で作成します。開発中はセキュリティルールを緩めに設定してください（上記要件定義を参照）。
5.  **Google Cloud 課金設定 (任意)**:
    将来的に Firebase の無料枠を超える利用や、Cloud Functions、Vertex AI などの高度なサービスを使用する場合は、Google Cloud コンソール ([https://console.cloud.google.com/](https://console.cloud.google.com/)) で課金設定を確認し、必要に応じて予算アラートを設定してください。

---

## プロジェクトの実行

### モバイルアプリ (Flutter)

1.  Flutter プロジェクトのルートディレクトリに移動します。
2.  必要なパッケージをインストールします。
    ```bash
    flutter pub get
    ```
3.  アプリを実行します。
    ```bash
    flutter run
    ```
    （iOS シミュレーター、Android エミュレーター、または実機で動作します。）

### バックエンド (Python/FastAPI)

1.  バックエンドのプロジェクトディレクトリに移動します。
2.  仮想環境を有効化します。
    ```bash
    # Windows
    .\venv\Scripts\activate
    # macOS/Linux
    source venv/bin/activate
    ```
3.  FastAPI サーバーを起動します。
    ```bash
    uvicorn main:app --reload
    ```
    （ブラウザで `http://127.0.0.1:8000` にアクセスすると、FastAPI のデフォルトメッセージが表示されます。`http://127.0.0.1:8000/docs` で API ドキュメントを確認できます。）

---

## 貢献

バグ報告、機能リクエスト、コードの改善など、あらゆる貢献を歓迎します！
Issue を作成するか、プルリクエストを送信してください。

---

## ライセンス

[ライセンス情報（例: MIT License など）をここに記述してください]

---
