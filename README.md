
# Testing Tanka

This repo is to mainly test whether tanka could have solved the issue I solved for 
[helm_frustration_1](https://github.com/jessesimpson36/helm_frustration_1).

To try this out, there are two different configurations in `environments/default/values.json`

```json
{
  "existingSecret": "jesse"
}
```

and

```json
{
  "existingSecret": {
    "name": "jesse"
  }
}
```

Check out the output by running this command:

```bash
tk show environments/default
```

output
```yaml
apiVersion: v1
data:
  isPasswordExplicit: string
  isSecretName: null
  nameOfSecret: default-secret
  typeOfSecretName: string
kind: Secret
metadata:
  name: jesse-frustration
  namespace: default
```

I named the kubernetes object for compatibility with the referenced "helm frustrations" repo.

I think tanka solves this problem quite nicely.
