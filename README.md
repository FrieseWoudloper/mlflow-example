# mlflow-example

To run from MLflow use,

```bash
mlflow run https://github.com/friesewoudloper/mlflow-example -P cp=0.05 -P maxdepth=15
```

Or when cloning this repo,

```bash
mlflow run . --entry-point train.R -P cp=0.05 -P maxdepth=15
```
