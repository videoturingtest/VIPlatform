# VIPlatform
Welcome to the VI platform. The VIPlatform is run through a series of docker containers which
operate in tandem to provide answers to questions related to popular drama's such as 'Friends'.


## Container Setup
In order to setup the docker images on your local machine, please run the following script with sudo user privileges.
WARNING! This script may take 2-3 hours to run and requires 200Gb of free disk space.
The url will be notified soon.
```console
sh vi_platform_setup.sh
```

To verify the script setup correctly run the:

```console
sudo docker ps
```
and check that the 8 required containers have been installed and are running correctly

## VI Platform Usage

The VI platform is run through 8 different docker containers. The 'container_login.sh' script is should be contained in 
the 'temp_images' directory you installed in the last step. This can be used to login to the required containers.

### Main
The main docker container coordinates all tasks involved in responding to a VI question. 
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
The Level-Classification docker container assigns a difficulty score to a given question for VI. In order to login to this docker container, run:
```console
./container_login.sh level_classification
```
Next, in order to start this docker container's process; run:
```console
cd /home/VTT/Level_Classification
python3 client.py  
```
### KnowledgeBase
The KnowledgeBase docker container provides an answer to a given VI question. In order to login to this docker container, run:
```console
./container_login.sh kbqa0.3
```
Next, in order to start this docker container's process; run:
```console
cd /home
python ibricks.py  
```
### SNU_Low 
The SNU_Low docker container provides answers to VI questions which are classified with a low level of difficulty. 
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
The SNU_High docker container provides answers to VI questions which are classified with a high level of difficulty. 
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
The AnswerSelection docker container chooses between multiple answers to a given VI  question. 
In order to login to this docker container, run:
```console
./container_login.sh khu_answer_2
```
Next, in order to start this docker container's process; run:
```console
cd workspace/Answer_Selection
python3 predict.py
```
