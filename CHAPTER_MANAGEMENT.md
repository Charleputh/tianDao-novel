# 章节管理系统使用说明

## 🎯 系统概述

本小说阅读器现在支持动态章节管理，无需手动修改HTML代码即可添加新章节。系统会自动扫描 `chapters/` 目录，生成章节列表，并在网页刷新时自动更新。

## 📁 目录结构

```
小说/
├── chapters/                 # 章节文件目录
│   ├── 第一章_觉醒.md
│   ├── 第二章_初入宗门.md
│   └── ...
├── chapters.json            # 自动生成的章节列表
├── generate_chapters.py     # 章节扫描脚本
├── add_chapter.sh          # 添加章节便捷脚本
├── update_chapters.sh      # 更新章节列表脚本
└── index.html              # 主页面
```

## 🚀 快速开始

### 添加新章节

```bash
# 使用便捷脚本添加第11章
./add_chapter.sh 11 "新的开始"

# 这会创建：chapters/第十一章_新的开始.md
# 并自动更新 chapters.json
```

### 手动添加章节

1. 在 `chapters/` 目录创建新文件：
   ```bash
   touch "chapters/第十一章_新的开始.md"
   ```

2. 编辑章节内容

3. 更新章节列表：
   ```bash
   ./update_chapters.sh
   ```

## 📝 章节文件格式

### 文件命名规范
- 格式：`第X章_章节标题.md`
- 支持中文数字：第一章、第二章...第十章、第十一章等
- 支持阿拉伯数字：第1章、第2章等

### 章节内容模板
```markdown
# 第十一章 新的开始

## 概要
本章概要描述...

## 正文
章节正文内容...

## 要点
- 重要情节点1
- 重要情节点2

## 下章预告
下一章将会...
```

## 🔧 系统工作原理

### 1. 章节扫描
- `generate_chapters.py` 扫描 `chapters/` 目录
- 解析文件名，提取章节号和标题
- 生成 `chapters.json` 文件

### 2. 动态加载
- 网页加载时，JavaScript 读取 `chapters.json`
- 动态生成章节菜单
- 按需加载章节内容

### 3. 自动更新
- 网页刷新时自动检测新章节
- 无需重启服务器
- 支持热更新

## 🛠️ 脚本说明

### add_chapter.sh
```bash
./add_chapter.sh <章节号> <章节标题>
```
- 自动创建章节文件
- 生成标准模板
- 更新章节列表

### update_chapters.sh
```bash
./update_chapters.sh [新章节文件名]
```
- 重新扫描章节目录
- 更新 chapters.json
- 可选择自动部署

### generate_chapters.py
```bash
python3 generate_chapters.py
```
- 扫描 chapters/ 目录
- 解析章节信息
- 生成 JSON 配置

## 🔍 故障排除

### 章节不显示
1. 检查文件名格式是否正确
2. 运行 `./update_chapters.sh` 更新列表
3. 刷新浏览器页面

### 章节顺序错误
1. 确保章节号格式正确
2. 重新运行 `generate_chapters.py`
3. 检查 `chapters.json` 内容

### 脚本权限问题
```bash
chmod +x add_chapter.sh
chmod +x update_chapters.sh
```

## 📊 章节统计

当前系统支持：
- ✅ 自动章节检测
- ✅ 动态菜单生成
- ✅ 热更新支持
- ✅ 中文数字章节号
- ✅ 章节模板生成
- ✅ 批量管理工具

## 🎨 自定义配置

### 修改章节模板
编辑 `add_chapter.sh` 中的模板部分：
```bash
# 在脚本中找到并修改这部分
cat > "$chapter_file" << EOF
# 第${chinese_number}章 ${title}
...
EOF
```

### 调整扫描规则
编辑 `generate_chapters.py` 中的正则表达式：
```python
# 修改文件名匹配规则
pattern = r'^第([一二三四五六七八九十\d]+)章[_\-\s]*(.+)\.md$'
```

## 🚀 部署到生产环境

```bash
# 更新章节后部署
./update_chapters.sh
./deploy.sh "添加新章节"
```

这样就完成了从开发到生产的完整流程！