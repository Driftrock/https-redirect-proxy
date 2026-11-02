# https-redirect-proxy

nginx sidecar that runs next to an app container in the same pod. nginx listens on port 80, redirects HTTP to HTTPS (using `X-Forwarded-Proto` from the GCP load balancer) and forwards HTTPS traffic to the app container on port 8080.

Used by admin, lead-store, inbound-leads, crm-sender and credentials_api (`kube/deployments/*.yml` in each repo).

## Image

`eu.gcr.io/platform-156214/https-redirect-proxy:<nginx version>-<revision>`, e.g. `1.31.8-b`

- nginx version: `ARG NGINX_VERSION` in the `Dockerfile`
- revision: the `REVISION` file

Built and pushed by Buildkite on merge to `master`. Tags are never overwritten: a build fails if the tag already exists.

## Releasing a new version

1. Make the change:
   - nginx upgrade: change `NGINX_VERSION` in the `Dockerfile` and set `REVISION` to `a`
   - config change: bump `REVISION` (`b` → `c`)
2. Open a PR. `Check image tag is new` fails if you forgot to bump.
3. Merge. Buildkite pushes the new tag.
4. Update the image tag in the services listed above.
