# API Security Setup

## Important: Securing Your API Keys

This project has been configured to keep API keys secure and prevent them from being committed to git.

### Setup Instructions

1. **Copy the template file:**
   ```bash
   cp lib/config/api_keys_template.dart lib/config/api_keys.dart
   ```

2. **Add your real API key:**
   - Open `lib/config/api_keys.dart`
   - Replace `"YOUR_ACTUAL_NEWS_API_KEY_HERE"` with your actual NewsAPI key
   - Get a free API key from: https://newsapi.org/

3. **Verify .gitignore:**
   - The file `lib/config/api_keys.dart` should be ignored by git
   - Check with: `git status` - it should not appear in untracked files

### Files Structure

- `lib/config/api_config.dart` - Main configuration (safe to commit)
- `lib/config/api_keys_template.dart` - Template with instructions (safe to commit)  
- `lib/config/api_keys.dart` - Your actual API keys (NEVER commit this)

### Git History Cleaning

The repository has been cleaned of previous API key commits using `git filter-repo`.

### Security Checklist

- ✅ API keys moved to separate file
- ✅ api_keys.dart added to .gitignore
- ✅ Git history cleaned of API keys
- ✅ Template file created for new contributors
- ✅ All service files updated to use secure config

### For New Contributors

1. Create your own `api_keys.dart` file from the template
2. Add your own NewsAPI key
3. Never commit the api_keys.dart file

## Troubleshooting

If you see compilation errors about missing api_keys.dart:
1. Make sure you've copied the template file
2. Make sure you've added your actual API key
3. Restart your IDE/development server