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
echo " ATOMA NODE SETUP HELPER"
echo "------------------------------------------------------------------"

# --- Language Strings Function ---
msg() {
  local key="$1"
  shift
  local text=""

  # --- English ---
  if [[ "$LANG_CHOICE" == "en" ]]; then
    case "$key" in
      "intro") text="This script helps guide you through setting up an Atoma node." ;;
      "manual_steps_warn") text="NOTE: Due to interactive steps and required manual configuration, this script CANNOT fully automate the process. It will guide you through the necessary commands and checks." ;;
      "section_prereqs") text="STEP 1: Prerequisites Installation" ;;
      "prereqs_check_cmds") text="Checking for essential commands (git, curl, cargo, docker, docker compose)..." ;;
      "prereqs_cmd_ok") text=" -> Command '$1' found." ;;
      "prereqs_cmd_missing") text=" -> [ERROR] Command '$1' not found. Please install it and re-run this script." ;;
      "prereqs_rust_check") text="Checking for Rust/Cargo..." ;;
      "prereqs_rust_install_cmd") text="If Rust is not installed, run: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh" ;;
      "prereqs_sui_check") text="Checking for SUI CLI..." ;;
      "prereqs_sui_install_cmd") text="If SUI CLI is not installed, run: cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui --features tracing" ;;
      "prereqs_docker_check") text="Checking for Docker..." ;;
      "prereqs_docker_install_link") text="If Docker is not installed, follow instructions at: https://docs.docker.com/engine/install/" ;;
      "prereqs_compose_check") text="Checking for Docker Compose..." ;;
      "prereqs_compose_install_link") text="Docker Compose is usually included with Docker Desktop or can be installed separately: https://docs.docker.com/compose/install/" ;;
      "prereqs_libs_warn") text="System libraries (cmake, gcc, libssl-dev, etc.) are also required." ;;
      "prereqs_libs_cmd_debian") text="On Debian/Ubuntu, you can try installing them with:" ;;
      "prereqs_libs_apt_cmd") text="sudo apt-get update && sudo apt-get install -y curl git cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential" ;;
      "prereqs_libs_manual") text="Please ensure these libraries are installed using your system's package manager." ;;
      "prereqs_complete_prompt") text="Have you installed all prerequisites? (y/n)" ;;

      "section_sui_setup") text="STEP 2: SUI Client Setup & Faucet" ;;
      "sui_check_config") text="Checking for SUI config (~/.sui/sui_config/client.yaml)..." ;;
      "sui_config_found") text=" -> SUI config found." ;;
      "sui_config_missing") text=" -> SUI config NOT found." ;;
      "sui_run_client_cmd") text="Please run the SUI client setup manually in a separate terminal:" ;;
      "sui_client_cmd") text="sui client" ;;
      "sui_client_follow_prompts") text="Follow the prompts to connect to testnet and create/import a wallet." ;;
      "sui_get_faucet") text="Once SUI client is set up, get faucet tokens (run these in a terminal):" ;;
      "sui_faucet_sui_cmd") text="sui client faucet" ;;
      "sui_faucet_toma_cmd") text='sui client call --package "0xa1b2ce1a52abc52c5d21be9da0f752dbd587018bc666c5298f778f42de26df1d" --module "toma" --function "faucet" --args "0xfdddd6fb95509ea36f44f06d0d0a2f5868dac2bda1423d204bdc9f458115ff75" 100000000000' ;;
      "sui_check_balance_cmd") text="You can check your balance with: sui client balance" ;;
      "sui_setup_complete_prompt") text="Have you completed the SUI client setup and faucet steps? (y/n)" ;;

      "section_clone_repos") text="STEP 3: Cloning Repositories" ;;
      "cloning_repo") text="Cloning $1 repository..." ;;
      "repo_exists") text="Repository '$1' already exists. Skipping clone." ;;
      "error_cloning") text="[ERROR] Failed to clone repository '$1'." ;;

      "section_atoma_contracts") text="STEP 4: Interact with Atoma Contracts (Manual)" ;;
      "atoma_contracts_navigate") text="Navigate to the contracts directory in a separate terminal:" ;;
      "atoma_contracts_cd_cmd") text="cd atoma-node-setup/atoma-contracts/sui" ;;
      "atoma_contracts_register") text="Run the node registration command:" ;;
      "atoma_contracts_register_cmd") text='./dev/cli db register-node --package "0xfa971724b5fb14c2ffc9a959b81cce4d85d457da27e29f793e12428ed71bb922"' ;;
      "atoma_contracts_register_note") text=" -> Note the node small ID and badge ID output by this command. You will need them later for config.toml." ;;
      "atoma_contracts_subscribe") text="Subscribe your node to a task (example uses Task ID 1):" ;;
      "atoma_contracts_subscribe_cmd") text='./dev/cli db subscribe-node-to-task --package "0xfa971724b5fb14c2ffc9a959b81cce4d85d457da27e29f793e12428ed71bb922" --task-small-id 1 --price-per-compute-unit 1 --max-num-compute-units 10000000' ;;
      "atoma_contracts_subscribe_note") text=" -> Adjust --task-small-id, --price-per-compute-unit, and --max-num-compute-units as needed. See Atoma docs for available Task IDs." ;;
      "atoma_contracts_complete_prompt") text="Have you completed the node registration and subscription steps? (y/n)" ;;

      "section_atoma_node_config") text="STEP 5: Configure Atoma Node (Manual)" ;;
      "atoma_node_config_navigate") text="Navigate to the node directory:" ;;
      "atoma_node_config_cd_cmd") text="cd atoma-node-setup/atoma-node" ;;
      "atoma_node_config_copy_env") text="Copy the example .env file:" ;;
      "atoma_node_config_copy_env_cmd") text="cp .env.example .env" ;;
      "atoma_node_config_edit_env") text="-> EDIT the '.env' file with your text editor. Set your PostgreSQL details (POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWORD) and any backend settings." ;;
      "atoma_node_config_copy_toml") text="Copy the example config.toml file:" ;;
      "atoma_node_config_copy_toml_cmd") text="cp config.example.toml config.toml" ;;
      "atoma_node_config_edit_toml") text="-> EDIT the 'config.toml' file. Set 'models', 'database_url' (using values from .env), 'node_small_ids', and 'node_badges' (using values from the registration step)." ;;
      "atoma_node_config_complete_prompt") text="Have you copied and edited both .env and config.toml? (y/n)" ;;

      "section_run_node") text="STEP 6: Run Atoma Node (Manual)" ;;
      "atoma_node_run_navigate") text="Ensure you are in the node directory:" ;;
      "atoma_node_run_cd_cmd") text="cd atoma-node-setup/atoma-node" ;;
      "atoma_node_run_choose_mode") text="Choose your run mode (confidential TEE or non-confidential) and desired services." ;;
      "atoma_node_run_example_non_conf") text="Example (Non-Confidential, All Services, Detached):" ;;
      "atoma_node_run_cmd_non_conf") text='COMPOSE_PROFILES=chat_completions_vllm,embeddings_tei,image_generations_mistralrs,non-confidential docker compose up -d' ;;
      "atoma_node_run_example_conf") text="Example (Confidential TEE, All Services, Detached):" ;;
      "atoma_node_run_cmd_conf") text='COMPOSE_PROFILES=chat_completions_vllm,embeddings_tei,image_generations_mistralrs,confidential docker compose up -d' ;;
      "atoma_node_run_note") text="-> Adjust COMPOSE_PROFILES based on the services you configured and want to run. Remove '-d' to run in the foreground." ;;
      "atoma_node_run_complete") text="Setup guide complete. You can now run the docker compose command." ;;

      "prompt_continue") text="Press Enter to continue to the next step..." ;;
      "prompt_abort") text="Aborting setup." ;;
      "error_input") text="Invalid input. Please enter 'y' or 'n'." ;;
      *) text="[WARN] Unknown message key (en): $key" ;;
    esac
  # --- Chinese ---
  elif [[ "$LANG_CHOICE" == "zh" ]]; then
    case "$key" in
      "intro") text="此脚本将指导您完成 Atoma 节点的设置过程。" ;;
      "manual_steps_warn") text="注意：由于存在交互式步骤和必需的手动配置，此脚本无法完全自动化该过程。它将引导您完成必要的命令和检查。" ;;
      "section_prereqs") text="步骤 1：安装先决条件" ;;
      "prereqs_check_cmds") text="正在检查基本命令 (git, curl, cargo, docker, docker compose)..." ;;
      "prereqs_cmd_ok") text=" -> 命令 '$1' 已找到。" ;;
      "prereqs_cmd_missing") text=" -> [错误] 命令 '$1' 未找到。请安装它后重新运行此脚本。" ;;
      "prereqs_rust_check") text="正在检查 Rust/Cargo..." ;;
      "prereqs_rust_install_cmd") text="如果未安装 Rust，请运行: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh" ;;
      "prereqs_sui_check") text="正在检查 SUI CLI..." ;;
      "prereqs_sui_install_cmd") text="如果未安装 SUI CLI，请运行: cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui --features tracing" ;;
      "prereqs_docker_check") text="正在检查 Docker..." ;;
      "prereqs_docker_install_link") text="如果未安装 Docker，请按照此处的说明操作: https://docs.docker.com/engine/install/" ;;
      "prereqs_compose_check") text="正在检查 Docker Compose..." ;;
      "prereqs_compose_install_link") text="Docker Compose 通常包含在 Docker Desktop 中，或可单独安装: https://docs.docker.com/compose/install/" ;;
      "prereqs_libs_warn") text="还需要系统库 (cmake, gcc, libssl-dev 等)。" ;;
      "prereqs_libs_cmd_debian") text="在 Debian/Ubuntu 上，您可以尝试使用以下命令安装它们：" ;;
      "prereqs_libs_apt_cmd") text="sudo apt-get update && sudo apt-get install -y curl git cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential" ;;
      "prereqs_libs_manual") text="请使用您系统的包管理器确保这些库已安装。" ;;
      "prereqs_complete_prompt") text="您是否已安装所有先决条件？ (y/n)" ;;

      "section_sui_setup") text="步骤 2：SUI 客户端设置与水龙头" ;;
      "sui_check_config") text="正在检查 SUI 配置 (~/.sui/sui_config/client.yaml)..." ;;
      "sui_config_found") text=" -> SUI 配置已找到。" ;;
      "sui_config_missing") text=" -> SUI 配置未找到。" ;;
      "sui_run_client_cmd") text="请在单独的终端中手动运行 SUI 客户端设置：" ;;
      "sui_client_cmd") text="sui client" ;;
      "sui_client_follow_prompts") text="按照提示连接到测试网并创建/导入钱包。" ;;
      "sui_get_faucet") text="SUI 客户端设置完成后，获取测试代币 (在终端中运行这些命令)：" ;;
      "sui_faucet_sui_cmd") text="sui client faucet" ;;
      "sui_faucet_toma_cmd") text='sui client call --package "0xa1b2ce1a52abc52c5d21be9da0f752dbd587018bc666c5298f778f42de26df1d" --module "toma" --function "faucet" --args "0xfdddd6fb95509ea36f44f06d0d0a2f5868dac2bda1423d204bdc9f458115ff75" 100000000000' ;;
      "sui_check_balance_cmd") text="您可以使用以下命令检查余额：sui client balance" ;;
      "sui_setup_complete_prompt") text="您是否已完成 SUI 客户端设置和水龙头步骤？ (y/n)" ;;

      "section_clone_repos") text="步骤 3：克隆代码仓库" ;;
      "cloning_repo") text="正在克隆 $1 仓库..." ;;
      "repo_exists") text="仓库 '$1' 已存在。跳过克隆。" ;;
      "error_cloning") text="[错误] 克隆仓库 '$1' 失败。" ;;

      "section_atoma_contracts") text="步骤 4：与 Atoma 合约交互 (手动)" ;;
      "atoma_contracts_navigate") text="在单独的终端中导航到合约目录：" ;;
      "atoma_contracts_cd_cmd") text="cd atoma-node-setup/atoma-contracts/sui" ;;
      "atoma_contracts_register") text="运行节点注册命令：" ;;
      "atoma_contracts_register_cmd") text='./dev/cli db register-node --package "0xfa971724b5fb14c2ffc9a959b81cce4d85d457da27e29f793e12428ed71bb922"' ;;
      "atoma_contracts_register_note") text=" -> 记下此命令输出的节点 small ID 和 badge ID。稍后配置 config.toml 时需要它们。" ;;
      "atoma_contracts_subscribe") text="将您的节点订阅到任务 (示例使用任务 ID 1)：" ;;
      "atoma_contracts_subscribe_cmd") text='./dev/cli db subscribe-node-to-task --package "0xfa971724b5fb14c2ffc9a959b81cce4d85d457da27e29f793e12428ed71bb922" --task-small-id 1 --price-per-compute-unit 1 --max-num-compute-units 10000000' ;;
      "atoma_contracts_subscribe_note") text=" -> 根据需要调整 --task-small-id, --price-per-compute-unit 和 --max-num-compute-units。有关可用的任务 ID，请参阅 Atoma 文档。" ;;
      "atoma_contracts_complete_prompt") text="您是否已完成节点注册和订阅步骤？ (y/n)" ;;

      "section_atoma_node_config") text="步骤 5：配置 Atoma 节点 (手动)" ;;
      "atoma_node_config_navigate") text="导航到节点目录：" ;;
      "atoma_node_config_cd_cmd") text="cd atoma-node-setup/atoma-node" ;;
      "atoma_node_config_copy_env") text="复制 .env 示例文件：" ;;
      "atoma_node_config_copy_env_cmd") text="cp .env.example .env" ;;
      "atoma_node_config_edit_env") text="-> 使用文本编辑器编辑 '.env' 文件。设置您的 PostgreSQL 详细信息 (POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWORD) 以及任何后端设置。" ;;
      "atoma_node_config_copy_toml") text="复制 config.toml 示例文件：" ;;
      "atoma_node_config_copy_toml_cmd") text="cp config.example.toml config.toml" ;;
      "atoma_node_config_edit_toml") text="-> 编辑 'config.toml' 文件。设置 'models', 'database_url' (使用 .env 中的值), 'node_small_ids' 和 'node_badges' (使用注册步骤中获得的值)。" ;;
      "atoma_node_config_complete_prompt") text="您是否已复制并编辑了 .env 和 config.toml 文件？ (y/n)" ;;

      "section_run_node") text="步骤 6：运行 Atoma 节点 (手动)" ;;
      "atoma_node_run_navigate") text="确保您在节点目录中：" ;;
      "atoma_node_run_cd_cmd") text="cd atoma-node-setup/atoma-node" ;;
      "atoma_node_run_choose_mode") text="选择您的运行模式（机密计算 TEE 或非机密）和所需的服务。" ;;
      "atoma_node_run_example_non_conf") text="示例 (非机密，所有服务，后台运行)：" ;;
      "atoma_node_run_cmd_non_conf") text='COMPOSE_PROFILES=chat_completions_vllm,embeddings_tei,image_generations_mistralrs,non-confidential docker compose up -d' ;;
      "atoma_node_run_example_conf") text="示例 (机密 TEE，所有服务，后台运行)：" ;;
      "atoma_node_run_cmd_conf") text='COMPOSE_PROFILES=chat_completions_vllm,embeddings_tei,image_generations_mistralrs,confidential docker compose up -d' ;;
      "atoma_node_run_note") text="-> 根据您配置并想要运行的服务调整 COMPOSE_PROFILES。移除 '-d' 以在前台运行。" ;;
      "atoma_node_run_complete") text="设置指南完成。您现在可以运行 docker compose 命令了。" ;;

      "prompt_continue") text="按 Enter 继续下一步..." ;;
      "prompt_abort") text="中止设置。" ;;
      "error_input") text="输入无效。请输入 'y' 或 'n'。" ;;
      *) text="[警告] 未知消息键 (zh): $key" ;;
    esac
  fi
  # Print the translated message, interpreting escape sequences
  echo -e "$text"
}

# --- Helper Functions ---
check_command() {
  if command -v "$1" &> /dev/null; then
    msg "prereqs_cmd_ok" "$1"
    return 0
  else
    msg "prereqs_cmd_missing" "$1"
    return 1
  fi
}

prompt_yes_no() {
  local prompt_key="$1"
  local response
  while true; do
    read -p "$(msg "$prompt_key") " response
    case "$response" in
      [Yy]* ) return 0;;
      [Nn]* ) return 1;;
      * ) msg "error_input";;
    esac
  done
}

pause_and_continue() {
    read -p "$(msg 'prompt_continue')"
    echo "------------------------------------------------------------------"
}

# --- Configuration ---
ATOMA_CONTRACTS_REPO_URL="https://github.com/atoma-network/atoma-contracts"
ATOMA_NODE_REPO_URL="https://github.com/atoma-network/atoma-node"
ATOMA_CONTRACTS_DIR="atoma-contracts"
ATOMA_NODE_DIR="atoma-node"
SUI_CONFIG_PATH="$HOME/.sui/sui_config/client.yaml"

# --- Main Script ---

msg "intro"
msg "manual_steps_warn"
echo "------------------------------------------------------------------"

# --- Step 1: Prerequisites ---
msg "section_prereqs"
msg "prereqs_check_cmds"
all_cmds_found=true
check_command "git" || all_cmds_found=false
check_command "curl" || all_cmds_found=false

msg "prereqs_rust_check"
check_command "cargo" || {
    all_cmds_found=false
    msg "prereqs_rust_install_cmd"
}

msg "prereqs_sui_check"
check_command "sui" || {
    all_cmds_found=false
    msg "prereqs_sui_install_cmd"
}

msg "prereqs_docker_check"
check_command "docker" || {
    all_cmds_found=false
    msg "prereqs_docker_install_link"
}

msg "prereqs_compose_check"
# Check for 'docker compose' (v2) first, then 'docker-compose' (v1)
if command -v docker &> /dev/null && docker compose version &> /dev/null; then
    msg "prereqs_cmd_ok" "docker compose"
elif check_command "docker-compose"; then
    # Found v1, it's okay
    : # No message needed if check_command printed OK
else
    all_cmds_found=false
    msg "prereqs_compose_install_link"
fi


echo ""
msg "prereqs_libs_warn"
msg "prereqs_libs_cmd_debian"
echo "   ${LANG_CHOICE:+ }$(msg 'prereqs_libs_apt_cmd')" # Add indentation visually
msg "prereqs_libs_manual"
echo ""

if ! $all_cmds_found; then
  exit 1
fi

if ! prompt_yes_no "prereqs_complete_prompt"; then
    msg "prompt_abort"
    exit 1
fi
pause_and_continue

# --- Step 2: SUI Setup ---
msg "section_sui_setup"
msg "sui_check_config"
if [ -f "$SUI_CONFIG_PATH" ]; then
    msg "sui_config_found"
else
    msg "sui_config_missing"
    msg "sui_run_client_cmd"
    echo "   ${LANG_CHOICE:+ }$(msg 'sui_client_cmd')"
    msg "sui_client_follow_prompts"
fi
echo ""
msg "sui_get_faucet"
echo "   1. $(msg 'sui_faucet_sui_cmd')"
echo "   2. $(msg 'sui_faucet_toma_cmd')"
echo ""
msg "sui_check_balance_cmd"
echo ""

if ! prompt_yes_no "sui_setup_complete_prompt"; then
    msg "prompt_abort"
    exit 1
fi
pause_and_continue

# --- Step 3: Clone Repos ---
msg "section_clone_repos"
clone_repo() {
    local url="$1"
    local dir="$2"
    if [ ! -d "$dir" ]; then
        msg "cloning_repo" "$dir"
        git clone --depth 1 "$url" "$dir" || { msg "error_cloning" "$dir"; exit 1; }
    else
        msg "repo_exists" "$dir"
    fi
}
clone_repo "$ATOMA_CONTRACTS_REPO_URL" "$ATOMA_CONTRACTS_DIR"
clone_repo "$ATOMA_NODE_REPO_URL" "$ATOMA_NODE_DIR"
pause_and_continue

# --- Step 4: Interact with Atoma Contracts ---
msg "section_atoma_contracts"
msg "atoma_contracts_navigate"
echo "   $(msg 'atoma_contracts_cd_cmd')"
echo ""
msg "atoma_contracts_register"
echo "   $(msg 'atoma_contracts_register_cmd')"
msg "atoma_contracts_register_note"
echo ""
msg "atoma_contracts_subscribe"
echo "   $(msg 'atoma_contracts_subscribe_cmd')"
msg "atoma_contracts_subscribe_note"
echo ""

if ! prompt_yes_no "atoma_contracts_complete_prompt"; then
    msg "prompt_abort"
    exit 1
fi
pause_and_continue

# --- Step 5: Configure Atoma Node ---
msg "section_atoma_node_config"
msg "atoma_node_config_navigate"
echo "   $(msg 'atoma_node_config_cd_cmd')"
echo ""
msg "atoma_node_config_copy_env"
echo "   $(msg 'atoma_node_config_copy_env_cmd')"
msg "atoma_node_config_edit_env"
echo ""
msg "atoma_node_config_copy_toml"
echo "   $(msg 'atoma_node_config_copy_toml_cmd')"
msg "atoma_node_config_edit_toml"
echo ""

if ! prompt_yes_no "atoma_node_config_complete_prompt"; then
    msg "prompt_abort"
    exit 1
fi
pause_and_continue

# --- Step 6: Run Atoma Node ---
msg "section_run_node"
msg "atoma_node_run_navigate"
echo "   $(msg 'atoma_node_run_cd_cmd')"
echo ""
msg "atoma_node_run_choose_mode"
echo ""
msg "atoma_node_run_example_non_conf"
echo "   $(msg 'atoma_node_run_cmd_non_conf')"
echo ""
msg "atoma_node_run_example_conf"
echo "   $(msg 'atoma_node_run_cmd_conf')"
echo ""
msg "atoma_node_run_note"
echo ""
msg "atoma_node_run_complete"
echo "------------------------------------------------------------------"

exit 0
