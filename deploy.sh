#!/bin/bash

# 阿宗国际佛学院 - GitHub Pages 自动部署脚本
# 使用方法: ./deploy.sh

echo "========================================"
echo "  阿宗国际佛学院 - GitHub Pages 部署"
echo "========================================"
echo ""

# 检查是否安装了 git
if ! command -v git &> /dev/null; then
    echo "错误: 未安装 Git，请先安装 Git"
    echo "安装命令: brew install git"
    exit 1
fi

# GitHub 用户名
GITHUB_USER="garang1318"
REPO_NAME="azong-buddhist-college"

# 检查当前目录是否正确
if [ ! -f "index.html" ]; then
    echo "错误: 当前目录不是项目目录"
    echo "请 cd 到 azong-buddhist-college 目录后再运行此脚本"
    exit 1
fi

echo "步骤 1: 检查 GitHub 登录状态..."
if ! git config --global user.email &> /dev/null; then
    echo "请输入您的 GitHub 邮箱:"
    read GITHUB_EMAIL
    git config --global user.email "$GITHUB_EMAIL"
fi

if ! git config --global user.name &> /dev/null; then
    echo "请输入您的 GitHub 用户名:"
    read GITHUB_NAME
    git config --global user.name "$GITHUB_NAME"
fi

echo ""
echo "步骤 2: 创建 GitHub 仓库..."
echo "如果仓库已存在，会跳过此步骤"
echo ""

# 检查是否已经有 git 仓库
if [ -d ".git" ]; then
    echo "Git 仓库已存在，跳过初始化"
else
    git init
    echo "Git 仓库初始化完成"
fi

# 添加远程仓库（如果不存在）
if ! git remote get-url origin &> /dev/null; then
    git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo "远程仓库已添加"
else
    echo "远程仓库已存在"
fi

echo ""
echo "步骤 3: 添加文件到 Git..."
git add index.html admin.html config.json README.md
echo "文件已添加"

echo ""
echo "步骤 4: 提交更改..."
git commit -m "Initial commit: 阿宗国际佛学院随喜登记系统"
echo "提交完成"

echo ""
echo "步骤 5: 推送到 GitHub..."
echo "首次推送需要输入 GitHub 用户名和密码（或 Token）"
echo ""

# 尝试推送
git push -u origin main 2>/dev/null || git push -u origin master

echo ""
echo "========================================"
echo "  代码推送完成！"
echo "========================================"
echo ""
echo "现在请手动启用 GitHub Pages:"
echo ""
echo "1. 访问: https://github.com/$GITHUB_USER/$REPO_NAME"
echo "2. 点击 Settings (设置)"
echo "3. 左侧菜单点击 Pages"
echo "4. Source 选择 'Deploy from a branch'"
echo "5. Branch 选择 'main' 或 'master'，文件夹选 '/ (root)'"
echo "6. 点击 Save"
echo ""
echo "等待 2-3 分钟后，访问以下链接:"
echo "  前台页面: https://$GITHUB_USER.github.io/$REPO_NAME/"
echo "  后台管理: https://$GITHUB_USER.github.io/$REPO_NAME/admin.html"
echo ""
echo "========================================"
