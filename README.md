# passport-reminder

```
passport-reminder/
├── docker-compose.yml
├── .env
├── Dockerfile
├── passport-notify.sh
└── crontab
```

# Deployment

```
# 创建项目目录并放入上述 5 个文件
git clone https://github.com/ahlfors/passport-reminder.git

# 修改 .env 中的真实值后，一键启动
docker compose up -d

# 手动测试
docker exec passport-reminder /usr/local/bin/passport-notify.sh

# 查看定时任务执行日志
docker exec passport-reminder cat /var/log/passport-notify.log

# 查看容器日志
docker logs -f passport-reminder
```