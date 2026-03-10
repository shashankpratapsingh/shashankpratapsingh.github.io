# Academic Website Template

A clean, elegant, and easy-to-maintain website template for academics. Built with [Hugo](https://gohugo.io/).

## Quick Start

### 1. Run Locally
```bash
# Start the development server
hugo server -D
```
Open **http://localhost:1313** in your browser. The `-D` flag ensures draft posts are visible.

### 2. Build for Production
```bash
# Generate the public/ folder
hugo --cleanDestinationDir
```
The content of the `public/` directory is what you upload to your web host (GitHub Pages, Netlify, etc.).

---

## How to Use This Site

**For content updates (adding papers, blog posts, changing bio), please read: [MAINTENANCE.md](MAINTENANCE.md)**

This guide is written specifically for academics and covers:
- Adding publications and talks
- Writing blog posts
- Updating your CV and contact info
- Changing your profile picture

---

## Technical Details (For Developers)

### Code Organization

```
custom-academic-site/
├── content/              # Content (Markdown files)
│   ├── blog/            # Blog posts
│   ├── publications/    # Publications page
│   ├── teaching/        # Teaching page
│   └── _index.md        # Homepage bio
├── data/                # Structured Data (YAML)
│   ├── publications.yaml  # List of talks and papers
│   └── teaching.yaml      # Teaching history
├── layouts/             # Layout Overrides
│   └── _default/
│       └── baseof.html  # Main site template (header/footer/nav)
├── static/              # Static Assets
│   ├── assets/
│   │   ├── images/      # Profile pic, photos
│   │   └── pdf/         # CV, papers
│   └── css/             # CSS Overrides
│       └── style.css    # Main stylesheet
├── themes/              # Theme Files (do not edit directly)
└── hugo.toml            # Site Configuration
```

### Key Customizations

#### 1. Navigation & Header
The main template is overridden in `layouts/_default/baseof.html`. This file contains:
- The HTML structure for the header and footer.
- The navigation menu logic.
- The "Constellation Effect" canvas (currently disabled/commented out).

#### 2. Styling
The site uses a custom stylesheet at `static/css/style.css` which overrides the theme's defaults. Key areas to look for:
- `:root` variables for colors and spacing.
- `.post-item` for blog tile styling.
- `nav a` for navigation link styling (animations, etc.).

### Troubleshooting

**Changes not showing?**
1. Stop the server (`Ctrl+C`).
2. Run `hugo server -D` again.
3. Hard refresh your browser (`Ctrl+Shift+R`).
4. If styling issues persist, try clearing your browser cache.

**"Constellation Effect"**
There is a hidden graph-theory visualization in `layouts/_default/baseof.html`. To enable it, uncomment the `<canvas>` tag and the script block at the bottom of the file.

---

## License

This project is open source. Feel free to modify and use it for your own academic website.

