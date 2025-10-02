# ----------------------------------------
# 1. Update system & install dependencies
# ----------------------------------------
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git docker.io docker-compose

# ------------------------------
# 2. Enable Docker service
# ------------------------------
sudo systemctl enable docker --now

# ------------------------------
# 3. Add user to Docker group
# ------------------------------
sudo usermod -aG docker $USER

# ------------------------------
# 4. Install Airbyte CLI (abctl)
# ------------------------------
curl -L https://get.airbyte.com | bash

# ------------------------------
# 5. Install local Airbyte Core
# ------------------------------
abctl local install

# -------------------------------
# 6. Display Airbyte credentials
# -------------------------------
abctl local credentials