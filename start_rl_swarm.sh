#!/bin/bash

# --- Language Selection ---
LANG_CHOICE="en" # Default to English

echo "Please select your language / 请选择语言:"
echo "1. English"
echo "2. 中文 (Chinese)"
read -p "Enter choice (1 or 2): " lang_input

if [[ "$lang_input" == "2" ]]; then
  LANG_CHOICE="zh"
  echo "语言已设置为中文。"
else
  LANG_CHOICE="en" # Default or invalid input goes to English
  echo "Language set to English."
fi
echo "------------------------------------------------------------------"


# --- Language Strings Function ---
# Usage: msg "key" ["arg1" "arg2" ...]
# Example: msg "starting_setup"
# Example: msg "error_command_not_found" "git"
msg() {
  local key="$1"
  shift # Remove the key, remaining args are for formatting

  # --- English ---
  if [[ "$LANG_CHOICE" == "en" ]]; then
    case "$key" in
      "starting_setup") echo "Starting RL Swarm Setup..." ;;
      "error_command_not_found") echo "[ERROR] Required command '$1' not found. Please install it." ;;
      "checking_python") echo "Checking Python version..." ;;
      "error_python_version") echo "[ERROR] Python $MIN_PYTHON_MAJOR.$MIN_PYTHON_MINOR or higher is required. You have $1.$2." ;;
      "please_install_python") echo "Please install or upgrade Python." ;;
      "macos_python_hint") echo "On macOS, you might need to install Python via Homebrew: brew install python" ;;
      "python_version_ok") echo "Python version $1.$2 found." ;;
      "detected_os") echo "Detected OS: $1" ;;
      "warning_os_untested") echo "[WARNING] Detected OS is not Linux or macOS. This script is primarily tested on those platforms." ;;
      "windows_wsl_note") echo "If you are on Windows, ensure you are running this within WSL (Windows Subsystem for Linux)." ;;
      "windows_wsl_link") echo "See: https://learn.microsoft.com/en-us/windows/wsl/install" ;;
      "press_enter_or_ctrl_c") echo "Press Enter to continue, or Ctrl+C to abort." ;;
      "checking_deps") echo "Checking dependencies..." ;;
      "deps_ok") echo "Dependencies OK." ;;
      "cloning_repo") echo "Cloning RL Swarm repository from $REPO_URL..." ;;
      "error_cloning") echo "[ERROR] Failed to clone repository." ;;
      "repo_exists") echo "Repository directory '$REPO_DIR' already exists. Skipping clone." ;;
      "pulling_repo") echo "Pulling latest changes..." ;;
      "warning_pulling") echo "[WARNING] Failed to pull latest changes." ;;
      "changing_dir_to") echo "Changed directory to $(pwd)" ;;
      "error_changing_dir") echo "[ERROR] Failed to change directory to $REPO_DIR." ;;
      "creating_venv") echo "Creating Python virtual environment..." ;;
      "error_creating_venv") echo "[ERROR] Failed to create virtual environment." ;;
      "venv_exists") echo "Virtual environment '.venv' already exists." ;;
      "activating_venv") echo "Activating virtual environment..." ;;
      "error_activating_venv") echo "[ERROR] Failed to activate virtual environment." ;;
      "preparing_to_run") echo " PREPARING TO RUN RL SWARM" ;;
      "script_will_start") echo "The script will now attempt to start the RL Swarm node using './run_rl_swarm.sh'." ;;
      "interactive_steps_warning") echo "Please be aware of the following interactive steps that might occur:" ;;
      "step1_testnet") echo "1. Testnet Participation: You'll likely be asked if you want to participate." ;;
      "step1_testnet_action") echo "   -> Please answer 'Y' or press Enter (as recommended)." ;;
      "step2_login") echo "2. Browser Login: A browser window might open (or you'll need to navigate" ;;
      "step2_login_details") echo "   to http://localhost:3000 on VMs/remote machines). Follow the login steps." ;;
      "step3_hf_token") echo "3. Hugging Face Token (Optional):" ;;
      "hf_token_env_set") echo "   -> Environment variable HUGGING_FACE_HUB_TOKEN is set." ;;
      "hf_token_env_set_auto") echo "      The underlying script might use this automatically." ;;
      "hf_token_env_not_set") echo "   -> Environment variable HUGGING_FACE_HUB_TOKEN is NOT set." ;;
      "hf_token_prompt_warning") echo "   -> If you choose to push models to Hugging Face Hub ('Y' when asked)," ;;
      "hf_token_prompt_warning2") echo "      you will likely be prompted to enter your HF Access Token interactively." ;;
      "hf_token_get_here") echo "   -> Get a token here (use a 'write' token): $HF_TOKEN_URL" ;;
      "hf_token_avoid_prompt") echo "   -> To potentially avoid the interactive prompt next time, you can set the variable" ;;
      "hf_token_avoid_prompt_export") echo "      before running this script, e.g.:" ;;
      "hf_token_avoid_prompt_export_cmd") echo "      export HUGGING_FACE_HUB_TOKEN='hf_YourTokenHere'" ;;
      "hf_token_avoid_prompt_export_cmd2") echo "      ./start_rl_swarm.sh" ;;
      "hf_token_avoid_prompt_curl") echo "      OR when using curl:" ;;
      "hf_token_avoid_prompt_curl_cmd") echo "      HUGGING_FACE_HUB_TOKEN='hf_YourTokenHere' curl ... | bash" ;;
      "script_execution_start") echo "The RL Swarm script './run_rl_swarm.sh' will now be executed." ;;
      "press_enter_to_start") echo "Press Enter to continue..." ;;
      "executing_script") echo "Executing ./run_rl_swarm.sh ..." ;;
      "script_finished") echo "RL Swarm script './run_rl_swarm.sh' finished or was interrupted (Exit Code: $1)." ;;
      *) echo "[WARN] Unknown message key: $key" ;;
    esac
  # --- Chinese ---
  elif [[ "$LANG_CHOICE" == "zh" ]]; then
    case "$key" in
      "starting_setup") echo "开始 RL Swarm 设置..." ;;
      "error_command_not_found") echo "[错误] 未找到所需命令 '$1'。请安装它。" ;;
      "checking_python") echo "检查 Python 版本..." ;;
      "error_python_version") echo "[错误] 需要 Python $MIN_PYTHON_MAJOR.$MIN_PYTHON_MINOR 或更高版本。您当前的版本是 $1.$2。" ;;
      "please_install_python") echo "请安装或升级 Python。" ;;
      "macos_python_hint") echo "在 macOS 上，您可能需要通过 Homebrew 安装 Python：brew install python" ;;
      "python_version_ok") echo "找到 Python 版本 $1.$2。" ;;
      "detected_os") echo "检测到的操作系统: $1" ;;
      "warning_os_untested") echo "[警告] 检测到的操作系统不是 Linux 或 macOS。此脚本主要在这些平台上测试。" ;;
      "windows_wsl_note") echo "如果您使用的是 Windows，请确保在 WSL (Windows Subsystem for Linux) 中运行此脚本。" ;;
      "windows_wsl_link") echo "请参阅: https://learn.microsoft.com/en-us/windows/wsl/install" ;;
      "press_enter_or_ctrl_c") echo "按 Enter 继续，或按 Ctrl+C 中止。" ;;
      "checking_deps") echo "检查依赖项..." ;;
      "deps_ok") echo "依赖项检查通过。" ;;
      "cloning_repo") echo "正在从 $REPO_URL 克隆 RL Swarm 仓库..." ;;
      "error_cloning") echo "[错误] 克隆仓库失败。" ;;
      "repo_exists") echo "仓库目录 '$REPO_DIR' 已存在。跳过克隆。" ;;
      "pulling_repo") echo "正在拉取最新更改..." ;;
      "warning_pulling") echo "[警告] 拉取最新更改失败。" ;;
      "changing_dir_to") echo "已切换目录到 $(pwd)" ;;
      "error_changing_dir") echo "[错误] 切换到目录 $REPO_DIR 失败。" ;;
      "creating_venv") echo "正在创建 Python 虚拟环境..." ;;
      "error_creating_venv") echo "[错误] 创建虚拟环境失败。" ;;
      "venv_exists") echo "虚拟环境 '.venv' 已存在。" ;;
      "activating_venv") echo "正在激活虚拟环境..." ;;
      "error_activating_venv") echo "[错误] 激活虚拟环境失败。" ;;
      "preparing_to_run") echo " 准备运行 RL SWARM" ;;
      "script_will_start") echo "脚本现在将尝试使用 './run_rl_swarm.sh' 启动 RL Swarm 节点。" ;;
      "interactive_steps_warning") echo "请注意接下来可能出现的交互式步骤：" ;;
      "step1_testnet") echo "1. 测试网参与：系统可能会询问您是否要参与。" ;;
      "step1_testnet_action") echo "   -> 请回答 'Y' 或按 Enter (根据文档建议)。" ;;
      "step2_login") echo "2. 浏览器登录：可能会打开一个浏览器窗口（或者您需要在 VM/远程机器上" ;;
      "step2_login_details") echo "   导航到 http://localhost:3000）。请按照登录步骤操作。" ;;
      "step3_hf_token") echo "3. Hugging Face Token (可选):" ;;
      "hf_token_env_set") echo "   -> 环境变量 HUGGING_FACE_HUB_TOKEN 已设置。" ;;
      "hf_token_env_set_auto") echo "      底层脚本可能会自动使用此变量。" ;;
      "hf_token_env_not_set") echo "   -> 环境变量 HUGGING_FACE_HUB_TOKEN 未设置。" ;;
      "hf_token_prompt_warning") echo "   -> 如果您选择将模型推送到 Hugging Face Hub (当被问及时回答 'Y')，" ;;
      "hf_token_prompt_warning2") echo "      您可能需要交互式地输入您的 HF 访问令牌。" ;;
      "hf_token_get_here") echo "   -> 在此处获取令牌 (使用 'write' 权限的令牌): $HF_TOKEN_URL" ;;
      "hf_token_avoid_prompt") echo "   -> 为了下次可能避免交互式提示，您可以在运行此脚本之前设置该变量，例如：" ;;
      "hf_token_avoid_prompt_export") echo "      " ;; # Empty line for spacing
      "hf_token_avoid_prompt_export_cmd") echo "      export HUGGING_FACE_HUB_TOKEN='hf_YourTokenHere'" ;;
      "hf_token_avoid_prompt_export_cmd2") echo "      ./start_rl_swarm.sh" ;;
      "hf_token_avoid_prompt_curl") echo "      或者在使用 curl 时：" ;;
      "hf_token_avoid_prompt_curl_cmd") echo "      HUGGING_FACE_HUB_TOKEN='hf_YourTokenHere' curl ... | bash" ;;
      "script_execution_start") echo "RL Swarm 脚本 './run_rl_swarm.sh' 即将执行。" ;;
      "press_enter_to_start") echo "按 Enter 继续..." ;;
      "executing_script") echo "正在执行 ./run_rl_swarm.sh ..." ;;
      "script_finished") echo "RL Swarm 脚本 './run_rl_swarm.sh' 已完成或被中断 (退出码: $1)。" ;;
      *) echo "[警告] 未知消息键: $key" ;;
    esac
  fi
}


# --- Configuration ---
REPO_URL="https://github.com/gensyn-ai/rl-swarm.git"
REPO_DIR="rl-swarm"
MIN_PYTHON_MAJOR=3
MIN_PYTHON_MINOR=10
HF_TOKEN_URL="https://huggingface.co/docs/hub/en/security-tokens"

# --- Helper Functions ---
check_command() {
  if ! command -v "$1" &> /dev/null; then
    msg "error_command_not_found" "$1"
    exit 1
  fi
}

check_python_version() {
  msg "checking_python"
  check_command python3
  local python_version_major python_version_minor
  python_version_major=$(python3 -c 'import sys; print(sys.version_info.major)')
  python_version_minor=$(python3 -c 'import sys; print(sys.version_info.minor)')

  if [[ "$python_version_major" -lt "$MIN_PYTHON_MAJOR" ]] || ([[ "$python_version_major" -eq "$MIN_PYTHON_MAJOR" ]] && [[ "$python_version_minor" -lt "$MIN_PYTHON_MINOR" ]]); then
    msg "error_python_version" "$python_version_major" "$python_version_minor"
    msg "please_install_python"
    if [[ "$(uname)" == "Darwin" ]]; then
        msg "macos_python_hint"
    fi
    exit 1
  else
    msg "python_version_ok" "$python_version_major" "$python_version_minor"
  fi
}

# --- OS Detection & Setup Notes ---
OS_TYPE="$(uname)"
msg "detected_os" "$OS_TYPE"

if [[ "$OS_TYPE" != "Linux" && "$OS_TYPE" != "Darwin" ]]; then
  msg "warning_os_untested"
  msg "windows_wsl_note"
  msg "windows_wsl_link"
  msg "press_enter_or_ctrl_c"
  read -r
fi

# --- Dependency Checks ---
msg "checking_deps"
check_command git
check_python_version
msg "deps_ok"
echo "------------------------------------------------------------------"


# --- Clone Repository ---
if [ ! -d "$REPO_DIR" ]; then
  msg "cloning_repo"
  git clone --depth 1 "$REPO_URL" "$REPO_DIR" || { msg "error_cloning"; exit 1; }
else
  msg "repo_exists"
  # Optional: Add git pull logic here if desired
  # msg "pulling_repo"
  # (cd "$REPO_DIR" && git pull) || msg "warning_pulling"
fi
echo "------------------------------------------------------------------"

# --- Navigate to Repo ---
cd "$REPO_DIR" || { msg "error_changing_dir"; exit 1; }
msg "changing_dir_to"
echo "------------------------------------------------------------------"

# --- Setup Virtual Environment ---
if [ ! -d ".venv" ]; then
  msg "creating_venv"
  python3 -m venv .venv || { msg "error_creating_venv"; exit 1; }
else
    msg "venv_exists"
fi

msg "activating_venv"
# Note: Activation within a script only affects the script's current execution context.
# The run_rl_swarm.sh script likely handles its own dependencies correctly after venv creation.
source .venv/bin/activate || { msg "error_activating_venv"; exit 1; }
echo "------------------------------------------------------------------"


# --- Pre-run Information & HF Token Handling ---
msg "preparing_to_run"
echo "------------------------------------------------------------------"
msg "script_will_start"
msg "interactive_steps_warning"
echo ""
msg "step1_testnet"
msg "step1_testnet_action"
echo ""
msg "step2_login"
msg "step2_login_details"
echo ""
msg "step3_hf_token"
if [ -n "$HUGGING_FACE_HUB_TOKEN" ]; then
    msg "hf_token_env_set"
    msg "hf_token_env_set_auto"
else
    msg "hf_token_env_not_set"
    msg "hf_token_prompt_warning"
    msg "hf_token_prompt_warning2"
    msg "hf_token_get_here"
    msg "hf_token_avoid_prompt"
    msg "hf_token_avoid_prompt_export"
    msg "hf_token_avoid_prompt_export_cmd"
    msg "hf_token_avoid_prompt_export_cmd2"
    msg "hf_token_avoid_prompt_curl"
    msg "hf_token_avoid_prompt_curl_cmd"
fi
echo "------------------------------------------------------------------"
msg "script_execution_start"
msg "press_enter_to_start"
read -r

# --- Run the main swarm script ---
msg "executing_script"
./run_rl_swarm.sh

# --- Post-run ---
EXIT_CODE=$?
echo "------------------------------------------------------------------"
msg "script_finished" "$EXIT_CODE"
# Deactivation might not run if run_rl_swarm.sh runs indefinitely or is killed
# deactivate # Deactivate is usually run automatically when the script exits

exit $EXIT_CODE
