# Aurora Portal

This project is a Maven-managed Java web application packaged as a WAR file. It includes a modern frontend dashboard, a lightweight in-memory backend, and automation scripts for building the app.

## Features
- WAR packaging with Maven
- Modern dashboard UI with cards and a task form
- Java servlet backend with in-memory data storage
- Build automation for Windows and Unix shells

## Build

Windows:
```bat
build.bat
```

Unix/Linux/macOS:
```bash
./build.sh
```

The packaged WAR will appear in `target/aurora-portal.war`.

## Deploy
Copy the generated WAR file to your Tomcat `webapps` folder.
