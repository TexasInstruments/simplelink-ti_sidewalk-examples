COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR ?= $(abspath ../../../../../../..)

include $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/imports.mak

CC = "$(GCC_ARMCOMPILER)/bin/arm-none-eabi-gcc"
LNK = "$(GCC_ARMCOMPILER)/bin/arm-none-eabi-gcc"
HEX = "$(GCC_ARMCOMPILER)/bin/arm-none-eabi-objcopy"

SYSCFG_CMD_STUB = $(SYSCONFIG_TOOL) --compiler gcc --product $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/.metadata/product.json
SYSCFG_FILES := $(shell $(SYSCFG_CMD_STUB) --listGeneratedFiles --listReferencedFiles --output . ../../freertos/sid_demo.syscfg)

SYSCFG_C_FILES = $(filter %.c,$(SYSCFG_FILES))
SYSCFG_H_FILES = $(filter %.h,$(SYSCFG_FILES))

OBJECTS = main.obj application_heap.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_assert.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_critical_region.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_crypto.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_delay.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_gpio.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_log.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_mfg_store.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_storage_kv.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_storage_patches_nvocmp.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_swi.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_temperature.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_ti_itm.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_timer.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_uptime.obj source_ti_common_nv_crc.obj application_app_ble_config.obj source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_ble_adapter_ble_adapter.obj source_ti_ti_sidewalk_apps_ti_common_components_ti_ble_osal_icall_ble.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_gatt_server.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_manager.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_manager_adapter_ble.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_mq_task.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_types.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_sid_hal_ti_sid_hal_memory.obj source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_sid_hal_ti_sid_hal_reset.obj source_ti_ble5stack_common_cc26xx_freertos_TI_heap_wrapper.obj source_ti_ble5stack_common_cc26xx_freertos_bget.obj source_ti_ble5stack_common_cc26xx_freertos_icall_POSIX.obj source_ti_ble5stack_host_gatt_uuid.obj source_ti_ble5stack_host_gattservapp_util.obj source_ti_ble5stack_icall_app_ble_user_config.obj source_ti_ble5stack_icall_app_icall_api_lite.obj source_ti_ble5stack_icall_src_icall_cc2650.obj source_ti_ble5stack_icall_src_icall_user_config.obj source_ti_ble5stack_icall_stack_ble_user_config_stack.obj source_ti_ble5stack_profiles_dev_info_cc26xx_devinfoservice.obj source_ti_ble5stack_rom_agama_r1_rom_init.obj $(patsubst %.c,%.obj,$(notdir $(SYSCFG_C_FILES)))
NAME = sid_demo

CFLAGS = -I../.. \
    -I. \
    @${CURDIR}/ti_ble_app_config.opt \
    @${CURDIR}/ti_build_config.opt \
    @${CURDIR}/ti_sidewalk.opt \
    "@$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/config/build_components.opt" \
    "@$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/config/factory_config.opt" \
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
    -I${CG_TOOL_ROOT}/arm-none-eabi/include/newlib-nano \
    -I${CG_TOOL_ROOT}/arm-none-eabi/include \
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
    -fstack-protector \
    -fstack-protector-strong \
    -mabi=aapcs \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/cc13xx_radio/include/ti" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/interfaces/timer_types" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/ti/sid_demo/app_source" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/ti/sid_demo/config" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/sid_hal/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/inc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx/freertos" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/controller/cc26xx/inc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/hal/src/inc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/hal/src/target/_common" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/inc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/src" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/src/inc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/inc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/osal/src/inc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/profiles/dev_info" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/rom" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/common/cc26xx" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/common/cc26xx" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/common/nv" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/devices/cc13x2x7_cc26x2x7" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/devices/cc13x2x7_cc26x2x7/driverlib" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/devices/cc13x2x7_cc26x2x7" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/devices/cc13x2x7_cc26x2x7/driverlib" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/dpk/osal/common/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/dpk/osal/freertos/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/dpk/osal/socket/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/framework/utils/include/ace" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/ace/sdk/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/iot_ble" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sall_link_metrics_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sall_mgm_core_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sall_mgm_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sall_security_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_900_network_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_ble_network_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_clock_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_endian" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_event_log_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_event_queue_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_list" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_network_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_protocol_defs" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_remote_logging/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_rng/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_sdk_internal_config_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_security_crypt_mask_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_security_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_state_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_time_ops/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/sid_utils" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/internal/storage_kv_keys" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_900_cfg" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_ama_adapter_ifc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_api" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_ble_cfg" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_coverage_api" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_error" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_network_coverage_api" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_sdk_config" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_ifc/sid_sdk_gw_config" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/assert" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/ble_adapter" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/critical_region" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/crypto" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/delay" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/gpio" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/log" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/mfg_store" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/radio" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/storage_kv" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/swi" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/temperature" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/timer" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/public/sid_pal_ifc/uptime" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_900_network_impl/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_api/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_ble_network_impl/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_memory_pool/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/hal/sid_hal_ifc/memory" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/hal/sid_hal_ifc/reset" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/dcr/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/ifc/phy_ifc/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/ifc/protocol_metrics_ifc/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/ifc/regulatory_ifc/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/common/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/mac/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/mac/src/network/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/phy" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/phy/sid_phy_wrapper" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/sid_mac_freq_hop/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/dpk_impl/sid_mcu/common/sid_protocol/utils/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_parsers/sid_demo_parser/include" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/sal/common/sid_parsers/sid_parser_utils/include" \
    -include sid_protocol_opts.h \
    -DDeviceFamily_CC26X2X7 \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source" \
    -Os \
    -DMANUFACTURE_FLASH_START=0xAE000 \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/posix/gcc" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/kernel/freertos" \
    "-I$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/kernel/freertos/dpl" \
    "-I$(FREERTOS_INSTALL_DIR)/FreeRTOS/Source/include" \
    "-I$(FREERTOS_INSTALL_DIR)/FreeRTOS/Source/portable/GCC/ARM_CM4F" \
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
    -Wall \
    "-I$(GCC_ARMCOMPILER)/arm-none-eabi/include/newlib-nano" \
    "-I$(GCC_ARMCOMPILER)/arm-none-eabi/include"

LFLAGS = -L${PROJECT_ROOT}/Debug \
    "-L$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/third_party/sidewalk/apps/common/sidewalk_sdk/ama/prebuilts/release" \
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
    "-L$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/libraries/cc26x2r1" \
    -Wl,-T,../../freertos/gcc/cc13x2x7_cc26x2x7_freertos.lds \
    "-Wl,-Map,$(NAME).map" \
    "-L$(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source" \
    ti_utils_build_linker.cmd.genlibs \
    -l:ti/devices/cc13x2x7_cc26x2x7/driverlib/bin/gcc/driverlib.lib \
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
all: $(NAME).hex

.INTERMEDIATE: syscfg
$(SYSCFG_FILES): syscfg
	@ echo generation complete

syscfg: ../../freertos/sid_demo.syscfg
	@ echo Generating configuration files...
	@ $(SYSCFG_CMD_STUB) --output $(@D) $<

define C_RULE
$(basename $(notdir $(1))).obj: $(1) $(SYSCFG_H_FILES)
	@ echo Building $$@
	@ $(CC) $(CFLAGS) "$$<" -c -o $$@
endef

$(foreach c_file,$(SYSCFG_C_FILES),$(eval $(call C_RULE,$(c_file))))

main.obj: ../../main.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

application_heap.obj: ../../application/heap.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_assert.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/assert.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_critical_region.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/critical_region.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_crypto.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/crypto.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_delay.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/delay.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_gpio.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/gpio.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_log.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/log.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_mfg_store.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/mfg_store.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_storage_kv.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/storage_kv.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_storage_patches_nvocmp.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/storage_patches/nvocmp.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_swi.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/swi.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_temperature.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/temperature.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_ti_itm.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/ti_itm.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_timer.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/timer.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_uptime.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/uptime.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_common_nv_crc.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/common/nv/crc.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

application_app_ble_config.obj: ../../application/app_ble_config.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_common_sal_ti_sid_pal_ble_adapter_ble_adapter.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/common/sal/ti/sid_pal/ble_adapter/ble_adapter.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_apps_ti_common_components_ti_ble_osal_icall_ble.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/apps/ti/common/components/ti_ble/osal_icall_ble.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_gatt_server.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_gatt_server.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_manager.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_manager.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_manager_adapter_ble.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_manager_adapter_ble.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_mq_task.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_mq_task.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_iot_ble_iot_ble_hal_types.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/iot_ble/iot_ble_hal_types.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_sid_hal_ti_sid_hal_memory.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/sid_hal/ti_sid_hal_memory.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ti_sidewalk_dpk_impl_sid_mcu_ti_hal_sid_hal_ti_sid_hal_reset.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ti_sidewalk/dpk_impl/sid_mcu/ti/hal/sid_hal/ti_sid_hal_reset.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_common_cc26xx_freertos_TI_heap_wrapper.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx/freertos/TI_heap_wrapper.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_common_cc26xx_freertos_bget.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx/freertos/bget.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_common_cc26xx_freertos_icall_POSIX.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/common/cc26xx/freertos/icall_POSIX.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_host_gatt_uuid.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/host/gatt_uuid.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_host_gattservapp_util.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/host/gattservapp_util.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_app_ble_user_config.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/app/ble_user_config.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_app_icall_api_lite.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/app/icall_api_lite.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_src_icall_cc2650.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/src/icall_cc2650.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_src_icall_user_config.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/src/icall_user_config.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_icall_stack_ble_user_config_stack.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/icall/stack/ble_user_config_stack.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_profiles_dev_info_cc26xx_devinfoservice.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/profiles/dev_info/cc26xx/devinfoservice.c $(SYSCFG_H_FILES)
	@ echo Building $@
	@ $(CC) $(CFLAGS) $< -c -o $@

source_ti_ble5stack_rom_agama_r1_rom_init.obj: $(COM_TI_SIMPLELINK_CC13XX_CC26XX_SDK_INSTALL_DIR)/source/ti/ble5stack/rom/agama_r1/rom_init.c $(SYSCFG_H_FILES)
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
