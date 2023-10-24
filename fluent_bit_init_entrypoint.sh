./init/fluent_bit_init_process
sed -i '/^exec/s/$/ -R \/parser-multiline.conf/' /init/invoke_fluent_bit.sh
source /init/invoke_fluent_bit.sh