# AnythingLLM: Self-Hosted Multiuser Setup with Docker

Easily self-host AnythingLLM for multiple users on your own server using Docker. This guide will help you deploy, persist your data, and enable multiuser support so your team or organization can collaborate securely.

---

## Prerequisites
- Docker installed ([Get Docker](https://docs.docker.com/get-docker/))
- (Optional) PowerShell for Windows setup
- Network access between devices (for multiuser access)

---

## Quick Start

1. **Clone this repository**
   ```sh
   git clone <your-repo-url>
   cd <your-repo-directory>
   ```

2. **Pull the latest AnythingLLM Docker image**
   ```sh
   docker pull mintplexlabs/anythingllm:latest
   ```

3. **Set up persistent storage and environment file**
   On Windows (PowerShell):
   ```powershell
   $env:STORAGE_LOCATION="$HOME\Documents\anythingllm"
   If(!(Test-Path $env:STORAGE_LOCATION)) {New-Item $env:STORAGE_LOCATION -ItemType Directory}
   If(!(Test-Path "$env:STORAGE_LOCATION\.env")) {New-Item "$env:STORAGE_LOCATION\.env" -ItemType File}
   ```
   On Linux/macOS:
   ```sh
   export STORAGE_LOCATION="$HOME/anythingllm"
   mkdir -p "$STORAGE_LOCATION"
   touch "$STORAGE_LOCATION/.env"
   ```

4. **Run the container**
   ```sh
   docker run -d -p 3001:3001 \
     --cap-add SYS_ADMIN \
     -v "$STORAGE_LOCATION:/app/server/storage" \
     -v "$STORAGE_LOCATION/.env:/app/server/.env" \
     -e STORAGE_DIR="/app/server/storage" \
     mintplexlabs/anythingllm
   ```

5. **Access the application**
   - Local: http://localhost:3001
   - Network: http://<your-server-ip>:3001

---

## Enabling Multiuser Mode

1. Log in to your AnythingLLM instance as an admin.
2. Go to the **Security** section in the application settings.
3. Click **Enable Multiuser**.
4. Invite or create accounts for your team members.

---

## Important Notes
- Data is persisted in the storage directory you specify.
- Ensure port 3001 is open on your firewall for network/multiuser access.
- All users must be on the same network or have access to your server's IP.
- For permission issues, check UID/GID settings in `.env`.

---

## Troubleshooting
- Permission errors: Check storage directory permissions and `.env` UID/GID.
- Port issues: Ensure port 3001 is not blocked by your firewall.
- Network issues: Verify all users can reach the server IP.

---

## Contributing
Pull requests and issues are welcome! Please open an issue to discuss your ideas or report bugs.

---

