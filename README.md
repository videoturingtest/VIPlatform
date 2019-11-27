# VTT_platform
Welcome to the VTT platform. The VTT platform is run through a series of docker containers which
operate in tandem to provide answers to questions related to popular drama's such as 'Friends'.
The VTT platform is run through 8 different docker containers.
### Main
The main docker container coordinates all tasks involved in responding to a VTT question. 
This main process MUST be run before any of the other docker processes. In order to login to the main docker container, run:
```console
./container_login.sh main
```
Next, in order to start this docker container's process; run:
```console
cd /home/main
python3 demo_main.py
```
### STT
The STT docker container is involved in processing questions. In order to login to this docker container, run:
```console
./container_login.sh pio_test2
```
Next, in order to start this docker container's process; run:
```console
cd /root/alta
python2 vtt_stt.py
```
### Yonsei Extraction
The Yonsei Extraction docker container is involved in language processing. This container loads BERT (https://github.com/google-research/bert), so this container's process may take some time to start. In order to login to this docker container, run:
```console
./container_login.sh yonsei_vtt
```
Next, in order to start this docker container's process; run:
```console
cd /home/pytorch-template-master
python3 infer.py
```
### Level-Classification
The Level-Classification docker container assigns a difficulty score to a given question for VTT. In order to login to this docker container, run:
```console
./container_login.sh level_classification
```
Next, in order to start this docker container's process; run:
```console
cd /home/VTT/Level_Classification
python3 client.py  
```
### KnowledgeBase
The KnowledgeBase docker container provides an answer to a given VTT question. In order to login to this docker container, run:
```console
./container_login.sh kbqa0.3
```
Next, in order to start this docker container's process; run:
```console
cd /home
python ibricks.py  
```
### SNU_Low 
The SNU_Low docker container provides answers to VTT questions which are classified with a low level of difficulty. 
In order to login to this docker container, run:
```console
./container_login.sh snu_low
```
Next, in order to start this docker container's process; run:
```console
cd /root
python3 predict.py 
```
### SNU_High
The SNU_High docker container provides answers to VTT questions which are classified with a high level of difficulty. 
In order to login to this docker container, run:
```console
./container_login.sh snu_vqa
```
Next, in order to start this docker container's process; run:
```console
cd vtt_qa_pipeline/startup
python3 cli.py infer
```
### AnswerSelection
The AnswerSelection docker container chooses between multiple answers to a given VTT question. 
In order to login to this docker container, run:
```console
./container_login.sh khu_answer_2
```
Next, in order to start this docker container's process; run:
```console
cd workspace/Answer_Selection
python3 predict.py
```