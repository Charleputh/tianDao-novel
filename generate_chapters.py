#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
章节列表生成器
自动扫描chapters目录，生成章节列表JSON文件
"""

import os
import json
import re
from pathlib import Path

def scan_chapters():
    """扫描chapters目录，生成章节列表"""
    chapters_dir = Path('chapters')
    chapters = []
    
    if not chapters_dir.exists():
        print("chapters目录不存在")
        return chapters
    
    print(f"扫描目录: {chapters_dir.absolute()}")
    
    # 扫描所有.md文件
    md_files = list(chapters_dir.glob('*.md'))
    print(f"找到{len(md_files)}个.md文件")
    
    for file_path in md_files:
        filename = file_path.name
        print(f"处理文件: {filename}")
        
        # 解析章节信息：第X章_标题.md
        # 支持中文数字和阿拉伯数字
        match = re.match(r'第([一二三四五六七八九十\d]+)章_(.+)\.md', filename)
        
        if match:
            chapter_str = match.group(1)
            chapter_title = match.group(2)
            
            # 中文数字转换
            chinese_to_num = {
                '一': 1, '二': 2, '三': 3, '四': 4, '五': 5,
                '六': 6, '七': 7, '八': 8, '九': 9, '十': 10
            }
            
            if chapter_str in chinese_to_num:
                chapter_num = chinese_to_num[chapter_str]
            elif chapter_str.isdigit():
                chapter_num = int(chapter_str)
            else:
                # 处理复杂的中文数字（如十一、十二等）
                if chapter_str.startswith('十'):
                    if len(chapter_str) == 1:
                        chapter_num = 10
                    else:
                        chapter_num = 10 + chinese_to_num.get(chapter_str[1], 0)
                else:
                    continue  # 跳过无法解析的章节号
            
            print(f"匹配成功: 第{chapter_num}章 - {chapter_title}")
            
            chapters.append({
                'number': chapter_num,
                'title': chapter_title,
                'filename': filename,
                'path': f'chapters/{filename}'
            })
        else:
            print(f"文件名格式不匹配: {filename}")
    
    # 按章节号排序
    chapters.sort(key=lambda x: x['number'])
    
    return chapters

def generate_chapters_json():
    """生成chapters.json文件"""
    chapters = scan_chapters()
    
    data = {
        'success': True,
        'chapters': chapters,
        'total': len(chapters),
        'last_updated': str(Path().cwd())
    }
    
    # 写入JSON文件
    with open('chapters.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    
    print(f"已生成chapters.json，包含{len(chapters)}个章节")
    
    # 打印章节列表
    for chapter in chapters:
        print(f"第{chapter['number']}章: {chapter['title']}")

if __name__ == '__main__':
    generate_chapters_json()