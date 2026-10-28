# Test Plan – BiteByte

| | |
| --- | --- |
| Project | BiteByte – recipe-sharing web app |
| Version under test | GitHub `main`, commit `798d848` (24.05.2026) |
| Tester | Kristijan Sarcevic |
| Test period | 26.10.2026 – 28.10.2026 |

## 1. Objective

Verify that BiteByte's main user flows work as intended, that invalid input is handled correctly on both the client and the server, and that data is saved correctly in the database. Report every defect found with clear steps to reproduce.

## 2. Scope

### In scope

| Module | ID prefix | What is tested |
| --- | --- | --- |
| Sign up | SU | Field validation, password rules, duplicate accounts, server-side validation |
| Log in / log out | LI | Valid and invalid login, session handling, protected pages |
| Submit recipe | SR | Required fields, photo upload limits, input boundaries, special characters |
| Edit / delete recipe | ED | Ownership rules, updates, deletion and data cleanup |
| Browse and search | RB | Search, filters, sorting, details page, invalid URLs |
| Support and newsletter | SP | Form validation and submission |
| UI and responsiveness | UI | Navigation, carousel, mobile layout, browsers |

### Out of scope

- Performance and load testing
- Full security / penetration testing (only basic access-control and HTML-input checks are included)
- Automated testing (planned as a follow-up with Selenium)
- Recipe rating (not implemented on the backend)

## 3. Approach

- **Manual functional testing** of each module against expected behavior.
- **Equivalence partitioning** and **boundary value analysis** for limited inputs: username length (3–15), password length (8+), photo size (2 MB), servings (1–15), difficulty (1–5).
- **Positive and negative tests** for every form.
- **Server-side checks**: repeat key negative tests with JavaScript disabled to confirm the server validates input on its own.
- **Database verification** with the queries in [`sql/data-checks.sql`](sql/data-checks.sql).
- Each failed test gets a bug report in [`bug-reports/`](bug-reports/) (and optionally in Jira), linked by Bug ID in the test case.

## 4. Test environments

| # | Device | OS | Browser |
| --- | --- | --- | --- |
| E1 | Desktop PC | Windows 11 | Opera GX, Edge |

Server for E1: XAMPP v3.3.0 (Apache/2.4.58, PHP/8.0.30, MariaDB 10.4.32-MariaDB) on E1.

Mobile layout tests (UI-03, UI-04) were run in the browser's mobile device view at phone width.

## 5. Test data

- Test accounts created during testing (record usernames in the test cases, never real passwords of other services).
- Seed data from the BiteByte SQL dump (3 users, sample recipes).
- Images: one JPG under 2 MB, one JPG just over 2 MB, one PNG, one GIF, one `.txt` file renamed to `.jpg`.

## 6. Entry and exit criteria

**Entry:** app runs locally, database imported, test cases written and reviewed.

**Exit:** all test cases executed (or marked Blocked with a reason), every failed test has a bug report, summary report written.

## 7. Severity and priority

| Severity | Meaning |
| --- | --- |
| Critical | Data loss, security hole, or a main flow completely blocked |
| Major | A feature doesn't work as intended, no reasonable workaround |
| Minor | Feature works but with wrong messages, layout issues or a workaround |
| Trivial | Cosmetic: typos, alignment, colors |

Priority (High / Medium / Low) = how soon it should be fixed.

## 8. Deliverables

Test plan · test cases (`test-cases.xlsx` / `.csv`) · bug reports · SQL data checks · test summary report
