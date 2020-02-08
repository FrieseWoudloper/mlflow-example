# mlflow-example

To run from MLflow use,

```bash
mlflow run https://github.com/javierluraschi/mlflow-example -P lambda=0.2 -P alpha=0.8
```

Or when cloning this repo,

```bash
mlflow run . --entry-point train.R -P lambda=0.2 -P alpha=0.8
```
