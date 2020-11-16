# VIPlatform
The VI Platform is a Video Intelligence Platform deployed through a series of Docker containers which
operate in tandem to provide answers to questions about video clips from popular TV dramas such as 'Friends'.

## Container Setup
To deploy the Video Intelligence Platform you first have to obtain a copy of the containers. The latest version can be found in the __ViPlatform.tar.gz__ file on the VIC server. This archive contains all eight tar files which are exports of the docker images needed to run the Platform.

When you have this file on your desired server, extract the tar.gz file and change into the correct directory.
```console
tar xf ViPlatform.tar.gz
cd ViPlatform
```

In order to setup the docker images on your local machine, please run the following script with appropriate user privileges.
WARNING! This script may take some time to run and requires 200GB of free disk space.
```console
sh vpp_commands.sh
```

To verify the script setup correctly run:

```console
docker ps
```
and check that the 8 required containers have been installed and are running correctly.

If you would like to set up the 8 containers manually you can do so by loading their archives into docker individually. In order to load the container simply do e.g.
```
docker load -i main.tar
```

## VI Platform Usage
The VI platform is run through 8 different docker containers. The 'container_login.sh' script should be contained in the 'ViPlatform/' directory you setup in the last step. This can be used to login to the required containers.

### Main
The main docker container coordinates all tasks involved in responding to a VI question. This main process MUST be run before any of the other docker processes. In order to login to the main docker container, run:
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
/opt/conda/bin/python3 client.py  
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
python3 client.py 
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
/opt/conda/bin/python3 predict.py
```
