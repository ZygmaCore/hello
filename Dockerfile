FROM ubuntu:latest

RUN apt update && apt install -y nasm binutils

COPY main.asm /main.asm

RUN nasm -f elf64 main.asm -o main.o && \
    ld main.o -o main

CMD ["./main"]
