#!/bin/bash

# 添加新章节脚本
# 用法: ./add_chapter.sh 章节号 章节标题

if [ $# -ne 2 ]; then
    echo "用法: $0 <章节号> <章节标题>"
    echo "示例: $0 11 新的开始"
    exit 1
fi

CHAPTER_NUM=$1
CHAPTER_TITLE=$2

# 转换数字为中文数字（简单版本，支持1-20）
num_to_chinese() {
    case $1 in
        1) echo "一" ;;
        2) echo "二" ;;
        3) echo "三" ;;
        4) echo "四" ;;
        5) echo "五" ;;
        6) echo "六" ;;
        7) echo "七" ;;
        8) echo "八" ;;
        9) echo "九" ;;
        10) echo "十" ;;
        11) echo "十一" ;;
        12) echo "十二" ;;
        13) echo "十三" ;;
        14) echo "十四" ;;
        15) echo "十五" ;;
        16) echo "十六" ;;
        17) echo "十七" ;;
        18) echo "十八" ;;
        19) echo "十九" ;;
        20) echo "二十" ;;
        *) echo $1 ;;  # 超过20的直接用数字
    esac
}

CHINESE_NUM=$(num_to_chinese $CHAPTER_NUM)
FILENAME="chapters/第${CHINESE_NUM}章_${CHAPTER_TITLE}.md"

echo "📝 创建新章节: $FILENAME"

# 检查文件是否已存在
if [ -f "$FILENAME" ]; then
    echo "⚠️  文件已存在: $FILENAME"
    read -p "是否要覆盖? (y/n): " overwrite
    if [ "$overwrite" != "y" ] && [ "$overwrite" != "Y" ]; then
        echo "❌ 取消创建"
        exit 1
    fi
fi

# 创建章节文件模板
cat > "$FILENAME" << EOF
# 第${CHINESE_NUM}章 ${CHAPTER_TITLE}

## 章节概要
<!-- 在这里写章节的简要概述 -->

---

## 正文

<!-- 在这里开始写章节内容 -->

林轩站在...

---

## 章节要点
- 
- 
- 

## 下章预告
<!-- 简要描述下一章的内容方向 -->

EOF

echo "✅ 章节文件创建成功: $FILENAME"

# 自动更新章节列表
echo "🔄 自动更新章节列表..."
python3 generate_chapters.py

echo "🎉 新章节添加完成！"
echo "📂 文件位置: $FILENAME"
echo "💡 提示: 你可以现在开始编辑这个文件，然后运行 ./update_chapters.sh 来更新网站"