set -x

#convert dataset and model
pushd models
python save_bert_inference.py -m $1/models/bert/distilbert-base-uncased -o ../bert.pt
popd

pushd datasets
python save_squad_features.py -m $1/models/bert/distilbert-base-uncased -d $1/datasets/bert -o ../squad.pt
popd

