# 🍽️ Finding Nibbles Spike

Welcome to **Finding Nibbles Spike** — a full-stack prototype built to explore how NestJS (backend) and Flutter (frontend) can be integrated to manage users and their dietary restrictions. This spike showcases essential architecture, database connectivity with PostgreSQL, and real-time UI communication via REST APIs.

---

## 📦 Tech Stack

| Layer       | Technology          |
| ----------- | ------------------- |
| Frontend    | Flutter + Dart      |
| HTTP Client | Dio                 |
| Backend     | NestJS (Node + TS)  |
| ORM         | Prisma              |
| Database    | PostgreSQL (Docker) |
| Admin UI    | pgAdmin             |

---

## 🚀 Features

- ✅ Modular NestJS backend with Prisma ORM
- ✅ PostgreSQL database containerized via Docker
- ✅ User creation and retrieval via REST API
- ✅ Flutter frontend using Dio for HTTP requests
- ✅ Live data updates & form handling
- ✅ pgAdmin setup for visual DB management

---

# Tutorial plan

Here is a link to the Tutorial plan site https://finding-nibbles.gitbook.io/finding-nibbles/

backendCodingChallenge.zip can be found inside the main directory of the FindingNibbles-Spike. This zip contains files necessary for developing backend strucutre for a **dietary-restriction**, additionally, it holds adjustments to the **user.service.ts** and **user.controller.ts** files. Be sure to create the correct sub-directory (folder) for the dietary-restriction resource. If you are having difficulties determining where to put these files, refer to section 5 of the spike.

frontendCodingChallenge.zip can be found inside the main directory of the FindingNibbles-Spike. This zip contains two files, one named **assign_dietary_requirements.dart** and the other **dietary_service.dart**. Be sure to place these files in the correct folders. ... If you are having troubles determining where to place these files refer back to section 7 of the spike.
