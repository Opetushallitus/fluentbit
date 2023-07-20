FROM golang:alpine as builder
WORKDIR /
COPY fluent_bit_init_process.go .
COPY go.* .
RUN go build -v

FROM public.ecr.aws/aws-observability/aws-for-fluent-bit:init-latest
COPY --from=builder /validation /init/fluent_bit_init_process
COPY output-cloudwatch.conf /output-cloudwatch.conf
COPY output-s3.conf /output-s3.conf
COPY parsers-multiline.conf /parsers-multiline.conf
COPY tail-input.conf /tail-input.conf
COPY service.conf /service.conf