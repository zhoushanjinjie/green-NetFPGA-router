#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
};

static const struct modversion_info ____versions[]
__attribute_used__
__attribute__((section("__versions"))) = {
	{ 0x1a197155, "struct_module" },
	{ 0x4c3af445, "__request_region" },
	{ 0x9a25c43, "pci_bus_read_config_byte" },
	{ 0x12da5bb2, "__kmalloc" },
	{ 0x89b301d4, "param_get_int" },
	{ 0xdc3eaf70, "iomem_resource" },
	{ 0x50b2266c, "skb_pad" },
	{ 0xab978df6, "malloc_sizes" },
	{ 0x600be4b6, "pci_disable_device" },
	{ 0xa0be5c1e, "netif_carrier_on" },
	{ 0x1779acb9, "netif_carrier_off" },
	{ 0x371f96b3, "alloc_netdev" },
	{ 0xd8c152cd, "raise_softirq_irqoff" },
	{ 0x98bd6f46, "param_set_int" },
	{ 0x87cddf59, "_spin_lock_irqsave" },
	{ 0xff3d1bce, "__dev_alloc_skb" },
	{ 0x7d11c268, "jiffies" },
	{ 0xda4008e6, "cond_resched" },
	{ 0x1f2f58f8, "netif_rx" },
	{ 0x8656db54, "dma_unmap_single" },
	{ 0xa13798f8, "printk_ratelimit" },
	{ 0x41dea45a, "pci_set_master" },
	{ 0x55d112e6, "pci_set_dma_mask" },
	{ 0x1b7d4074, "printk" },
	{ 0x570e7795, "ethtool_op_get_link" },
	{ 0x6932ac60, "free_netdev" },
	{ 0x2da418b5, "copy_to_user" },
	{ 0xb7106789, "register_netdev" },
	{ 0x625acc81, "__down_failed_interruptible" },
	{ 0xa20fdde, "_spin_unlock_irqrestore" },
	{ 0x1902adf, "netpoll_trap" },
	{ 0x9eac042a, "__ioremap" },
	{ 0x4396197f, "skb_over_panic" },
	{ 0x19070091, "kmem_cache_alloc" },
	{ 0x26e96637, "request_irq" },
	{ 0x784bf468, "eth_type_trans" },
	{ 0xfe6e8525, "__raw_local_irq_save" },
	{ 0xdfb10773, "raw_local_irq_restore" },
	{ 0x8bb33e7d, "__release_region" },
	{ 0xb5925c61, "pci_unregister_driver" },
	{ 0x1ab47614, "ether_setup" },
	{ 0x280f9f14, "__per_cpu_offset" },
	{ 0x19cacd0, "init_waitqueue_head" },
	{ 0x37a0cba, "kfree" },
	{ 0xedc03953, "iounmap" },
	{ 0x661be8a0, "__pci_register_driver" },
	{ 0x60a4461c, "__up_wakeup" },
	{ 0xc47aaaf4, "unregister_netdev" },
	{ 0x88a660ab, "__netif_schedule" },
	{ 0xf8e46c64, "consume_skb" },
	{ 0x7e9e0ce5, "dma_map_single" },
	{ 0x908aa9b2, "iowrite32" },
	{ 0x78b2aedd, "pci_enable_device" },
	{ 0xf2a644fb, "copy_from_user" },
	{ 0x2241a928, "ioread32" },
	{ 0xf20dabd8, "free_irq" },
	{ 0x8e82d908, "per_cpu__softnet_data" },
};

static const char __module_depends[]
__attribute_used__
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("pci:v0000FEEDd00000001sv*sd*bc*sc*i*");

MODULE_INFO(srcversion, "92BE4B2998C25B8070282D9");
