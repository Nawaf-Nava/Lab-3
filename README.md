# Lab 3 — Apache Tomcat Ghostcat (CVE-2020-1938)

This repository contains an intentionally outdated Apache Tomcat image for a controlled coursework environment.

## Scope and safety

- The target is intended for a local, isolated Docker environment.
- Both Tomcat ports are published on the host loopback interface only: `127.0.0.1`.
- Do not change the port bindings to `0.0.0.0`, expose AJP (8009) to the public internet, or deploy this vulnerable image as a public Render web service.
- Use only on a machine and network you control, and remove the lab when coursework is complete.

## Lab components

- Tomcat image: `tomcat:9.0.30-jdk11` (an affected Tomcat 9.0.x release)
- HTTP: `http://127.0.0.1:8080`
- AJP: `127.0.0.1:8009`
- Docker Compose binds both ports to localhost, not to external network interfaces.

## Requirements

- Docker Engine
- Docker Compose plugin

## Start

From the repository directory:

```bash
docker compose up --build -d
docker compose ps
docker compose logs --tail=80 tomcat-ghostcat-lab
```

Open `http://127.0.0.1:8080` to confirm that Tomcat responds.

## Stop and remove

```bash
docker compose down
docker image rm lab-3-tomcat-ghostcat-lab 2>/dev/null || true
```

## Coursework evidence

Capture screenshots of:
1. Docker and Docker Compose versions.
2. The image build completing.
3. The container running and its loopback-only port bindings.
4. The Tomcat landing page.
5. The container logs.
6. The lab being stopped and removed.

## Important note about Render

A public Render web service would expose the intentionally vulnerable target to the internet. This repository therefore does not configure a public deployment of the vulnerable Tomcat service. Render may be used for a separate, non-vulnerable project page or report, while the vulnerable target remains isolated.

## Reference

CVE-2020-1938 (Ghostcat) affects specific Apache Tomcat versions and configurations. This lab pins Tomcat 9.0.30 for historical coursework reproduction; it is not suitable for production.
