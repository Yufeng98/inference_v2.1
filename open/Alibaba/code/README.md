# Build environment

## Prerequisites

* ubuntu:21.10

## Build docker image

We provide `DockerFile` to build the docker:

```bash
docker build -f Alibaba/docker/Dockerfile -t image_name:[tag] .
```

## Start a container

```bash
docker run -tid --net host --name [container_name] -v </path/to/alibaba-submission>:/host/Alibaba image_name:[tag]
docker exec -it [container_name] bash
```

## Install ARMNN

```bash
DOWNLOAD_PATH="/absolute/path/to/download"
INSTALL_PATH="/absolute/path/to/build"
bash /host/Alibaba/docker/download_src.sh $DOWNLOAD_PATH
bash /host/Alibaba/docker/build_env.sh $DOWNLOAD_PATH $INSTALL_PATH
```

## Install loadgen

```bash
git clone https://github.com/mlcommons/inference.git
cd inference
git checkout r2.1
cd loadgen
CPLUS_INCLUDE_PATH=/usr/local/lib/python3.9/dist-packages/pybind11/include/ CFLAGS="-std=c++14" python setup.py install
```

# Dataset

The dataset used for this benchmark is the [ImageNet 2012](http://image-net.org/challenges/LSVRC/2012/) validation set.
You can get **val_map.txt** in `Alibaba/data_maps/val_map.txt`.

# Model

## SinianML-ARMNN

The SinianML-ARMNN models are provided in `code/model/` directory.

| Model                                                         | Accuracy               | 
| :------------------------------------------------------------ | :--------------------- | 
| sinianml_acc75.862_is168_p5.990M_f631.703M_o14_B4_int8.armnn  |  75.862%               | 
| sinianml_acc73.130_is160_p4.739M_f418.899M_o14_B4_int8.armnn  |  73.130%               | 

### Optimization

Alibaba's SinianML-ARMNN models are generated by the following steps:

1. Train the model from scratch via the Alibaba SinianML framework;
2. Use our quantization-aware training to convert it to `int8` precision;
3. Convert the best model format to `armnn` format, using the ArmnnConverter provided by armnn.

# Run Resnet50

```bash
cd <path_to_inference_results>/open/Alibaba/code/
# for performance mode
python run.py --config config/performance_A.yaml
python run.py --config config/performance_B.yaml
# for accuracy mode
python run.py --config config/accuracy_A.yaml
python run.py --config config/accuracy_B.yaml
# get accuracy result
python accuracy-imagenet.py --mlperf-accuracy-file output_logs/mlperf_log_accuracy.json --imagenet-val-file <ILSVRC2012_img_val>/val_map.txt --dtype int32
```

**Note:** *accuracy-imagenet.py* is
in [inference/vision/classification_and_detection/tools/accuracy-imagenet.py](https://github.com/mlcommons/inference/blob/master/vision/classification_and_detection/tools/accuracy-imagenet.py) 