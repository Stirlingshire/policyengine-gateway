# policyengine-gateway

PolicyEngine's household API (`ghcr.io/policyengine/policyengine-household-api`) with a bearer-token check in front (Caddy, same container). Deployed on Aptible.

- Call it with `Authorization: Bearer <API_KEY>`; e.g. `POST /us/calculate`. `/liveness_check` is open.
- `API_KEY` is set as Aptible config on the app; the container refuses to start without it.
- New PolicyEngine model version: bump `PE_TAG` in `Dockerfile`, push to `main`, deploy the new `sha-<commit>` image.
- Verify any deployment: `./smoke-test.sh <base-url> <api-key>`.
- Memory: ~3.4 GB idle, ~4.2 GB under load (2 gunicorn workers), so the container is sized above 4 GB.
