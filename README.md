# 天道九问，我只想回地球 - 在线小说阅读器

这是一个基于HTML的在线小说阅读器，支持实时更新和响应式设计。

## 功能特点

- 📱 响应式设计，支持手机、平板、电脑阅读
- 🔄 30秒自动刷新，实时同步最新内容
- ⌨️ 键盘快捷键支持（方向键切换章节，F5刷新）
- 🎨 优雅的渐变背景和卡片式布局
- 💬 智能内容格式化（对话、心理描写特殊样式）

## 在线访问

访问地址：[点击这里阅读](https://your-username.github.io/novel-reader/)

## 使用方法

1. 将所有文件放在同一目录下
2. 使用现代浏览器打开 `index.html`
3. 点击左上角菜单按钮浏览章节
4. 支持自动刷新和内容格式化

## 自动部署到GitHub Pages

### 首次设置

1. **创建GitHub仓库**
   ```bash
   # 初始化Git仓库
   git init
   git add .
   git commit -m "初始化小说阅读器项目"
   git branch -M main
   
   # 添加远程仓库（替换为你的信息）
   git remote add origin https://github.com/你的用户名/仓库名.git
   git push -u origin main
   ```

2. **启用GitHub Pages**
   - 进入仓库Settings > Pages
   - Source选择"GitHub Actions"
   - 保存设置

### 日常更新

使用快速部署脚本：
```bash
# 方法1：使用默认提交信息
./deploy.sh

# 方法2：自定义提交信息
./deploy.sh "添加第11章内容"
```

或手动操作：
```bash
git add .
git commit -m "更新内容"
git push
```

### 访问网站
部署完成后，访问：`https://你的用户名.github.io/仓库名/`

## 本地运行

```bash
# 克隆仓库
git clone https://github.com/your-username/novel-reader.git
cd novel-reader

# 启动本地服务器
python3 -m http.server 8000

# 在浏览器中访问
open http://localhost:8000/小说阅读器.html
```

## 📝 添加新章节

### 方法一：使用便捷脚本（推荐）
```bash
# 添加新章节（会自动创建文件模板和更新章节列表）
./add_chapter.sh 11 新的开始

# 编辑完章节内容后，更新网站
./update_chapters.sh
```

### 方法二：手动添加
1. 在 `chapters/` 目录创建新的章节文件，命名格式：`第X章_章节标题.md`
2. 运行更新脚本：`./update_chapters.sh`
3. 网页会自动检测并加载新章节

### 章节文件管理
- 所有章节文件统一存放在 `chapters/` 目录下
- 支持中文数字章节号（第一章、第二章...第十章、第十一章等）
- 系统会自动扫描并生成章节列表
- 网页刷新后会自动获取最新的章节信息

### 部署更新
运行 `./deploy.sh "添加新章节"` 自动部署到GitHub Pages

## 技术特性

- 响应式设计，支持移动端
- 抽屉式导航菜单
- 自动内容格式化
- 支持对话和描写的差异化显示
- 一键刷新功能
- GitHub Actions自动部署
- 支持自定义域名

## 文件结构

```
├── 小说阅读器.html          # 主页面
├── 第一章_觉醒.md           # 第一章内容
├── 第二章_初试锋芒.md       # 第二章内容
├── 第三章_青云宗.md         # 第三章内容
└── README.md               # 说明文档
```

## 更新内容

只需要编辑对应的 `.md` 文件，网页会自动加载最新内容。

## 部署说明

本项目可以部署到任何静态网站托管服务：
- GitHub Pages
- Netlify
- Vercel
- 阿里云OSS
- 腾讯云COS

---

*一个关于九魂归一与超越天道的修仙传奇*