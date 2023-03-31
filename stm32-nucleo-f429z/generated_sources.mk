HAL_SOURCES = ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma2d.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_eth.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sdram.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c \
							./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fmc.c 

BSP_SOURCES = ./Drivers/BSP/STM32F4xx_Nucleo_144/stm32f4xx_nucleo_144.c 


DRIVERS_INCLUDES =	-I./Drivers/CMSIS/Device/ST/STM32F4xx/Include \
										-I./Drivers/CMSIS/Include \
										-I./Drivers/STM32F4xx_HAL_Driver/Inc \
										-I./Drivers/BSP/STM32F4xx_Nucleo_144 \
										-I.Drivers/BSP/Components/Common 

FREERTOS_SOURCES = 	./Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/cmsis_os.c \
										./Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c \
										./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c \
										./Middlewares/Third_Party/FreeRTOS/Source/croutine.c \
										./Middlewares/Third_Party/FreeRTOS/Source/list.c \
										./Middlewares/Third_Party/FreeRTOS/Source/queue.c \
										./Middlewares/Third_Party/FreeRTOS/Source/tasks.c \
										./Middlewares/Third_Party/FreeRTOS/Source/timers.c 

FREERTOS_INCLUDES += 	-I./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F \
											-I./Middlewares/Third_Party/FreeRTOS/Source/include \
											-I./Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS 

LWIP_SOURCES =	./Middlewares/Third_Party/LwIP/src/api/api_lib.c \
								./Middlewares/Third_Party/LwIP/src/api/api_msg.c \
								./Middlewares/Third_Party/LwIP/src/api/err.c \
								./Middlewares/Third_Party/LwIP/src/api/netbuf.c \
								./Middlewares/Third_Party/LwIP/src/api/netdb.c \
								./Middlewares/Third_Party/LwIP/src/api/netifapi.c \
								./Middlewares/Third_Party/LwIP/src/api/sockets.c \
								./Middlewares/Third_Party/LwIP/src/api/tcpip.c \
								./Middlewares/Third_Party/LwIP/src/apps/http/fs.c \
								./Middlewares/Third_Party/LwIP/src/apps/http/httpd.c \
								./Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.c \
								./Middlewares/Third_Party/LwIP/src/core/ipv4/dhcp.c \
								./Middlewares/Third_Party/LwIP/src/core/ipv4/etharp.c \
								./Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.c \
								./Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.c \
								./Middlewares/Third_Party/LwIP/src/core/ipv4/ip4.c \
								./Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_addr.c \
								./Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_frag.c \
								./Middlewares/Third_Party/LwIP/src/core/def.c \
								./Middlewares/Third_Party/LwIP/src/core/dns.c \
								./Middlewares/Third_Party/LwIP/src/core/inet_chksum.c \
								./Middlewares/Third_Party/LwIP/src/core/init.c \
								./Middlewares/Third_Party/LwIP/src/core/ip.c \
								./Middlewares/Third_Party/LwIP/src/core/mem.c \
								./Middlewares/Third_Party/LwIP/src/core/memp.c \
								./Middlewares/Third_Party/LwIP/src/core/netif.c \
								./Middlewares/Third_Party/LwIP/src/core/pbuf.c \
								./Middlewares/Third_Party/LwIP/src/core/raw.c \
								./Middlewares/Third_Party/LwIP/src/core/stats.c \
								./Middlewares/Third_Party/LwIP/src/core/sys.c \
								./Middlewares/Third_Party/LwIP/src/core/tcp.c \
								./Middlewares/Third_Party/LwIP/src/core/tcp_in.c \
								./Middlewares/Third_Party/LwIP/src/core/tcp_out.c \
								./Middlewares/Third_Party/LwIP/src/core/timeouts.c \
								./Middlewares/Third_Party/LwIP/src/core/udp.c \
								./Middlewares/Third_Party/LwIP/src/netif/ethernet.c \
								./Middlewares/Third_Party/LwIP/system/OS/sys_arch.c 

LWIP_INCLUDES =	-I./Middlewares/Third_Party/LwIP/src/include \
								-I./Middlewares/Third_Party/LwIP/system

OTHER_GENERATED_SOURCES = SW4STM32/syscalls.c
