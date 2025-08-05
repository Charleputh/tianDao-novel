#!/bin/bash

# 小说阅读器自动部署脚本
# 使用方法: ./deploy.sh "提交信息"

echo "🚀 开始部署小说阅读器..."

# 检查是否提供了提交信息
if [ -z "$1" ]; then
    COMMIT_MSG="更新小说内容 $(date '+%Y-%m-%d %H:%M:%S')"
else
    COMMIT_MSG="$1"
fi

echo "📝 提交信息: $COMMIT_MSG"

# 添加所有更改
echo "📦 添加文件..."
git add .

# 检查是否有更改
if git diff --staged --quiet; then
    echo "❌ 没有检测到更改，无需部署"
    exit 0
fi

# 提交更改
echo "💾 提交更改..."
git commit -m "$COMMIT_MSG"

# 推送到远程仓库
echo "🌐 推送到GitHub..."
git push

echo "✅ 部署完成！"
echo "🔗 你的网站将在1-2分钟内更新"
echo "📱 访问地址: https://你的用户名.github.io/仓库名/"