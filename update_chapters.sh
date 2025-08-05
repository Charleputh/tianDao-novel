#!/bin/bash

# 小说章节自动更新脚本
# 用法: ./update_chapters.sh [章节文件名]

echo "🔄 开始更新章节列表..."

# 如果提供了章节文件名参数，先移动到chapters目录
if [ ! -z "$1" ]; then
    if [ -f "$1" ]; then
        echo "📁 移动章节文件 $1 到 chapters 目录..."
        mv "$1" chapters/
    else
        echo "⚠️  文件 $1 不存在"
    fi
fi

# 重新生成章节列表
echo "📝 重新生成章节列表..."
python3 generate_chapters.py

# 检查是否生成成功
if [ -f "chapters.json" ]; then
    echo "✅ 章节列表更新成功！"
    
    # 显示当前章节数量
    chapter_count=$(python3 -c "import json; data=json.load(open('chapters.json')); print(data['total'])")
    echo "📚 当前共有 $chapter_count 个章节"
    
    # 如果启用了自动部署，询问是否要部署
    if [ -f "deploy.sh" ]; then
        echo ""
        read -p "🚀 是否要自动部署到GitHub Pages? (y/n): " deploy_choice
        if [ "$deploy_choice" = "y" ] || [ "$deploy_choice" = "Y" ]; then
            echo "🚀 开始自动部署..."
            ./deploy.sh "更新章节列表 - 新增至第${chapter_count}章"
        fi
    fi
else
    echo "❌ 章节列表生成失败！"
    exit 1
fi

echo "🎉 更新完成！"