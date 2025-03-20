# Aether JupyterLab Setup & Customization

**Version:** 1.0  
**Date:** March 20, 2025  
**Author:** Hawk Eye | Omniversal Aether  

---

## 📌 Overview  

This document outlines the full setup, customization, and automation process for deploying JupyterLab with WP-DOS theming and other enhancements in a Dockerized environment. It serves as the central reference for maintaining and expanding the Aether ecosystem.

---

## 📍 Core Objectives  

✅ Automate JupyterLab deployment and updates  
✅ Store all configurations in a structured repo (**AetherEX**)  
✅ Apply **WP-DOS 1.1 theme** for a custom UI  
✅ Enable persistent **logging & documentation** via Jupyter Notebooks  
✅ Secure **HTTPS & reverse proxy setup via Nginx**  
✅ Maintain **compatibility & modularity** for future expansions  

---

## 🛠️ Deployment Workflow  

1️⃣ **Server Preparation**  
   - Provision Ubuntu-based Droplet  
   - Install required packages: **Docker, Certbot, Nginx**  
   - Fix **DNS & connectivity issues**  
   - Validate **firewall & network settings**  

2️⃣ **JupyterLab Installation**  
   - Pull **JupyterLab Docker image**  
   - Set up **Docker Compose & configuration**  
   - Define **authentication & security policies**  
   - Generate **admin token & system user credentials**  
   - Deploy **JupyterHub in a containerized environment**  

3️⃣ **Reverse Proxy & SSL**  
   - Configure **Nginx as a reverse proxy**  
   - Enable **SSL via Let’s Encrypt (Certbot)**  
   - Validate **domain routing: aether.omniversalmedia.org → JupyterHub**  
   - Troubleshoot **Bad Gateway & SSL issues**  

4️⃣ **WP-DOS 1.1 Theming**  
   - Extract **WP-DOS theme** into `/mnt/data/wp-dos-theme/wp-dos/`  
   - Apply **custom UI & branding inside JupyterLab**  
   - Ensure **theme persistence across restarts**  

5️⃣ **Documentation & Version Control**  
   - Store configurations inside **AetherEX GitHub Repo**  
   - Log deployment progress in **Jupyter Notebook**  
   - Enable **live tracking of system changes** via logs  
   - Document **fixes & best practices for scaling**  

---  

## 📂 File & Repo Structure  

```
/mnt/data/  
 ├── wp-dos-theme/  
 │   ├── wp-dos/ (Extracted theme files)  
 │   ├── assets/  
 │   ├── styles/  
 │   └── config/  
 ├── AetherEX/ (GitHub Repo)  
 │   ├── jupyter_config/  
 │   │   ├── jupyterhub_config.py  
 │   │   ├── docker-compose.yml  
 │   │   └── theme_config.json  
 │   ├── nginx_config/  
 │   │   ├── sites-available/  
 │   │   ├── certbot/  
 │   │   └── ssl_keys/  
 │   ├── deployment_logs/  
 │   ├── scripts/  
 │   │   ├── setup_jupyter.sh  
 │   │   ├── restart_services.sh  
 │   │   ├── backup_config.sh  
```

---

## 🛠️ Key Commands for Deployment  

### 🔹 Install & Configure JupyterLab  
```bash
docker run -d --name jupyterlab -p 8000:8000 -v /srv/jupyterlab:/etc/jupyterhub jupyterhub/jupyterhub
docker ps
```

### 🔹 Apply Nginx Proxy & SSL  
```bash
sudo ln -s /etc/nginx/sites-available/jupyterhub /etc/nginx/sites-enabled/
sudo systemctl restart nginx
sudo certbot --nginx -d aether.omniversalmedia.org
```

### 🔹 Restart Services  
```bash
sudo systemctl restart nginx
docker restart jupyterlab
```

---

## 🔍 Current Issues & Fixes  

| Issue                          | Cause                        | Solution                           |
|--------------------------------|-----------------------------|------------------------------------|
| **JupyterLab not accessible**  | Nginx misconfiguration      | Fix proxy settings & restart      |
| **SSL cert not applied**       | Certbot failed to renew     | Manually renew via `certbot --nginx` |
| **WP-DOS theme not loading**   | Incorrect theme path        | Verify paths & reload theme settings |
| **SSH commands not executing** | Script permission issue     | `chmod +x setup_jupyter.sh`       |

---

## 🚀 Next Steps  

✅ Refine **WP-DOS theme** for better UI/UX  
✅ Automate **JupyterLab deployment via SSH**  
✅ Integrate **GitHub Actions for version control**  
✅ Enable **multi-user support** inside JupyterHub  

---

## 📌 Summary  

This document serves as a **blueprint** for the JupyterHub + WP-DOS project. It provides:  

✅ A **clear deployment strategy**  
✅ A **structured repo for configuration management**  
✅ **Live tracking & automation** of execution  
✅ A **framework for future expansions**  

This marks the beginning of a **fully customized JupyterHub instance**, integrated with **Omniversal UI** for development & creative projects. 🚀🔥

---  

Let me know when you're ready to continue! 💡
