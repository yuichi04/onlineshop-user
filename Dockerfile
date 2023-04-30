# ベースイメージを指定
FROM node:18.16.0-alpine

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係をインストール
COPY package*.json ./
RUN npm ci

# ソースコードをコピー
COPY . .

# アプリケーションをビルド
RUN npm run build

# 開発サーバーのポートを公開
EXPOSE 3000

# 開発サーバーを起動
CMD ["npm", "run", "start"]
