## openshift

Deploy into an environment with LLamaStack configured onto MaaS (e.g https://github.com/eformat/rhoai-cluster-pool)

```bash
oc new-project galah
oc new-app --name galah -e LLM_API_KEY=fake quay.io/eformat/galah:latest
oc patch deployment/galah  -p '{"spec": {"template": {"spec": {"containers": [{"name": "galah", "imagePullPolicy":"Always", "command": ["./galah/galah", "-o", "/tmp/galah.json", "-f", "/tmp/cache.db", "-p", "openai", "-m", "llama-4-scout-17b-16e-w4a16", "-u", "http://llamastack-with-config-service.llama-stack:8321/v1/openai/v1"]}]}}}}'
oc create route edge --service=galah --port=8080 --insecure-policy=Redirect
```
