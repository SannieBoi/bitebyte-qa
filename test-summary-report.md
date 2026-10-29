# Test Summary Report – BiteByte

| | |
| --- | --- |
| Version tested | GitHub `main`, commit `798d848` |
| Test period | 26.10.2026 – 28.10.2026 |
| Tester | Kristijan Sarcevic |
| Environment | E1 (Windows 11, Opera GX, XAMPP) – see [test plan](test-plan.md#4-test-environments) |

## Summary

The main flows (sign up, log in, submit, edit, delete, browse, search and filter) work for normal use: 42 of 58 tests passed. However, 17 bugs were found, 2 of them critical: logged-out visitors can edit and delete any recipe, and uploaded `.php` files run on the server. BiteByte should not be put online until these two are fixed.

## Execution results

| Module | Test cases | Pass | Fail | Blocked |
| --- | --- | --- | --- | --- |
| Sign up (SU) | 17 | 14 | 3 | 0 |
| Log in / log out (LI) | 8 | 7 | 1 | 0 |
| Submit recipe (SR) | 11 | 7 | 4 | 0 |
| Edit / delete (ED) | 6 | 4 | 2 | 0 |
| Browse and search (RB) | 8 | 6 | 2 | 0 |
| Support and newsletter (SP) | 3 | 1 | 2 | 0 |
| UI and responsiveness (UI) | 5 | 3 | 2 | 0 |
| **Total** | **58** | **42** | **16** | **0** |

Pass rate: 72% (42 / 58).

## Bugs by severity

| Severity | Count |
| --- | --- |
| Critical | 2 |
| Major | 4 |
| Minor | 9 |
| Trivial | 2 |
| **Total** | **17** |

15 bugs came from failed test cases and 2 from exploratory testing (BUG-015, BUG-016). Full list: [bug-reports/](bug-reports/README.md)

## Most important findings

1. [BUG-001](bug-reports/BUG-001.md) – Anyone who is not logged in gets owner permissions, so any visitor can change or delete every recipe on the site.
2. [BUG-002](bug-reports/BUG-002.md) – The server accepts any file as a recipe photo and keeps its extension, so an uploaded `.php` file can run code on the server.
3. [BUG-003](bug-reports/BUG-003.md) – Signup rules (username length, password strength) are only checked in the browser; with JavaScript off, weak accounts are created.
4. [BUG-004](bug-reports/BUG-004.md) – Users have no way to log out, and the header never changes after logging in.

## Blocked or not executed

- None. All 58 test cases were executed.
- Note: mobile layout was checked in the browser's mobile device view, not on real phones.

## Recommendations

- Give edit/delete permission only to the logged-in owner (BUG-001).
- On the server, accept only real PNG/JPEG files and save them with a generated `.jpg`/`.png` extension (BUG-002).
- Repeat all signup and recipe validation on the server, with English error messages (BUG-003, BUG-007, BUG-009, BUG-010).
- Add a Log out button and a logged-in header (BUG-004).
- Connect the support form to the `support` table, or remove it until it works (BUG-005, BUG-011).

## Update – 29.10.2026

BUG-002 (critical) was fixed and retested: the server now accepts only real JPG/PNG uploads. SR-05 now passes on retest, and the regression checks SR-01 and SR-04 still pass. The results above are from the original test run and were not changed.
