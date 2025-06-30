FROM ubuntu:latest

RUN apt update && apt install -y nasm binutils

COPY loop.asm /loop.asm

RUN nasm -f elf64 loop.asm -o loop.o && \
    ld loop.o -o loop

CMD ["./loop"]
