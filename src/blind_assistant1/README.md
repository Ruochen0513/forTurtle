# 语音识别+语音控制系统

## 功能特点

1. **语音交互技术**
   - 语音识别：使用VolcEngine API将语音转为文本
   - 语义理解：使用智谱AI GLM-4-Flash大模型进行语义分析
```bash
export VOLC_APP_ID=7709498845
export VOLC_ACCESS_KEY=tiKoWmAWbbi-tIkY81klLAk-evHvOxlL




## 系统要求

- ROS Noetic
- Python 3.8+
- PyAudio
- VolcEngine API密钥

## 安装与设置

1. 安装依赖项：

```bash
cd ~/workspace/catkin_ws/src/blind_assistant/scripts
./setup.sh
```

2. 编译工作空间：

```bash
cd ~/workspace/catkin_ws
catkin_make
```

3. 设置环境变量（可选，将API密钥添加到环境变量）：

```bash
export VOLC_API_KEY="您的API密钥"
export VOLC_API_SECRET="您的API密钥密文"
```

## 使用方法

1. 启动语音交互系统：

```bash
roslaunch blind_assistant voice_interaction.launch api_key:=您的API密钥 api_secret:=您的API密钥密文
```

2. 使用语音指令与机器人交互，例如：
   - "前进"/"后退"/"左转"/"右转"/"停止" - 控制机器人移动
   - "抓取" - 让机器人抓取物体
   - "帮助" - 获取帮助

## 项目结构

```
blind_assistant/
├── scripts/              # Python脚本
│   ├── speech_recognition.py   # 语音识别节点
│   ├── speech_synthesis.py     # 语音合成节点
│   ├── semantic_understanding.py # 语义理解节点
│   └── setup.sh          # 安装脚本
├── launch/               # 启动文件
│   └── voice_interaction.launch # 语音交互启动文件
└── config/               # 配置文件（待添加）
```

## 注意事项

- 确保有可用的麦克风和扬声器
- 需要网络连接以使用VolcEngine API
- 为获得最佳效果，请在安静的环境中使用 