# 阿宗国际佛学院 - 随喜登记系统

一个简洁的佛教法会随喜登记系统，支持人民币自动换算尼币，可灵活分配随喜金额到各个项目。

## 功能特点

- **汇率自动换算**：人民币自动换算成尼币
- **灵活分配**：输入总额后自动平均分配，也可手动调整各项目金额
- **智能调整**：修改某个项目后，其他未修改项目自动重新分配剩余金额
- **确认单生成**：提交后生成完整的确认页面，包含供养人信息、金额分配、回向内容
- **拼音自动转换**：人名后自动添加拼音
- **截图上传**：支持上传汇款截图并在确认页面显示

## 文件结构

```
azong-buddhist-college/
├── index.html          # 前台登记页面（用户访问）
├── admin.html          # 后台管理页面（管理员使用）
├── config.json         # 配置文件（汇率、标题、随喜项目等）
└── README.md           # 说明文档
```

## 部署到 GitHub Pages

### 1. 创建 GitHub 仓库

1. 登录 [GitHub](https://github.com)
2. 点击右上角 "+" → "New repository"
3. 仓库名称填写：`azong-buddhist-college`
4. 选择 "Public"（公开）
5. 点击 "Create repository"

### 2. 上传文件

#### 方法一：通过网页上传

1. 在新创建的仓库页面，点击 "uploading an existing file"
2. 将以下文件拖放到上传区域：
   - `index.html`
   - `admin.html`
   - `config.json`
3. 填写提交信息："Initial commit"
4. 点击 "Commit changes"

#### 方法二：使用 Git 命令行

```bash
# 克隆仓库到本地
git clone https://github.com/你的用户名/azong-buddhist-college.git

# 进入目录
cd azong-buddhist-college

# 复制文件到该目录
# ... 将 index.html, admin.html, config.json 复制到当前目录

# 添加文件
git add .

# 提交
git commit -m "Initial commit"

# 推送
git push origin main
```

### 3. 启用 GitHub Pages

1. 在仓库页面，点击 "Settings"（设置）
2. 左侧菜单点击 "Pages"
3. "Source" 部分选择 "Deploy from a branch"
4. "Branch" 选择 "main"，文件夹选择 "/ (root)"
5. 点击 "Save"
6. 等待几分钟，页面会显示访问链接：`https://你的用户名.github.io/azong-buddhist-college/`

### 4. 配置网站

1. 访问后台管理页面：`https://你的用户名.github.io/azong-buddhist-college/admin.html`
2. 填写法会信息、汇率、随喜项目、联系方式
3. 点击 "保存配置"，下载 config.json 文件
4. 在 GitHub 仓库中上传新的 config.json 文件替换旧的

### 5. 使用流程

**管理员：**
1. 访问 `https://你的用户名.github.io/azong-buddhist-college/admin.html`
2. 配置法会信息、汇率、随喜项目
3. 保存并下载 config.json
4. 上传 config.json 到 GitHub 仓库

**用户：**
1. 访问 `https://你的用户名.github.io/azong-buddhist-college/`
2. 填写随喜信息并提交
3. 获得确认页面，可打印或保存为 PDF

## 配置说明

### config.json 字段说明

```json
{
  "title": "阿宗国际佛学院",           // 网站标题
  "subtitle": "AZONG INTERNATIONAL BUDDHIST ACADEMY",  // 副标题
  "description": "法会介绍文字...",     // 法会介绍
  "exchangeRate": 18.5,                 // 汇率（1人民币 = ? 尼币）
  "currencyName": "尼泊尔卢比",         // 货币名称
  "currencyCode": "NPR",                // 货币代码
  "items": [                            // 随喜项目列表
    {"id": "fahui", "name": "随喜法会", "sort": 1},
    {"id": "gongdeng", "name": "供灯", "sort": 2}
  ],
  "contact": {                          // 联系方式
    "wechat": "AzongCollege",
    "email": "info@azong.edu.np",
    "address": "尼泊尔加德满都"
  }
}
```

## 自定义域名（可选）

1. 在仓库根目录创建文件 `CNAME`
2. 文件内容填写你的域名，如：`foshi.azong.org`
3. 在域名服务商处添加 CNAME 记录指向 `你的用户名.github.io`

## 注意事项

1. GitHub Pages 免费版有每月 100GB 的流量限制
2. 由于是静态网站，数据不会保存到服务器，确认页面需要用户自行保存
3. 建议定期备份 config.json 文件

## 技术栈

- 纯 HTML + CSS + JavaScript
- 无需后端服务器
- 支持响应式设计，可在手机端使用
