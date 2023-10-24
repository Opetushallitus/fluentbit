FROM public.ecr.aws/aws-observability/aws-for-fluent-bit:init-2.31.12
RUN yum update -y && yum clean all
COPY *.conf /