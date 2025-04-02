# Atoma Node Guided Setup Script

This script provides a guided walkthrough to help set up an [Atoma Network Node](https://docs.atoma.network/node/get-started/setup-node). It checks for prerequisites, clones the necessary repositories, and provides step-by-step instructions for the manual configuration and execution required by the official Atoma documentation.

**Important:** This script **does not** fully automate the setup due to required manual steps like SUI client interaction, configuration file editing, and final execution choices. It serves as a checklist and helper.

---

## English Instructions

### How to Use

1.  Navigate to the directory containing this README and the script (e.g., `atoma-node-setup`).
2.  Make the script executable (if not already):
    ```bash
    chmod +x start_atoma_node.sh
    ```
3.  Run the script:
    ```bash
    ./start_atoma_node.sh
    ```
4.  The script will first ask for your preferred language (English/Chinese).
5.  It will then guide you through the following stages:
    *   **Prerequisites Check:** Verifies if essential tools (`git`, `curl`, `cargo`, `sui`, `docker`, `docker compose`) are likely installed and reminds you about system libraries. It prompts for confirmation before proceeding.
    *   **SUI Client Setup:** Checks for existing SUI configuration and provides commands for manual setup (`sui client`) and obtaining faucet tokens (`sui client faucet`, `sui client call ...`). It prompts for confirmation.
    *   **Repository Cloning:** Automatically clones the `atoma-contracts` and `atoma-node` repositories into the current directory if they don't exist.
    *   **Atoma Contract Interaction (Manual):** Provides the necessary `cd` and `./dev/cli` commands to register your node and subscribe it to a task. You need to run these in a separate terminal and note down the output (node ID, badge ID). It prompts for confirmation.
    *   **Atoma Node Configuration (Manual):** Instructs you to navigate to the `atoma-node` directory, copy the example `.env` and `config.toml` files, and edit them with your specific details (PostgreSQL credentials, models, node/badge IDs from the previous step). It prompts for confirmation.
    *   **Run Atoma Node (Manual):** Provides example `docker compose` commands for running the node (non-confidential and confidential modes). You need to choose the appropriate command based on your setup and configuration.

Follow the instructions provided by the script at each step. You will need to perform actions in other terminals and edit configuration files manually.

---

## 中文说明 (Chinese Instructions)

### 如何使用

1.  导航到包含此 README 和脚本的目录 (例如 `atoma-node-setup`)。
2.  赋予脚本执行权限 (如果尚未执行)：
    ```bash
    chmod +x start_atoma_node.sh
    ```
3.  运行脚本：
    ```bash
    ./start_atoma_node.sh
    ```
4.  脚本首先会询问您的首选语言 (英语/中文)。
5.  然后它将引导您完成以下阶段：
    *   **先决条件检查:** 验证基本工具 (`git`, `curl`, `cargo`, `sui`, `docker`, `docker compose`) 是否可能已安装，并提醒您系统库。在继续之前，它会提示您确认。
    *   **SUI 客户端设置:** 检查现有的 SUI 配置，并提供手动设置 (`sui client`) 和获取测试代币 (`sui client faucet`, `sui client call ...`) 的命令。它会提示您确认。
    *   **仓库克隆:** 如果 `atoma-contracts` 和 `atoma-node` 仓库在当前目录中不存在，则自动克隆它们。
    *   **Atoma 合约交互 (手动):** 提供必要的 `cd` 和 `./dev/cli` 命令来注册您的节点并将其订阅到任务。您需要在单独的终端中运行这些命令，并记下输出 (节点 ID, badge ID)。它会提示您确认。
    *   **Atoma 节点配置 (手动):** 指导您导航到 `atoma-node` 目录，复制示例 `.env` 和 `config.toml` 文件，并使用您的特定详细信息（PostgreSQL 凭据、模型、上一步中的节点/badge ID）编辑它们。它会提示您确认。
    *   **运行 Atoma 节点 (手动):** 提供用于运行节点的示例 `docker compose` 命令（非机密和机密模式）。您需要根据您的设置和配置选择适当的命令。

请按照脚本在每个步骤提供的说明进行操作。您将需要在其他终端中执行操作并手动编辑配置文件。
