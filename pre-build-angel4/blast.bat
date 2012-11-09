echo off

scac -hard -off=flush_pipe -DLL=C:\AshlingOpellaXDforARC\opxdarc -blast=C:\000-use-this-folder-for-your-tests-000\frank\angel4\A7_80MHz_64bit_I32k_D32k_AA4.xbf -memxfersize=0x8000 -prop=jtag_frequency=1 -on=jtag_optimise -prop=auto_address=1 -prop=gclk0=72 -prop=gclk=80 -on=reload_readonly -mmu C:\000-use-this-folder-for-your-tests-000\frank\angel4\vmlinux
