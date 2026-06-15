# GitHub Profile README Starter

A ready-made GitHub **profile** that auto-generates and self-hosts trophies, stats,
a streak card, top languages, a contribution snake, a metrics dashboard, and a 3D
"city" built from your commits. Everything updates on a schedule from real data.

[![License: MIT](https://img.shields.io/badge/License-MIT-6f8ff7?style=flat-square)](LICENSE)
![Template](https://img.shields.io/badge/Use_this-template-2ea44f?style=flat-square&logo=github)

---

## Live example

A real profile built with this template:

### [github.com/uzuchan](https://github.com/uzuchan)

<div align="center">

![header](https://raw.githubusercontent.com/uzuchan/uzuchan/main/assets/header.svg)

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/uzuchan/uzuchan/main/assets/trophies-dark.svg">
  <img alt="trophies" src="https://raw.githubusercontent.com/uzuchan/uzuchan/main/assets/trophies-light.svg">
</picture>

<img height="160" alt="stats" src="https://raw.githubusercontent.com/uzuchan/uzuchan/main/assets/stats.svg">
<img height="160" alt="top languages" src="https://raw.githubusercontent.com/uzuchan/uzuchan/main/assets/top-langs.svg">

</div>

---

## What you get

- Trophies, GitHub stats, streak, and top-languages cards — **self-generated from real data, no third-party service**
- A contribution **snake** animation and a **metrics** dashboard
- A 3D **contribution city** (with a link to the interactive WebGL version)
- An animated header banner and skill icons
- **Auto-updates** via GitHub Actions (trophies/stats every 6h, the rest daily)
- Works with the built-in token — **no Personal Access Token needed**

---

## How to use (step by step)

> You will need: a GitHub account, and a terminal with `git` (or GitHub Desktop).

### 1. Create your profile repository
On GitHub, create a **public** repository whose name is **exactly your username**.
- Example: if your username is `octocat`, name the repo `octocat`.
- GitHub shows a note like "you found a secret!" — that confirms it is your special profile repo.

> Easiest path: the green **"Use this template"** button at the top of this page →
> "Create a new repository" → name it exactly like your username.

### 2. Get the files onto your computer
```bash
git clone https://github.com/<your-username>/<your-username>.git
cd <your-username>
```
(No terminal? Use **GitHub Desktop** to clone, then open the folder.)

### 3. Run the setup script
```bash
./setup.sh <your-username>
```
This will:
- turn `PROFILE_TEMPLATE.md` into your `README.md`
- replace the `__USERNAME__` placeholder everywhere
- generate your skill icons
- check that nothing is left over

### 4. Commit and push
```bash
git add -A
git commit -m "set up my profile"
git push
```

### 5. Turn on the automation
- Open the **Actions** tab of your repository. If prompted, **enable workflows**.
- Run each workflow once with **"Run workflow"** (after that they run on a schedule):
  `Generate Stats`, `Generate Snake Animation`, `Generate Metrics`, `Generate 3D Contribution City`.
- Wait a minute, then reload your profile — the cards will appear.

### 6. Make it yours
Open `README.md` and fill in the `TODO` parts:
- **About Me** — your intro, interests, what you build
- **Featured Projects** — uncomment the example and set `__REPO__` to your repos
- **Skills** — see "Customizing" below

### (Optional) Count private contributions
On your profile's contribution graph, open **Contribution settings** and turn on
**Private contributions** so private activity is reflected in the numbers (contents stay private).

---

## 使い方（初心者向け・日本語）

> 必要なもの: GitHubアカウントと、`git` が使えるターミナル（または GitHub Desktop）。

1. **プロフィール用リポジトリを作る**
   GitHubで、**自分のユーザー名と完全に同じ名前**の **public** リポジトリを作ります
   （例: ユーザー名 `octocat` → リポジトリ名も `octocat`）。作成画面で「秘密を見つけました！」の
   ような表示が出れば、それが特別な「プロフィール用リポジトリ」です。
   - 一番簡単なのは、このページ上部の緑の **「Use this template」** ボタン →
     「Create a new repository」→ リポジトリ名を自分のユーザー名と同じにする方法です。

2. **ファイルを自分のPCに取得**
   ```bash
   git clone https://github.com/<ユーザー名>/<ユーザー名>.git
   cd <ユーザー名>
   ```
   （ターミナルが苦手なら **GitHub Desktop** で clone してフォルダを開いてもOK）

3. **セットアップスクリプトを実行**
   ```bash
   ./setup.sh <ユーザー名>
   ```
   `PROFILE_TEMPLATE.md` が `README.md` になり、`__USERNAME__` が一括置換され、
   使用技術アイコンも生成され、置換漏れもチェックされます。

4. **コミットして push**
   ```bash
   git add -A
   git commit -m "set up my profile"
   git push
   ```

5. **自動更新をオンにする**
   リポジトリの **Actions** タブを開き、必要なら「ワークフローを有効化」。
   各ワークフロー（`Generate Stats` / `Generate Snake Animation` / `Generate Metrics` /
   `Generate 3D Contribution City`）を **「Run workflow」** で1回ずつ実行（以降は自動）。
   1分ほど待ってプロフィールを再読み込みすると、各カードが表示されます。

6. **自分の内容に編集**
   `README.md` の `TODO` を埋めます（About Me / Featured Projects は `__REPO__` を自分のリポジトリ名に / Skills は下の Customizing 参照）。
   （任意）コントリビューショングラフの **Contribution settings** → **Private contributions** をONにすると非公開リポの活動も件数に反映されます（中身は非公開）。

---

## Customizing

- **Skills / 使用技術**: edit `CATEGORIES` in `scripts/fetch-skills.sh`, then run
  `bash scripts/fetch-skills.sh` again. Icon names: <https://skillicons.dev> (all lowercase).
- **Header tagline / ヘッダーの肩書き**: edit the text in `assets/header.svg`.
- **Accent color / 配色**: `#6f8ff7` is used throughout — search & replace to change it.

---

## How it works

| Element | Source | Updates |
|---------|--------|---------|
| Header / Footer | `assets/header.svg` `footer.svg` | static (name set by setup.sh) |
| Trophies / Streak / Stats / Top languages | `scripts/generate-*.mjs` -> `assets/*.svg` | every 6h (Generate Stats) |
| Snake | Platane/snk -> `output` branch | daily |
| Metrics | lowlighter/metrics -> `metrics.svg` | daily |
| Contribution City (3D) | github-profile-3d-contrib | daily |
| Skill icons | `scripts/fetch-skills.sh` -> `assets/skills-*.svg` | manual |

Workflows detect the repository owner with `${{ github.repository_owner }}`, so they
target **your** data automatically. Image URLs carry a `?v=` value that the workflow
bumps on each update, so the display never gets stuck on GitHub's image cache.

---

## Credits / License

- Trophies / streak / stats / top-languages cards are this kit's own generators (no external
  service). The rank algorithm mirrors [github-readme-stats](https://github.com/anuraghazra/github-readme-stats) (MIT).
- 3D SVG: [github-profile-3d-contrib](https://github.com/yoshi389111/github-profile-3d-contrib) (MIT)
- Interactive 3D city (link target): [honzaap/GithubCity](https://github.com/honzaap/GithubCity) (Apache-2.0)
- Snake: [Platane/snk](https://github.com/Platane/snk) / Metrics: [lowlighter/metrics](https://github.com/lowlighter/metrics)
- Icons: [skillicons.dev](https://skillicons.dev)

MIT licensed — see [LICENSE](LICENSE). Made by [uzuchan](https://github.com/uzuchan).
