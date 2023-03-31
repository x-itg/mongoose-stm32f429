include generated_sources.mk

PROG = firmware

MONGOOSE_FLAGS = -DMG_ARCH=MG_ARCH_FREERTOS -DMG_ENABLE_LWIP=1
MCU_FLAGS = -mcpu=cortex-m4 --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -DSTM32F429xx -DUSE_STM32F4XX_NUCLEO_144 -DUSE_HAL_DRIVER -fstack-usage -ffunction-sections 

PROJECT_ROOT_PATH = $(realpath $(CURDIR)/../..)

INCLUDES =	-I./Inc -I./Src 
INCLUDES += -I./Middlewares/Third_Party/Mongoose 
INCLUDES += $(DRIVERS_INCLUDES) $(FREERTOS_INCLUDES) $(LWIP_INCLUDES) 

SOURCES = 	$(wildcard Src/*.c) Middlewares/Third_Party/Mongoose/mongoose.c
SOURCES += 	$(BSP_SOURCES) $(HAL_SOURCES) $(FREERTOS_SOURCES) $(LWIP_SOURCES) $(OTHER_GENERATED_SOURCES)

OBJECTS = $(SOURCES:%.c=obj/%.o) obj/startup_stm32f429xx.o 

CFLAGS = -std=gnu11 -g3 -Os -W -Wall $(MCU_FLAGS) $(MONGOOSE_FLAGS) $(INCLUDES)

# STMCube generated code produces a lot of "unused parameter" warnings
CFLAGS += -Wno-unused-parameter

LINKFLAGS =	-mcpu=cortex-m4 -T"SW4STM32/STM32F429ZI_NUCLEO_144/STM32F429ZITx_FLASH.ld" --specs=nosys.specs \
						-Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -u _printf_float -Wl,--start-group -lc -lm -Wl,--end-group
						
build: $(PROG).bin

$(PROG).bin: $(PROG).elf
	arm-none-eabi-objcopy -O binary $< $@

$(PROG).elf: $(OBJECTS)
	arm-none-eabi-gcc $(OBJECTS) $(LINKFLAGS) -o $@
	arm-none-eabi-size $@

obj/%.o: %.c
	@mkdir -p $(dir $@)
	arm-none-eabi-gcc $(CFLAGS) -c $< -o $@

obj/startup_stm32f429xx.o: SW4STM32/startup_stm32f429xx.s
	@mkdir -p $(dir $@)
	arm-none-eabi-gcc $(CFLAGS) -x assembler-with-cpp -c $< -o $@

flash: $(PROG).bin
	st-flash --reset write $< 0x8000000
	
clean:
	@rm -rf $(PROG).* obj
