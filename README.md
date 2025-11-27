# Python Web Developer - Internship Project (Todo App)

This repository contains a simple Flask-based Todo application intended as a complete internship deliverable.

## What you get
- Flask web app with REST API and simple frontend
- SQLite database (auto-created)
- Step-by-step execution instructions
- 20-page internship report (report.pdf)
- Demo script for recording video

## Project structure
```
/app
  app.py
  templates/index.html
  todo.db (created at runtime)
/requirements.txt
/report.pdf
/README.md
/demo_script.md
/run.sh
/run_windows.bat
```

## How to run (Linux / Mac)
1. Create virtual environment (recommended):
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```
2. Install requirements:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the app:
   ```bash
   cd app
   python app.py
   ```
4. Open http://localhost:5000 in browser.

## How to run (Windows - PowerShell)
```powershell
python -m venv venv
venv\Scripts\Activate
pip install -r requirements.txt
cd app
python app.py
```

## Notes for the internship report & GitHub
- Add the repository link and a short video demo on your LinkedIn as described by the company.
- The included `report.pdf` is a ready 20-page report tailored for this internship role. Edit if you want to personalize.

## Docker / Docker Compose (run using Docker)

### Using Docker (build + run)
```bash
# build image
docker build -t python-internship-app .

# run container
docker run -p 5000:5000 --name internship_app -v "$(pwd)/data":/app/app -e DB_PATH=todo.db python-internship-app
```
App will be available at http://localhost:5000

### Using docker-compose
```bash
docker-compose up --build -d
# to stop
docker-compose down
```
This compose file maps `./data` to the app directory so the SQLite DB persists on host.