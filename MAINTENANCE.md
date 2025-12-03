# Website Maintenance Guide

> **New to Hugo?** Don't worry! This guide is written for academics who know LaTeX, Python, or C++, but may be new to web development. Hugo is like a "compiler" for websites—you write simple text files, and Hugo generates the HTML for you. You'll never need to write HTML or CSS.

## For Academics Using This Template

If you're taking this template to create your own academic website, here's what you need to know:

### Hugo Concepts (Explained for Academics)

**Think of Hugo like LaTeX:**
- **Content files** (`.md`) = Your `.tex` source files
- **Data files** (`.yaml`) = Your `.bib` bibliography files  
- **Templates** (`layouts/`) = Document class and style files
- **`hugo` command** = `pdflatex` (compiles everything into a website)
- **`hugo server`** = Live preview (like a PDF viewer with auto-refresh)

### Key Differences from LaTeX

| LaTeX | Hugo | Why It's Better |
|-------|------|-----------------|
| Edit `.tex`, run `pdflatex` | Edit `.md`, auto-updates | No manual compilation needed |
| BibTeX entries in `.bib` | YAML entries in `data/` | Easier syntax, no escaping |
| `\section{}`, `\textbf{}` | `## Section`, `**bold**` | Simpler, more readable |
| Figures in `\includegraphics{}` | Images in `static/` | Just drop files in a folder |

### Your First 5 Minutes

1. **Start the local server:**
   ```bash
   cd custom-academic-site
   hugo server -D
   ```
   Open http://localhost:1313 in your browser

2. **Make a change to see it work:**
   - Open `hugo.toml`
   - Change `author = "Your Name"`
   - Save the file
   - Watch your browser auto-update!

3. **Add a publication:**
   - Open `data/publications.yaml`
   - Add a new talk entry (copy the format)
   - Save and see it appear on the Publications page

4. **Write a blog post:**
   ```bash
   hugo new blog/my-first-post.md
   ```
   - Open the created file
   - Write some content
   - Change `draft: false`
   - See it appear on your site!

5. **Build for deployment:**
   ```bash
   hugo --cleanDestinationDir
   ```
   The `public/` folder now contains your complete website.

### What You'll Actually Edit

**99% of your time will be spent on these files:**
- `data/publications.yaml` - Your talks and papers
- `data/teaching.yaml` - Your courses and teaching
- `content/blog/*.md` - Your blog posts
- `hugo.toml` - Your personal information
- `static/assets/pdf/` - Your CV and PDFs

**You'll rarely (if ever) touch:**
- `themes/` - Visual design (like document class files)
- `layouts/` - Templates (like custom LaTeX commands)
- Anything with `.html` or `.css`

---

# Website Maintenance Guide

This guide explains how to maintain and update your academic website without touching HTML or CSS code. All updates are done through simple YAML files, markdown files, or configuration changes.

---

## Quick Reference

| Task | File to Edit | Format |
|------|--------------|--------|
| Add a publication | `data/publications.yaml` | YAML |
| Add a talk | `data/publications.yaml` | YAML |
| Update teaching history | `data/teaching.yaml` | YAML |
| Write a blog post | Create new file in `content/blog/` | Markdown |
| Add photography images | Upload to `static/assets/images/photography/` | Image files |
| Update CV link | `hugo.toml` | TOML config |
| Change profile picture | Replace `static/assets/images/profile.jpg` | Image file |
| Update contact info | `hugo.toml` | TOML config |

---

## 1. Adding Publications and Talks

**File:** `data/publications.yaml`

### Adding a New Talk

Add a new entry under the `talks:` section:

```yaml
talks:
  - title: "Your Talk Title"
    pdf: "/assets/pdf/your-talk.pdf"
    event: "Conference Name"
    event_url: "https://conference-website.com"
```

**Steps:**
1. Open `data/publications.yaml`
2. Add your talk entry at the end of the `talks:` list
3. Upload your PDF to `static/assets/pdf/your-talk.pdf`
4. Save the file

### Adding a New Publication

When you have a published paper, uncomment and edit the `publications:` section:

```yaml
publications:
  - title: "Your Paper Title"
    authors: "Author 1, Author 2, Author 3"
    journal: "Journal Name"
    year: 2025
    pdf: "/assets/pdf/paper.pdf"          # Optional
    arxiv: "2501.12345"                   # Optional
    doi: "10.1234/example"                # Optional
```

**Steps:**
1. Open `data/publications.yaml`
2. Remove the `#` comment symbols from the publications section
3. Add your publication details
4. Upload your PDF to `static/assets/pdf/` if you have one
5. Save the file

---

## 2. Writing a New Blog Post

**Command:** `hugo new blog/post-name.md`

### Quick Start

1. Open a terminal in your site directory
2. Run: `hugo new blog/my-post-title.md`
3. Open the newly created file: `content/blog/my-post-title.md`
4. You'll see pre-filled front matter:

```yaml
---
title: "My Post Title"
date: 2025-11-23T12:00:00-06:00
draft: true
tags: []
summary: ""
---

Write your blog post content here.
```

5. Edit the content below the `---` markers
6. Add tags if desired: `tags: ["representation theory", "hopf algebras"]`
7. Add a summary: `summary: "A brief description of this post"`
8. When ready to publish, change `draft: true` to `draft: false`
9. Save the file

### Writing Content

Use standard Markdown syntax:

```markdown
## Section Heading

This is a paragraph with **bold** and *italic* text.

- Bullet point 1
- Bullet point 2

### Subsection

You can use math: $x^2 + y^2 = z^2$ for inline or:

$$
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
$$

for display math.
```

---

## 3. Updating Teaching History

**File:** `data/teaching.yaml`

### Adding a New Course (Instructor of Record)

Add to the `instructor_of_record` section:

```yaml
instructor_of_record:
  - institution: "University of Iowa"
    courses:
      - name: "Course Name"
        terms: "Spring 2026; Fall 2026"
        description: "Brief description of your responsibilities and class size."
```

### Adding a TA Position

Add to the `teaching_assistant` section:

```yaml
teaching_assistant:
  - institution: "University of Iowa"
    courses:
      - name: "Course Name"
        terms: "Spring 2026"
        description: "Description of your TA duties."
```

### Adding Tutoring Experience

Add to the `tutoring` section:

```yaml
tutoring:
  - name: "Program Name"
    terms: "Spring 2026; Fall 2026"
    description: "Description of tutoring activities."
```

---

## 4. Updating Your CV and Other Documents

**File:** `hugo.toml`

Find the `# Document URLs` section and update the paths:

```toml
[params]
  # Document URLs
  cvUrl = "/assets/pdf/CV_Shashank.pdf"
  researchStatementUrl = "/assets/pdf/Research_Statement_Shashank.pdf"
  teachingPhilosophyUrl = "/assets/pdf/Teaching_Philosophy_Statement.pdf"
```

**Steps:**
1. Upload your new PDF to `static/assets/pdf/`
2. Update the URL in `hugo.toml` to match the filename
3. Save the file

The links will automatically update throughout the site.

---

## 5. Adding Photography Images

**Directory:** `static/assets/images/photography/`

### Steps:
1. Place your images in `static/assets/images/photography/`
2. Supported formats: `.jpg`, `.jpeg`, `.png`, `.webp`
3. Recommended: Optimize images before uploading (max 2000px width)

> **Note:** The photography gallery display is a future enhancement. For now, images can be referenced in blog posts or other content.

### Using Images in Blog Posts

```markdown
![Image description](/assets/images/photography/my-photo.jpg)
```

---

## 6. Changing Your Profile Picture

**File:** `static/assets/images/profile.jpg`

### Steps:
1. Prepare your photo (recommended: square aspect ratio, at least 400x400px)
2. Save it as `profile.jpg`
3. Replace the file at `static/assets/images/profile.jpg`
4. Refresh your browser to see the change

The profile picture displays in the hero section on the homepage.

---

## 7. Updating Contact Information

**File:** `hugo.toml`

Find the `[params]` section and update your details:

```toml
[params]
  author = "Your Full Name"
  firstName = "First"
  lastName = "Last Name"
  role = "Your Title"
  affiliation = "Your University"
  address = "Building and Room Number"
  city = "City, State ZIP"
  email = "your-email@university.edu"
```

These values are used throughout the site (header, footer, homepage).

---

## 8. Configuring Social Media Links

**File:** `hugo.toml`

You can add social media icons to your site header/footer by uncommenting lines in the `[params.social]` section.

```toml
[params.social]
  email = "your-email@university.edu"
  # orcid = "0000-0000-0000-0000"
  # scholar = "your-scholar-id"
  # github = "your-username"
  # twitter = "your-handle"
  # linkedin = "your-username"
```

**Steps:**
1. Open `hugo.toml`
2. Find `[params.social]`
3. Uncomment the services you want to use (remove `#`)
4. Replace the placeholder with your actual username or ID
5. Save to see the icons appear

---

## 9. Building and Deploying the Site

### Local Preview

To preview your changes locally:

```bash
hugo server -D
```

Then open http://localhost:1313 in your browser. The `-D` flag shows draft posts.

### Building for Production

To build the final site:

```bash
hugo --cleanDestinationDir
```

This creates the site in the `public/` directory.

### Deployment

The `public/` directory contains your complete website. Upload it to your web host:

- **GitHub Pages:** Push the `public/` folder to your gh-pages branch
- **Netlify:** Connect your repository and set build command to `hugo`
- **Traditional hosting:** Upload `public/` contents via FTP/SFTP

---

## File Structure Reference

```
custom-academic-site/
├── content/              # Your content files
│   ├── blog/            # Blog posts (create new posts here)
│   ├── publications/    # Publications page
│   ├── teaching/        # Teaching page
│   └── _index.md        # Homepage content
├── data/                # Data files (YAML)
│   ├── publications.yaml  # Talks and publications
│   └── teaching.yaml      # Teaching history
├── static/              # Static files (images, PDFs)
│   └── assets/
│       ├── images/
│       │   ├── profile.jpg      # Your profile picture
│       │   └── photography/     # Photography images
│       └── pdf/                 # CV, papers, talks
└── hugo.toml            # Site configuration
```

---

## Common Issues and Solutions

### Issue: Changes don't appear on the site

**Solution:** 
1. Stop the Hugo server (Ctrl+C)
2. Run `hugo server -D` again
3. Hard refresh your browser (Ctrl+Shift+R or Cmd+Shift+R)

### Issue: Blog post doesn't show up

**Solution:** Check if `draft: true` in the front matter. Change to `draft: false` or use `hugo server -D` to preview drafts.

### Issue: Image doesn't display

**Solution:** 
1. Verify the image is in `static/assets/images/`
2. Use the path `/assets/images/filename.jpg` (no "static" in the URL)
3. Check file extension matches (case-sensitive on some servers)

### Issue: YAML syntax error

**Solution:**
1. Check indentation (use spaces, not tabs)
2. Ensure colons have a space after them: `title: "Example"`
3. Quote strings with special characters: `title: "Title: With Colon"`

---

## Getting Help

- **Hugo Documentation:** https://gohugo.io/documentation/
- **Markdown Guide:** https://www.markdownguide.org/
- **YAML Syntax:** https://yaml.org/spec/1.2/spec.html

For site-specific questions, refer to the theme documentation in `themes/elegant-academic/`.
