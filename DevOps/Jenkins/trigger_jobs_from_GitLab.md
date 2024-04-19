# Trigger jobs from GitLab

**In Jenkins:**
1. Open your project
2. Click "Configure" on the left-hand side
3. Scroll down to "Build Triggers" and put a checkmark on "Build when a change is pushed to GitLab." There should be a webhook URL to the right of this text. Copy it and save it for later.
4. Expand the "Advanced..." button
5. Click "Generate" under the secret token section. Copy it and save it for later.
6. Save your changes

**In GitLab:**
1. Open your project
2. Click "Settings" -> "Webhooks" on the left-hand side
3. Paste the Jenkins webhook URL into the "URL" section
4. Paste the secret token into the "Secret token" section
5. Click "Add webhook"
6. Test your webhook by scrolling down to "Project Hooks" at the bottom of the page and click "Test" -> "Push events"
