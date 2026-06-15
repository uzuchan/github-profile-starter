# GitHub Profile README Starter

A GitHub profile that **auto-generates and self-hosts** trophies, stats, streak,
top languages, a contribution snake, a metrics dashboard, and a 3D "city" built
from your contributions — all from real data, on a schedule.

Images are served from your own repository (not third-party URLs), so they are
resistant to cache lag and outages. The data is fetched by GitHub Actions and
always targets **the repository owner** automatically.

---

## Setup

### 1. Create your profile repository
Create a **public** repository named **exactly** like your GitHub username.
- Example: if your username is `octocat`, the repo must be `octocat/octocat`.
- This is GitHub's special "profile README" repository.

### 2. Add this kit
Use **"Use this template"** (recommended), or copy the kit's files into the repo,
then clone it locally.

### 3. Initialize (replace the username placeholder)
In the cloned folder, run (replace `<username>` with your GitHub username):

```bash
./setup.sh octocat
```

This will:
- Replace `__USERNAME__` in README / SVG / scripts with your username
- Generate your skill icons (`assets/skills-*.svg`)
- Check for leftover placeholders (any leftover means a 404, so it must be 0)

> Workflows (`.github/workflows/*.yml`) use `${{ github.repository_owner }}` to
> detect the owner automatically, so they need no replacement.

### 4. Commit and push
```bash
git add -A && git commit -m "setup profile" && git push
```

### 5. Run the workflows once
Open the **Actions** tab (enable Actions if prompted) and click **Run workflow**
on each of these once (they run automatically afterwards):
- **Generate Stats** — trophies / streak / stats / top languages (every 6h)
- **Generate Snake Animation** — contribution snake (daily)
- **Generate Metrics** — metrics dashboard (daily)
- **Generate 3D Contribution City** — 3D city (daily)

> All run with the built-in `GITHUB_TOKEN`. No Personal Access Token needed.

### 6. Fill in the TODOs
- **About Me**: intro, interests, what you are building
- **Featured Projects**: pin cards for your repos (see the commented example; set `__REPO__`)
- **Skills**: to change the tech icons, edit `CATEGORIES` in `scripts/fetch-skills.sh`
  and re-run `bash scripts/fetch-skills.sh` (icon names: https://skillicons.dev , all lowercase)
- The header tagline lives in `assets/header.svg`.

### 7. (Optional) Count private contributions
On your profile's contribution graph, open "Contribution settings" and enable
"Private contributions" so private activity is reflected in the counts (content stays private).

---

## What updates automatically

| Element | Source | Updates |
|---------|--------|---------|
| Header / Footer | `assets/header.svg` `footer.svg` (self-hosted) | static (name set by setup.sh) |
| Trophies / Streak / Stats / Top languages | `scripts/generate-*.mjs` -> `assets/*.svg` | Generate Stats (every 6h) |
| Snake | Platane/snk -> `output` branch | daily |
| Metrics | lowlighter/metrics -> `metrics.svg` | daily |
| Contribution City (3D) | github-profile-3d-contrib -> `profile-3d-contrib/` | daily |
| Skill icons | `scripts/fetch-skills.sh` -> `assets/skills-*.svg` | manual (when you change tech) |

Image URLs carry a `?v=` parameter that the workflow bumps on each update, so the
display never gets stuck on a stale GitHub image cache.

## Credits / License
- Trophies / streak / stats / top-languages cards are this kit's own generators
  (no external service). The rank algorithm mirrors github-readme-stats (MIT).
- 3D SVG: [github-profile-3d-contrib](https://github.com/yoshi389111/github-profile-3d-contrib) (MIT)
- Interactive 3D city (link target): [honzaap/GithubCity](https://github.com/honzaap/GithubCity) (Apache-2.0)
- Snake: [Platane/snk](https://github.com/Platane/snk) / Metrics: [lowlighter/metrics](https://github.com/lowlighter/metrics)
- Icons: [skillicons.dev](https://skillicons.dev)

This kit is MIT licensed (see LICENSE).

---
---

# 日本語版

GitHub プロフィールに、トロフィー・統計・連続記録・使用言語・スネーク・メトリクス・
コミット履歴から育つ3Dの街を **実データから自動生成・自前配信** するキットです。
各画像は自分のリポジトリから配信されるので、外部サービスのキャッシュ遅延や停止に強いです。
データ取得は GitHub Actions が行い、**リポジトリの持ち主**を自動で対象にします。

## 手順

1. **プロフィール用リポジトリを作る**: 自分のユーザー名と**完全に同じ名前**の public リポジトリを作成（例: `octocat/octocat`）。
2. **キットを入れる**: 「Use this template」を押すか、ファイルをそのリポジトリに置いて clone。
3. **初期設定**: clone したフォルダで `./setup.sh <ユーザー名>` を実行。`__USERNAME__` が一括置換され、使用技術アイコンも生成されます（置換漏れは0であること）。
   - ワークフローは `${{ github.repository_owner }}` で持ち主を自動取得するため置換不要。
4. **コミットして push**: `git add -A && git commit -m "setup profile" && git push`
5. **ワークフローを初回実行**: Actions タブで各ワークフロー（Generate Stats / Snake / Metrics / 3D City）を「Run workflow」で1回ずつ手動実行（以降は自動）。すべて標準トークンで動き、PAT不要。
6. **TODO を編集**: About Me / Featured Projects（`__REPO__` を自分のリポジトリ名に）/ Skills（`scripts/fetch-skills.sh` の `CATEGORIES` を編集して再実行。アイコン名は https://skillicons.dev、すべて小文字）。ヘッダーの肩書きは `assets/header.svg` にあります。
7. **（任意）非公開コミットを反映**: コントリビューショングラフの「Contribution settings」→「Private contributions」をONにすると非公開の活動も件数に反映（中身は非公開のまま）。

画像URLの `?v=` はデータ更新時にワークフローが自動で付け替えるので、表示が古いまま固まりません。
セクション見出しに絵文字を付けるなど、見た目は自由にカスタムしてOKです。

ライセンスは MIT（LICENSE 参照）。クレジットは英語版の Credits を参照してください。
