# Flutter Interview Project

This Flutter project is a demonstration of various features and components commonly used in Flutter applications. It includes state management, custom widgets, and responsive UI design.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The project showcases a dashboard interface with a carousel slider, icon grid, transaction list, and bottom navigation. The state management is handled using the `provider` package.

## Features

- **Dashboard Page**: Includes a carousel slider, icon grid, and transaction list.
- **State Management**: Managed using the `provider` package.
- **Custom Widgets**: Several custom widgets are implemented, including the bottom navigation bar, carousel slider, and more.
- **Responsive UI**: The UI components are responsive to different screen sizes.

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

3. **Run the project**:
   ```bash
   flutter run
   ```

## Usage

Once the project is running, you will be presented with a dashboard interface that includes:

- A carousel slider for displaying images.
- An icon grid with options like Transfer, Withdraw, and Topup.
- A transaction list that displays recent transactions.

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

```
