# Flutter Interview Project

This Flutter project is a demonstration of various features and components commonly used in Flutter applications. It includes state management, custom widgets, and responsive UI design.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Dependencies](#dependencies)
- [Screenshots](#screenshots)

## Project Overview

The project showcases a dashboard interface with a carousel slider, icon grid, transaction list, and bottom navigation. The state management is handled using the `provider` package.

## Features

- **Dashboard Page**: Includes a carousel slider, icon grid, and transaction list.
- **State Management**: Managed using the `provider` package.
- **Custom Widgets**: Several custom widgets are implemented, including the bottom navigation bar, carousel slider, and more.
- **Responsive UI**: The UI components are responsive to different screen sizes.

## Requirements
1. Android studio.
2. Visual studio IDE(optional)
3. Virtual device or physical device
4. The latest stable version of flutter and dart.
5. Windows 10 or higher.

## Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/swafey-karanja/flutter_interview.git
   cd flutter_interview
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Check that all requirements are satisfied.**
    ```bash
   flutter doctor
   ```
5. **Start a virtual device on android studio or connect a physical device**

6. **Run the project**:
   ```bash
   flutter run
   ```

## Usage

Once the project is running, you will be presented with a dashboard interface that includes:

- A carousel slider for displaying images.
- An icon grid with options like Transfer, Withdraw, and Topup.
- A transaction list that displays recent transactions.
- A bottom modal sheet that displays more services that the user can access.
- A floating action button that opens the bottom modal sheet.

You can interact with the bottom navigation to switch between different sections of the app.

## File Structure

Here’s a brief overview of the key files in the project:

```plaintext
lib/
├── main.dart                  # Main entry point of the Flutter app
├── pages/
│   └── dashboard_page.dart    # Dashboard UI implementation
├── providers/
│   └── dashboard_provider.dart # State management for the dashboard
├── utils/
│   └── constants.dart         # Common constants like text styles
├── widgets/
│   ├── bottom_navigation_widget.dart  # Custom bottom navigation bar
│   ├── carousel_slider_widget.dart    # Carousel slider for images
│   ├── icon_grid_widget.dart          # Grid layout for action icons
│   └── transaction_list_widget.dart   # Transaction list widget
pubspec.yaml                  # Project dependencies and configuration
```

## Dependencies

This project uses the following dependencies:

- **Flutter SDK**: The core framework.
- **Provider**: State management.
- **Carousel Slider**: For creating the image slider.

Check the `pubspec.yaml` file for more details.

## Screenshots
The screenshots below are of a virtual device that I used to visualise the development process.

![image](https://github.com/user-attachments/assets/753c64e0-d07b-4bf9-b267-59c730f454a3)
![image](https://github.com/user-attachments/assets/d7bfccb7-e2b8-4940-9e94-3cd8dad1c0f1)
![image](https://github.com/user-attachments/assets/dcc72b93-3b48-4d39-ae53-9db296e26104)




