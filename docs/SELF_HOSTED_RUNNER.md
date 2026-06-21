# Self-hosted Runner 快速部署（Ubuntu）

## 为什么用 self-hosted runner？
- 目标站点可能会拒绝来自 GitHub Actions 托管 runner 的密码登录请求
- 自托管 runner 使用你自己的 IP 地址，不会被识别为"云端"
- 可以正常使用账号密码登录或 Cookie 方式

## 前置条件
- 一台在线的 Ubuntu 服务器（VPS、家用电脑均可）
- 已安装 Docker（可选，但推荐）
- 有该仓库的写权限

## 部署步骤

### 1. 获取 Runner 注册令牌
1. 进入仓库页面 → Settings → Actions → Runners
2. 点击 "New self-hosted runner"
3. 选择操作系统为 Linux
4. 复制显示的 `./config.sh` 命令中的 token

### 2. 下载并配置 Runner
```bash
# 创建目录
mkdir actions-runner && cd actions-runner

# 下载最新版本（替换为页面显示的版本号）
curl -o actions-runner-linux-x64-<VERSION>.tar.gz -L https://github.com/actions/runner/releases/download/v<VERSION>/actions-runner-linux-x64-<VERSION>.tar.gz

# 解压
tar xzf ./actions-runner-linux-x64-<VERSION>.tar.gz

# 配置（替换 URL 和 TOKEN）
./config.sh --url https://github.com/licunyangokok/v2free-auto-checkin --token <YOUR_TOKEN>

# 安装为服务（推荐）
sudo ./svc.sh install
sudo ./svc.sh start
```

### 3. 验证 Runner 状态
```bash
# 检查运行状态
sudo ./svc.sh status

# 或查看日志
sudo journalctl -u actions.runner.* -f
```

### 4. 修改 Workflow 使用 Self-hosted Runner
在 `.github/workflows/maxo-checkin.yml` 中修改：
```yaml
jobs:
  checkin:
    name: 执行签到
    runs-on: self-hosted  # 改为 self-hosted
    # ... 其余不变
```

## 安全注意事项
⚠️ **重要**：
- 不要在不可信环境保存密码或 Token
- Runner 会以你的权限执行仓库代码，确保仓库安全
- 定期更新 Runner 版本
- 如果使用家用电脑，注意网络安全

## 常见问题

### Q: Runner 离线怎么办？
A: 检查网络连接，重启服务：`sudo ./svc.sh restart`

### Q: 如何移除 Runner？
A: 在仓库 Settings → Actions → Runners 页面删除，然后在服务器上执行 `./svc.sh stop && ./svc.sh uninstall`

### Q: 多个仓库可以用同一个 Runner 吗？
A: 可以为多个仓库配置同一个 Runner，在注册时添加 `--labels` 参数区分

## 相关链接
- [GitHub 官方文档](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners)
- [Runner 故障排查](https://docs.github.com/en/actions/hosting-your-own-runners/monitoring-and-troubleshooting-self-hosted-runners)
