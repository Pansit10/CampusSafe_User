# CampusSafe User Mobile

CampusSafe User Mobile is the user-facing mobile application for the CampusSafe system.

This project is built using **Flutter** and **Dart**.

---

## Requirements

Before running the project, make sure you have installed:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android SDK
- Git

Check if Flutter is installed correctly:

```bash id="ue2n6g"
flutter doctor
```

You can also check:

```bash id="xg3r10"
flutter --version
dart --version
git --version
```

Fix any important issues shown by `flutter doctor` before running the application.

---

## Clone the Repository

```bash id="0ndly3"
git clone https://github.com/Pansit10/CampusSafe_User.git
```

Go to the project folder:

```bash id="y9cvdq"
cd CampusSafe_User
```

If your local project folder has a different name, open that folder instead.

---

## Install Dependencies

Run:

```bash id="n37ggj"
flutter pub get
```

This installs all packages defined in `pubspec.yaml`.

---

## Run the Application

First, make sure an Android emulator or physical device is connected.

Check available devices:

```bash id="spfrrp"
flutter devices
```

Then run:

```bash id="gf4rsz"
flutter run
```

If multiple devices are available, Flutter may ask which device you want to use.

---

## Run on a Specific Device

Check device IDs:

```bash id="2o6ycu"
flutter devices
```

Then:

```bash id="2dcic3"
flutter run -d DEVICE_ID
```

Example:

```bash id="7gzcmq"
flutter run -d emulator-5554
```

---

## Useful Flutter Commands

Get dependencies:

```bash id="q2h2hh"
flutter pub get
```

Check project issues:

```bash id="9ej7jx"
flutter analyze
```

Format Dart code:

```bash id="77j4vj"
dart format .
```

Run tests:

```bash id="jg0ada"
flutter test
```

Clean generated build files:

```bash id="2642lp"
flutter clean
```

Then reinstall packages:

```bash id="rjbtfx"
flutter pub get
```

---

# Git Branch Workflow

## Important Rule

Do **not** develop directly on the `main` branch.

The `main` branch should contain only stable and tested code.

For every new feature, bug fix, UI update, or experiment:

1. Update your local `main`
2. Create a new branch
3. Develop the feature
4. Test the mobile application
5. Commit your changes
6. Push the branch
7. Create a Pull Request
8. Review and test
9. Merge into `main`

---

## 1. Check Your Current Branch

```bash id="sydl81"
git branch
```

The current branch is marked with `*`.

Example:

```text id="kjwk7n"
* main
```

You can also use:

```bash id="6ytrq9"
git branch --show-current
```

---

## 2. Update Main Before Starting Work

Always update your local `main` before creating a new branch.

```bash id="hu69ax"
git checkout main
git pull origin main
```

---

## 3. Create a New Branch

Create and switch to a new branch:

```bash id="ndb9ay"
git checkout -b branch-name
```

Example:

```bash id="icq2tc"
git checkout -b feature/login-screen
```

Other examples:

```bash id="0oxc1g"
git checkout -b feature/register-screen
```

```bash id="7fn2bj"
git checkout -b feature/incident-report
```

```bash id="o1djbt"
git checkout -b feature/map-screen
```

---

# Recommended Branch Naming

Use descriptive branch names.

### Features

```text id="d7dr56"
feature/login-screen
feature/register-screen
feature/home-screen
feature/incident-report
feature/map-screen
feature/profile-screen
feature/sos-feature
```

### Bug Fixes

```text id="22jvnf"
fix/login-validation
fix/navigation-error
fix/map-location
fix/form-validation
```

### UI Updates

```text id="h29rau"
ui/login-redesign
ui/home-layout
ui/profile-screen
```

### Testing

```text id="rpzxwg"
test/login-flow
test/incident-report
test/navigation
```

### Other Changes

```text id="6aqfy7"
chore/update-packages
docs/update-readme
refactor/auth-flow
```

---

## 4. Develop Your Feature

Make changes normally while inside your feature branch.

Check your current branch:

```bash id="zr310v"
git branch
```

Check modified files:

```bash id="1x4rio"
git status
```

---

## 5. Test Before Committing

Before committing, run the app:

```bash id="ahsjm5"
flutter run
```

Also check for Dart and Flutter issues:

```bash id="bmmn5i"
flutter analyze
```

If your project contains tests:

```bash id="vtv9wp"
flutter test
```

Only create a Pull Request when the feature works correctly.

---

## 6. Add Changes

Add all modified files:

```bash id="k6xvrg"
git add .
```

Then check:

```bash id="oxjeh8"
git status
```

Make sure only the files you want are included.

---

## 7. Commit Changes

Example:

```bash id="cgl2qn"
git commit -m "Add login screen"
```

Other examples:

```bash id="bx68jm"
git commit -m "Add incident reporting screen"
```

```bash id="fz3bao"
git commit -m "Fix login form validation"
```

```bash id="qo3c4w"
git commit -m "Update profile screen UI"
```

Use short and clear commit messages.

---

## 8. Push the Branch

For the first push of a new branch:

```bash id="yvecd3"
git push -u origin branch-name
```

Example:

```bash id="9fko8o"
git push -u origin feature/login-screen
```

After the first push:

```bash id="f3ny0y"
git push
```

---

# Create a Pull Request

After pushing your branch:

1. Open the GitHub repository.
2. Click **Compare & pull request**.
3. Make sure the Pull Request uses:

```text id="35ng7w"
base: main
compare: your-branch-name
```

Example:

```text id="87jflm"
base: main
compare: feature/login-screen
```

4. Add a clear title.
5. Add a description of the changes.
6. Create the Pull Request.
7. Review the changes.
8. Test the app if necessary.
9. Merge only when the feature is stable.

---

# Pull Request Example

```text id="h2sa0w"
Title:
Add user login screen

Description:
- Added login UI
- Added email and password validation
- Added navigation to register screen
- Tested on Android emulator
```

---

# After Merging

After your Pull Request has been merged into `main`, return to the main branch:

```bash id="1yk5af"
git checkout main
```

Download the latest changes:

```bash id="gjd8fu"
git pull origin main
```

Delete the old local branch:

```bash id="vi8tlp"
git branch -d branch-name
```

Example:

```bash id="9sl0gz"
git branch -d feature/login-screen
```

Then create a new branch for the next feature:

```bash id="6xho2g"
git checkout -b feature/new-feature
```

---

# Daily Development Workflow

Before starting a new task:

```bash id="zqdj5o"
git checkout main
git pull origin main
git checkout -b feature/my-feature
```

Develop and test:

```bash id="35cwu9"
flutter pub get
flutter run
flutter analyze
```

Then commit and push:

```bash id="n3uhoo"
git add .
git commit -m "Add my feature"
git push -u origin feature/my-feature
```

Then create a Pull Request:

```text id="ni7y2k"
feature/my-feature
        ↓
     Testing
        ↓
  Pull Request
        ↓
      main
```

---

# Example Workflow

Suppose you want to update the Login screen.

First:

```bash id="3qq3yq"
git checkout main
git pull origin main
```

Create a branch:

```bash id="ycnjsp"
git checkout -b feature/login-screen
```

Develop the Login screen.

Run:

```bash id="rpc5cm"
flutter run
```

Check code:

```bash id="tdcvpf"
flutter analyze
```

If everything works:

```bash id="lopm4r"
git add .
git commit -m "Improve login screen"
git push -u origin feature/login-screen
```

Then create a Pull Request:

```text id="4vew6e"
feature/login-screen → main
```

After merging:

```bash id="wx9nqd"
git checkout main
git pull origin main
git branch -d feature/login-screen
```

---

# Project Structure

A Flutter project may look similar to:

```text id="x8o4j3"
campussafe_mobile/
├── android/
├── ios/
├── lib/
│   ├── data/
│   ├── models/
│   ├── routes/
│   ├── screens/
│   │   ├── alerts/
│   │   ├── auth/
│   │   ├── home/
│   │   ├── incidents/
│   │   ├── map/
│   │   ├── profile/
│   │   ├── sos/
│   │   └── splash/
│   ├── theme/
│   ├── widgets/
│   ├── app.dart
│   └── main.dart
├── test/
├── pubspec.yaml
└── README.md
```

Keep reusable widgets, screens, models, routes, and other logic organized properly as the application grows.

---

# `.gitignore`

Flutter automatically creates a `.gitignore`.

Make sure generated files and local environment files are not committed.

Common ignored files include:

```gitignore id="w4bf9y"
.dart_tool/
.packages
.pub/
build/
.flutter-plugins
.flutter-plugins-dependencies

.idea/
.vscode/
*.iml

android/.gradle/
android/local.properties

.env
.env.*
```

Do not commit passwords, API secrets, private keys, or sensitive configuration files.

---

# Important Git Rules

- Never develop directly on `main`.
- Always create a branch for every task.
- Pull the latest `main` before starting a new branch.
- Run `flutter analyze` before creating a Pull Request.
- Test the application before merging.
- Use clear branch names.
- Use clear commit messages.
- Do not commit build files.
- Do not commit secret environment variables.
- Merge only stable code into `main`.

---

# Recommended Workflow

```text id="opjuny"
main
 │
 ├── feature/login-screen
 │         │
 │         ├── Develop
 │         ├── flutter run
 │         ├── flutter analyze
 │         └── Test
 │
 │             ↓
 │        Pull Request
 │             ↓
 └──────────> main
```

The goal is to keep `main` stable while all development, testing, and experiments happen inside separate branches.