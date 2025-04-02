# RL Swarm Easy Setup Script

This script provides a convenient way to set up and run a node for the [Gensyn RL Swarm Testnet](https://github.com/gensyn-ai/rl-swarm). It automates dependency checks, repository cloning, virtual environment setup, and provides guidance for the interactive steps required by the official `run_rl_swarm.sh` script.

---

## English Instructions

### Prerequisites

*   **Operating System:** Linux or macOS is recommended. For Windows, you **must** use WSL (Windows Subsystem for Linux).
*   **Git:** Must be installed (`sudo apt update && sudo apt install git` on Debian/Ubuntu, `brew install git` on macOS).
*   **Python:** Version 3.10 or higher must be installed (`python3 --version`).

### How to Use

You can run this script directly or via `curl`/`wget` for a one-line setup.

**Method 1: Download and Run Manually**

1.  Download the `start_rl_swarm.sh` script to your machine.
2.  Make it executable:
    ```bash
    chmod +x start_rl_swarm.sh
    ```
3.  Run the script:
    ```bash
    ./start_rl_swarm.sh
    ```

**Method 2: One-Line Setup (using `curl`)**

*(Replace `YOUR_SCRIPT_URL` with the actual raw URL where the `start_rl_swarm.sh` script is hosted, e.g., a GitHub Gist raw URL)*

```bash
curl -sSL YOUR_SCRIPT_URL | bash
```

**Method 3: One-Line Setup (using `wget`)**

*(Replace `YOUR_SCRIPT_URL` with the actual raw URL)*

```bash
wget -qO - YOUR_SCRIPT_URL | bash
```

### Non-Interactive Hugging Face Token (Optional)

If you want to automatically provide your Hugging Face token (needed if you choose to upload models) instead of pasting it interactively, you can set the `HUGGING_FACE_HUB_TOKEN` environment variable *before* running the script.

**Example with `curl`:**

```bash
HUGGING_FACE_HUB_TOKEN='hf_YourTokenHere' curl -sSL YOUR_SCRIPT_URL | bash
```

**Example when running locally:**

```bash
export HUGGING_FACE_HUB_TOKEN='hf_YourTokenHere'
./start_rl_swarm.sh
```
*(Replace `hf_YourTokenHere` with your actual token)*

### What the Script Does

1.  Prompts for language selection (English/Chinese).
2.  Checks for `git` and required Python version.
3.  Checks if the `rl-swarm` repository directory exists. If not, it clones it from GitHub.
4.  Navigates into the `rl-swarm` directory.
5.  Creates a Python virtual environment (`.venv`) if it doesn't exist.
6.  Activates the virtual environment.
7.  Provides clear instructions about the upcoming interactive steps (Testnet participation, Browser Login, Hugging Face Token).
8.  Executes the official `./run_rl_swarm.sh` script.

Follow the on-screen prompts from the `./run_rl_swarm.sh` script after this setup script finishes its part.

---

## 中文说明 (Chinese Instructions)

### 先决条件

*   **操作系统:** 推荐使用 Linux 或 macOS。对于 Windows，您**必须**使用 WSL (Windows Subsystem for Linux)。
*   **Git:** 必须已安装 (在 Debian/Ubuntu 上运行 `sudo apt update && sudo apt install git`，在 macOS 上运行 `brew install git`)。
*   **Python:** 必须安装 3.10 或更高版本 (`python3 --version`)。

### 如何使用

您可以直接运行此脚本，或通过 `curl`/`wget` 实现一键设置。

**方法一：手动下载并运行**

1.  将 `start_rl_swarm.sh` 脚本下载到您的机器上。
2.  赋予执行权限：
    ```bash
    chmod +x start_rl_swarm.sh
    ```
3.  运行脚本：
    ```bash
    ./start_rl_swarm.sh
    ```

**方法二：一键设置 (使用 `curl`)**

*(将 `YOUR_SCRIPT_URL` 替换为 `start_rl_swarm.sh` 脚本所在的实际原始 URL，例如 GitHub Gist 的 raw URL)*

```bash
curl -sSL YOUR_SCRIPT_URL | bash
```

**方法三：一键设置 (使用 `wget`)**

*(将 `YOUR_SCRIPT_URL` 替换为实际原始 URL)*

```bash
wget -qO - YOUR_SCRIPT_URL | bash
```

### 非交互式 Hugging Face Token (可选)

如果您希望自动提供您的 Hugging Face Token（如果您选择上传模型则需要），而不是在脚本提示时交互式粘贴，您可以在运行脚本*之前*设置 `HUGGING_FACE_HUB_TOKEN` 环境变量。

**使用 `curl` 的示例：**

```bash
HUGGING_FACE_HUB_TOKEN='hf_YourTokenHere' curl -sSL YOUR_SCRIPT_URL | bash
```

**本地运行示例：**

```bash
export HUGGING_FACE_HUB_TOKEN='hf_YourTokenHere'
./start_rl_swarm.sh
```
*(将 `hf_YourTokenHere` 替换为您的实际 Token)*

### 脚本功能

1.  提示选择语言 (英语/中文)。
2.  检查 `git` 和所需的 Python 版本。
3.  检查 `rl-swarm` 仓库目录是否存在。如果不存在，则从 GitHub 克隆。
4.  切换到 `rl-swarm` 目录。
5.  如果 Python 虚拟环境 (`.venv`) 不存在，则创建它。
6.  激活虚拟环境。
7.  提供关于接下来官方脚本交互步骤（测试网参与、浏览器登录、Hugging Face Token）的清晰说明。
8.  执行官方的 `./run_rl_swarm.sh` 脚本。

在此设置脚本完成其工作后，请按照屏幕上来自 `./run_rl_swarm.sh` 脚本的提示进行操作。
