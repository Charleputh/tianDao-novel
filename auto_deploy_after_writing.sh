#!/bin/bash

# 自动部署创作助手
# 在完成章节创作后自动更新和部署

echo "🎯 开始自动部署流程..."

# 1. 更新章节列表
echo "📚 更新章节列表..."
python3 generate_chapters.py

if [ $? -eq 0 ]; then
    echo "✅ 章节列表更新成功"
else
    echo "❌ 章节列表更新失败"
    exit 1
fi

# 2. 检查是否有新的章节文件
CHAPTER_COUNT=$(python3 -c "
import json
try:
    with open('chapters.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
    print(data.get('total', 0))
except:
    print(0)
")

echo "📖 当前章节总数: $CHAPTER_COUNT"

# 3. 自动部署
COMMIT_MSG="新增章节内容 - 总计${CHAPTER_COUNT}章 $(date '+%Y-%m-%d %H:%M:%S')"
echo "🚀 开始自动部署: $COMMIT_MSG"

# 执行部署
./deploy.sh "$COMMIT_MSG"

if [ $? -eq 0 ]; then
    echo "🎉 自动部署完成！"
    echo "🌐 网站将在1-2分钟内更新"
    echo "📱 章节总数: $CHAPTER_COUNT"
else
    echo "❌ 部署失败，请检查错误信息"
    exit 1
fi