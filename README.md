# wrapper-model

Python wrapper for authenticating with SAS Viya OAuth APIs and scoring machine learning models through SAS Micro Analytic Service (MAS) endpoints using Model REST APIs.

### Wrapper-Model Project Structure to implement in SAS Model Manager as a custom model

```text
wrapper-model/

├── DS2Pkg_PythonWrapper.sas
├── ModelProperties.json
├── example_test.py
├── fileMetadata.json
├── inputVar.json
├── outputVar.json
├── score.py
└── settings.py
```

### File Descriptions

| File                       | Description                                                       |
| -------------------------- | ----------------------------------------------------------------- |
| `DS2Pkg_PythonWrapper.sas` | DS2 package implementation used for SAS Model Manager integration |
| `ModelProperties.json`     | Contains model metadata and configuration properties              |
| `example_test.py`          | Example Python script to test model scoring                       |
| `fileMetadata.json`        | Metadata definition for model files                               |
| `inputVar.json`            | Input variable schema definition                                  |
| `outputVar.json`           | Output variable schema definition                                 |
| `score.py`                 | Main Python scoring script                                        |
| `settings.py`              | Configuration and environment settings                            |

---

### Scoring the Wrapper-Model in SAS Studio

```text
├── scoring-wrapper-model.sas
```
