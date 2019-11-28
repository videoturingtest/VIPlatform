#! /bin/sh

# First pull down the vtt_docker tar images
wget http://147.46.240.131/vtt_docker.tar.gz

# Next unzip the files
tar xf vtt_docker.tar.gz

# Next load the 7 required docker repositories
docker load < temp_images/kbqa0.3_latest.tar
docker load < temp_images/level_classification_latest.tar
docker load < temp_images/main_latest.tar
docker load < temp_images/pio_test2_latest.tar
docker load < temp_images/snu_low_latest.tar
docker load < temp_images/snu_vqa_latest.tar
docker load < temp_images/yonsei_vtt_latest.tar
