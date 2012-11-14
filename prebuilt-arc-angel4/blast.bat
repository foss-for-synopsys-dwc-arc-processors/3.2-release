echo off

scac -hard -off=flush_pipe -DLL=C:\AshlingOpellaXDforARC\opxdarc -blast=C:\ARC_AA4_A7_80MHz_64B_I32KB_D32KB_AA4.xbf -memxfersize=0x8000 -prop=jtag_frequency=1 -on=jtag_optimise -prop=auto_address=1 -prop=gclk0=72 -prop=gclk=80 -on=reload_readonly -mmu C:\arc-angel4-vmlinux
