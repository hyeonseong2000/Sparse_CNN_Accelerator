# Sparse_CNN_Accelerator

## Project details

MNIST 데이터셋에 대해 학습된 LeNet-5 모델을 Post Training Quantization, Pruning 기법을 통해 Compression 하고, CSR Format 을 이용하여 Sparse Matrix의 Convolution 연산을 Energy efficient 하게 가속하기 위해 이를 지원하는 CSR Encoder, Decoder, 그리고 Coordinate computation Unit을 이용하여 원하는 메모리 bank 위치에 Routing 하는 Router 모듈을 통한 PE 구조를 통해 Sparse CNN 가속기를 제작하는 프로젝트.
