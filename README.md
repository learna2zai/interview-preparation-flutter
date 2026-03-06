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

