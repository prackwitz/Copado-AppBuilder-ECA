---
name: normalize-salesforce-namespace
description: "Use when asked to update Salesforce metadata namespace prefixes before commit, especially replacing copado_know1__ with copadoai__ in force-app metadata."
user-invocable: true
---

# Normalize Salesforce Namespace

Use this skill when metadata needs to be rewritten from one package namespace to another before commit.

Default workflow:

1. Search for the old prefix in `force-app/main/default`.
2. Run the bundled script to replace `copado_know1__` with `copadoai__`.
3. Re-run the search to confirm the old prefix is gone and the new prefix is present.
4. If requested, repeat the same replacement in other metadata folders such as `unpackaged`.

Bundled helper:

```powershell
powershell -ExecutionPolicy Bypass -File .github/skills/normalize-salesforce-namespace/replace-namespace.ps1
```

Optional arguments:

```powershell
powershell -ExecutionPolicy Bypass -File .github/skills/normalize-salesforce-namespace/replace-namespace.ps1 -TargetRoot force-app/main/default -OldPrefix copado_know1__ -NewPrefix copadoai__
```

Validation:

```powershell
rg "copado_know1__|copadoai__" force-app/main/default
```
