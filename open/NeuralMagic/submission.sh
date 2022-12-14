git clone https://github.com/neuralmagic/mlperf_inference_results_v2.1.git
cd mlperf_inference_results_v2.1/open/NeuralMagic/code/bert/deepsparse

python3 -m venv mlperf
source mlperf/bin/activate
make setup
make build_docker
make launch_docker

# BERT-Large_pruneofa_80sparse_qat
python3 run.py --backend=deepsparse --model_path=models/BERT-Large_pruneofa_80sparse_qat.onnx --batch_size=1 --scenario=SingleStream
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_prune-ofa-large/SingleStream/performance/run_1/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/BERT-Large_pruneofa_80sparse_qat.onnx --batch_size=1 --scenario=SingleStream --accuracy
vim build/logs/accuracy.txt # {"exact_match": 83.519394512772, "f1": 90.41656583679988}
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_prune-ofa-large/SingleStream/accuracy/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/BERT-Large_pruneofa_80sparse_qat.onnx --batch_size=128 --scenario=Offline
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_prune-ofa-large/Offline/performance/run_1/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/BERT-Large_pruneofa_80sparse_qat.onnx --batch_size=128 --scenario=Offline --accuracy
vim build/logs/accuracy.txt # {"exact_match": 83.519394512772, "f1": 90.41656583679988}
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_prune-ofa-large/Offline/accuracy/.
rm build/logs/*

# oBERT-Large_95sparse_block4_qat
python3 run.py --backend=deepsparse --model_path=models/oBERT-Large_95sparse_block4_qat.onnx --batch_size=1 --scenario=SingleStream
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_obert-large/SingleStream/performance/run_1/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/oBERT-Large_95sparse_block4_qat.onnx --batch_size=1 --scenario=SingleStream --accuracy
vim build/logs/accuracy.txt # {"exact_match": 83.519394512772, "f1": 90.21282641816266}
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_obert-large/SingleStream/accuracy/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/oBERT-Large_95sparse_block4_qat.onnx --batch_size=128 --scenario=Offline
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_obert-large/Offline/performance/run_1/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/oBERT-Large_95sparse_block4_qat.onnx --batch_size=128 --scenario=Offline --accuracy
vim build/logs/accuracy.txt # {"exact_match": 83.519394512772, "f1": 90.21282641816266}
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_obert-large/Offline/accuracy/.
rm build/logs/*

# oBERT-MobileBERT_14layer_50sparse_block4_qat
python3 run.py --backend=deepsparse --model_path=models/oBERT-MobileBERT_14layer_50sparse_block4_qat.onnx --batch_size=1 --scenario=SingleStream
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_obert-mobilebert/SingleStream/performance/run_1/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/oBERT-MobileBERT_14layer_50sparse_block4_qat.onnx --batch_size=1 --scenario=SingleStream --accuracy
vim build/logs/accuracy.txt # {"exact_match": 83.50993377483444, "f1": 90.32072989985656}
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_obert-mobilebert/SingleStream/accuracy/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/oBERT-MobileBERT_14layer_50sparse_block4_qat.onnx --batch_size=128 --scenario=Offline
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_obert-mobilebert/Offline/performance/run_1/.
rm build/logs/*

python3 run.py --backend=deepsparse --model_path=models/oBERT-MobileBERT_14layer_50sparse_block4_qat.onnx --batch_size=128 --scenario=Offline --accuracy
vim build/logs/accuracy.txt # {"exact_match": 83.50993377483444, "f1": 90.32072989985656}
cp build/logs/* ~/mlperf_inference_results_v2.1/open/NeuralMagic/results/nm80ci_icx_deepsparse/bert-99_obert-mobilebert/Offline/accuracy/.
rm build/logs/*
