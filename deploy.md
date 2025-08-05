# 部署指南

## 快速部署到GitHub Pages

### 1. 准备工作
确保你已经安装了Git，并且有GitHub账号。

### 2. 创建GitHub仓库
1. 登录GitHub
2. 点击右上角的"+"，选择"New repository"
3. 仓库名建议使用：`novel-reader` 或 `tianDao-novel`
4. 设为Public（公开）
5. 点击"Create repository"

### 3. 上传代码
在终端中执行以下命令：

```bash
# 进入项目目录
cd "/Users/liu/cat/小说"

# 初始化Git仓库
git init

# 添加所有文件
git add .

# 提交代码
git commit -m "初始化小说阅读器项目"

# 设置主分支
git branch -M main

# 添加远程仓库（替换为你的GitHub用户名和仓库名）
git remote add origin https://github.com/你的用户名/novel-reader.git

# 推送到GitHub
git push -u origin main
```

### 4. 启用GitHub Pages
1. 进入你的GitHub仓库页面
2. 点击"Settings"标签
3. 在左侧菜单中找到"Pages"
4. 在"Source"部分选择"Deploy from a branch"
5. Branch选择"main"
6. 文件夹选择"/ (root)"
7. 点击"Save"

### 5. 访问你的网站
等待1-2分钟后，你的网站将在以下地址可用：
`https://你的用户名.github.io/novel-reader/`

## 自动化部署设置

本项目已配置GitHub Actions自动部署，每次推送代码到main分支时会自动部署到GitHub Pages。

### 启用自动部署
1. 确保你的仓库已经推送了`.github/workflows/deploy.yml`文件
2. 进入GitHub仓库的Settings > Pages
3. Source选择"GitHub Actions"
4. 保存设置

### 更新内容

每次修改小说内容后，只需要：

```bash
cd "/Users/liu/cat/小说"
git add .
git commit -m "更新章节内容"
git push
```

GitHub Actions会自动构建并部署，通常在1-2分钟内完成！

## 自定义域名（可选）

如果你有自己的域名：

1. 在仓库根目录创建`CNAME`文件
2. 文件内容写入你的域名（如：`novel.yourdomain.com`）
3. 在域名DNS设置中添加CNAME记录指向`你的用户名.github.io`

## 其他部署选项

### Netlify部署
1. 访问 [netlify.com](https://netlify.com)
2. 使用GitHub账号登录
3. 点击"New site from Git"
4. 选择你的仓库
5. 点击"Deploy site"

### Vercel部署
1. 访问 [vercel.com](https://vercel.com)
2. 使用GitHub账号登录
3. 点击"New Project"
4. 导入你的GitHub仓库
5. 点击"Deploy"

---

**提示：** 推荐使用GitHub Pages，因为它完全免费且稳定可靠。