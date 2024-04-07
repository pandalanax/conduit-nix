# stepsi

### 1. rebuild the system
```
sudo nixos-rebuild switch
```

### 2. open logs for service
```
journalctl -u matrix-as-signal.service --no-pager  -f
```
### 2. show appservice registration
```
cat /var/lib/matrix-as-signal/signal-registration.yaml
```

### 3. write to @conduit:your.domain register-appservice with contents of yaml

### 4. watch log switch from "unkown token" to "User does not exist".
```
..
..
Apr 07 13:00:13 sorry2004 matrix-as-signal-start[280993]: 2024-04-07T13:00:13+02:00 DBG Request completed duration=1.762466 method=GET req_id=14 response_length=78 response_mime=application/json status_code=401 url=https://matrix.sorry2004.org/_matrix/client/versions?user_id=%40signalbot%3Asorry2004.org
Apr 07 13:00:13 sorry2004 matrix-as-signal-start[280993]: 2024-04-07T13:00:13+02:00 ERR Failed to connect to homeserver, retrying in 10 seconds... error="failed to GET /_matrix/client/versions: M_UNKNOWN_TOKEN (HTTP 401): M_UNKNOWN_TOKEN: Unknown access token."
Apr 07 13:00:23 sorry2004 matrix-as-signal-start[280993]: 2024-04-07T13:00:23+02:00 DBG Request completed duration=1.700339 method=GET req_id=15 response_length=78 response_mime=application/json status_code=401 url=https://matrix.sorry2004.org/_matrix/client/versions?user_id=%40signalbot%3Asorry2004.org
Apr 07 13:00:23 sorry2004 matrix-as-signal-start[280993]: 2024-04-07T13:00:23+02:00 ERR Failed to connect to homeserver, retrying in 10 seconds... error="failed to GET /_matrix/client/versions: M_UNKNOWN_TOKEN (HTTP 401): M_UNKNOWN_TOKEN: Unknown access token."
Apr 07 13:00:33 sorry2004 matrix-as-signal-start[280993]: 2024-04-07T13:00:33+02:00 DBG Request completed duration=1.478236 method=GET req_id=16 response_length=78 response_mime=application/json status_code=401 url=https://matrix.sorry2004.org/_matrix/client/versions?user_id=%40signalbot%3Asorry2004.org
Apr 07 13:00:33 sorry2004 matrix-as-signal-start[280993]: 2024-04-07T13:00:33+02:00 ERR Failed to connect to homeserver, retrying in 10 seconds... error="failed to GET /_matrix/client/versions: M_UNKNOWN_TOKEN (HTTP 401): M_UNKNOWN_TOKEN: Unknown access token."

Apr 07 13:00:43 sorry2004 matrix-as-signal-start[280993]: 2024-04-07T13:00:43+02:00 DBG Request completed duration=1.880522 method=GET req_id=17 response_length=69 response_mime=application/json status_code=403 url=https://matrix.sorry2004.org/_matrix/client/versions?user_id=%40signalbot%3Asorry2004.org

Apr 07 13:00:43 sorry2004 matrix-as-signal-start[280993]: 2024-04-07T13:00:43+02:00 ERR Failed to connect to homeserver, retrying in 10 seconds... error="failed to GET /_matrix/client/versions: M_FORBIDDEN (HTTP 403): M_FORBIDDEN: User does not exist."

``` 


