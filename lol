index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Website</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <header>
    <h1>Welcome to My Website</h1>
    <p>Built with a simple script and hosted on GitHub Pages</p>
  </header>

  <main>
    <section>
      <h2>About</h2>
      <p>This is a clean, fast static website that deploys automatically whenever you push to the main branch.</p>
    </section>

    <section>
      <h2>Features</h2>
      <ul>
        <li>Zero build step needed for basic use</li>
        <li>Automatic deployment via GitHub Actions</li>
        <li>Works on any device</li>
      </ul>
    </section>
  </main>

  <footer>
    <p>Made with ❤️ and GitHub</p>
  </footer>

  <script src="script.js"></script>
</body>
</html>
styles.css
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  line-height: 1.6;
  color: #1a1a1a;
  background: #f8f9fa;
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem 1.5rem;
}

header {
  text-align: center;
  margin-bottom: 3rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #e0e0e0;
}

header h1 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
  color: #111;
}

header p {
  color: #555;
  font-size: 1.1rem;
}

main section {
  margin-bottom: 2.5rem;
}

h2 {
  font-size: 1.5rem;
  margin-bottom: 0.75rem;
  color: #222;
}

ul {
  padding-left: 1.5rem;
}

li {
  margin-bottom: 0.4rem;
}

footer {
  text-align: center;
  margin-top: 4rem;
  padding-top: 2rem;
  border-top: 1px solid #e0e0e0;
  color: #777;
  font-size: 0.95rem;
}
script.js
// Simple example script
console.log("Website loaded successfully!");

document.addEventListener("DOMContentLoaded", () => {
  // You can add interactivity here later
});
.github/workflows/deploy.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Pages
        uses: actions/configure-pages@v5

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: '.'

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4

