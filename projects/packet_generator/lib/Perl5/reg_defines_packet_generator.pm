#############################################################
#
# Perl register defines
#
# Project: Packet Generator (packet_generator)
# Description: Packet Generator that replays PCAP files
#
#############################################################

package reg_defines_packet_generator;

use Exporter;

@ISA = ('Exporter');

@EXPORT = qw(
                DEVICE_ID
                DEVICE_MAJOR
                DEVICE_MINOR
                DEVICE_REVISION
                DEVICE_PROJ_DIR
                DEVICE_PROJ_NAME
                DEVICE_PROJ_DESC
                MAX_PHY_PORTS
                PCI_ADDR_WIDTH
                PCI_DATA_WIDTH
                PCI_BE_WIDTH
                CPCI_CNET_ADDR_WIDTH
                CPCI_CNET_DATA_WIDTH
                CPCI_NF2_ADDR_WIDTH
                CPCI_NF2_DATA_WIDTH
                DMA_DATA_WIDTH
                DMA_CTRL_WIDTH
                CPCI_DEBUG_DATA_WIDTH
                SRAM_ADDR_WIDTH
                SRAM_DATA_WIDTH
                DRAM_ADDR_WIDTH
                FAST_CLK_PERIOD
                SLOW_CLK_PERIOD
                IO_QUEUE_STAGE_NUM
                DATA_WIDTH
                CTRL_WIDTH
                NUM_OUTPUT_QUEUES
                OQ_DEFAULT_MAX_PKTS
                OQ_SRAM_PKT_CNT_WIDTH
                OQ_SRAM_WORD_CNT_WIDTH
                OQ_SRAM_BYTE_CNT_WIDTH
                OQ_ENABLE_SEND_BIT_NUM
                OQ_INITIALIZE_OQ_BIT_NUM
                OQ_PKT_GEN_ITER_WIDTH
                RATE_LIMIT_ENABLE_BIT_NUM
                RATE_LIMIT_INCLUDE_OVERHEAD_BIT_NUM
                DEV_ID_NUM_REGS
                DEV_ID_NON_STR_REGS
                DEV_ID_MD5SUM_LENGTH
                DEV_ID_PROJ_DIR_WORD_LEN
                DEV_ID_PROJ_DIR_BYTE_LEN
                DEV_ID_PROJ_DIR_BIT_LEN
                DEV_ID_PROJ_NAME_WORD_LEN
                DEV_ID_PROJ_NAME_BYTE_LEN
                DEV_ID_PROJ_NAME_BIT_LEN
                DEV_ID_PROJ_DESC_WORD_LEN
                DEV_ID_PROJ_DESC_BYTE_LEN
                DEV_ID_PROJ_DESC_BIT_LEN
                DEV_ID_MD5_VALUE_V1_0
                DEV_ID_MD5_VALUE_V1_1
                DEV_ID_MD5_VALUE_V1_2
                DEV_ID_MD5_VALUE_V1_3
                DEV_ID_MD5_VALUE_V2_0
                DEV_ID_MD5_VALUE_V2_1
                DEV_ID_MD5_VALUE_V2_2
                DEV_ID_MD5_VALUE_V2_3
                DEV_ID_NUM_REGS_V1
                DEV_ID_NON_STR_REGS_V1
                DEV_ID_PROJ_NAME_WORD_LEN_V1
                DEV_ID_PROJ_NAME_BYTE_LEN_V1
                DEV_ID_PROJ_NAME_BIT_LEN_V1
                CPU_QUEUE_REGS_ENABLE
                CPU_QUEUE_REGS_DISABLE
                MAC_GRP_TX_QUEUE_DISABLE_BIT_NUM
                MAC_GRP_RX_QUEUE_DISABLE_BIT_NUM
                MAC_GRP_RESET_MAC_BIT_NUM
                MAC_GRP_MAC_DISABLE_TX_BIT_NUM
                MAC_GRP_MAC_DISABLE_RX_BIT_NUM
                MAC_GRP_MAC_DIS_JUMBO_TX_BIT_NUM
                MAC_GRP_MAC_DIS_JUMBO_RX_BIT_NUM
                MAC_GRP_MAC_DIS_CRC_CHECK_BIT_NUM
                MAC_GRP_MAC_DIS_CRC_GEN_BIT_NUM
                PKT_CAP_DA_HI
                PKT_CAP_DA_LO
                PKT_CAP_SA_HI
                PKT_CAP_SA_LO
                PKT_CAP_ETHERTYPE
                DELAY_CTRL_VAL
                PAD_CTRL_VAL
                CORE_BASE_ADDR
                DEV_ID_BASE_ADDR
                MDIO_BASE_ADDR
                COUNTER_BASE_ADDR
                DMA_BASE_ADDR
                MAC_GRP_0_BASE_ADDR
                MAC_GRP_1_BASE_ADDR
                MAC_GRP_2_BASE_ADDR
                MAC_GRP_3_BASE_ADDR
                CPU_QUEUE_0_BASE_ADDR
                CPU_QUEUE_1_BASE_ADDR
                CPU_QUEUE_2_BASE_ADDR
                CPU_QUEUE_3_BASE_ADDR
                SRAM_BASE_ADDR
                UDP_BASE_ADDR
                OQ_BASE_ADDR
                IN_ARB_BASE_ADDR
                DELAY_BASE_ADDR
                RATE_LIMIT_0_BASE_ADDR
                RATE_LIMIT_1_BASE_ADDR
                RATE_LIMIT_2_BASE_ADDR
                RATE_LIMIT_3_BASE_ADDR
                RATE_LIMIT_4_BASE_ADDR
                RATE_LIMIT_5_BASE_ADDR
                RATE_LIMIT_6_BASE_ADDR
                RATE_LIMIT_7_BASE_ADDR
                PKT_GEN_BASE_ADDR
                DRAM_BASE_ADDR
                CPU_QUEUE_OFFSET
                MAC_GRP_OFFSET
                RATE_LIMIT_OFFSET
                DEV_ID_MD5_0_REG
                DEV_ID_MD5_1_REG
                DEV_ID_MD5_2_REG
                DEV_ID_MD5_3_REG
                DEV_ID_DEVICE_ID_REG
                DEV_ID_VERSION_REG
                DEV_ID_CPCI_ID_REG
                DEV_ID_PROJ_DIR_0_REG
                DEV_ID_PROJ_DIR_1_REG
                DEV_ID_PROJ_DIR_2_REG
                DEV_ID_PROJ_DIR_3_REG
                DEV_ID_PROJ_DIR_4_REG
                DEV_ID_PROJ_DIR_5_REG
                DEV_ID_PROJ_DIR_6_REG
                DEV_ID_PROJ_DIR_7_REG
                DEV_ID_PROJ_DIR_8_REG
                DEV_ID_PROJ_DIR_9_REG
                DEV_ID_PROJ_DIR_10_REG
                DEV_ID_PROJ_DIR_11_REG
                DEV_ID_PROJ_DIR_12_REG
                DEV_ID_PROJ_DIR_13_REG
                DEV_ID_PROJ_DIR_14_REG
                DEV_ID_PROJ_DIR_15_REG
                DEV_ID_PROJ_NAME_0_REG
                DEV_ID_PROJ_NAME_1_REG
                DEV_ID_PROJ_NAME_2_REG
                DEV_ID_PROJ_NAME_3_REG
                DEV_ID_PROJ_NAME_4_REG
                DEV_ID_PROJ_NAME_5_REG
                DEV_ID_PROJ_NAME_6_REG
                DEV_ID_PROJ_NAME_7_REG
                DEV_ID_PROJ_NAME_8_REG
                DEV_ID_PROJ_NAME_9_REG
                DEV_ID_PROJ_NAME_10_REG
                DEV_ID_PROJ_NAME_11_REG
                DEV_ID_PROJ_NAME_12_REG
                DEV_ID_PROJ_NAME_13_REG
                DEV_ID_PROJ_NAME_14_REG
                DEV_ID_PROJ_NAME_15_REG
                DEV_ID_PROJ_DESC_0_REG
                DEV_ID_PROJ_DESC_1_REG
                DEV_ID_PROJ_DESC_2_REG
                DEV_ID_PROJ_DESC_3_REG
                DEV_ID_PROJ_DESC_4_REG
                DEV_ID_PROJ_DESC_5_REG
                DEV_ID_PROJ_DESC_6_REG
                DEV_ID_PROJ_DESC_7_REG
                DEV_ID_PROJ_DESC_8_REG
                DEV_ID_PROJ_DESC_9_REG
                DEV_ID_PROJ_DESC_10_REG
                DEV_ID_PROJ_DESC_11_REG
                DEV_ID_PROJ_DESC_12_REG
                DEV_ID_PROJ_DESC_13_REG
                DEV_ID_PROJ_DESC_14_REG
                DEV_ID_PROJ_DESC_15_REG
                DEV_ID_PROJ_DESC_16_REG
                DEV_ID_PROJ_DESC_17_REG
                DEV_ID_PROJ_DESC_18_REG
                DEV_ID_PROJ_DESC_19_REG
                DEV_ID_PROJ_DESC_20_REG
                DEV_ID_PROJ_DESC_21_REG
                DEV_ID_PROJ_DESC_22_REG
                DEV_ID_PROJ_DESC_23_REG
                DEV_ID_PROJ_DESC_24_REG
                MDIO_PHY_0_CONTROL_REG
                MDIO_PHY_0_STATUS_REG
                MDIO_PHY_0_PHY_ID_HI_REG
                MDIO_PHY_0_PHY_ID_LO_REG
                MDIO_PHY_0_AUTONEGOTIATION_ADVERT_REG
                MDIO_PHY_0_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG
                MDIO_PHY_0_AUTONEG_EXPANSION_REG
                MDIO_PHY_0_AUTONEG_NEXT_PAGE_TX_REG
                MDIO_PHY_0_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG
                MDIO_PHY_0_MASTER_SLAVE_CTRL_REG
                MDIO_PHY_0_MASTER_SLAVE_STATUS_REG
                MDIO_PHY_0_PSE_CTRL_REG
                MDIO_PHY_0_PSE_STATUS_REG
                MDIO_PHY_0_MMD_ACCESS_CTRL_REG
                MDIO_PHY_0_MMD_ACCESS_STATUS_REG
                MDIO_PHY_0_EXTENDED_STATUS_REG
                MDIO_PHY_0_PHY_EXTENDED_CTRL_REG
                MDIO_PHY_0_PHY_EXTENDED_STATUS_REG
                MDIO_PHY_0_RX_ERROR_COUNT_REG
                MDIO_PHY_0_FALSE_CARRIER_SENSE_COUNT_REG
                MDIO_PHY_0_RX_NOT_OK_COUNT_REG
                MDIO_PHY_0_EXPANSION_1_REG
                MDIO_PHY_0_EXPANSION_2_REG
                MDIO_PHY_0_EXPANSION_REG_ACCESS_REG
                MDIO_PHY_0_SHADOW_18_REG
                MDIO_PHY_0_AUX_STATUS_REG
                MDIO_PHY_0_INT_STATUS_REG
                MDIO_PHY_0_INT_MASK_REG
                MDIO_PHY_0_SHADOW_1C_REG
                MDIO_PHY_0_SHADOW_1D_REG
                MDIO_PHY_0_TEST_REG
                MDIO_PHY_0_RESERVED_REG
                MDIO_PHY_1_CONTROL_REG
                MDIO_PHY_1_STATUS_REG
                MDIO_PHY_1_PHY_ID_HI_REG
                MDIO_PHY_1_PHY_ID_LO_REG
                MDIO_PHY_1_AUTONEGOTIATION_ADVERT_REG
                MDIO_PHY_1_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG
                MDIO_PHY_1_AUTONEG_EXPANSION_REG
                MDIO_PHY_1_AUTONEG_NEXT_PAGE_TX_REG
                MDIO_PHY_1_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG
                MDIO_PHY_1_MASTER_SLAVE_CTRL_REG
                MDIO_PHY_1_MASTER_SLAVE_STATUS_REG
                MDIO_PHY_1_PSE_CTRL_REG
                MDIO_PHY_1_PSE_STATUS_REG
                MDIO_PHY_1_MMD_ACCESS_CTRL_REG
                MDIO_PHY_1_MMD_ACCESS_STATUS_REG
                MDIO_PHY_1_EXTENDED_STATUS_REG
                MDIO_PHY_1_PHY_EXTENDED_CTRL_REG
                MDIO_PHY_1_PHY_EXTENDED_STATUS_REG
                MDIO_PHY_1_RX_ERROR_COUNT_REG
                MDIO_PHY_1_FALSE_CARRIER_SENSE_COUNT_REG
                MDIO_PHY_1_RX_NOT_OK_COUNT_REG
                MDIO_PHY_1_EXPANSION_1_REG
                MDIO_PHY_1_EXPANSION_2_REG
                MDIO_PHY_1_EXPANSION_REG_ACCESS_REG
                MDIO_PHY_1_SHADOW_18_REG
                MDIO_PHY_1_AUX_STATUS_REG
                MDIO_PHY_1_INT_STATUS_REG
                MDIO_PHY_1_INT_MASK_REG
                MDIO_PHY_1_SHADOW_1C_REG
                MDIO_PHY_1_SHADOW_1D_REG
                MDIO_PHY_1_TEST_REG
                MDIO_PHY_1_RESERVED_REG
                MDIO_PHY_2_CONTROL_REG
                MDIO_PHY_2_STATUS_REG
                MDIO_PHY_2_PHY_ID_HI_REG
                MDIO_PHY_2_PHY_ID_LO_REG
                MDIO_PHY_2_AUTONEGOTIATION_ADVERT_REG
                MDIO_PHY_2_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG
                MDIO_PHY_2_AUTONEG_EXPANSION_REG
                MDIO_PHY_2_AUTONEG_NEXT_PAGE_TX_REG
                MDIO_PHY_2_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG
                MDIO_PHY_2_MASTER_SLAVE_CTRL_REG
                MDIO_PHY_2_MASTER_SLAVE_STATUS_REG
                MDIO_PHY_2_PSE_CTRL_REG
                MDIO_PHY_2_PSE_STATUS_REG
                MDIO_PHY_2_MMD_ACCESS_CTRL_REG
                MDIO_PHY_2_MMD_ACCESS_STATUS_REG
                MDIO_PHY_2_EXTENDED_STATUS_REG
                MDIO_PHY_2_PHY_EXTENDED_CTRL_REG
                MDIO_PHY_2_PHY_EXTENDED_STATUS_REG
                MDIO_PHY_2_RX_ERROR_COUNT_REG
                MDIO_PHY_2_FALSE_CARRIER_SENSE_COUNT_REG
                MDIO_PHY_2_RX_NOT_OK_COUNT_REG
                MDIO_PHY_2_EXPANSION_1_REG
                MDIO_PHY_2_EXPANSION_2_REG
                MDIO_PHY_2_EXPANSION_REG_ACCESS_REG
                MDIO_PHY_2_SHADOW_18_REG
                MDIO_PHY_2_AUX_STATUS_REG
                MDIO_PHY_2_INT_STATUS_REG
                MDIO_PHY_2_INT_MASK_REG
                MDIO_PHY_2_SHADOW_1C_REG
                MDIO_PHY_2_SHADOW_1D_REG
                MDIO_PHY_2_TEST_REG
                MDIO_PHY_2_RESERVED_REG
                MDIO_PHY_3_CONTROL_REG
                MDIO_PHY_3_STATUS_REG
                MDIO_PHY_3_PHY_ID_HI_REG
                MDIO_PHY_3_PHY_ID_LO_REG
                MDIO_PHY_3_AUTONEGOTIATION_ADVERT_REG
                MDIO_PHY_3_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG
                MDIO_PHY_3_AUTONEG_EXPANSION_REG
                MDIO_PHY_3_AUTONEG_NEXT_PAGE_TX_REG
                MDIO_PHY_3_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG
                MDIO_PHY_3_MASTER_SLAVE_CTRL_REG
                MDIO_PHY_3_MASTER_SLAVE_STATUS_REG
                MDIO_PHY_3_PSE_CTRL_REG
                MDIO_PHY_3_PSE_STATUS_REG
                MDIO_PHY_3_MMD_ACCESS_CTRL_REG
                MDIO_PHY_3_MMD_ACCESS_STATUS_REG
                MDIO_PHY_3_EXTENDED_STATUS_REG
                MDIO_PHY_3_PHY_EXTENDED_CTRL_REG
                MDIO_PHY_3_PHY_EXTENDED_STATUS_REG
                MDIO_PHY_3_RX_ERROR_COUNT_REG
                MDIO_PHY_3_FALSE_CARRIER_SENSE_COUNT_REG
                MDIO_PHY_3_RX_NOT_OK_COUNT_REG
                MDIO_PHY_3_EXPANSION_1_REG
                MDIO_PHY_3_EXPANSION_2_REG
                MDIO_PHY_3_EXPANSION_REG_ACCESS_REG
                MDIO_PHY_3_SHADOW_18_REG
                MDIO_PHY_3_AUX_STATUS_REG
                MDIO_PHY_3_INT_STATUS_REG
                MDIO_PHY_3_INT_MASK_REG
                MDIO_PHY_3_SHADOW_1C_REG
                MDIO_PHY_3_SHADOW_1D_REG
                MDIO_PHY_3_TEST_REG
                MDIO_PHY_3_RESERVED_REG
                MDIO_PHY_GROUP_BASE_ADDR
                MDIO_PHY_GROUP_INST_OFFSET
                COUNTER_1_REG
                COUNTER_2_REG
                COUNTER_3_REG
                COUNTER_4_REG
                COUNTER_1_2_LOAD_REG
                COUNTER_3_4_LOAD_REG
                COUNTER_BIT_95_64_REG
                COUNTER_BIT_63_32_REG
                COUNTER_BIT_31_0_REG
                COUNTER_READ_ENABLE_REG
                COUNTER_CLK_SYN_0_COUNTER_RESET_REG
                COUNTER_CLK_SYN_0_TX_HI_REG
                COUNTER_CLK_SYN_0_TX_LO_REG
                COUNTER_CLK_SYN_0_RX_HI_REG
                COUNTER_CLK_SYN_0_RX_LO_REG
                COUNTER_CLK_SYN_1_COUNTER_RESET_REG
                COUNTER_CLK_SYN_1_TX_HI_REG
                COUNTER_CLK_SYN_1_TX_LO_REG
                COUNTER_CLK_SYN_1_RX_HI_REG
                COUNTER_CLK_SYN_1_RX_LO_REG
                COUNTER_CLK_SYN_2_COUNTER_RESET_REG
                COUNTER_CLK_SYN_2_TX_HI_REG
                COUNTER_CLK_SYN_2_TX_LO_REG
                COUNTER_CLK_SYN_2_RX_HI_REG
                COUNTER_CLK_SYN_2_RX_LO_REG
                COUNTER_CLK_SYN_3_COUNTER_RESET_REG
                COUNTER_CLK_SYN_3_TX_HI_REG
                COUNTER_CLK_SYN_3_TX_LO_REG
                COUNTER_CLK_SYN_3_RX_HI_REG
                COUNTER_CLK_SYN_3_RX_LO_REG
                COUNTER_PTP_VALID_TX_REG
                COUNTER_PTP_VALID_RX_REG
                COUNTER_PTP_ENABLE_MASK_RX_REG
                COUNTER_PTP_ENABLE_MASK_TX_REG
                COUNTER_PTP_MASK_RX_REG
                COUNTER_PTP_MASK_TX_REG
                DMA_CTRL_REG
                DMA_NUM_INGRESS_PKTS_REG
                DMA_NUM_INGRESS_BYTES_REG
                DMA_NUM_EGRESS_PKTS_REG
                DMA_NUM_EGRESS_BYTES_REG
                DMA_NUM_TIMEOUTS_REG
                MAC_GRP_0_CONTROL_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_STORED_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                MAC_GRP_0_RX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_0_RX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_0_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_0_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                MAC_GRP_0_TX_QUEUE_NUM_PKTS_SENT_REG
                MAC_GRP_0_TX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_0_TX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_1_CONTROL_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_STORED_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                MAC_GRP_1_RX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_1_RX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_1_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_1_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                MAC_GRP_1_TX_QUEUE_NUM_PKTS_SENT_REG
                MAC_GRP_1_TX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_1_TX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_2_CONTROL_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_STORED_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                MAC_GRP_2_RX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_2_RX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_2_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_2_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                MAC_GRP_2_TX_QUEUE_NUM_PKTS_SENT_REG
                MAC_GRP_2_TX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_2_TX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_3_CONTROL_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_STORED_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                MAC_GRP_3_RX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_3_RX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_3_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_3_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                MAC_GRP_3_TX_QUEUE_NUM_PKTS_SENT_REG
                MAC_GRP_3_TX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_3_TX_QUEUE_NUM_BYTES_PUSHED_REG
                CPU_QUEUE_0_CONTROL_REG
                CPU_QUEUE_0_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                CPU_QUEUE_0_RX_QUEUE_NUM_PKTS_ENQUEUED_REG
                CPU_QUEUE_0_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                CPU_QUEUE_0_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                CPU_QUEUE_0_RX_QUEUE_NUM_UNDERRUNS_REG
                CPU_QUEUE_0_RX_QUEUE_NUM_OVERRUNS_REG
                CPU_QUEUE_0_RX_QUEUE_NUM_WORDS_PUSHED_REG
                CPU_QUEUE_0_RX_QUEUE_NUM_BYTES_PUSHED_REG
                CPU_QUEUE_0_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                CPU_QUEUE_0_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                CPU_QUEUE_0_TX_QUEUE_NUM_PKTS_DEQUEUED_REG
                CPU_QUEUE_0_TX_QUEUE_NUM_UNDERRUNS_REG
                CPU_QUEUE_0_TX_QUEUE_NUM_OVERRUNS_REG
                CPU_QUEUE_0_TX_QUEUE_NUM_WORDS_PUSHED_REG
                CPU_QUEUE_0_TX_QUEUE_NUM_BYTES_PUSHED_REG
                CPU_QUEUE_1_CONTROL_REG
                CPU_QUEUE_1_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                CPU_QUEUE_1_RX_QUEUE_NUM_PKTS_ENQUEUED_REG
                CPU_QUEUE_1_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                CPU_QUEUE_1_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                CPU_QUEUE_1_RX_QUEUE_NUM_UNDERRUNS_REG
                CPU_QUEUE_1_RX_QUEUE_NUM_OVERRUNS_REG
                CPU_QUEUE_1_RX_QUEUE_NUM_WORDS_PUSHED_REG
                CPU_QUEUE_1_RX_QUEUE_NUM_BYTES_PUSHED_REG
                CPU_QUEUE_1_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                CPU_QUEUE_1_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                CPU_QUEUE_1_TX_QUEUE_NUM_PKTS_DEQUEUED_REG
                CPU_QUEUE_1_TX_QUEUE_NUM_UNDERRUNS_REG
                CPU_QUEUE_1_TX_QUEUE_NUM_OVERRUNS_REG
                CPU_QUEUE_1_TX_QUEUE_NUM_WORDS_PUSHED_REG
                CPU_QUEUE_1_TX_QUEUE_NUM_BYTES_PUSHED_REG
                CPU_QUEUE_2_CONTROL_REG
                CPU_QUEUE_2_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                CPU_QUEUE_2_RX_QUEUE_NUM_PKTS_ENQUEUED_REG
                CPU_QUEUE_2_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                CPU_QUEUE_2_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                CPU_QUEUE_2_RX_QUEUE_NUM_UNDERRUNS_REG
                CPU_QUEUE_2_RX_QUEUE_NUM_OVERRUNS_REG
                CPU_QUEUE_2_RX_QUEUE_NUM_WORDS_PUSHED_REG
                CPU_QUEUE_2_RX_QUEUE_NUM_BYTES_PUSHED_REG
                CPU_QUEUE_2_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                CPU_QUEUE_2_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                CPU_QUEUE_2_TX_QUEUE_NUM_PKTS_DEQUEUED_REG
                CPU_QUEUE_2_TX_QUEUE_NUM_UNDERRUNS_REG
                CPU_QUEUE_2_TX_QUEUE_NUM_OVERRUNS_REG
                CPU_QUEUE_2_TX_QUEUE_NUM_WORDS_PUSHED_REG
                CPU_QUEUE_2_TX_QUEUE_NUM_BYTES_PUSHED_REG
                CPU_QUEUE_3_CONTROL_REG
                CPU_QUEUE_3_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                CPU_QUEUE_3_RX_QUEUE_NUM_PKTS_ENQUEUED_REG
                CPU_QUEUE_3_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                CPU_QUEUE_3_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                CPU_QUEUE_3_RX_QUEUE_NUM_UNDERRUNS_REG
                CPU_QUEUE_3_RX_QUEUE_NUM_OVERRUNS_REG
                CPU_QUEUE_3_RX_QUEUE_NUM_WORDS_PUSHED_REG
                CPU_QUEUE_3_RX_QUEUE_NUM_BYTES_PUSHED_REG
                CPU_QUEUE_3_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                CPU_QUEUE_3_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                CPU_QUEUE_3_TX_QUEUE_NUM_PKTS_DEQUEUED_REG
                CPU_QUEUE_3_TX_QUEUE_NUM_UNDERRUNS_REG
                CPU_QUEUE_3_TX_QUEUE_NUM_OVERRUNS_REG
                CPU_QUEUE_3_TX_QUEUE_NUM_WORDS_PUSHED_REG
                CPU_QUEUE_3_TX_QUEUE_NUM_BYTES_PUSHED_REG
                OQ_QUEUE_0_CTRL_REG
                OQ_QUEUE_0_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_0_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_0_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_0_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_0_NUM_PKTS_STORED_REG
                OQ_QUEUE_0_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_0_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_0_ADDR_LO_REG
                OQ_QUEUE_0_ADDR_HI_REG
                OQ_QUEUE_0_RD_ADDR_REG
                OQ_QUEUE_0_WR_ADDR_REG
                OQ_QUEUE_0_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_0_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_0_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_0_NUM_WORDS_LEFT_REG
                OQ_QUEUE_0_FULL_THRESH_REG
                OQ_QUEUE_0_CURR_ITER_REG
                OQ_QUEUE_0_MAX_ITER_REG
                OQ_QUEUE_1_CTRL_REG
                OQ_QUEUE_1_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_1_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_1_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_1_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_1_NUM_PKTS_STORED_REG
                OQ_QUEUE_1_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_1_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_1_ADDR_LO_REG
                OQ_QUEUE_1_ADDR_HI_REG
                OQ_QUEUE_1_RD_ADDR_REG
                OQ_QUEUE_1_WR_ADDR_REG
                OQ_QUEUE_1_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_1_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_1_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_1_NUM_WORDS_LEFT_REG
                OQ_QUEUE_1_FULL_THRESH_REG
                OQ_QUEUE_1_CURR_ITER_REG
                OQ_QUEUE_1_MAX_ITER_REG
                OQ_QUEUE_2_CTRL_REG
                OQ_QUEUE_2_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_2_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_2_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_2_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_2_NUM_PKTS_STORED_REG
                OQ_QUEUE_2_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_2_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_2_ADDR_LO_REG
                OQ_QUEUE_2_ADDR_HI_REG
                OQ_QUEUE_2_RD_ADDR_REG
                OQ_QUEUE_2_WR_ADDR_REG
                OQ_QUEUE_2_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_2_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_2_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_2_NUM_WORDS_LEFT_REG
                OQ_QUEUE_2_FULL_THRESH_REG
                OQ_QUEUE_2_CURR_ITER_REG
                OQ_QUEUE_2_MAX_ITER_REG
                OQ_QUEUE_3_CTRL_REG
                OQ_QUEUE_3_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_3_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_3_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_3_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_3_NUM_PKTS_STORED_REG
                OQ_QUEUE_3_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_3_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_3_ADDR_LO_REG
                OQ_QUEUE_3_ADDR_HI_REG
                OQ_QUEUE_3_RD_ADDR_REG
                OQ_QUEUE_3_WR_ADDR_REG
                OQ_QUEUE_3_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_3_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_3_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_3_NUM_WORDS_LEFT_REG
                OQ_QUEUE_3_FULL_THRESH_REG
                OQ_QUEUE_3_CURR_ITER_REG
                OQ_QUEUE_3_MAX_ITER_REG
                OQ_QUEUE_4_CTRL_REG
                OQ_QUEUE_4_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_4_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_4_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_4_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_4_NUM_PKTS_STORED_REG
                OQ_QUEUE_4_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_4_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_4_ADDR_LO_REG
                OQ_QUEUE_4_ADDR_HI_REG
                OQ_QUEUE_4_RD_ADDR_REG
                OQ_QUEUE_4_WR_ADDR_REG
                OQ_QUEUE_4_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_4_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_4_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_4_NUM_WORDS_LEFT_REG
                OQ_QUEUE_4_FULL_THRESH_REG
                OQ_QUEUE_4_CURR_ITER_REG
                OQ_QUEUE_4_MAX_ITER_REG
                OQ_QUEUE_5_CTRL_REG
                OQ_QUEUE_5_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_5_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_5_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_5_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_5_NUM_PKTS_STORED_REG
                OQ_QUEUE_5_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_5_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_5_ADDR_LO_REG
                OQ_QUEUE_5_ADDR_HI_REG
                OQ_QUEUE_5_RD_ADDR_REG
                OQ_QUEUE_5_WR_ADDR_REG
                OQ_QUEUE_5_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_5_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_5_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_5_NUM_WORDS_LEFT_REG
                OQ_QUEUE_5_FULL_THRESH_REG
                OQ_QUEUE_5_CURR_ITER_REG
                OQ_QUEUE_5_MAX_ITER_REG
                OQ_QUEUE_6_CTRL_REG
                OQ_QUEUE_6_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_6_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_6_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_6_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_6_NUM_PKTS_STORED_REG
                OQ_QUEUE_6_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_6_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_6_ADDR_LO_REG
                OQ_QUEUE_6_ADDR_HI_REG
                OQ_QUEUE_6_RD_ADDR_REG
                OQ_QUEUE_6_WR_ADDR_REG
                OQ_QUEUE_6_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_6_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_6_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_6_NUM_WORDS_LEFT_REG
                OQ_QUEUE_6_FULL_THRESH_REG
                OQ_QUEUE_6_CURR_ITER_REG
                OQ_QUEUE_6_MAX_ITER_REG
                OQ_QUEUE_7_CTRL_REG
                OQ_QUEUE_7_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_7_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_7_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_7_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_7_NUM_PKTS_STORED_REG
                OQ_QUEUE_7_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_7_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_7_ADDR_LO_REG
                OQ_QUEUE_7_ADDR_HI_REG
                OQ_QUEUE_7_RD_ADDR_REG
                OQ_QUEUE_7_WR_ADDR_REG
                OQ_QUEUE_7_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_7_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_7_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_7_NUM_WORDS_LEFT_REG
                OQ_QUEUE_7_FULL_THRESH_REG
                OQ_QUEUE_7_CURR_ITER_REG
                OQ_QUEUE_7_MAX_ITER_REG
                OQ_QUEUE_8_CTRL_REG
                OQ_QUEUE_8_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_8_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_8_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_8_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_8_NUM_PKTS_STORED_REG
                OQ_QUEUE_8_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_8_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_8_ADDR_LO_REG
                OQ_QUEUE_8_ADDR_HI_REG
                OQ_QUEUE_8_RD_ADDR_REG
                OQ_QUEUE_8_WR_ADDR_REG
                OQ_QUEUE_8_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_8_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_8_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_8_NUM_WORDS_LEFT_REG
                OQ_QUEUE_8_FULL_THRESH_REG
                OQ_QUEUE_8_CURR_ITER_REG
                OQ_QUEUE_8_MAX_ITER_REG
                OQ_QUEUE_9_CTRL_REG
                OQ_QUEUE_9_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_9_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_9_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_9_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_9_NUM_PKTS_STORED_REG
                OQ_QUEUE_9_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_9_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_9_ADDR_LO_REG
                OQ_QUEUE_9_ADDR_HI_REG
                OQ_QUEUE_9_RD_ADDR_REG
                OQ_QUEUE_9_WR_ADDR_REG
                OQ_QUEUE_9_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_9_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_9_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_9_NUM_WORDS_LEFT_REG
                OQ_QUEUE_9_FULL_THRESH_REG
                OQ_QUEUE_9_CURR_ITER_REG
                OQ_QUEUE_9_MAX_ITER_REG
                OQ_QUEUE_10_CTRL_REG
                OQ_QUEUE_10_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_10_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_10_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_10_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_10_NUM_PKTS_STORED_REG
                OQ_QUEUE_10_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_10_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_10_ADDR_LO_REG
                OQ_QUEUE_10_ADDR_HI_REG
                OQ_QUEUE_10_RD_ADDR_REG
                OQ_QUEUE_10_WR_ADDR_REG
                OQ_QUEUE_10_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_10_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_10_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_10_NUM_WORDS_LEFT_REG
                OQ_QUEUE_10_FULL_THRESH_REG
                OQ_QUEUE_10_CURR_ITER_REG
                OQ_QUEUE_10_MAX_ITER_REG
                OQ_QUEUE_11_CTRL_REG
                OQ_QUEUE_11_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_11_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_11_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_11_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_11_NUM_PKTS_STORED_REG
                OQ_QUEUE_11_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_11_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_11_ADDR_LO_REG
                OQ_QUEUE_11_ADDR_HI_REG
                OQ_QUEUE_11_RD_ADDR_REG
                OQ_QUEUE_11_WR_ADDR_REG
                OQ_QUEUE_11_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_11_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_11_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_11_NUM_WORDS_LEFT_REG
                OQ_QUEUE_11_FULL_THRESH_REG
                OQ_QUEUE_11_CURR_ITER_REG
                OQ_QUEUE_11_MAX_ITER_REG
                OQ_QUEUE_GROUP_BASE_ADDR
                OQ_QUEUE_GROUP_INST_OFFSET
                IN_ARB_NUM_PKTS_SENT_REG
                IN_ARB_LAST_PKT_WORD_0_HI_REG
                IN_ARB_LAST_PKT_WORD_0_LO_REG
                IN_ARB_LAST_PKT_CTRL_0_REG
                IN_ARB_LAST_PKT_WORD_1_HI_REG
                IN_ARB_LAST_PKT_WORD_1_LO_REG
                IN_ARB_LAST_PKT_CTRL_1_REG
                IN_ARB_STATE_REG
                DELAY_RESET_REG
                RATE_LIMIT_0_CTRL_REG
                RATE_LIMIT_0_TOKEN_INTERVAL_REG
                RATE_LIMIT_0_TOKEN_INC_REG
                RATE_LIMIT_1_CTRL_REG
                RATE_LIMIT_1_TOKEN_INTERVAL_REG
                RATE_LIMIT_1_TOKEN_INC_REG
                RATE_LIMIT_2_CTRL_REG
                RATE_LIMIT_2_TOKEN_INTERVAL_REG
                RATE_LIMIT_2_TOKEN_INC_REG
                RATE_LIMIT_3_CTRL_REG
                RATE_LIMIT_3_TOKEN_INTERVAL_REG
                RATE_LIMIT_3_TOKEN_INC_REG
                RATE_LIMIT_4_CTRL_REG
                RATE_LIMIT_4_TOKEN_INTERVAL_REG
                RATE_LIMIT_4_TOKEN_INC_REG
                RATE_LIMIT_5_CTRL_REG
                RATE_LIMIT_5_TOKEN_INTERVAL_REG
                RATE_LIMIT_5_TOKEN_INC_REG
                RATE_LIMIT_6_CTRL_REG
                RATE_LIMIT_6_TOKEN_INTERVAL_REG
                RATE_LIMIT_6_TOKEN_INC_REG
                RATE_LIMIT_7_CTRL_REG
                RATE_LIMIT_7_TOKEN_INTERVAL_REG
                RATE_LIMIT_7_TOKEN_INC_REG
                PKT_GEN_CTRL_ENABLE_REG
                PKT_GEN_CTRL_0_PKT_COUNT_REG
                PKT_GEN_CTRL_0_BYTE_COUNT_HI_REG
                PKT_GEN_CTRL_0_BYTE_COUNT_LO_REG
                PKT_GEN_CTRL_0_TIME_FIRST_HI_REG
                PKT_GEN_CTRL_0_TIME_FIRST_LO_REG
                PKT_GEN_CTRL_0_TIME_LAST_HI_REG
                PKT_GEN_CTRL_0_TIME_LAST_LO_REG
                PKT_GEN_CTRL_1_PKT_COUNT_REG
                PKT_GEN_CTRL_1_BYTE_COUNT_HI_REG
                PKT_GEN_CTRL_1_BYTE_COUNT_LO_REG
                PKT_GEN_CTRL_1_TIME_FIRST_HI_REG
                PKT_GEN_CTRL_1_TIME_FIRST_LO_REG
                PKT_GEN_CTRL_1_TIME_LAST_HI_REG
                PKT_GEN_CTRL_1_TIME_LAST_LO_REG
                PKT_GEN_CTRL_2_PKT_COUNT_REG
                PKT_GEN_CTRL_2_BYTE_COUNT_HI_REG
                PKT_GEN_CTRL_2_BYTE_COUNT_LO_REG
                PKT_GEN_CTRL_2_TIME_FIRST_HI_REG
                PKT_GEN_CTRL_2_TIME_FIRST_LO_REG
                PKT_GEN_CTRL_2_TIME_LAST_HI_REG
                PKT_GEN_CTRL_2_TIME_LAST_LO_REG
                PKT_GEN_CTRL_3_PKT_COUNT_REG
                PKT_GEN_CTRL_3_BYTE_COUNT_HI_REG
                PKT_GEN_CTRL_3_BYTE_COUNT_LO_REG
                PKT_GEN_CTRL_3_TIME_FIRST_HI_REG
                PKT_GEN_CTRL_3_TIME_FIRST_LO_REG
                PKT_GEN_CTRL_3_TIME_LAST_HI_REG
                PKT_GEN_CTRL_3_TIME_LAST_LO_REG
                PKT_GEN_CTRL_GROUP_BASE_ADDR
                PKT_GEN_CTRL_GROUP_INST_OFFSET
                OQ_CONTROL_ENABLE_SEND_POS  
                OQ_CONTROL_INITIALIZE_OQ_POS
                OQ_CONTROL_ENABLE_SEND      
                OQ_CONTROL_INITIALIZE_OQ    
                DMA_IFACE_CTRL_DISABLE_POS
                DMA_IFACE_CTRL_RESET_POS  
                DMA_IFACE_CTRL_DISABLE    
                DMA_IFACE_CTRL_RESET      
                MII_CTRL_RESET_POS            
                MII_CTRL_INTERNAL_LOOPBACK_POS
                MII_CTRL_SPEED_SEL_LO_POS     
                MII_CTRL_AUTONEG_ENABLE_POS   
                MII_CTRL_PWR_DOWN_POS         
                MII_CTRL_ISOLATE_POS          
                MII_CTRL_RESTART_AUTONEG_POS  
                MII_CTRL_DUPLEX_MODE_POS      
                MII_CTRL_COLLISION_TEST_EN_POS
                MII_CTRL_SPEED_SEL_HI_POS     
                MII_CTRL_RESET                
                MII_CTRL_INTERNAL_LOOPBACK    
                MII_CTRL_SPEED_SEL_LO         
                MII_CTRL_AUTONEG_ENABLE       
                MII_CTRL_PWR_DOWN             
                MII_CTRL_ISOLATE              
                MII_CTRL_RESTART_AUTONEG      
                MII_CTRL_DUPLEX_MODE          
                MII_CTRL_COLLISION_TEST_EN    
                MII_CTRL_SPEED_SEL_HI         
                MII_STATUS_100BASE_T4_CAPABLE_POS         
                MII_STATUS_100BASE_X_FULL_DPLX_CAPABLE_POS
                MII_STATUS_100BASE_X_HALF_DPLX_CAPABLE_POS
                MII_STATUS_10BASE_T_FULL_DPLX_CAPABLE_POS 
                MII_STATUS_10BASE_T_HALF_DPLX_CAPABLE_POS 
                MII_STATUS_10BASE_T2_FULL_DPLX_CAPABLE_POS
                MII_STATUS_10BASE_T2_HALF_DPLX_CAPABLE_POS
                MII_STATUS_EXTENDED_STATUS_POS            
                MII_STATUS_MF_PREAMBLE_SUPPRESS_POS       
                MII_STATUS_AUTONEG_COMPLETE_POS           
                MII_STATUS_REMOTE_FAULT_POS               
                MII_STATUS_AUTONEG_ABILITY_POS            
                MII_STATUS_LINK_STATUS_POS                
                MII_STATUS_JABBER_DETECT_POS              
                MII_STATUS_EXTENDED_CAPABILITY_POS        
                MII_STATUS_100BASE_T4_CAPABLE             
                MII_STATUS_100BASE_X_FULL_DPLX_CAPABLE    
                MII_STATUS_100BASE_X_HALF_DPLX_CAPABLE    
                MII_STATUS_10BASE_T_FULL_DPLX_CAPABLE     
                MII_STATUS_10BASE_T_HALF_DPLX_CAPABLE     
                MII_STATUS_10BASE_T2_FULL_DPLX_CAPABLE    
                MII_STATUS_10BASE_T2_HALF_DPLX_CAPABLE    
                MII_STATUS_EXTENDED_STATUS                
                MII_STATUS_MF_PREAMBLE_SUPPRESS           
                MII_STATUS_AUTONEG_COMPLETE               
                MII_STATUS_REMOTE_FAULT                   
                MII_STATUS_AUTONEG_ABILITY                
                MII_STATUS_LINK_STATUS                    
                MII_STATUS_JABBER_DETECT                  
                MII_STATUS_EXTENDED_CAPABILITY            
                CPU_QUEUE_CONTROL_TX_QUEUE_DISABLE_POS
                CPU_QUEUE_CONTROL_RX_QUEUE_DISABLE_POS
                CPU_QUEUE_CONTROL_TX_QUEUE_DISABLE    
                CPU_QUEUE_CONTROL_RX_QUEUE_DISABLE    
                MAC_GRP_CONTROL_TX_QUEUE_DISABLE_POS     
                MAC_GRP_CONTROL_RX_QUEUE_DISABLE_POS     
                MAC_GRP_CONTROL_RESET_MAC_POS            
                MAC_GRP_CONTROL_MAC_DISABLE_TX_POS       
                MAC_GRP_CONTROL_MAC_DISABLE_RX_POS       
                MAC_GRP_CONTROL_MAC_DISABLE_JUMBO_TX_POS 
                MAC_GRP_CONTROL_MAC_DISABLE_JUMBO_RX_POS 
                MAC_GRP_CONTROL_MAC_DISABLE_CRC_CHECK_POS
                MAC_GRP_CONTROL_MAC_DISABLE_CRC_GEN_POS  
                MAC_GRP_CONTROL_TX_QUEUE_DISABLE         
                MAC_GRP_CONTROL_RX_QUEUE_DISABLE         
                MAC_GRP_CONTROL_RESET_MAC                
                MAC_GRP_CONTROL_MAC_DISABLE_TX           
                MAC_GRP_CONTROL_MAC_DISABLE_RX           
                MAC_GRP_CONTROL_MAC_DISABLE_JUMBO_TX     
                MAC_GRP_CONTROL_MAC_DISABLE_JUMBO_RX     
                MAC_GRP_CONTROL_MAC_DISABLE_CRC_CHECK    
                MAC_GRP_CONTROL_MAC_DISABLE_CRC_GEN      
            );


# -------------------------------------
#   Version Information
# -------------------------------------
sub DEVICE_ID ()        { 101; }
sub DEVICE_MAJOR ()     { 1; }
sub DEVICE_MINOR ()     { 1; }
sub DEVICE_REVISION ()  { 1; }
sub DEVICE_PROJ_DIR ()  { "packet_generator"; }
sub DEVICE_PROJ_NAME () { "Packet Generator"; }
sub DEVICE_PROJ_DESC () { "Packet Generator that replays PCAP files"; }


# -------------------------------------
#   Constants
# -------------------------------------

# ===== File: lib/verilog/core/common/xml/global.xml =====

# Maximum number of phy ports
sub MAX_PHY_PORTS ()                        { 4;}

# PCI address bus width
sub PCI_ADDR_WIDTH ()                       { 32;}

# PCI data bus width
sub PCI_DATA_WIDTH ()                       { 32;}

# PCI byte enable bus width
sub PCI_BE_WIDTH ()                         { 4;}

# CPCI--CNET address bus width. This is byte addresses even though bottom bits are zero.
sub CPCI_CNET_ADDR_WIDTH ()                 { 27;}

# CPCI--CNET data bus width
sub CPCI_CNET_DATA_WIDTH ()                 { 32;}

# CPCI--Virtex address bus width. This is byte addresses even though bottom bits are zero.
sub CPCI_NF2_ADDR_WIDTH ()                  { 27;}

# CPCI--Virtex data bus width
sub CPCI_NF2_DATA_WIDTH ()                  { 32;}

# DMA data bus width
sub DMA_DATA_WIDTH ()                       { 32;}

# DMA control bus width
sub DMA_CTRL_WIDTH ()                       { 4;}

# CPCI debug bus width
sub CPCI_DEBUG_DATA_WIDTH ()                { 29;}

# SRAM address width
sub SRAM_ADDR_WIDTH ()                      { 19;}

# SRAM data width
sub SRAM_DATA_WIDTH ()                      { 36;}

# DRAM address width
sub DRAM_ADDR_WIDTH ()                      { 24;}


# ===== File: lib/verilog/core/common/xml/nf_defines.xml =====

# Clock period of 125 MHz clock in ns
sub FAST_CLK_PERIOD ()                      { 8;}

# Clock period of 62.5 MHz clock in ns
sub SLOW_CLK_PERIOD ()                      { 16;}

# Header value used by the IO queues
sub IO_QUEUE_STAGE_NUM ()                    { 0xff;}

# Data path data width
sub DATA_WIDTH ()                           { 64;}

# Data path control width
sub CTRL_WIDTH ()                           { 8;}


# ===== File: projects/packet_generator/include/sram_rr_output_queues.xml =====

sub NUM_OUTPUT_QUEUES ()                    { 12;}

sub OQ_DEFAULT_MAX_PKTS ()                   { 0x7ffff;}

sub OQ_SRAM_PKT_CNT_WIDTH ()                { 19;}

sub OQ_SRAM_WORD_CNT_WIDTH ()               { 19;}

sub OQ_SRAM_BYTE_CNT_WIDTH ()               { 19;}

sub OQ_ENABLE_SEND_BIT_NUM ()               { 0;}

sub OQ_INITIALIZE_OQ_BIT_NUM ()             { 1;}

sub OQ_PKT_GEN_ITER_WIDTH ()                { 32;}


# ===== File: projects/packet_generator/include/rate_limiter.xml =====

# enable bit num
sub RATE_LIMIT_ENABLE_BIT_NUM ()            { 0;}

# overhead bit num
sub RATE_LIMIT_INCLUDE_OVERHEAD_BIT_NUM ()  { 1;}


# ===== File: lib/verilog/core/utils/xml/device_id_reg.xml =====

# Total number of registers
sub DEV_ID_NUM_REGS ()                      { 64;}

# Number of non string registers
sub DEV_ID_NON_STR_REGS ()                  { 7;}

# Length of MD5 sum (bits)
sub DEV_ID_MD5SUM_LENGTH ()                 { 128;}

# Project directory length (in words, not chars)
sub DEV_ID_PROJ_DIR_WORD_LEN ()             { 16;}

# Project directory length (in bytes/chars)
sub DEV_ID_PROJ_DIR_BYTE_LEN ()             { 64;}

# Project directory length (in bits)
sub DEV_ID_PROJ_DIR_BIT_LEN ()              { 512;}

# Project name length (in words, not chars)
sub DEV_ID_PROJ_NAME_WORD_LEN ()            { 16;}

# Project name length (in bytes/chars)
sub DEV_ID_PROJ_NAME_BYTE_LEN ()            { 64;}

# Project name length (in bits)
sub DEV_ID_PROJ_NAME_BIT_LEN ()             { 512;}

# Device description length (in words, not chars)
sub DEV_ID_PROJ_DESC_WORD_LEN ()            { 25;}

# Device description length (in bytes/chars)
sub DEV_ID_PROJ_DESC_BYTE_LEN ()            { 100;}

# Device description length (in bits)
sub DEV_ID_PROJ_DESC_BIT_LEN ()             { 800;}

# MD5 identifier (v1): MD5 sum of the string "device_id.v"
sub DEV_ID_MD5_VALUE_V1_0 ()                { 0x4071736d;}
sub DEV_ID_MD5_VALUE_V1_1 ()                { 0x8a603d2b;}
sub DEV_ID_MD5_VALUE_V1_2 ()                { 0x4d55f629;}
sub DEV_ID_MD5_VALUE_V1_3 ()                { 0x89a73c95;}

# MD5 identifier (v2): MD5 sum of the string "device_id.v:v2"
sub DEV_ID_MD5_VALUE_V2_0 ()                { 0x5e461ffe;}
sub DEV_ID_MD5_VALUE_V2_1 ()                { 0x439725c9;}
sub DEV_ID_MD5_VALUE_V2_2 ()                { 0x279a22a1;}
sub DEV_ID_MD5_VALUE_V2_3 ()                { 0x855f6c53;}

# Total number of registers (v1)
sub DEV_ID_NUM_REGS_V1 ()                   { 64;}

# Number of non string registers (v1)
sub DEV_ID_NON_STR_REGS_V1 ()               { 7;}

# Project name length (v1: in words, not chars)
sub DEV_ID_PROJ_NAME_WORD_LEN_V1 ()         { 25;}

# Project name length (v1: in bytes/chars)
sub DEV_ID_PROJ_NAME_BYTE_LEN_V1 ()         { 100;}

# Project name length (v1: in bits)
sub DEV_ID_PROJ_NAME_BIT_LEN_V1 ()          { 800;}


# ===== File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml =====

sub CPU_QUEUE_REGS_ENABLE ()                 { 0x00000000;}

sub CPU_QUEUE_REGS_DISABLE ()                { 0x00000001;}


# ===== File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml =====

# TX queue disable bit
sub MAC_GRP_TX_QUEUE_DISABLE_BIT_NUM ()     { 0;}

# RX queue disable bit
sub MAC_GRP_RX_QUEUE_DISABLE_BIT_NUM ()     { 1;}

# Reset MAC bit
sub MAC_GRP_RESET_MAC_BIT_NUM ()            { 2;}

# MAC TX queue disable bit
sub MAC_GRP_MAC_DISABLE_TX_BIT_NUM ()       { 3;}

# MAC RX queue disable bit
sub MAC_GRP_MAC_DISABLE_RX_BIT_NUM ()       { 4;}

# MAC disable jumbo TX bit
sub MAC_GRP_MAC_DIS_JUMBO_TX_BIT_NUM ()     { 5;}

# MAC disable jumbo RX bit
sub MAC_GRP_MAC_DIS_JUMBO_RX_BIT_NUM ()     { 6;}

# MAC disable crc check disable bit
sub MAC_GRP_MAC_DIS_CRC_CHECK_BIT_NUM ()    { 7;}

# MAC disable crc generate bit
sub MAC_GRP_MAC_DIS_CRC_GEN_BIT_NUM ()      { 8;}


# ===== File: projects/packet_generator/include/project.xml =====

sub PKT_CAP_DA_HI ()                        { 0x0000;}
sub PKT_CAP_DA_LO ()                        { 0x00000001;}

sub PKT_CAP_SA_HI ()                        { 0x0000;}
sub PKT_CAP_SA_LO ()                        { 0x00000002;}

sub PKT_CAP_ETHERTYPE ()                     { 0x9001;}

# Control word to specify delay
sub DELAY_CTRL_VAL ()                        { 0xfe;}

# Control word to specify pad
sub PAD_CTRL_VAL ()                          { 0xfd;}



## -------------------------------------
##   Modules
## -------------------------------------

# Module tags
sub CORE_BASE_ADDR ()           { 0x0000000; }
sub DEV_ID_BASE_ADDR ()         { 0x0400000; }
sub MDIO_BASE_ADDR ()           { 0x0440000; }
sub COUNTER_BASE_ADDR ()        { 0x0480000; }
sub DMA_BASE_ADDR ()            { 0x0500000; }
sub MAC_GRP_0_BASE_ADDR ()      { 0x0600000; }
sub MAC_GRP_1_BASE_ADDR ()      { 0x0640000; }
sub MAC_GRP_2_BASE_ADDR ()      { 0x0680000; }
sub MAC_GRP_3_BASE_ADDR ()      { 0x06c0000; }
sub CPU_QUEUE_0_BASE_ADDR ()    { 0x0700000; }
sub CPU_QUEUE_1_BASE_ADDR ()    { 0x0740000; }
sub CPU_QUEUE_2_BASE_ADDR ()    { 0x0780000; }
sub CPU_QUEUE_3_BASE_ADDR ()    { 0x07c0000; }
sub SRAM_BASE_ADDR ()           { 0x1000000; }
sub UDP_BASE_ADDR ()            { 0x2000000; }
sub OQ_BASE_ADDR ()             { 0x2000000; }
sub IN_ARB_BASE_ADDR ()         { 0x2001000; }
sub DELAY_BASE_ADDR ()          { 0x2001100; }
sub RATE_LIMIT_0_BASE_ADDR ()   { 0x2001140; }
sub RATE_LIMIT_1_BASE_ADDR ()   { 0x2001180; }
sub RATE_LIMIT_2_BASE_ADDR ()   { 0x20011c0; }
sub RATE_LIMIT_3_BASE_ADDR ()   { 0x2001200; }
sub RATE_LIMIT_4_BASE_ADDR ()   { 0x2001240; }
sub RATE_LIMIT_5_BASE_ADDR ()   { 0x2001280; }
sub RATE_LIMIT_6_BASE_ADDR ()   { 0x20012c0; }
sub RATE_LIMIT_7_BASE_ADDR ()   { 0x2001300; }
sub PKT_GEN_BASE_ADDR ()        { 0x2001400; }
sub DRAM_BASE_ADDR ()           { 0x4000000; }

sub CPU_QUEUE_OFFSET ()    { 0x0040000; }
sub MAC_GRP_OFFSET ()      { 0x0040000; }
sub RATE_LIMIT_OFFSET ()   { 0x0000040; }


# -------------------------------------
#   Registers
# -------------------------------------

# Name: device_id (DEV_ID)
# Description: Device identification
# File: lib/verilog/core/utils/xml/device_id_reg.xml
sub DEV_ID_MD5_0_REG ()          { 0x0400000;}
sub DEV_ID_MD5_1_REG ()          { 0x0400004;}
sub DEV_ID_MD5_2_REG ()          { 0x0400008;}
sub DEV_ID_MD5_3_REG ()          { 0x040000c;}
sub DEV_ID_DEVICE_ID_REG ()      { 0x0400010;}
sub DEV_ID_VERSION_REG ()        { 0x0400014;}
sub DEV_ID_CPCI_ID_REG ()        { 0x0400018;}
sub DEV_ID_PROJ_DIR_0_REG ()     { 0x040001c;}
sub DEV_ID_PROJ_DIR_1_REG ()     { 0x0400020;}
sub DEV_ID_PROJ_DIR_2_REG ()     { 0x0400024;}
sub DEV_ID_PROJ_DIR_3_REG ()     { 0x0400028;}
sub DEV_ID_PROJ_DIR_4_REG ()     { 0x040002c;}
sub DEV_ID_PROJ_DIR_5_REG ()     { 0x0400030;}
sub DEV_ID_PROJ_DIR_6_REG ()     { 0x0400034;}
sub DEV_ID_PROJ_DIR_7_REG ()     { 0x0400038;}
sub DEV_ID_PROJ_DIR_8_REG ()     { 0x040003c;}
sub DEV_ID_PROJ_DIR_9_REG ()     { 0x0400040;}
sub DEV_ID_PROJ_DIR_10_REG ()    { 0x0400044;}
sub DEV_ID_PROJ_DIR_11_REG ()    { 0x0400048;}
sub DEV_ID_PROJ_DIR_12_REG ()    { 0x040004c;}
sub DEV_ID_PROJ_DIR_13_REG ()    { 0x0400050;}
sub DEV_ID_PROJ_DIR_14_REG ()    { 0x0400054;}
sub DEV_ID_PROJ_DIR_15_REG ()    { 0x0400058;}
sub DEV_ID_PROJ_NAME_0_REG ()    { 0x040005c;}
sub DEV_ID_PROJ_NAME_1_REG ()    { 0x0400060;}
sub DEV_ID_PROJ_NAME_2_REG ()    { 0x0400064;}
sub DEV_ID_PROJ_NAME_3_REG ()    { 0x0400068;}
sub DEV_ID_PROJ_NAME_4_REG ()    { 0x040006c;}
sub DEV_ID_PROJ_NAME_5_REG ()    { 0x0400070;}
sub DEV_ID_PROJ_NAME_6_REG ()    { 0x0400074;}
sub DEV_ID_PROJ_NAME_7_REG ()    { 0x0400078;}
sub DEV_ID_PROJ_NAME_8_REG ()    { 0x040007c;}
sub DEV_ID_PROJ_NAME_9_REG ()    { 0x0400080;}
sub DEV_ID_PROJ_NAME_10_REG ()   { 0x0400084;}
sub DEV_ID_PROJ_NAME_11_REG ()   { 0x0400088;}
sub DEV_ID_PROJ_NAME_12_REG ()   { 0x040008c;}
sub DEV_ID_PROJ_NAME_13_REG ()   { 0x0400090;}
sub DEV_ID_PROJ_NAME_14_REG ()   { 0x0400094;}
sub DEV_ID_PROJ_NAME_15_REG ()   { 0x0400098;}
sub DEV_ID_PROJ_DESC_0_REG ()    { 0x040009c;}
sub DEV_ID_PROJ_DESC_1_REG ()    { 0x04000a0;}
sub DEV_ID_PROJ_DESC_2_REG ()    { 0x04000a4;}
sub DEV_ID_PROJ_DESC_3_REG ()    { 0x04000a8;}
sub DEV_ID_PROJ_DESC_4_REG ()    { 0x04000ac;}
sub DEV_ID_PROJ_DESC_5_REG ()    { 0x04000b0;}
sub DEV_ID_PROJ_DESC_6_REG ()    { 0x04000b4;}
sub DEV_ID_PROJ_DESC_7_REG ()    { 0x04000b8;}
sub DEV_ID_PROJ_DESC_8_REG ()    { 0x04000bc;}
sub DEV_ID_PROJ_DESC_9_REG ()    { 0x04000c0;}
sub DEV_ID_PROJ_DESC_10_REG ()   { 0x04000c4;}
sub DEV_ID_PROJ_DESC_11_REG ()   { 0x04000c8;}
sub DEV_ID_PROJ_DESC_12_REG ()   { 0x04000cc;}
sub DEV_ID_PROJ_DESC_13_REG ()   { 0x04000d0;}
sub DEV_ID_PROJ_DESC_14_REG ()   { 0x04000d4;}
sub DEV_ID_PROJ_DESC_15_REG ()   { 0x04000d8;}
sub DEV_ID_PROJ_DESC_16_REG ()   { 0x04000dc;}
sub DEV_ID_PROJ_DESC_17_REG ()   { 0x04000e0;}
sub DEV_ID_PROJ_DESC_18_REG ()   { 0x04000e4;}
sub DEV_ID_PROJ_DESC_19_REG ()   { 0x04000e8;}
sub DEV_ID_PROJ_DESC_20_REG ()   { 0x04000ec;}
sub DEV_ID_PROJ_DESC_21_REG ()   { 0x04000f0;}
sub DEV_ID_PROJ_DESC_22_REG ()   { 0x04000f4;}
sub DEV_ID_PROJ_DESC_23_REG ()   { 0x04000f8;}
sub DEV_ID_PROJ_DESC_24_REG ()   { 0x04000fc;}

# Name: mdio (MDIO)
# Description: MDIO interface
# File: lib/verilog/core/io/mdio/xml/mdio.xml
sub MDIO_PHY_0_CONTROL_REG ()                                  { 0x0440000;}
sub MDIO_PHY_0_STATUS_REG ()                                   { 0x0440004;}
sub MDIO_PHY_0_PHY_ID_HI_REG ()                                { 0x0440008;}
sub MDIO_PHY_0_PHY_ID_LO_REG ()                                { 0x044000c;}
sub MDIO_PHY_0_AUTONEGOTIATION_ADVERT_REG ()                   { 0x0440010;}
sub MDIO_PHY_0_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG ()   { 0x0440014;}
sub MDIO_PHY_0_AUTONEG_EXPANSION_REG ()                        { 0x0440018;}
sub MDIO_PHY_0_AUTONEG_NEXT_PAGE_TX_REG ()                     { 0x044001c;}
sub MDIO_PHY_0_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG ()      { 0x0440020;}
sub MDIO_PHY_0_MASTER_SLAVE_CTRL_REG ()                        { 0x0440024;}
sub MDIO_PHY_0_MASTER_SLAVE_STATUS_REG ()                      { 0x0440028;}
sub MDIO_PHY_0_PSE_CTRL_REG ()                                 { 0x044002c;}
sub MDIO_PHY_0_PSE_STATUS_REG ()                               { 0x0440030;}
sub MDIO_PHY_0_MMD_ACCESS_CTRL_REG ()                          { 0x0440034;}
sub MDIO_PHY_0_MMD_ACCESS_STATUS_REG ()                        { 0x0440038;}
sub MDIO_PHY_0_EXTENDED_STATUS_REG ()                          { 0x044003c;}
sub MDIO_PHY_0_PHY_EXTENDED_CTRL_REG ()                        { 0x0440040;}
sub MDIO_PHY_0_PHY_EXTENDED_STATUS_REG ()                      { 0x0440044;}
sub MDIO_PHY_0_RX_ERROR_COUNT_REG ()                           { 0x0440048;}
sub MDIO_PHY_0_FALSE_CARRIER_SENSE_COUNT_REG ()                { 0x044004c;}
sub MDIO_PHY_0_RX_NOT_OK_COUNT_REG ()                          { 0x0440050;}
sub MDIO_PHY_0_EXPANSION_1_REG ()                              { 0x0440054;}
sub MDIO_PHY_0_EXPANSION_2_REG ()                              { 0x0440058;}
sub MDIO_PHY_0_EXPANSION_REG_ACCESS_REG ()                     { 0x044005c;}
sub MDIO_PHY_0_SHADOW_18_REG ()                                { 0x0440060;}
sub MDIO_PHY_0_AUX_STATUS_REG ()                               { 0x0440064;}
sub MDIO_PHY_0_INT_STATUS_REG ()                               { 0x0440068;}
sub MDIO_PHY_0_INT_MASK_REG ()                                 { 0x044006c;}
sub MDIO_PHY_0_SHADOW_1C_REG ()                                { 0x0440070;}
sub MDIO_PHY_0_SHADOW_1D_REG ()                                { 0x0440074;}
sub MDIO_PHY_0_TEST_REG ()                                     { 0x0440078;}
sub MDIO_PHY_0_RESERVED_REG ()                                 { 0x044007c;}
sub MDIO_PHY_1_CONTROL_REG ()                                  { 0x0440080;}
sub MDIO_PHY_1_STATUS_REG ()                                   { 0x0440084;}
sub MDIO_PHY_1_PHY_ID_HI_REG ()                                { 0x0440088;}
sub MDIO_PHY_1_PHY_ID_LO_REG ()                                { 0x044008c;}
sub MDIO_PHY_1_AUTONEGOTIATION_ADVERT_REG ()                   { 0x0440090;}
sub MDIO_PHY_1_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG ()   { 0x0440094;}
sub MDIO_PHY_1_AUTONEG_EXPANSION_REG ()                        { 0x0440098;}
sub MDIO_PHY_1_AUTONEG_NEXT_PAGE_TX_REG ()                     { 0x044009c;}
sub MDIO_PHY_1_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG ()      { 0x04400a0;}
sub MDIO_PHY_1_MASTER_SLAVE_CTRL_REG ()                        { 0x04400a4;}
sub MDIO_PHY_1_MASTER_SLAVE_STATUS_REG ()                      { 0x04400a8;}
sub MDIO_PHY_1_PSE_CTRL_REG ()                                 { 0x04400ac;}
sub MDIO_PHY_1_PSE_STATUS_REG ()                               { 0x04400b0;}
sub MDIO_PHY_1_MMD_ACCESS_CTRL_REG ()                          { 0x04400b4;}
sub MDIO_PHY_1_MMD_ACCESS_STATUS_REG ()                        { 0x04400b8;}
sub MDIO_PHY_1_EXTENDED_STATUS_REG ()                          { 0x04400bc;}
sub MDIO_PHY_1_PHY_EXTENDED_CTRL_REG ()                        { 0x04400c0;}
sub MDIO_PHY_1_PHY_EXTENDED_STATUS_REG ()                      { 0x04400c4;}
sub MDIO_PHY_1_RX_ERROR_COUNT_REG ()                           { 0x04400c8;}
sub MDIO_PHY_1_FALSE_CARRIER_SENSE_COUNT_REG ()                { 0x04400cc;}
sub MDIO_PHY_1_RX_NOT_OK_COUNT_REG ()                          { 0x04400d0;}
sub MDIO_PHY_1_EXPANSION_1_REG ()                              { 0x04400d4;}
sub MDIO_PHY_1_EXPANSION_2_REG ()                              { 0x04400d8;}
sub MDIO_PHY_1_EXPANSION_REG_ACCESS_REG ()                     { 0x04400dc;}
sub MDIO_PHY_1_SHADOW_18_REG ()                                { 0x04400e0;}
sub MDIO_PHY_1_AUX_STATUS_REG ()                               { 0x04400e4;}
sub MDIO_PHY_1_INT_STATUS_REG ()                               { 0x04400e8;}
sub MDIO_PHY_1_INT_MASK_REG ()                                 { 0x04400ec;}
sub MDIO_PHY_1_SHADOW_1C_REG ()                                { 0x04400f0;}
sub MDIO_PHY_1_SHADOW_1D_REG ()                                { 0x04400f4;}
sub MDIO_PHY_1_TEST_REG ()                                     { 0x04400f8;}
sub MDIO_PHY_1_RESERVED_REG ()                                 { 0x04400fc;}
sub MDIO_PHY_2_CONTROL_REG ()                                  { 0x0440100;}
sub MDIO_PHY_2_STATUS_REG ()                                   { 0x0440104;}
sub MDIO_PHY_2_PHY_ID_HI_REG ()                                { 0x0440108;}
sub MDIO_PHY_2_PHY_ID_LO_REG ()                                { 0x044010c;}
sub MDIO_PHY_2_AUTONEGOTIATION_ADVERT_REG ()                   { 0x0440110;}
sub MDIO_PHY_2_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG ()   { 0x0440114;}
sub MDIO_PHY_2_AUTONEG_EXPANSION_REG ()                        { 0x0440118;}
sub MDIO_PHY_2_AUTONEG_NEXT_PAGE_TX_REG ()                     { 0x044011c;}
sub MDIO_PHY_2_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG ()      { 0x0440120;}
sub MDIO_PHY_2_MASTER_SLAVE_CTRL_REG ()                        { 0x0440124;}
sub MDIO_PHY_2_MASTER_SLAVE_STATUS_REG ()                      { 0x0440128;}
sub MDIO_PHY_2_PSE_CTRL_REG ()                                 { 0x044012c;}
sub MDIO_PHY_2_PSE_STATUS_REG ()                               { 0x0440130;}
sub MDIO_PHY_2_MMD_ACCESS_CTRL_REG ()                          { 0x0440134;}
sub MDIO_PHY_2_MMD_ACCESS_STATUS_REG ()                        { 0x0440138;}
sub MDIO_PHY_2_EXTENDED_STATUS_REG ()                          { 0x044013c;}
sub MDIO_PHY_2_PHY_EXTENDED_CTRL_REG ()                        { 0x0440140;}
sub MDIO_PHY_2_PHY_EXTENDED_STATUS_REG ()                      { 0x0440144;}
sub MDIO_PHY_2_RX_ERROR_COUNT_REG ()                           { 0x0440148;}
sub MDIO_PHY_2_FALSE_CARRIER_SENSE_COUNT_REG ()                { 0x044014c;}
sub MDIO_PHY_2_RX_NOT_OK_COUNT_REG ()                          { 0x0440150;}
sub MDIO_PHY_2_EXPANSION_1_REG ()                              { 0x0440154;}
sub MDIO_PHY_2_EXPANSION_2_REG ()                              { 0x0440158;}
sub MDIO_PHY_2_EXPANSION_REG_ACCESS_REG ()                     { 0x044015c;}
sub MDIO_PHY_2_SHADOW_18_REG ()                                { 0x0440160;}
sub MDIO_PHY_2_AUX_STATUS_REG ()                               { 0x0440164;}
sub MDIO_PHY_2_INT_STATUS_REG ()                               { 0x0440168;}
sub MDIO_PHY_2_INT_MASK_REG ()                                 { 0x044016c;}
sub MDIO_PHY_2_SHADOW_1C_REG ()                                { 0x0440170;}
sub MDIO_PHY_2_SHADOW_1D_REG ()                                { 0x0440174;}
sub MDIO_PHY_2_TEST_REG ()                                     { 0x0440178;}
sub MDIO_PHY_2_RESERVED_REG ()                                 { 0x044017c;}
sub MDIO_PHY_3_CONTROL_REG ()                                  { 0x0440180;}
sub MDIO_PHY_3_STATUS_REG ()                                   { 0x0440184;}
sub MDIO_PHY_3_PHY_ID_HI_REG ()                                { 0x0440188;}
sub MDIO_PHY_3_PHY_ID_LO_REG ()                                { 0x044018c;}
sub MDIO_PHY_3_AUTONEGOTIATION_ADVERT_REG ()                   { 0x0440190;}
sub MDIO_PHY_3_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG ()   { 0x0440194;}
sub MDIO_PHY_3_AUTONEG_EXPANSION_REG ()                        { 0x0440198;}
sub MDIO_PHY_3_AUTONEG_NEXT_PAGE_TX_REG ()                     { 0x044019c;}
sub MDIO_PHY_3_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG ()      { 0x04401a0;}
sub MDIO_PHY_3_MASTER_SLAVE_CTRL_REG ()                        { 0x04401a4;}
sub MDIO_PHY_3_MASTER_SLAVE_STATUS_REG ()                      { 0x04401a8;}
sub MDIO_PHY_3_PSE_CTRL_REG ()                                 { 0x04401ac;}
sub MDIO_PHY_3_PSE_STATUS_REG ()                               { 0x04401b0;}
sub MDIO_PHY_3_MMD_ACCESS_CTRL_REG ()                          { 0x04401b4;}
sub MDIO_PHY_3_MMD_ACCESS_STATUS_REG ()                        { 0x04401b8;}
sub MDIO_PHY_3_EXTENDED_STATUS_REG ()                          { 0x04401bc;}
sub MDIO_PHY_3_PHY_EXTENDED_CTRL_REG ()                        { 0x04401c0;}
sub MDIO_PHY_3_PHY_EXTENDED_STATUS_REG ()                      { 0x04401c4;}
sub MDIO_PHY_3_RX_ERROR_COUNT_REG ()                           { 0x04401c8;}
sub MDIO_PHY_3_FALSE_CARRIER_SENSE_COUNT_REG ()                { 0x04401cc;}
sub MDIO_PHY_3_RX_NOT_OK_COUNT_REG ()                          { 0x04401d0;}
sub MDIO_PHY_3_EXPANSION_1_REG ()                              { 0x04401d4;}
sub MDIO_PHY_3_EXPANSION_2_REG ()                              { 0x04401d8;}
sub MDIO_PHY_3_EXPANSION_REG_ACCESS_REG ()                     { 0x04401dc;}
sub MDIO_PHY_3_SHADOW_18_REG ()                                { 0x04401e0;}
sub MDIO_PHY_3_AUX_STATUS_REG ()                               { 0x04401e4;}
sub MDIO_PHY_3_INT_STATUS_REG ()                               { 0x04401e8;}
sub MDIO_PHY_3_INT_MASK_REG ()                                 { 0x04401ec;}
sub MDIO_PHY_3_SHADOW_1C_REG ()                                { 0x04401f0;}
sub MDIO_PHY_3_SHADOW_1D_REG ()                                { 0x04401f4;}
sub MDIO_PHY_3_TEST_REG ()                                     { 0x04401f8;}
sub MDIO_PHY_3_RESERVED_REG ()                                 { 0x04401fc;}

sub MDIO_PHY_GROUP_BASE_ADDR ()  { 0x0440000; }
sub MDIO_PHY_GROUP_INST_OFFSET() { 0x0000080; }

# Name: stamp_counter (COUNTER)
# Description: Registers for the Stamp Counter and PTP
# File: projects/packet_generator/include/stamp_counter.xml
sub COUNTER_1_REG ()                         { 0x0480000;}
sub COUNTER_2_REG ()                         { 0x0480004;}
sub COUNTER_3_REG ()                         { 0x0480008;}
sub COUNTER_4_REG ()                         { 0x048000c;}
sub COUNTER_1_2_LOAD_REG ()                  { 0x0480010;}
sub COUNTER_3_4_LOAD_REG ()                  { 0x0480014;}
sub COUNTER_BIT_95_64_REG ()                 { 0x0480018;}
sub COUNTER_BIT_63_32_REG ()                 { 0x048001c;}
sub COUNTER_BIT_31_0_REG ()                  { 0x0480020;}
sub COUNTER_READ_ENABLE_REG ()               { 0x0480024;}
sub COUNTER_CLK_SYN_0_COUNTER_RESET_REG ()   { 0x0480028;}
sub COUNTER_CLK_SYN_0_TX_HI_REG ()           { 0x048002c;}
sub COUNTER_CLK_SYN_0_TX_LO_REG ()           { 0x0480030;}
sub COUNTER_CLK_SYN_0_RX_HI_REG ()           { 0x0480034;}
sub COUNTER_CLK_SYN_0_RX_LO_REG ()           { 0x0480038;}
sub COUNTER_CLK_SYN_1_COUNTER_RESET_REG ()   { 0x048003c;}
sub COUNTER_CLK_SYN_1_TX_HI_REG ()           { 0x0480040;}
sub COUNTER_CLK_SYN_1_TX_LO_REG ()           { 0x0480044;}
sub COUNTER_CLK_SYN_1_RX_HI_REG ()           { 0x0480048;}
sub COUNTER_CLK_SYN_1_RX_LO_REG ()           { 0x048004c;}
sub COUNTER_CLK_SYN_2_COUNTER_RESET_REG ()   { 0x0480050;}
sub COUNTER_CLK_SYN_2_TX_HI_REG ()           { 0x0480054;}
sub COUNTER_CLK_SYN_2_TX_LO_REG ()           { 0x0480058;}
sub COUNTER_CLK_SYN_2_RX_HI_REG ()           { 0x048005c;}
sub COUNTER_CLK_SYN_2_RX_LO_REG ()           { 0x0480060;}
sub COUNTER_CLK_SYN_3_COUNTER_RESET_REG ()   { 0x0480064;}
sub COUNTER_CLK_SYN_3_TX_HI_REG ()           { 0x0480068;}
sub COUNTER_CLK_SYN_3_TX_LO_REG ()           { 0x048006c;}
sub COUNTER_CLK_SYN_3_RX_HI_REG ()           { 0x0480070;}
sub COUNTER_CLK_SYN_3_RX_LO_REG ()           { 0x0480074;}
sub COUNTER_PTP_VALID_TX_REG ()              { 0x0480078;}
sub COUNTER_PTP_VALID_RX_REG ()              { 0x048007c;}
sub COUNTER_PTP_ENABLE_MASK_RX_REG ()        { 0x0480080;}
sub COUNTER_PTP_ENABLE_MASK_TX_REG ()        { 0x0480084;}
sub COUNTER_PTP_MASK_RX_REG ()               { 0x0480088;}
sub COUNTER_PTP_MASK_TX_REG ()               { 0x048008c;}

# Name: dma (DMA)
# Description: DMA transfer module
# File: lib/verilog/core/dma/xml/dma.xml
sub DMA_CTRL_REG ()                { 0x0500000;}
sub DMA_NUM_INGRESS_PKTS_REG ()    { 0x0500004;}
sub DMA_NUM_INGRESS_BYTES_REG ()   { 0x0500008;}
sub DMA_NUM_EGRESS_PKTS_REG ()     { 0x050000c;}
sub DMA_NUM_EGRESS_BYTES_REG ()    { 0x0500010;}
sub DMA_NUM_TIMEOUTS_REG ()        { 0x0500014;}

# Name: nf2_mac_grp (MAC_GRP_0)
# Description: Ethernet MAC group
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml
sub MAC_GRP_0_CONTROL_REG ()                          { 0x0600000;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0600004;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_STORED_REG ()         { 0x0600008;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG ()   { 0x060000c;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()    { 0x0600010;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()       { 0x0600014;}
sub MAC_GRP_0_RX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x0600018;}
sub MAC_GRP_0_RX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x060001c;}
sub MAC_GRP_0_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0600020;}
sub MAC_GRP_0_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()       { 0x0600024;}
sub MAC_GRP_0_TX_QUEUE_NUM_PKTS_SENT_REG ()           { 0x0600028;}
sub MAC_GRP_0_TX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x060002c;}
sub MAC_GRP_0_TX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x0600030;}

# Name: nf2_mac_grp (MAC_GRP_1)
# Description: Ethernet MAC group
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml
sub MAC_GRP_1_CONTROL_REG ()                          { 0x0640000;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0640004;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_STORED_REG ()         { 0x0640008;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG ()   { 0x064000c;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()    { 0x0640010;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()       { 0x0640014;}
sub MAC_GRP_1_RX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x0640018;}
sub MAC_GRP_1_RX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x064001c;}
sub MAC_GRP_1_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0640020;}
sub MAC_GRP_1_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()       { 0x0640024;}
sub MAC_GRP_1_TX_QUEUE_NUM_PKTS_SENT_REG ()           { 0x0640028;}
sub MAC_GRP_1_TX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x064002c;}
sub MAC_GRP_1_TX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x0640030;}

# Name: nf2_mac_grp (MAC_GRP_2)
# Description: Ethernet MAC group
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml
sub MAC_GRP_2_CONTROL_REG ()                          { 0x0680000;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0680004;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_STORED_REG ()         { 0x0680008;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG ()   { 0x068000c;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()    { 0x0680010;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()       { 0x0680014;}
sub MAC_GRP_2_RX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x0680018;}
sub MAC_GRP_2_RX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x068001c;}
sub MAC_GRP_2_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0680020;}
sub MAC_GRP_2_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()       { 0x0680024;}
sub MAC_GRP_2_TX_QUEUE_NUM_PKTS_SENT_REG ()           { 0x0680028;}
sub MAC_GRP_2_TX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x068002c;}
sub MAC_GRP_2_TX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x0680030;}

# Name: nf2_mac_grp (MAC_GRP_3)
# Description: Ethernet MAC group
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml
sub MAC_GRP_3_CONTROL_REG ()                          { 0x06c0000;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x06c0004;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_STORED_REG ()         { 0x06c0008;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG ()   { 0x06c000c;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()    { 0x06c0010;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()       { 0x06c0014;}
sub MAC_GRP_3_RX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x06c0018;}
sub MAC_GRP_3_RX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x06c001c;}
sub MAC_GRP_3_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x06c0020;}
sub MAC_GRP_3_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()       { 0x06c0024;}
sub MAC_GRP_3_TX_QUEUE_NUM_PKTS_SENT_REG ()           { 0x06c0028;}
sub MAC_GRP_3_TX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x06c002c;}
sub MAC_GRP_3_TX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x06c0030;}

# Name: cpu_dma_queue (CPU_QUEUE_0)
# Description: CPU DMA queue
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml
sub CPU_QUEUE_0_CONTROL_REG ()                         { 0x0700000;}
sub CPU_QUEUE_0_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()      { 0x0700004;}
sub CPU_QUEUE_0_RX_QUEUE_NUM_PKTS_ENQUEUED_REG ()      { 0x0700008;}
sub CPU_QUEUE_0_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()   { 0x070000c;}
sub CPU_QUEUE_0_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()      { 0x0700010;}
sub CPU_QUEUE_0_RX_QUEUE_NUM_UNDERRUNS_REG ()          { 0x0700014;}
sub CPU_QUEUE_0_RX_QUEUE_NUM_OVERRUNS_REG ()           { 0x0700018;}
sub CPU_QUEUE_0_RX_QUEUE_NUM_WORDS_PUSHED_REG ()       { 0x070001c;}
sub CPU_QUEUE_0_RX_QUEUE_NUM_BYTES_PUSHED_REG ()       { 0x0700020;}
sub CPU_QUEUE_0_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()      { 0x0700024;}
sub CPU_QUEUE_0_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()      { 0x0700028;}
sub CPU_QUEUE_0_TX_QUEUE_NUM_PKTS_DEQUEUED_REG ()      { 0x070002c;}
sub CPU_QUEUE_0_TX_QUEUE_NUM_UNDERRUNS_REG ()          { 0x0700030;}
sub CPU_QUEUE_0_TX_QUEUE_NUM_OVERRUNS_REG ()           { 0x0700034;}
sub CPU_QUEUE_0_TX_QUEUE_NUM_WORDS_PUSHED_REG ()       { 0x0700038;}
sub CPU_QUEUE_0_TX_QUEUE_NUM_BYTES_PUSHED_REG ()       { 0x070003c;}

# Name: cpu_dma_queue (CPU_QUEUE_1)
# Description: CPU DMA queue
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml
sub CPU_QUEUE_1_CONTROL_REG ()                         { 0x0740000;}
sub CPU_QUEUE_1_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()      { 0x0740004;}
sub CPU_QUEUE_1_RX_QUEUE_NUM_PKTS_ENQUEUED_REG ()      { 0x0740008;}
sub CPU_QUEUE_1_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()   { 0x074000c;}
sub CPU_QUEUE_1_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()      { 0x0740010;}
sub CPU_QUEUE_1_RX_QUEUE_NUM_UNDERRUNS_REG ()          { 0x0740014;}
sub CPU_QUEUE_1_RX_QUEUE_NUM_OVERRUNS_REG ()           { 0x0740018;}
sub CPU_QUEUE_1_RX_QUEUE_NUM_WORDS_PUSHED_REG ()       { 0x074001c;}
sub CPU_QUEUE_1_RX_QUEUE_NUM_BYTES_PUSHED_REG ()       { 0x0740020;}
sub CPU_QUEUE_1_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()      { 0x0740024;}
sub CPU_QUEUE_1_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()      { 0x0740028;}
sub CPU_QUEUE_1_TX_QUEUE_NUM_PKTS_DEQUEUED_REG ()      { 0x074002c;}
sub CPU_QUEUE_1_TX_QUEUE_NUM_UNDERRUNS_REG ()          { 0x0740030;}
sub CPU_QUEUE_1_TX_QUEUE_NUM_OVERRUNS_REG ()           { 0x0740034;}
sub CPU_QUEUE_1_TX_QUEUE_NUM_WORDS_PUSHED_REG ()       { 0x0740038;}
sub CPU_QUEUE_1_TX_QUEUE_NUM_BYTES_PUSHED_REG ()       { 0x074003c;}

# Name: cpu_dma_queue (CPU_QUEUE_2)
# Description: CPU DMA queue
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml
sub CPU_QUEUE_2_CONTROL_REG ()                         { 0x0780000;}
sub CPU_QUEUE_2_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()      { 0x0780004;}
sub CPU_QUEUE_2_RX_QUEUE_NUM_PKTS_ENQUEUED_REG ()      { 0x0780008;}
sub CPU_QUEUE_2_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()   { 0x078000c;}
sub CPU_QUEUE_2_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()      { 0x0780010;}
sub CPU_QUEUE_2_RX_QUEUE_NUM_UNDERRUNS_REG ()          { 0x0780014;}
sub CPU_QUEUE_2_RX_QUEUE_NUM_OVERRUNS_REG ()           { 0x0780018;}
sub CPU_QUEUE_2_RX_QUEUE_NUM_WORDS_PUSHED_REG ()       { 0x078001c;}
sub CPU_QUEUE_2_RX_QUEUE_NUM_BYTES_PUSHED_REG ()       { 0x0780020;}
sub CPU_QUEUE_2_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()      { 0x0780024;}
sub CPU_QUEUE_2_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()      { 0x0780028;}
sub CPU_QUEUE_2_TX_QUEUE_NUM_PKTS_DEQUEUED_REG ()      { 0x078002c;}
sub CPU_QUEUE_2_TX_QUEUE_NUM_UNDERRUNS_REG ()          { 0x0780030;}
sub CPU_QUEUE_2_TX_QUEUE_NUM_OVERRUNS_REG ()           { 0x0780034;}
sub CPU_QUEUE_2_TX_QUEUE_NUM_WORDS_PUSHED_REG ()       { 0x0780038;}
sub CPU_QUEUE_2_TX_QUEUE_NUM_BYTES_PUSHED_REG ()       { 0x078003c;}

# Name: cpu_dma_queue (CPU_QUEUE_3)
# Description: CPU DMA queue
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml
sub CPU_QUEUE_3_CONTROL_REG ()                         { 0x07c0000;}
sub CPU_QUEUE_3_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()      { 0x07c0004;}
sub CPU_QUEUE_3_RX_QUEUE_NUM_PKTS_ENQUEUED_REG ()      { 0x07c0008;}
sub CPU_QUEUE_3_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()   { 0x07c000c;}
sub CPU_QUEUE_3_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()      { 0x07c0010;}
sub CPU_QUEUE_3_RX_QUEUE_NUM_UNDERRUNS_REG ()          { 0x07c0014;}
sub CPU_QUEUE_3_RX_QUEUE_NUM_OVERRUNS_REG ()           { 0x07c0018;}
sub CPU_QUEUE_3_RX_QUEUE_NUM_WORDS_PUSHED_REG ()       { 0x07c001c;}
sub CPU_QUEUE_3_RX_QUEUE_NUM_BYTES_PUSHED_REG ()       { 0x07c0020;}
sub CPU_QUEUE_3_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()      { 0x07c0024;}
sub CPU_QUEUE_3_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()      { 0x07c0028;}
sub CPU_QUEUE_3_TX_QUEUE_NUM_PKTS_DEQUEUED_REG ()      { 0x07c002c;}
sub CPU_QUEUE_3_TX_QUEUE_NUM_UNDERRUNS_REG ()          { 0x07c0030;}
sub CPU_QUEUE_3_TX_QUEUE_NUM_OVERRUNS_REG ()           { 0x07c0034;}
sub CPU_QUEUE_3_TX_QUEUE_NUM_WORDS_PUSHED_REG ()       { 0x07c0038;}
sub CPU_QUEUE_3_TX_QUEUE_NUM_BYTES_PUSHED_REG ()       { 0x07c003c;}

# Name: SRAM (SRAM)
# Description: SRAM

# Name: output_queues (OQ)
# Description: SRAM-based output queue using round-robin removal, modified for Packet Generator
# File: projects/packet_generator/include/sram_rr_output_queues.xml
sub OQ_QUEUE_0_CTRL_REG ()                          { 0x2000000;}
sub OQ_QUEUE_0_NUM_PKT_BYTES_STORED_REG ()          { 0x2000004;}
sub OQ_QUEUE_0_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000008;}
sub OQ_QUEUE_0_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200000c;}
sub OQ_QUEUE_0_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000010;}
sub OQ_QUEUE_0_NUM_PKTS_STORED_REG ()               { 0x2000014;}
sub OQ_QUEUE_0_NUM_PKTS_DROPPED_REG ()              { 0x2000018;}
sub OQ_QUEUE_0_NUM_PKTS_REMOVED_REG ()              { 0x200001c;}
sub OQ_QUEUE_0_ADDR_LO_REG ()                       { 0x2000020;}
sub OQ_QUEUE_0_ADDR_HI_REG ()                       { 0x2000024;}
sub OQ_QUEUE_0_RD_ADDR_REG ()                       { 0x2000028;}
sub OQ_QUEUE_0_WR_ADDR_REG ()                       { 0x200002c;}
sub OQ_QUEUE_0_NUM_PKTS_IN_Q_REG ()                 { 0x2000030;}
sub OQ_QUEUE_0_MAX_PKTS_IN_Q_REG ()                 { 0x2000034;}
sub OQ_QUEUE_0_NUM_WORDS_IN_Q_REG ()                { 0x2000038;}
sub OQ_QUEUE_0_NUM_WORDS_LEFT_REG ()                { 0x200003c;}
sub OQ_QUEUE_0_FULL_THRESH_REG ()                   { 0x2000040;}
sub OQ_QUEUE_0_CURR_ITER_REG ()                     { 0x2000044;}
sub OQ_QUEUE_0_MAX_ITER_REG ()                      { 0x2000048;}
sub OQ_QUEUE_1_CTRL_REG ()                          { 0x2000100;}
sub OQ_QUEUE_1_NUM_PKT_BYTES_STORED_REG ()          { 0x2000104;}
sub OQ_QUEUE_1_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000108;}
sub OQ_QUEUE_1_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200010c;}
sub OQ_QUEUE_1_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000110;}
sub OQ_QUEUE_1_NUM_PKTS_STORED_REG ()               { 0x2000114;}
sub OQ_QUEUE_1_NUM_PKTS_DROPPED_REG ()              { 0x2000118;}
sub OQ_QUEUE_1_NUM_PKTS_REMOVED_REG ()              { 0x200011c;}
sub OQ_QUEUE_1_ADDR_LO_REG ()                       { 0x2000120;}
sub OQ_QUEUE_1_ADDR_HI_REG ()                       { 0x2000124;}
sub OQ_QUEUE_1_RD_ADDR_REG ()                       { 0x2000128;}
sub OQ_QUEUE_1_WR_ADDR_REG ()                       { 0x200012c;}
sub OQ_QUEUE_1_NUM_PKTS_IN_Q_REG ()                 { 0x2000130;}
sub OQ_QUEUE_1_MAX_PKTS_IN_Q_REG ()                 { 0x2000134;}
sub OQ_QUEUE_1_NUM_WORDS_IN_Q_REG ()                { 0x2000138;}
sub OQ_QUEUE_1_NUM_WORDS_LEFT_REG ()                { 0x200013c;}
sub OQ_QUEUE_1_FULL_THRESH_REG ()                   { 0x2000140;}
sub OQ_QUEUE_1_CURR_ITER_REG ()                     { 0x2000144;}
sub OQ_QUEUE_1_MAX_ITER_REG ()                      { 0x2000148;}
sub OQ_QUEUE_2_CTRL_REG ()                          { 0x2000200;}
sub OQ_QUEUE_2_NUM_PKT_BYTES_STORED_REG ()          { 0x2000204;}
sub OQ_QUEUE_2_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000208;}
sub OQ_QUEUE_2_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200020c;}
sub OQ_QUEUE_2_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000210;}
sub OQ_QUEUE_2_NUM_PKTS_STORED_REG ()               { 0x2000214;}
sub OQ_QUEUE_2_NUM_PKTS_DROPPED_REG ()              { 0x2000218;}
sub OQ_QUEUE_2_NUM_PKTS_REMOVED_REG ()              { 0x200021c;}
sub OQ_QUEUE_2_ADDR_LO_REG ()                       { 0x2000220;}
sub OQ_QUEUE_2_ADDR_HI_REG ()                       { 0x2000224;}
sub OQ_QUEUE_2_RD_ADDR_REG ()                       { 0x2000228;}
sub OQ_QUEUE_2_WR_ADDR_REG ()                       { 0x200022c;}
sub OQ_QUEUE_2_NUM_PKTS_IN_Q_REG ()                 { 0x2000230;}
sub OQ_QUEUE_2_MAX_PKTS_IN_Q_REG ()                 { 0x2000234;}
sub OQ_QUEUE_2_NUM_WORDS_IN_Q_REG ()                { 0x2000238;}
sub OQ_QUEUE_2_NUM_WORDS_LEFT_REG ()                { 0x200023c;}
sub OQ_QUEUE_2_FULL_THRESH_REG ()                   { 0x2000240;}
sub OQ_QUEUE_2_CURR_ITER_REG ()                     { 0x2000244;}
sub OQ_QUEUE_2_MAX_ITER_REG ()                      { 0x2000248;}
sub OQ_QUEUE_3_CTRL_REG ()                          { 0x2000300;}
sub OQ_QUEUE_3_NUM_PKT_BYTES_STORED_REG ()          { 0x2000304;}
sub OQ_QUEUE_3_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000308;}
sub OQ_QUEUE_3_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200030c;}
sub OQ_QUEUE_3_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000310;}
sub OQ_QUEUE_3_NUM_PKTS_STORED_REG ()               { 0x2000314;}
sub OQ_QUEUE_3_NUM_PKTS_DROPPED_REG ()              { 0x2000318;}
sub OQ_QUEUE_3_NUM_PKTS_REMOVED_REG ()              { 0x200031c;}
sub OQ_QUEUE_3_ADDR_LO_REG ()                       { 0x2000320;}
sub OQ_QUEUE_3_ADDR_HI_REG ()                       { 0x2000324;}
sub OQ_QUEUE_3_RD_ADDR_REG ()                       { 0x2000328;}
sub OQ_QUEUE_3_WR_ADDR_REG ()                       { 0x200032c;}
sub OQ_QUEUE_3_NUM_PKTS_IN_Q_REG ()                 { 0x2000330;}
sub OQ_QUEUE_3_MAX_PKTS_IN_Q_REG ()                 { 0x2000334;}
sub OQ_QUEUE_3_NUM_WORDS_IN_Q_REG ()                { 0x2000338;}
sub OQ_QUEUE_3_NUM_WORDS_LEFT_REG ()                { 0x200033c;}
sub OQ_QUEUE_3_FULL_THRESH_REG ()                   { 0x2000340;}
sub OQ_QUEUE_3_CURR_ITER_REG ()                     { 0x2000344;}
sub OQ_QUEUE_3_MAX_ITER_REG ()                      { 0x2000348;}
sub OQ_QUEUE_4_CTRL_REG ()                          { 0x2000400;}
sub OQ_QUEUE_4_NUM_PKT_BYTES_STORED_REG ()          { 0x2000404;}
sub OQ_QUEUE_4_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000408;}
sub OQ_QUEUE_4_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200040c;}
sub OQ_QUEUE_4_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000410;}
sub OQ_QUEUE_4_NUM_PKTS_STORED_REG ()               { 0x2000414;}
sub OQ_QUEUE_4_NUM_PKTS_DROPPED_REG ()              { 0x2000418;}
sub OQ_QUEUE_4_NUM_PKTS_REMOVED_REG ()              { 0x200041c;}
sub OQ_QUEUE_4_ADDR_LO_REG ()                       { 0x2000420;}
sub OQ_QUEUE_4_ADDR_HI_REG ()                       { 0x2000424;}
sub OQ_QUEUE_4_RD_ADDR_REG ()                       { 0x2000428;}
sub OQ_QUEUE_4_WR_ADDR_REG ()                       { 0x200042c;}
sub OQ_QUEUE_4_NUM_PKTS_IN_Q_REG ()                 { 0x2000430;}
sub OQ_QUEUE_4_MAX_PKTS_IN_Q_REG ()                 { 0x2000434;}
sub OQ_QUEUE_4_NUM_WORDS_IN_Q_REG ()                { 0x2000438;}
sub OQ_QUEUE_4_NUM_WORDS_LEFT_REG ()                { 0x200043c;}
sub OQ_QUEUE_4_FULL_THRESH_REG ()                   { 0x2000440;}
sub OQ_QUEUE_4_CURR_ITER_REG ()                     { 0x2000444;}
sub OQ_QUEUE_4_MAX_ITER_REG ()                      { 0x2000448;}
sub OQ_QUEUE_5_CTRL_REG ()                          { 0x2000500;}
sub OQ_QUEUE_5_NUM_PKT_BYTES_STORED_REG ()          { 0x2000504;}
sub OQ_QUEUE_5_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000508;}
sub OQ_QUEUE_5_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200050c;}
sub OQ_QUEUE_5_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000510;}
sub OQ_QUEUE_5_NUM_PKTS_STORED_REG ()               { 0x2000514;}
sub OQ_QUEUE_5_NUM_PKTS_DROPPED_REG ()              { 0x2000518;}
sub OQ_QUEUE_5_NUM_PKTS_REMOVED_REG ()              { 0x200051c;}
sub OQ_QUEUE_5_ADDR_LO_REG ()                       { 0x2000520;}
sub OQ_QUEUE_5_ADDR_HI_REG ()                       { 0x2000524;}
sub OQ_QUEUE_5_RD_ADDR_REG ()                       { 0x2000528;}
sub OQ_QUEUE_5_WR_ADDR_REG ()                       { 0x200052c;}
sub OQ_QUEUE_5_NUM_PKTS_IN_Q_REG ()                 { 0x2000530;}
sub OQ_QUEUE_5_MAX_PKTS_IN_Q_REG ()                 { 0x2000534;}
sub OQ_QUEUE_5_NUM_WORDS_IN_Q_REG ()                { 0x2000538;}
sub OQ_QUEUE_5_NUM_WORDS_LEFT_REG ()                { 0x200053c;}
sub OQ_QUEUE_5_FULL_THRESH_REG ()                   { 0x2000540;}
sub OQ_QUEUE_5_CURR_ITER_REG ()                     { 0x2000544;}
sub OQ_QUEUE_5_MAX_ITER_REG ()                      { 0x2000548;}
sub OQ_QUEUE_6_CTRL_REG ()                          { 0x2000600;}
sub OQ_QUEUE_6_NUM_PKT_BYTES_STORED_REG ()          { 0x2000604;}
sub OQ_QUEUE_6_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000608;}
sub OQ_QUEUE_6_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200060c;}
sub OQ_QUEUE_6_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000610;}
sub OQ_QUEUE_6_NUM_PKTS_STORED_REG ()               { 0x2000614;}
sub OQ_QUEUE_6_NUM_PKTS_DROPPED_REG ()              { 0x2000618;}
sub OQ_QUEUE_6_NUM_PKTS_REMOVED_REG ()              { 0x200061c;}
sub OQ_QUEUE_6_ADDR_LO_REG ()                       { 0x2000620;}
sub OQ_QUEUE_6_ADDR_HI_REG ()                       { 0x2000624;}
sub OQ_QUEUE_6_RD_ADDR_REG ()                       { 0x2000628;}
sub OQ_QUEUE_6_WR_ADDR_REG ()                       { 0x200062c;}
sub OQ_QUEUE_6_NUM_PKTS_IN_Q_REG ()                 { 0x2000630;}
sub OQ_QUEUE_6_MAX_PKTS_IN_Q_REG ()                 { 0x2000634;}
sub OQ_QUEUE_6_NUM_WORDS_IN_Q_REG ()                { 0x2000638;}
sub OQ_QUEUE_6_NUM_WORDS_LEFT_REG ()                { 0x200063c;}
sub OQ_QUEUE_6_FULL_THRESH_REG ()                   { 0x2000640;}
sub OQ_QUEUE_6_CURR_ITER_REG ()                     { 0x2000644;}
sub OQ_QUEUE_6_MAX_ITER_REG ()                      { 0x2000648;}
sub OQ_QUEUE_7_CTRL_REG ()                          { 0x2000700;}
sub OQ_QUEUE_7_NUM_PKT_BYTES_STORED_REG ()          { 0x2000704;}
sub OQ_QUEUE_7_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000708;}
sub OQ_QUEUE_7_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200070c;}
sub OQ_QUEUE_7_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000710;}
sub OQ_QUEUE_7_NUM_PKTS_STORED_REG ()               { 0x2000714;}
sub OQ_QUEUE_7_NUM_PKTS_DROPPED_REG ()              { 0x2000718;}
sub OQ_QUEUE_7_NUM_PKTS_REMOVED_REG ()              { 0x200071c;}
sub OQ_QUEUE_7_ADDR_LO_REG ()                       { 0x2000720;}
sub OQ_QUEUE_7_ADDR_HI_REG ()                       { 0x2000724;}
sub OQ_QUEUE_7_RD_ADDR_REG ()                       { 0x2000728;}
sub OQ_QUEUE_7_WR_ADDR_REG ()                       { 0x200072c;}
sub OQ_QUEUE_7_NUM_PKTS_IN_Q_REG ()                 { 0x2000730;}
sub OQ_QUEUE_7_MAX_PKTS_IN_Q_REG ()                 { 0x2000734;}
sub OQ_QUEUE_7_NUM_WORDS_IN_Q_REG ()                { 0x2000738;}
sub OQ_QUEUE_7_NUM_WORDS_LEFT_REG ()                { 0x200073c;}
sub OQ_QUEUE_7_FULL_THRESH_REG ()                   { 0x2000740;}
sub OQ_QUEUE_7_CURR_ITER_REG ()                     { 0x2000744;}
sub OQ_QUEUE_7_MAX_ITER_REG ()                      { 0x2000748;}
sub OQ_QUEUE_8_CTRL_REG ()                          { 0x2000800;}
sub OQ_QUEUE_8_NUM_PKT_BYTES_STORED_REG ()          { 0x2000804;}
sub OQ_QUEUE_8_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000808;}
sub OQ_QUEUE_8_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200080c;}
sub OQ_QUEUE_8_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000810;}
sub OQ_QUEUE_8_NUM_PKTS_STORED_REG ()               { 0x2000814;}
sub OQ_QUEUE_8_NUM_PKTS_DROPPED_REG ()              { 0x2000818;}
sub OQ_QUEUE_8_NUM_PKTS_REMOVED_REG ()              { 0x200081c;}
sub OQ_QUEUE_8_ADDR_LO_REG ()                       { 0x2000820;}
sub OQ_QUEUE_8_ADDR_HI_REG ()                       { 0x2000824;}
sub OQ_QUEUE_8_RD_ADDR_REG ()                       { 0x2000828;}
sub OQ_QUEUE_8_WR_ADDR_REG ()                       { 0x200082c;}
sub OQ_QUEUE_8_NUM_PKTS_IN_Q_REG ()                 { 0x2000830;}
sub OQ_QUEUE_8_MAX_PKTS_IN_Q_REG ()                 { 0x2000834;}
sub OQ_QUEUE_8_NUM_WORDS_IN_Q_REG ()                { 0x2000838;}
sub OQ_QUEUE_8_NUM_WORDS_LEFT_REG ()                { 0x200083c;}
sub OQ_QUEUE_8_FULL_THRESH_REG ()                   { 0x2000840;}
sub OQ_QUEUE_8_CURR_ITER_REG ()                     { 0x2000844;}
sub OQ_QUEUE_8_MAX_ITER_REG ()                      { 0x2000848;}
sub OQ_QUEUE_9_CTRL_REG ()                          { 0x2000900;}
sub OQ_QUEUE_9_NUM_PKT_BYTES_STORED_REG ()          { 0x2000904;}
sub OQ_QUEUE_9_NUM_OVERHEAD_BYTES_STORED_REG ()     { 0x2000908;}
sub OQ_QUEUE_9_NUM_PKT_BYTES_REMOVED_REG ()         { 0x200090c;}
sub OQ_QUEUE_9_NUM_OVERHEAD_BYTES_REMOVED_REG ()    { 0x2000910;}
sub OQ_QUEUE_9_NUM_PKTS_STORED_REG ()               { 0x2000914;}
sub OQ_QUEUE_9_NUM_PKTS_DROPPED_REG ()              { 0x2000918;}
sub OQ_QUEUE_9_NUM_PKTS_REMOVED_REG ()              { 0x200091c;}
sub OQ_QUEUE_9_ADDR_LO_REG ()                       { 0x2000920;}
sub OQ_QUEUE_9_ADDR_HI_REG ()                       { 0x2000924;}
sub OQ_QUEUE_9_RD_ADDR_REG ()                       { 0x2000928;}
sub OQ_QUEUE_9_WR_ADDR_REG ()                       { 0x200092c;}
sub OQ_QUEUE_9_NUM_PKTS_IN_Q_REG ()                 { 0x2000930;}
sub OQ_QUEUE_9_MAX_PKTS_IN_Q_REG ()                 { 0x2000934;}
sub OQ_QUEUE_9_NUM_WORDS_IN_Q_REG ()                { 0x2000938;}
sub OQ_QUEUE_9_NUM_WORDS_LEFT_REG ()                { 0x200093c;}
sub OQ_QUEUE_9_FULL_THRESH_REG ()                   { 0x2000940;}
sub OQ_QUEUE_9_CURR_ITER_REG ()                     { 0x2000944;}
sub OQ_QUEUE_9_MAX_ITER_REG ()                      { 0x2000948;}
sub OQ_QUEUE_10_CTRL_REG ()                         { 0x2000a00;}
sub OQ_QUEUE_10_NUM_PKT_BYTES_STORED_REG ()         { 0x2000a04;}
sub OQ_QUEUE_10_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2000a08;}
sub OQ_QUEUE_10_NUM_PKT_BYTES_REMOVED_REG ()        { 0x2000a0c;}
sub OQ_QUEUE_10_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2000a10;}
sub OQ_QUEUE_10_NUM_PKTS_STORED_REG ()              { 0x2000a14;}
sub OQ_QUEUE_10_NUM_PKTS_DROPPED_REG ()             { 0x2000a18;}
sub OQ_QUEUE_10_NUM_PKTS_REMOVED_REG ()             { 0x2000a1c;}
sub OQ_QUEUE_10_ADDR_LO_REG ()                      { 0x2000a20;}
sub OQ_QUEUE_10_ADDR_HI_REG ()                      { 0x2000a24;}
sub OQ_QUEUE_10_RD_ADDR_REG ()                      { 0x2000a28;}
sub OQ_QUEUE_10_WR_ADDR_REG ()                      { 0x2000a2c;}
sub OQ_QUEUE_10_NUM_PKTS_IN_Q_REG ()                { 0x2000a30;}
sub OQ_QUEUE_10_MAX_PKTS_IN_Q_REG ()                { 0x2000a34;}
sub OQ_QUEUE_10_NUM_WORDS_IN_Q_REG ()               { 0x2000a38;}
sub OQ_QUEUE_10_NUM_WORDS_LEFT_REG ()               { 0x2000a3c;}
sub OQ_QUEUE_10_FULL_THRESH_REG ()                  { 0x2000a40;}
sub OQ_QUEUE_10_CURR_ITER_REG ()                    { 0x2000a44;}
sub OQ_QUEUE_10_MAX_ITER_REG ()                     { 0x2000a48;}
sub OQ_QUEUE_11_CTRL_REG ()                         { 0x2000b00;}
sub OQ_QUEUE_11_NUM_PKT_BYTES_STORED_REG ()         { 0x2000b04;}
sub OQ_QUEUE_11_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2000b08;}
sub OQ_QUEUE_11_NUM_PKT_BYTES_REMOVED_REG ()        { 0x2000b0c;}
sub OQ_QUEUE_11_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2000b10;}
sub OQ_QUEUE_11_NUM_PKTS_STORED_REG ()              { 0x2000b14;}
sub OQ_QUEUE_11_NUM_PKTS_DROPPED_REG ()             { 0x2000b18;}
sub OQ_QUEUE_11_NUM_PKTS_REMOVED_REG ()             { 0x2000b1c;}
sub OQ_QUEUE_11_ADDR_LO_REG ()                      { 0x2000b20;}
sub OQ_QUEUE_11_ADDR_HI_REG ()                      { 0x2000b24;}
sub OQ_QUEUE_11_RD_ADDR_REG ()                      { 0x2000b28;}
sub OQ_QUEUE_11_WR_ADDR_REG ()                      { 0x2000b2c;}
sub OQ_QUEUE_11_NUM_PKTS_IN_Q_REG ()                { 0x2000b30;}
sub OQ_QUEUE_11_MAX_PKTS_IN_Q_REG ()                { 0x2000b34;}
sub OQ_QUEUE_11_NUM_WORDS_IN_Q_REG ()               { 0x2000b38;}
sub OQ_QUEUE_11_NUM_WORDS_LEFT_REG ()               { 0x2000b3c;}
sub OQ_QUEUE_11_FULL_THRESH_REG ()                  { 0x2000b40;}
sub OQ_QUEUE_11_CURR_ITER_REG ()                    { 0x2000b44;}
sub OQ_QUEUE_11_MAX_ITER_REG ()                     { 0x2000b48;}

sub OQ_QUEUE_GROUP_BASE_ADDR ()  { 0x2000000; }
sub OQ_QUEUE_GROUP_INST_OFFSET() { 0x0000100; }

# Name: in_arb (IN_ARB)
# Description: Round-robin input arbiter
# File: lib/verilog/core/input_arbiter/rr_input_arbiter/xml/rr_input_arbiter.xml
sub IN_ARB_NUM_PKTS_SENT_REG ()        { 0x2001000;}
sub IN_ARB_LAST_PKT_WORD_0_HI_REG ()   { 0x2001004;}
sub IN_ARB_LAST_PKT_WORD_0_LO_REG ()   { 0x2001008;}
sub IN_ARB_LAST_PKT_CTRL_0_REG ()      { 0x200100c;}
sub IN_ARB_LAST_PKT_WORD_1_HI_REG ()   { 0x2001010;}
sub IN_ARB_LAST_PKT_WORD_1_LO_REG ()   { 0x2001014;}
sub IN_ARB_LAST_PKT_CTRL_1_REG ()      { 0x2001018;}
sub IN_ARB_STATE_REG ()                { 0x200101c;}

# Name: delay (DELAY)
# Description: Delay Module Registers
# File: projects/packet_generator/include/delay.xml
sub DELAY_RESET_REG ()   { 0x2001100;}

# Name: rate_limiter (RATE_LIMIT_0)
# Description: Event Capture Registers
# File: projects/packet_generator/include/rate_limiter.xml
sub RATE_LIMIT_0_CTRL_REG ()             { 0x2001140;}
sub RATE_LIMIT_0_TOKEN_INTERVAL_REG ()   { 0x2001144;}
sub RATE_LIMIT_0_TOKEN_INC_REG ()        { 0x2001148;}

# Name: rate_limiter (RATE_LIMIT_1)
# Description: Event Capture Registers
# File: projects/packet_generator/include/rate_limiter.xml
sub RATE_LIMIT_1_CTRL_REG ()             { 0x2001180;}
sub RATE_LIMIT_1_TOKEN_INTERVAL_REG ()   { 0x2001184;}
sub RATE_LIMIT_1_TOKEN_INC_REG ()        { 0x2001188;}

# Name: rate_limiter (RATE_LIMIT_2)
# Description: Event Capture Registers
# File: projects/packet_generator/include/rate_limiter.xml
sub RATE_LIMIT_2_CTRL_REG ()             { 0x20011c0;}
sub RATE_LIMIT_2_TOKEN_INTERVAL_REG ()   { 0x20011c4;}
sub RATE_LIMIT_2_TOKEN_INC_REG ()        { 0x20011c8;}

# Name: rate_limiter (RATE_LIMIT_3)
# Description: Event Capture Registers
# File: projects/packet_generator/include/rate_limiter.xml
sub RATE_LIMIT_3_CTRL_REG ()             { 0x2001200;}
sub RATE_LIMIT_3_TOKEN_INTERVAL_REG ()   { 0x2001204;}
sub RATE_LIMIT_3_TOKEN_INC_REG ()        { 0x2001208;}

# Name: rate_limiter (RATE_LIMIT_4)
# Description: Event Capture Registers
# File: projects/packet_generator/include/rate_limiter.xml
sub RATE_LIMIT_4_CTRL_REG ()             { 0x2001240;}
sub RATE_LIMIT_4_TOKEN_INTERVAL_REG ()   { 0x2001244;}
sub RATE_LIMIT_4_TOKEN_INC_REG ()        { 0x2001248;}

# Name: rate_limiter (RATE_LIMIT_5)
# Description: Event Capture Registers
# File: projects/packet_generator/include/rate_limiter.xml
sub RATE_LIMIT_5_CTRL_REG ()             { 0x2001280;}
sub RATE_LIMIT_5_TOKEN_INTERVAL_REG ()   { 0x2001284;}
sub RATE_LIMIT_5_TOKEN_INC_REG ()        { 0x2001288;}

# Name: rate_limiter (RATE_LIMIT_6)
# Description: Event Capture Registers
# File: projects/packet_generator/include/rate_limiter.xml
sub RATE_LIMIT_6_CTRL_REG ()             { 0x20012c0;}
sub RATE_LIMIT_6_TOKEN_INTERVAL_REG ()   { 0x20012c4;}
sub RATE_LIMIT_6_TOKEN_INC_REG ()        { 0x20012c8;}

# Name: rate_limiter (RATE_LIMIT_7)
# Description: Event Capture Registers
# File: projects/packet_generator/include/rate_limiter.xml
sub RATE_LIMIT_7_CTRL_REG ()             { 0x2001300;}
sub RATE_LIMIT_7_TOKEN_INTERVAL_REG ()   { 0x2001304;}
sub RATE_LIMIT_7_TOKEN_INC_REG ()        { 0x2001308;}

# Name: packet_capture (PKT_GEN)
# Description: Packet Generator Control Registers
# File: projects/packet_generator/include/packet_capture.xml
sub PKT_GEN_CTRL_ENABLE_REG ()            { 0x2001400;}
sub PKT_GEN_CTRL_0_PKT_COUNT_REG ()       { 0x2001480;}
sub PKT_GEN_CTRL_0_BYTE_COUNT_HI_REG ()   { 0x2001484;}
sub PKT_GEN_CTRL_0_BYTE_COUNT_LO_REG ()   { 0x2001488;}
sub PKT_GEN_CTRL_0_TIME_FIRST_HI_REG ()   { 0x200148c;}
sub PKT_GEN_CTRL_0_TIME_FIRST_LO_REG ()   { 0x2001490;}
sub PKT_GEN_CTRL_0_TIME_LAST_HI_REG ()    { 0x2001494;}
sub PKT_GEN_CTRL_0_TIME_LAST_LO_REG ()    { 0x2001498;}
sub PKT_GEN_CTRL_1_PKT_COUNT_REG ()       { 0x20014a0;}
sub PKT_GEN_CTRL_1_BYTE_COUNT_HI_REG ()   { 0x20014a4;}
sub PKT_GEN_CTRL_1_BYTE_COUNT_LO_REG ()   { 0x20014a8;}
sub PKT_GEN_CTRL_1_TIME_FIRST_HI_REG ()   { 0x20014ac;}
sub PKT_GEN_CTRL_1_TIME_FIRST_LO_REG ()   { 0x20014b0;}
sub PKT_GEN_CTRL_1_TIME_LAST_HI_REG ()    { 0x20014b4;}
sub PKT_GEN_CTRL_1_TIME_LAST_LO_REG ()    { 0x20014b8;}
sub PKT_GEN_CTRL_2_PKT_COUNT_REG ()       { 0x20014c0;}
sub PKT_GEN_CTRL_2_BYTE_COUNT_HI_REG ()   { 0x20014c4;}
sub PKT_GEN_CTRL_2_BYTE_COUNT_LO_REG ()   { 0x20014c8;}
sub PKT_GEN_CTRL_2_TIME_FIRST_HI_REG ()   { 0x20014cc;}
sub PKT_GEN_CTRL_2_TIME_FIRST_LO_REG ()   { 0x20014d0;}
sub PKT_GEN_CTRL_2_TIME_LAST_HI_REG ()    { 0x20014d4;}
sub PKT_GEN_CTRL_2_TIME_LAST_LO_REG ()    { 0x20014d8;}
sub PKT_GEN_CTRL_3_PKT_COUNT_REG ()       { 0x20014e0;}
sub PKT_GEN_CTRL_3_BYTE_COUNT_HI_REG ()   { 0x20014e4;}
sub PKT_GEN_CTRL_3_BYTE_COUNT_LO_REG ()   { 0x20014e8;}
sub PKT_GEN_CTRL_3_TIME_FIRST_HI_REG ()   { 0x20014ec;}
sub PKT_GEN_CTRL_3_TIME_FIRST_LO_REG ()   { 0x20014f0;}
sub PKT_GEN_CTRL_3_TIME_LAST_HI_REG ()    { 0x20014f4;}
sub PKT_GEN_CTRL_3_TIME_LAST_LO_REG ()    { 0x20014f8;}

sub PKT_GEN_CTRL_GROUP_BASE_ADDR ()  { 0x2001480; }
sub PKT_GEN_CTRL_GROUP_INST_OFFSET() { 0x0000020; }

# Name: DRAM (DRAM)
# Description: DRAM



# -------------------------------------
#   Bitmasks
# -------------------------------------

# Type: oq_control
# File: projects/packet_generator/include/sram_rr_output_queues.xml

# Part 1: bit positions
sub OQ_CONTROL_ENABLE_SEND_POS   ()   { 0; }
sub OQ_CONTROL_INITIALIZE_OQ_POS ()   { 1; }

# Part 2: masks/values
sub OQ_CONTROL_ENABLE_SEND       ()   { 0x1; }
sub OQ_CONTROL_INITIALIZE_OQ     ()   { 0x2; }

# Type: dma_iface_ctrl
# Description: DMA interface control register
# File: lib/verilog/core/dma/xml/dma.xml

# Part 1: bit positions
sub DMA_IFACE_CTRL_DISABLE_POS ()   { 0; }
sub DMA_IFACE_CTRL_RESET_POS   ()   { 1; }

# Part 2: masks/values
sub DMA_IFACE_CTRL_DISABLE     ()   { 0x001; }
sub DMA_IFACE_CTRL_RESET       ()   { 0x002; }

# Type: mii_ctrl
# Description: MII control register
# File: lib/verilog/core/io/mdio/xml/mdio.xml

# Part 1: bit positions
sub MII_CTRL_RESET_POS             ()   { 15; }
sub MII_CTRL_INTERNAL_LOOPBACK_POS ()   { 14; }
sub MII_CTRL_SPEED_SEL_LO_POS      ()   { 13; }
sub MII_CTRL_AUTONEG_ENABLE_POS    ()   { 12; }
sub MII_CTRL_PWR_DOWN_POS          ()   { 11; }
sub MII_CTRL_ISOLATE_POS           ()   { 10; }
sub MII_CTRL_RESTART_AUTONEG_POS   ()   { 9; }
sub MII_CTRL_DUPLEX_MODE_POS       ()   { 8; }
sub MII_CTRL_COLLISION_TEST_EN_POS ()   { 7; }
sub MII_CTRL_SPEED_SEL_HI_POS      ()   { 6; }

# Part 2: masks/values
sub MII_CTRL_RESET                 ()   { 0x8000; }
sub MII_CTRL_INTERNAL_LOOPBACK     ()   { 0x4000; }
sub MII_CTRL_SPEED_SEL_LO          ()   { 0x2000; }
sub MII_CTRL_AUTONEG_ENABLE        ()   { 0x1000; }
sub MII_CTRL_PWR_DOWN              ()   { 0x0800; }
sub MII_CTRL_ISOLATE               ()   { 0x0400; }
sub MII_CTRL_RESTART_AUTONEG       ()   { 0x0200; }
sub MII_CTRL_DUPLEX_MODE           ()   { 0x0100; }
sub MII_CTRL_COLLISION_TEST_EN     ()   { 0x0080; }
sub MII_CTRL_SPEED_SEL_HI          ()   { 0x0040; }

# Type: mii_status
# Description: MII status register
# File: lib/verilog/core/io/mdio/xml/mdio.xml

# Part 1: bit positions
sub MII_STATUS_100BASE_T4_CAPABLE_POS          ()   { 15; }
sub MII_STATUS_100BASE_X_FULL_DPLX_CAPABLE_POS ()   { 14; }
sub MII_STATUS_100BASE_X_HALF_DPLX_CAPABLE_POS ()   { 13; }
sub MII_STATUS_10BASE_T_FULL_DPLX_CAPABLE_POS  ()   { 12; }
sub MII_STATUS_10BASE_T_HALF_DPLX_CAPABLE_POS  ()   { 11; }
sub MII_STATUS_10BASE_T2_FULL_DPLX_CAPABLE_POS ()   { 10; }
sub MII_STATUS_10BASE_T2_HALF_DPLX_CAPABLE_POS ()   { 9; }
sub MII_STATUS_EXTENDED_STATUS_POS             ()   { 8; }
sub MII_STATUS_MF_PREAMBLE_SUPPRESS_POS        ()   { 6; }
sub MII_STATUS_AUTONEG_COMPLETE_POS            ()   { 5; }
sub MII_STATUS_REMOTE_FAULT_POS                ()   { 4; }
sub MII_STATUS_AUTONEG_ABILITY_POS             ()   { 3; }
sub MII_STATUS_LINK_STATUS_POS                 ()   { 2; }
sub MII_STATUS_JABBER_DETECT_POS               ()   { 1; }
sub MII_STATUS_EXTENDED_CAPABILITY_POS         ()   { 0; }

# Part 2: masks/values
sub MII_STATUS_100BASE_T4_CAPABLE              ()   { 0x8000; }
sub MII_STATUS_100BASE_X_FULL_DPLX_CAPABLE     ()   { 0x4000; }
sub MII_STATUS_100BASE_X_HALF_DPLX_CAPABLE     ()   { 0x2000; }
sub MII_STATUS_10BASE_T_FULL_DPLX_CAPABLE      ()   { 0x1000; }
sub MII_STATUS_10BASE_T_HALF_DPLX_CAPABLE      ()   { 0x0800; }
sub MII_STATUS_10BASE_T2_FULL_DPLX_CAPABLE     ()   { 0x0400; }
sub MII_STATUS_10BASE_T2_HALF_DPLX_CAPABLE     ()   { 0x0200; }
sub MII_STATUS_EXTENDED_STATUS                 ()   { 0x0100; }
sub MII_STATUS_MF_PREAMBLE_SUPPRESS            ()   { 0x0040; }
sub MII_STATUS_AUTONEG_COMPLETE                ()   { 0x0020; }
sub MII_STATUS_REMOTE_FAULT                    ()   { 0x0010; }
sub MII_STATUS_AUTONEG_ABILITY                 ()   { 0x0008; }
sub MII_STATUS_LINK_STATUS                     ()   { 0x0004; }
sub MII_STATUS_JABBER_DETECT                   ()   { 0x0002; }
sub MII_STATUS_EXTENDED_CAPABILITY             ()   { 0x0001; }

# Type: cpu_queue_control
# Description: DMA queue control register
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml

# Part 1: bit positions
sub CPU_QUEUE_CONTROL_TX_QUEUE_DISABLE_POS ()   { 0; }
sub CPU_QUEUE_CONTROL_RX_QUEUE_DISABLE_POS ()   { 1; }

# Part 2: masks/values
sub CPU_QUEUE_CONTROL_TX_QUEUE_DISABLE     ()   { 0x001; }
sub CPU_QUEUE_CONTROL_RX_QUEUE_DISABLE     ()   { 0x002; }

# Type: mac_grp_control
# Description: MAC group control register
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml

# Part 1: bit positions
sub MAC_GRP_CONTROL_TX_QUEUE_DISABLE_POS      ()   { 0; }
sub MAC_GRP_CONTROL_RX_QUEUE_DISABLE_POS      ()   { 1; }
sub MAC_GRP_CONTROL_RESET_MAC_POS             ()   { 2; }
sub MAC_GRP_CONTROL_MAC_DISABLE_TX_POS        ()   { 3; }
sub MAC_GRP_CONTROL_MAC_DISABLE_RX_POS        ()   { 4; }
sub MAC_GRP_CONTROL_MAC_DISABLE_JUMBO_TX_POS  ()   { 5; }
sub MAC_GRP_CONTROL_MAC_DISABLE_JUMBO_RX_POS  ()   { 6; }
sub MAC_GRP_CONTROL_MAC_DISABLE_CRC_CHECK_POS ()   { 7; }
sub MAC_GRP_CONTROL_MAC_DISABLE_CRC_GEN_POS   ()   { 8; }

# Part 2: masks/values
sub MAC_GRP_CONTROL_TX_QUEUE_DISABLE          ()   { 0x001; }
sub MAC_GRP_CONTROL_RX_QUEUE_DISABLE          ()   { 0x002; }
sub MAC_GRP_CONTROL_RESET_MAC                 ()   { 0x004; }
sub MAC_GRP_CONTROL_MAC_DISABLE_TX            ()   { 0x008; }
sub MAC_GRP_CONTROL_MAC_DISABLE_RX            ()   { 0x010; }
sub MAC_GRP_CONTROL_MAC_DISABLE_JUMBO_TX      ()   { 0x020; }
sub MAC_GRP_CONTROL_MAC_DISABLE_JUMBO_RX      ()   { 0x040; }
sub MAC_GRP_CONTROL_MAC_DISABLE_CRC_CHECK     ()   { 0x080; }
sub MAC_GRP_CONTROL_MAC_DISABLE_CRC_GEN       ()   { 0x100; }





1;

__END__
