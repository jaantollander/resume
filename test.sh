#!/usr/bin/env sh
shellcheck -s sh ./build.sh -x ./source.sh

# Shellcheck for Netlify GitHub action.
for i in 1 2 3; do
    yq ".jobs.build-resume.steps[$i].run" < ".github/workflows/netlify.yml" \
        | shellcheck -s sh -
done
