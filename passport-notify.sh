#!/bin/bash

# 容器已设置为 Asia/Shanghai 时区，无需手动 +8 hours
current_date=$(date +"%Y-%m-%d")
echo "[$(date '+%Y-%m-%d %H:%M:%S')] 当前日期: $current_date"

# 获取6个月后的日期
date_after_6_months=$(date -d "$current_date +6 months" +"%Y年%m月%d日")
echo "6个月后的日期是 $date_after_6_months"

# 使用双引号确保环境变量正确展开
curl -s "https://oapi.dingtalk.com/robot/send?access_token=${DINGTALK_TOKEN}" \
  -H 'Content-Type: application/json' \
  -d "{\"msgtype\": \"markdown\", \"markdown\": {\"title\": \"日期提醒\", \"text\": \"# [元气满满][元气满满] 日期提醒：6个月后的日期是${date_after_6_months} 请注意护照有效期\n![](${IMAGE_URL})\"}}"

echo ""
echo "[$(date '+%Y-%m-%d %H:%M:%S')] 通知发送完成"