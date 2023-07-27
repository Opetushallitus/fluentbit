FROM golang:alpine as builder
WORKDIR /
COPY fluent_bit_init_process.go .
COPY go.* .
RUN go build -v

FROM public.ecr.aws/aws-observability/aws-for-fluent-bit:init-latest
COPY --from=builder /validation /init/fluent_bit_init_process
RUN sed -i '/\[OUTPUT\]/Q' /fluent-bit/etc/fluent-bit.conf
COPY *.conf /