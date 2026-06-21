# 🚀 V2Free (Maxo) 每日自动签到 — GitHub Actions 版

> **完全免费 · 无需开电脑 · 24 小时云端运行**

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-自动化签到-blue)
![免费](https://img.shields.io/badge/费用-完全免费-success)
![Python](https://img.shields.io/badge/Python-3.11+-green)

---

## ✨ 功能特点

| 特性 | 说明 |
|------|------|
| ☁️ **云端运行** | 无需开电脑，GitHub 服务器帮你执行 |
| 💰 **完全免费** | 公开仓库无限使用，私有仓库每月 2000 分钟 |
| ⏰ **每日定时** | 北京时间 08:30 自动执行（可自定义） |
| 🔒 **安全存储** | 账号密码存放在 GitHub Secrets，不暴露在代码中 |
| 📧 **失败通知** | 签到失败时 GitHub 会发邮件通知你 |
| 🔄 **手动触发** | 随时可以在 Actions 页面手动执行 |

---

## 📁 文件结构

```
github-actions-checkin/
├── .github/
│   └── workflows/
│       └── maxo-checkin.yml    # ⬅️ GitHub Actions 工作流配置
├── scripts/
│   └── checkin.py              # ⬅️ 签到 Python 脚本
└── README.md                    # 本文件
```

---

## 🚀 5 步快速部署

### 第 1 步：Fork 或创建仓库 ✅ 已完成
> 你的仓库 `licunyangokok/v2free-auto-checkin` 已创建好！

### 第 2 步：上传文件 ✅ 已完成
> 文件已通过网页上传到仓库中。

### 第 3 步：配置 Secrets（重要！⚠️ 必须手动操作）

这是最关键的一步——把你的 V2Free 账号信息存入 GitHub Secrets：

1. 进入你的仓库页面
2. 点击 **Settings** → 左侧 **Secrets and variables** → **Actions**
3. 点击 **New repository secret**，添加以下 Secrets：

#### 方式 A：账号密码登录（推荐 ✅）

| Secret 名称 | 填写内容 | 示例 |
|-------------|----------|------|
| `V2FREE_EMAIL` | 你的 V2Free 注册邮箱 | `2552925651@qq.com` |
| `V2FREE_PASSWORD` | 你的 V2Free 密码 | `your_password_here` |

### 第 4 步：（可选）自定义配置

如果需要修改，进入仓库 **Settings** → **Variables** → **Actions**：

| 变量名 | 默认值 | 说明 |
|--------|--------|------|
| `V2FREE_URL` | `https://w1.maxo.top` | V2Free 网站地址（如果域名变了改这里） |

### 第 5 步：启用并测试

1. 进入仓库的 **Actions** 标签页
2. 选择 `V2Free 每日自动签到` 工作流
3. 点击右侧 **Run workflow** 手动触发一次测试
4. 查看运行日志确认是否成功 ✅

成功后，每天北京时间 **08:30** 会自动执行！

---

## ❓ 常见问题

### Q: 真的完全免费吗？
**A:** 是的！公开仓库的 GitHub Actions 完全免费无限制。每次签到只需约 5 秒，一个月也才用到约 150 秒。

### Q: 安全吗？我的密码会泄露吗？
**A:** 安全。密码存储在 GitHub Secrets 中：
- 不会出现在代码里
- 日志中会被自动遮蔽
- 即使仓库是公开的，别人也看不到你的 Secrets

### Q: 如果 V2Free 域名变了怎么办？
**A:** 在仓库 Settings → Variables 中修改 `V2FREE_URL` 即可，不需要改代码。

### Q: 签到失败了怎么办？
**A:** GitHub 会在 Actions 页面显示详细日志，你可以查看具体错误原因。常见原因：
- Cookie/密码过期 → 更新 Secrets
- 网站维护 → 等待下次自动重试
- 账号被封 → 需要联系 V2Free 客服

### Q: 可以改成其他时间吗？
**A:** 可以！编辑 `.github/workflows/maxo-checkin.yml` 中的 `cron` 表达式：
```yaml
schedule:
  - cron: '30 0 * * *'    # UTC 00:30 = 北京时间 08:30
```

---

## 🔧 技术细节

- **运行环境**: Ubuntu Latest (GitHub-hosted runner)
- **Python 版本**: 3.11+
- **依赖库**: requests
- **认证方式**: 账号密码登录 / Cookie 二选一
- **签到接口**: 自动探测多种 ss-panel 签到 API 路径
- **容错机制**: 多路径尝试 + 用户中心最终验证

---

## 📄 许可证

MIT License — 自由使用、修改和分发。
