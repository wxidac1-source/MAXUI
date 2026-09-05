# 魔法相机 MAXUI

iOS 15–16 Dopamine / palera1n **rootless** 越狱虚拟相机（视频 / 图片 / WiFi-MJPEG 推流替换摄像头），全 App 与 Safari 网页通用，离线卡密激活。

- 包 ID：`com.maxui.tweak`
- 注入过滤器：`maxui.plist`（UIKit / WebKit 全局，内容与构建产物一致）
- 运行时数据目录：`/var/jb/var/mobile/Library/vcamplus/`（video.mp4 / image.jpg / 1.mp4~6.mp4 / enabled / stream.conf）
- 依赖：Dopamine 自带 ElleKit；`firmware >= 15.0`

## 源码结构

| 文件 | 作用 |
|---|---|
| `Tweak.xm` | 主逻辑（摄像头替换、悬浮面板、卡密、推流） |
| `vcam_friend_js.mm` / `fishhook.c/.h` | 网页注入与 hook 支撑 |
| `Makefile` | theos 构建（rootless，TWEAK_NAME=maxui，arm64/arm64e） |
| `maxui.plist` | MobileSubstrate 注入过滤器 |
| `control` | dpkg 包元信息（Conflicts/Replaces 旧 vcamplus 包，安装自动替换） |
| `layout/DEBIAN/preinst|postinst|postrm` | 安装维护脚本（迁移激活、清理旧残留、目录授权） |
| `keygen.py` | 离线卡密生成/校验工具 |
| `.github/workflows/build.yml` | GitHub Actions 自动构建 deb |

## 构建

推送到 `main` 即由 GitHub Actions（macOS + theos + iOS16.5 SDK）自动构建，产物在 Actions 运行页的 Artifacts（`maxui-deb`），同时发布到 Release。

## 安装后

Sileo 添加本仓库对应的软件源后在线安装；或下载 deb 用 Sileo/Filza 本地安装。安装后 Respring，在任意相机界面 1.5 秒内先后按音量+、音量−（顺序不限）呼出菜单。
