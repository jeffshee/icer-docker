from torch import cuda
import tensorflow as tf
import subprocess


def check_env():
    print("[NVIDIA] nvidia-smi")
    subprocess.call(["nvidia-smi"])
    print("[PyTorch] CUDA check:", cuda.is_available())
    print("[Tensorflow] CUDA check:", tf.config.list_physical_devices('GPU'))


if __name__ == "__main__":
    check_env()
