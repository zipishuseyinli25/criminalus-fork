section .text
global _start

_start:
    ; Python bootloader startup
    sys_call python_cpu_device_found

    ; Booting kernel
    sys_call python_bootloader_boot_kernel

    ; Kernel reader initialization
    sys_call kernel_reader_zen_kernel_found

    ; Check for Zen kernel
    cmp byte [zen_kernel_found], 0
    je dont_found_zen_kernel

    ; Booting module os device
    sys_call booting_module_os_device
    jmp end_booting

dont_found_zen_kernel:
    ; Zen kernel not found
    ; Handle accordingly or jump to an error routine

end_booting:
    ; Continue with the rest of your code
    sys_call start_main_gpuid_start
    sysroot_main equ gui_starting

    ; GUI initialization
    sys_call start_gui_table
    sys_call start_pyiso_reader
    sys_call start_pyiso_key_verification

    ; Continue with the rest of your assembly code
