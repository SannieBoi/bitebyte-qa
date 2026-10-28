# BiteByte – Manual QA Project

Manual testing of **[BiteByte](https://github.com/SannieBoi/BiteByte)**, a recipe-sharing web app (PHP, MySQL, HTML/CSS/JS) that I co-built as my graduation project. This repo holds the test plan, test cases, bug reports and SQL data checks.

## Results at a glance

| Metric | Value |
| --- | --- |
| Test cases written | 58 |
| Executed | 58 |
| Passed / Failed / Blocked | 42 / 16 / 0 (72% pass rate) |
| Bugs reported | 17 (Critical 2, Major 4, Minor 9, Trivial 2) |
| Test period | 10/2026 |

**Most serious findings:** logged-out visitors can edit and delete any recipe ([BUG-001](bug-reports/BUG-001.md)), and a `.php` file uploaded as a recipe photo runs on the server ([BUG-002](bug-reports/BUG-002.md)).

Full numbers and conclusion: [test-summary-report.md](test-summary-report.md)

## What's in this repo

| File | What it is |
| --- | --- |
| [test-plan.md](test-plan.md) | Scope, approach, environments, entry/exit criteria |
| [test-cases.xlsx](test-cases.xlsx) | All test cases with steps, expected/actual results and status (working copy) |
| [test-cases.csv](test-cases.csv) | Same test cases, viewable directly on GitHub |
| [bug-reports/](bug-reports/) | One file per bug, with steps to reproduce and screenshots |
| [sql/data-checks.sql](sql/data-checks.sql) | SQL queries used to verify data in the database after tests |
| [test-summary-report.md](test-summary-report.md) | Final results and conclusion |

## Features tested

- Sign up (field validation, password rules, duplicate accounts)
- Log in / log out and access to protected pages
- Submitting, editing and deleting recipes (incl. photo upload)
- Browsing, searching, filtering and sorting recipes
- Recipe details page
- Support and newsletter forms
- Navigation, carousel and responsive layout

## Techniques used

Equivalence partitioning, boundary value analysis, positive and negative testing, basic security checks (access control, HTML input), database verification with SQL, cross-browser and mobile layout checks.

## Tools

MySQL / MariaDB (data checks) · XAMPP · Opera GX DevTools · Excel

## How to run BiteByte locally

1. Install [XAMPP](https://www.apachefriends.org/) and start **Apache** and **MySQL**.
2. Clone [BiteByte](https://github.com/SannieBoi/BiteByte) into `xampp/htdocs/`.
3. In phpMyAdmin, create a database named `bitebyte` and import `sql/bitebyte (2).sql` from the BiteByte repo.
4. Open `http://localhost/BiteByte/php/index.php`.

---
Author: Kristijan Sarcevic · [LinkedIn](https://www.linkedin.com/in/kristijan-sarcevic-120a84271/) · [GitHub](https://github.com/SannieBoi)
