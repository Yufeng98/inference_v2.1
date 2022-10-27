export NUM_SOCKETS=1        # i.e. 8
export CPUS_PER_SOCKET=24   # i.e. 28
export CPUS_PER_PROCESS=6  # which determine how much processes will be used
                            # process-per-socket = CPUS_PER_SOCKET/CPUS_PER_PROCESS
export CPUS_PER_INSTANCE=6  # instance-per-process number=CPUS_PER_PROCESS/CPUS_PER_INSTANCE
                             # total-instance = instance-per-process * process-per-socket
export BATCH_SIZE=128
export DNNL_MAX_CPU_ISA=AVX512_CORE_AMX
