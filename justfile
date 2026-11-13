# Local build settings may be kept in .env.
set dotenv-load

python := "uv run --locked python"

default: build

# Validated PDF, with cached no-op when source files have not changed.
build:
    {{python}} scripts/project.py build

# CI gate: format, lint, PDF links/layout, tests, corrections.
check:
    {{python}} scripts/project.py check

# Formatter check, source rules and the evaluated document (T000-T099).
lint:
    {{python}} scripts/project.py lint

# Format the Typst sources in place (Typstyle with the Tinymist settings).
fmt:
    {{python}} scripts/project.py fmt

# Unit tests: corrections schema, labels, bibliography, numbering, lint rules.
test:
    {{python}} scripts/project.py test

# The reader's list of corrections: build/aizenberg-integrals.corrections.pdf
corrections:
    {{python}} scripts/project.py corrections

# Remove build/ and the build cache.
clean:
    {{python}} scripts/project.py clean

# Exact Sage checks, run with `sage -python`.
check-sage:
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    scripts=(checks/sage/*.py)
    if [ ${#scripts[@]} -eq 0 ]; then
        echo "No Sage checks yet (checks/sage/)."
        exit 0
    fi
    for script in "${scripts[@]}"; do
        echo "== $script"
        sage -python "$script"
    done

# Advisory prose check (Harper); dictionary and rules shared with VS Code.
check-prose:
    {{python}} scripts/check_prose.py

# Compile the formal checks and audit their declarations.
check-lean:
    {{python}} checks/lean/check_axioms.py
