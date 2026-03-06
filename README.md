# Flutter Interview Preparation

### Topics 
- UI creation - Auth(Login, Register), Main(Home, Settings)
- Application routes - `go_router`
- Bloc usage - application state management(`flutter_bloc`, `equatable`)
- Secure Token storage - Jwt token storing
- Backend API comsumed (Network layer) - `http`

### Application Architecture
```
lib
 ├── config
 │    └── api_config.dart
 │
 ├── models
 │    └── user_model.dart
 │
 ├── services
 │    ├── auth_service.dart
 │    └── api_service.dart
 │
 ├── storage
 │    └── token_storage.dart
 │
 ├── screens
 │    ├── login_screen.dart
 │    └── home_screen.dart
 │
 └── router
      └── app_router.dart
```

### App Glipmses

<img width="200" height="450" alt="Simulator Screenshot - iPhone 17 Pro - 2026-03-06 at 14 17 45" src="https://github.com/user-attachments/assets/3c26c0af-8b59-49cf-b5a9-8a12a704a501" />
<img width="200" height="450" alt="Simulator Screenshot - iPhone 17 Pro - 2026-03-06 at 14 17 50" src="https://github.com/user-attachments/assets/67e1d1b7-f11e-4946-8ccf-ab343c2f9779" />

- Video

https://github.com/user-attachments/assets/6937fe57-b4a6-4ce2-a5cf-7f4cf0d305f8



