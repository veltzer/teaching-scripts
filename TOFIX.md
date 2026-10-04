# TOFIX

Findings from a code scan on 2026-10-04.

## High

- `fix_bash.bash:3` - the line is written inside double quotes, so `${HOME}` and `${PATH}` are expanded when the script runs and the whole current PATH is frozen literally into `~/.bashrc`; escape them (`\${HOME}`, `\${PATH}`) or use single quotes so `.bashrc` gets the variable references.

## Medium

- `fix_bash.bash:3-5` - appends unconditionally with `>>`, so every run adds duplicate lines to `~/.bashrc`; guard each line with `grep -qxF ... ~/.bashrc ||`.
- `install_k8s.bash:16` - `curl` has no `--fail`, so a 404/5xx (e.g. a bad version string from line 7) saves the HTML error page as `kubectl` and line 17 makes it executable; add `--fail` (and verify the published `.sha256` as the linked kubernetes.io instructions do).
- `install_minikube.bash:7` - same issue: no `--fail` and no checksum check before `chmod +x` at line 9; add `--fail` and verify against the `.sha256` minikube publishes.

## Low

- `install_k8s.bash:5` - `if true` makes the `else` branch (hardcoded `v1.26.7`, lines 9-11) dead code; drop it or turn it into an optional argument/env var.
- `install_minikube.bash:3` - commented-out `version="1.32.0"` and the matching commented `curl` at line 8 are leftovers; remove them or make the version a parameter like above.
- `README.md:2` - the README does not mention the three scripts or that `fix_bash.bash` must run after the two installers (it sources `kubectl`/`minikube` completions); add a short usage section.
