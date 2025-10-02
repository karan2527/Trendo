# 📰 Trendo - Modern News App

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/News_API-FF6B35?style=for-the-badge&logo=rss&logoColor=white" alt="News API">
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android">
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS">
</div>

<div align="center">
  <h3>🚀 A Beautiful, Modern News Application Built with Flutter</h3>
  <p>Stay updated with the latest news from around the world with an intuitive and elegant user interface.</p>
</div>

---

## ✨ Features

### 🎯 Core Features
- **📱 Modern UI/UX Design** - Clean, intuitive interface following Material Design principles
- **🌍 Global News Coverage** - Access to worldwide news from reliable sources
- **📂 Category-Based Navigation** - Organized news sections (Business, Entertainment, Science, Sports, Technology)
- **🔄 Real-time Updates** - Latest news fetched from NewsAPI
- **📖 Full Article View** - Integrated WebView for complete article reading
- **🎨 Responsive Design** - Optimized for various screen sizes and orientations

### 🛡️ Technical Features
- **🔐 Secure API Key Management** - Environment variables for sensitive data
- **⚡ Optimized Performance** - Efficient API calls and image loading
- **🌐 Network Error Handling** - Graceful handling of connectivity issues
- **📱 Cross-Platform** - Runs seamlessly on both Android and iOS
- **🎭 Loading States** - Beautiful loading indicators and error states

---

## 📱 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center"><strong>Home Screen</strong></td>
      <td align="center"><strong>Category View</strong></td>
      <td align="center"><strong>Article Reader</strong></td>
    </tr>
    <tr>
      <td><img src="Screenshots\Home_Screen.jpeg" width="250" alt="Home Screen"/></td>
      <td><img src="Screenshots\Business_category.jpeg" width="250" alt="Category View"/></td>
      <td><img src="Screenshots\News_Sports.jpeg" width="250" alt="Sports View"/></td>
      <td><img src="Screenshots\Sports_Category.jpeg" width="250" alt="Category View"/></td>
      <td><img src="Screenshots\News.jpeg" width="250" alt="Article Reader"/></td>
    </tr>
  </table>
</div>

---

## 🛠️ Technology Stack

| Technology | Purpose | Version |
|------------|---------|---------|
| **Flutter** | Cross-platform UI framework | Latest |
| **Dart** | Programming language | Latest |
| **NewsAPI** | News data source | v2 |
| **HTTP** | API communication | ^1.5.0 |
| **WebView Flutter** | In-app browser | ^3.0.1 |
| **Flutter DotEnv** | Environment variables | ^5.2.1 |

---

## 🚀 Quick Start

### Prerequisites

Before you begin, ensure you have the following installed:
- **Flutter SDK** (Latest stable version)
- **Dart SDK** (Included with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/trendo.git
   cd trendo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   ```bash
   # Copy the environment template
   cp .env.example .env
   
   # Edit .env and add your NewsAPI key
   # Get your free API key from: https://newsapi.org/
   ```

4. **Configure your API Key**
   
   Edit the `.env` file:
   ```env
   NEWS_API_KEY=your_actual_api_key_here
   ```

5. **Run the application**
   ```bash
   flutter run
   ```

---

## 🔧 Configuration

### NewsAPI Setup

1. Visit [NewsAPI.org](https://newsapi.org/)
2. Create a free account
3. Generate your API key
4. Add the key to your `.env` file as shown above

### Environment Variables

The application uses environment variables for secure configuration:

```env
# .env file
NEWS_API_KEY=your_newsapi_key_here
```

**⚠️ Important:** Never commit your `.env` file to version control. It's already included in `.gitignore`.

---

## 📁 Project Structure

```
lib/
├── config/
│   ├── api_config.dart          # API configuration management
│   └── api_keys_template.dart   # Template for API keys
├── models/
│   ├── article_model.dart       # Article data model
│   └── show_category.dart       # Category model
├── pages/
│   ├── home.dart               # Main home screen
│   ├── category_news.dart      # Category-specific news
│   ├── article_view.dart       # Full article view
│   └── onboarding.dart         # App onboarding
├── services/
│   ├── news.dart              # General news API service
│   └── show_category_news.dart # Category news service
└── main.dart                  # Application entry point

assets/
├── images/                    # Static images and icons
└── screenshots/              # App screenshots for README
```

---

## 🎨 Key Components

### Home Screen
- **Hottest News** - Horizontal scrollable trending articles
- **Explore Categories** - Circular category navigation
- **Trending News** - Vertical scrollable news feed

### Category Screen
- Dynamic news filtering by category
- Responsive grid layout
- Pull-to-refresh functionality

### Article Viewer
- Full-screen WebView integration
- Loading indicators
- Navigation controls

---


## 📋 Requirements

### Minimum Requirements
- **Flutter**: 3.0.0+
- **Dart**: 3.0.0+
- **Android**: API level 21 (Android 5.0)
- **iOS**: 11.0+

### Recommended
- **RAM**: 4GB minimum, 8GB recommended
- **Storage**: 2GB free space
- **Internet**: Stable connection for news fetching

---


### Common Issues

1. **API Key Not Working**
   - Ensure your NewsAPI key is valid and active
   - Check `.env` file configuration
   - Verify internet connectivity

2. **Build Errors**
   - Run `flutter clean && flutter pub get`
   - Check Flutter version compatibility
   - Ensure all dependencies are up to date

3. **WebView Issues**
   - Enable internet permissions in `android/app/src/main/AndroidManifest.xml`
   - For iOS, configure `Info.plist` for web content

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Trendo News App

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```



<div align="center">
  <h3>⭐ If you found this project helpful, please consider giving it a star!</h3>
  <p>Made with ❤️ using Flutter</p>
</div>
