# docker-azure-blob-delete-old-files
docker image to delete old files from an azure storage container.

## build
```
docker build -t ekesken/azure-blob-delete-old-files .
```

## run
```
docker run \
  -e AZURE_STORAGE_ACCOUNT=test \
  -e AZURE_STORAGE_ACCESS_KEY=secret \
  -e AZURE_STORAGE_CONTAINER=test \
  -e MTIME_THRESHOLD=30 \
  -e DRY_RUN=true \
  ekesken/azure-blob-delete-old-files
```
