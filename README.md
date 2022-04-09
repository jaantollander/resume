# Resume
This repository contains my resume. I adapted it from the [Pandoc Resume](https://github.com/mszep/pandoc_resume).

We can build the resume locally using the shell script. The script requires Pandoc and ConTeXt.

```sh
./build.sh pdf
./build.sh html
```

We can invoke GitHub Actions to publish the HTML and PDF version of the resume to GitHub Pages by adding a new Git tag and pushing it to GitHub.

```sh
git tag <tag-name>
git push <tag-name>
```

The [**HTML resume**](https://jaantollander.github.io/resume/) and the [**PDF resume**](https://jaantollander.github.io/resume/resume.pdf) will become available as seen on the links.
