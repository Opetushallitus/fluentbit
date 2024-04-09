FROM public.ecr.aws/aws-observability/aws-for-fluent-bit:init-2.32.2
RUN yum update -y && yum clean all
COPY *.conf /
COPY input-forward.conf /fluent-bit/etc/fluent-bit.conf
COPY fluent_bit_init_entrypoint.sh /init/fluent_bit_init_entrypoint.sh
RUN chmod +x /init/fluent_bit_init_entrypoint.sh
CMD /init/fluent_bit_init_entrypoint.sh