SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR ?= $(abspath ../../../../../../..)

MAKEFILE := $(lastword $(MAKEFILE_LIST))
BASE_DIR := $(realpath $(dir $(MAKEFILE)))

include $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/imports.mak

CC = "$(GCC_ARMCOMPILER)/bin/arm-none-eabi-gcc"
LNK = "$(GCC_ARMCOMPILER)/bin/arm-none-eabi-gcc"
HEX = "$(GCC_ARMCOMPILER)/bin/arm-none-eabi-objcopy"

SYSCFG_CMD_STUB = $(SYSCONFIG_TOOL) --compiler gcc --product $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/.metadata/product.json
SYSCFG_FILES := $(shell $(SYSCFG_CMD_STUB) --listGeneratedFiles --listReferencedFiles --output . ../../freertos/sid_demo.syscfg)

SYSCFG_C_FILES = $(filter %.c,$(SYSCFG_FILES))
SYSCFG_H_FILES = $(filter %.h,$(SYSCFG_FILES))
SYSCFG_OPT_FILES = $(filter %.opt,$(SYSCFG_FILES))

OBJECTS = main.obj application_heap.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_assert.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_critical_region.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_crypto.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_delay.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_gpio.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_log.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_mfg_store.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_storage_kv.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_storage_patches_nvocmp.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_swi.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_temperature.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_ti_itm.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_timer.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_uptime.obj source_ti_common_nv_crc.obj application_app_ble_config.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_ble_adapter_ble_adapter.obj source_ti_ti_sidewalk_apps_ti_common_components_ti_ble_osal_icall_ble.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_gatt_server.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_manager.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_manager_adapter_ble.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_mq_task.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_types.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_sid_hal_ti_sid_hal_memory.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_sid_hal_ti_sid_hal_reset.obj source_ti_ble5stack_common_cc26xx_freertos_TI_heap_wrapper.obj source_ti_ble5stack_common_cc26xx_freertos_bget.obj source_ti_ble5stack_common_cc26xx_freertos_icall_POSIX.obj source_ti_ble5stack_host_gatt_uuid.obj source_ti_ble5stack_host_gattservapp_util.obj source_ti_ble5stack_icall_app_ble_user_config.obj source_ti_ble5stack_icall_app_icall_api_lite.obj source_ti_ble5stack_icall_src_icall_cc2650.obj source_ti_ble5stack_icall_src_icall_user_config.obj source_ti_ble5stack_icall_stack_ble_user_config_stack.obj source_ti_ble5stack_profiles_dev_info_cc26xx_devinfoservice.obj source_ti_ble5stack_rom_agama_r1_rom_init.obj sysconfig_fsk_ti_radio_config.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_cc13xx_radio.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_cc13xx_radio_fsk.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_cc13xx_radio_lora.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_ti_RFQueue.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_ti_cc13xx.obj source_ti_common_sys_syscalls_stub.obj $(patsubst %.c,%.obj,$(notdir $(SYSCFG_C_FILES)))
NAME = sid_demo

CFLAGS += -I../.. \
    -I. \
    $(addprefix @,$(SYSCFG_OPT_FILES)) \
    "@$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/config/build_components.opt" \
    "@$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/config/factory_config.opt" \
    -DUNIFIED_ASL_SUPPORT=1 \
    -DFLASH_ROM_BUILD \
    -DFREERTOS \
    -DHALL_USE_ASSERT \
    -DHALO_WITH_MODULE_HALO_LIB_HALL \
    -DHALO_WITH_MODULE_HALO_LIB_HALO_MANAGEMENT=1 \
    -DMETRICS_ENABLED=1 \
    -DMR_POSIX \
    -DNVOCMP_MIN_VDD_FLASH_MV=1800 \
    -DNVOCMP_NVS_MUTEX \
    -DNVOCMP_NWSAMEITEM=1 \
    -DPROTOCOL_STANDALONE_BUILD=1 \
    -DREGION_US915 \
    -DRNET_SECURITY_BUILD=1 \
    -DSALL_ENABLE_ENDPOINT_ONLY_CMDS \
    -DSIDEWALK_ENABLE_DEBUG_LOGS=1 \
    -DSIDEWALK_NO_SYSTEM_RESET_REPORTS \
    -DSID_BLE_PERIODIC_TIMESYNC_ENABLED=0 \
    -DSID_BUILD_DEBUG=1 \
    -DSID_BUILD_RELEASE=0 \
    -DSID_ENABLE_BLE_OR_900MHZ=0 \
    -DSID_EVENT_LOG_DATABASE_FILE_NAME=protocol_event_log_database.h \
    -DSID_EVENT_LOG_ENABLED=1 \
    -DSID_EVENT_LOG_RENDERER=1 \
    -DSID_FSK_WAN_SUPPORT=1 \
    -DSID_HAL_PROTOCOL_MEMORY_SZ=1024 \
    -DSID_PAL_ASSERT_DISABLED \
    -DSID_PAL_LOG_ENABLED=1 \
    -DSID_PAL_STORAGE_KV_INTERNAL_CONFIG_GROUP_ID=2 \
    -DSID_PAL_STORAGE_KV_INTERNAL_PROTOCOL_GROUP_ID=1 \
    -DSID_SDK_CONFIG_ENABLE_LINK_TYPE_3=0 \
    -DTI_LOG_WITH_TIMESTAMP=1 \
    -DWORKAROUND_RNET_HALL_DEPS \
    "-I$(GCC_ARMCOMPILER)/arm-none-eabi/include/newlib-nano" \
    "-I$(GCC_ARMCOMPILER)/arm-none-eabi/include" \
    -Wextra \
    -Winit-self \
    -Wno-cast-function-type \
    -Wno-comment \
    -Wno-error=discarded-qualifiers \
    -Wno-error=enum-compare \
    -Wno-error=format-truncation \
    -Wno-error=implicit-function-declaration \
    -Wno-error=incompatible-pointer-types \
    -Wno-error=int-conversion \
    -Wno-error=maybe-uninitialized \
    -Wno-error=pointer-sign \
    -Wno-error=switch \
    -Wno-error=unused-but-set-variable \
    -Wno-error=unused-const-variable= \
    -Wno-error=unused-function \
    -Wno-error=unused-value \
    -Wno-error=unused-variable \
    -Wno-expansion-to-defined \
    -Wno-ignored-qualifiers \
    -Wno-implicit-fallthrough \
    -Wno-missing-field-initializers \
    -Wno-sign-compare \
    -Wno-type-limits \
    -Wno-unused \
    -fdiagnostics-color=always \
    -fno-builtin \
    -fno-strict-aliasing \
    -fshort-enums \
    -mabi=aapcs \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/include/ti" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/interfaces/timer_types" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/ti/sid_demo/app_source" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/ti/sid_demo/config" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/sid_hal/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/inc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx/freertos" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/controller/cc26xx/inc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/hal/src/inc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/hal/src/target/_common" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/inc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/src" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/src/inc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/inc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/osal/src/inc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/profiles/dev_info" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/rom" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/common/cc26xx" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/common/cc26xx" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/common/nv" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/devices/cc13x2x7_cc26x2x7" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/devices/cc13x2x7_cc26x2x7/driverlib" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/devices/cc13x2x7_cc26x2x7" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/devices/cc13x2x7_cc26x2x7/driverlib" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/dpk/osal/common/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/dpk/osal/freertos/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/dpk/osal/socket/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/framework/utils/include/ace" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/iot_ble" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sall_link_metrics_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sall_mgm_core_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sall_mgm_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sall_security_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_900_network_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_ble_network_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_clock_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_endian" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_event_log_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_event_queue_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_list" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_network_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_protocol_defs" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_remote_logging/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_rng/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_sdk_internal_config_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_security_crypt_mask_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_security_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_state_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_time_ops/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_utils" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/storage_kv_keys" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_900_cfg" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_ama_adapter_ifc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_api" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_ble_cfg" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_coverage_api" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_error" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_network_coverage_api" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_sdk_config" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_sdk_gw_config" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/assert" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/ble_adapter" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/critical_region" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/crypto" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/delay" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/gpio" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/log" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/mfg_store" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/radio" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/storage_kv" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/swi" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/temperature" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/timer" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/uptime" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_900_network_impl/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_api/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_ble_network_impl/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_memory_pool/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/hal/sid_hal_ifc/memory" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/hal/sid_hal_ifc/reset" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/dcr/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/ifc/phy_ifc/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/ifc/protocol_metrics_ifc/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/ifc/regulatory_ifc/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/common/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/mac/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/network/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/phy" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/phy/sid_phy_wrapper" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/sid_mac_freq_hop/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/utils/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_parsers/sid_demo_parser/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_parsers/sid_parser_utils/include" \
    -include "$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/include/sid_protocol_opts.h" \
    -DBUILD_900MHZ_SUPPORT=1 \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/ti/sid_demo/app_source/cc1352p7/sysconfig" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source" \
    -Os \
    -DMANUFACTURE_FLASH_START=0xAE000 \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/posix/gcc" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/kernel/freertos" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/kernel/freertos/dpl" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/freertos/include" \
    "-I$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/freertos/portable/GCC/ARM_CM4F" \
    -mcpu=cortex-m4 \
    -march=armv7e-m \
    -mthumb \
    -std=c99 \
    -mfloat-abi=hard \
    -mfpu=fpv4-sp-d16 \
    -ffunction-sections \
    -fdata-sections \
    -g \
    -gstrict-dwarf \
    -Wall

LFLAGS += -L../../Debug \
    "-L$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/ama/prebuilts/release" \
    -Wl,-l:OneLib.a \
    -Wl,-l:StackWrapper.a \
    -Wl,-l:ble_r2.symbols \
    -mabi=aapcs \
    -ffunction-sections \
    -fdata-sections \
    -fno-strict-aliasing \
    -fno-builtin \
    -fshort-enums \
    -fdiagnostics-color=always \
    --specs=nosys.specs \
    "-L$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/libraries/cc13x2r1" \
    -Wl,-T,../../freertos/gcc/cc13x2x7_cc26x2x7_freertos.lds \
    "-Wl,-Map,$(NAME).map" \
    "-L$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source" \
    ti_utils_build_linker.cmd.genlibs \
    -march=armv7e-m \
    -mthumb \
    -mfloat-abi=hard \
    -mfpu=fpv4-sp-d16 \
    -nostartfiles \
    -static \
    -Wl,--gc-sections \
    "-L$(GCC_ARMCOMPILER)/arm-none-eabi/lib/thumb/v7e-m/hard" \
    -lgcc \
    -lc \
    -lm \
    -lnosys \
    --specs=nano.specs

all: postbuild

.PHONY: postbuild
postbuild: $(NAME).hex
	$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/tools/sidewalk/web_app/bin/deploy_stack -c $(BASE_DIR)/ti_sidewalk_config.yaml --credentials $(BASE_DIR)/../../aws_credentials/aws_credentials.yaml;
	$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/tools/sidewalk/generate_prototype/bin/generate_prototype -c $(BASE_DIR)/ti_sidewalk_config.yaml -o $(BASE_DIR)/SidewalkDevice --credentials $(BASE_DIR)/../../aws_credentials/aws_credentials.yaml;
	$(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/tools/sidewalk/merge_bin_with_hex/bin/merge_bin_with_hex $(BASE_DIR)/$(NAME).hex $(BASE_DIR)/SidewalkDevice/TI.bin 0xAE000 $(BASE_DIR)/$(NAME)_merged.hex;

.INTERMEDIATE: syscfg
$(SYSCFG_FILES): syscfg
	@ echo generation complete

syscfg: ../../freertos/sid_demo.syscfg
	@ echo Generating configuration files...
	@ $(SYSCFG_CMD_STUB) --output $(@D) $<

define C_RULE
$(basename $(notdir $(1))).obj: $(1) $(SYSCFG_H_FILES)
	@ echo Building $$@
	@ $(CC) $(CFLAGS) $$< -c -o $$@
endef

$(foreach c_file,$(SYSCFG_C_FILES),$(eval $(call C_RULE,$(c_file))))

main.obj: ../../main.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

application_heap.obj: ../../application/heap.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_assert.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/assert.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_critical_region.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/critical_region.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_crypto.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/crypto.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_delay.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/delay.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_gpio.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/gpio.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_log.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/log.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_mfg_store.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/mfg_store.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_storage_kv.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/storage_kv.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_storage_patches_nvocmp.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/storage_patches/nvocmp.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_swi.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/swi.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_temperature.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/temperature.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_ti_itm.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/ti_itm.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_timer.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/timer.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_uptime.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/uptime.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_common_nv_crc.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/common/nv/crc.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

application_app_ble_config.obj: ../../application/app_ble_config.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_ble_adapter_ble_adapter.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/ble_adapter/ble_adapter.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_ti_common_components_ti_ble_osal_icall_ble.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/ti/common/components/ti_ble/osal_icall_ble.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_gatt_server.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_gatt_server.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_manager.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_manager.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_manager_adapter_ble.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_manager_adapter_ble.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_mq_task.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_mq_task.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_types.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_types.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_sid_hal_ti_sid_hal_memory.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/sid_hal/ti_sid_hal_memory.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_sid_hal_ti_sid_hal_reset.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/sid_hal/ti_sid_hal_reset.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_common_cc26xx_freertos_TI_heap_wrapper.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx/freertos/TI_heap_wrapper.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_common_cc26xx_freertos_bget.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx/freertos/bget.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_common_cc26xx_freertos_icall_POSIX.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx/freertos/icall_POSIX.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_host_gatt_uuid.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/host/gatt_uuid.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_host_gattservapp_util.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/host/gattservapp_util.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_app_ble_user_config.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/app/ble_user_config.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_app_icall_api_lite.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/app/icall_api_lite.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_src_icall_cc2650.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/src/icall_cc2650.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_src_icall_user_config.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/src/icall_user_config.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_stack_ble_user_config_stack.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/stack/ble_user_config_stack.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_profiles_dev_info_cc26xx_devinfoservice.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/profiles/dev_info/cc26xx/devinfoservice.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_rom_agama_r1_rom_init.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/rom/agama_r1/rom_init.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

sysconfig_fsk_ti_radio_config.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/ti/sid_demo/app_source/cc1352p7/sysconfig/fsk_ti_radio_config.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_cc13xx_radio.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/cc13xx_radio.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_cc13xx_radio_fsk.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/cc13xx_radio_fsk.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_cc13xx_radio_lora.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/cc13xx_radio_lora.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_ti_RFQueue.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/ti/RFQueue.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_cc13xx_radio_ti_cc13xx.obj: $(SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/ti/cc13xx.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_common_sys_syscalls_stub.obj: ../../source/ti/common/sys/syscalls_stub.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

$(NAME).out: $(OBJECTS)
	@ echo linking $@
	@ $(LNK)  $(OBJECTS)  $(LFLAGS) -o $(NAME).out

$(NAME).hex: $(NAME).out
	@ echo building $@
	@ $(HEX) -O ihex --remove-section .vtable --remove-section .dmaSpi0RxControlTableEntry --remove-section .dmaSpi0TxControlTableEntry --remove-section .dmaSpi1RxControlTableEntry --remove-section .dmaSpi1TxControlTableEntry --remove-section .dmaSpi0RxAltControlTableEntry --remove-section .dmaSpi0TxAltControlTableEntry --remove-section .dmaSpi1RxAltControlTableEntry --remove-section .dmaSpi1TxAltControlTableEntry --gap-fill 0xff $? $@

clean:
	@ echo Cleaning...
	@ $(RM) $(OBJECTS) > $(DEVNULL) 2>&1
	@ $(RM) $(NAME).out > $(DEVNULL) 2>&1
	@ $(RM) $(NAME).map > $(DEVNULL) 2>&1
	@ $(RM) $(NAME).hex > $(DEVNULL) 2>&1
	@ $(RM) $(SYSCFG_FILES)> $(DEVNULL) 2>&1
