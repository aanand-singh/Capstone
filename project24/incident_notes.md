# Incident Notes: Manual Chaos Test

- Goal: Record recovery from failure
- Service: Python HTTP server (app.py) on port 8080
- Timezone: all times in UTC (from `date` output in evidence.log)

## Timeline
- 09:42:01 - Baseline: service healthy, HTTP 200 OK
- 09:42:10 - Failure injected: process killed via `kill $(cat service.pid)`
- 09:42:10-11 - Observed impact: curl returned "(7) Failed to connect to localhost port 8080", connection refused
- 09:43:34 - Recovery action: restarted app.py with nohup in the background
- 09:43:36 - Verification: curl returned HTTP 200 OK, service restored

## Metrics
- Time to recover (restart to verified 200): ~2 seconds
- Total outage (kill to verified recovery): ~1 min 26 sec
- Detection: immediate (curl failure), since the failure was injected manually

## Root cause
Intentional test: the service process was stopped deliberately. No real fault.

## Observations
- Most of the outage was manual delay between detecting the failure and typing the restart command.
- No automatic recovery exists: the service stayed down until someone restarted it.
- No data loss, since the service is stateless.

## Follow-ups
- Run the service under a supervisor (systemd `Restart=on-failure` or Docker `--restart unless-stopped`) for automatic recovery.
- Add a /health endpoint and alerting so outages are detected in seconds.
- Document a restart runbook for manual recovery.

## Evidence
- evidence.log (timestamps and curl output for each phase)
