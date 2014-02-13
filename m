Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE4C7E00807
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2014 11:45:27 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0Y0094J9JEVOH0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 13 Feb 2014 13:45:15 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 88B4A200BE; Thu,
	13 Feb 2014 14:45:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 13 Feb 2014 14:45:11 -0500
Message-id: <1392320711-25521-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: apply network performance and LCD fixes locally for now
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2014 19:45:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...2-am43xx-Add-context-offset-for-dss-hwmod.patch |  44 +++++
 ...omap-Sync-up-omap2plus-defconfig-with-sav.patch | 195 +++++++++++++++++++++
 ...map_hwmod-Add-context-ops-to-am43xx-soc_o.patch |  36 ++++
 ...omap-Make-advanced-networking-features-as.patch |  54 ++++++
 ...M-config-omap-Disable-extra-debug-options.patch |  47 +++++
 ...ge-ARM-config-omap-Disable-SMP-for-AM335x.patch |  44 +++++
 ...ll-warning-in-CPUIDLE-code-with-CONFIG_SM.patch |  49 ++++++
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |  12 +-
 8 files changed, 480 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0001-ARM-config-omap-Sync-up-omap2plus-defconfig-with-sav.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0002-ARM-config-omap-Make-advanced-networking-features-as.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0003-ARM-config-omap-Disable-extra-debug-options.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0005-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch

diff --git a/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch b/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
new file mode 100644
index 0000000..52594a1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
@@ -0,0 +1,44 @@
+From 52502d8e52ecd82cd802ee6900942d041f9a79ef Mon Sep 17 00:00:00 2001
+From: Dave Gerlach <d-gerlach@ti.com>
+Date: Wed, 12 Feb 2014 16:06:46 -0600
+Subject: [PATCH 1/2] ARM: OMAP2+: am43xx: Add context offset for dss hwmod
+
+Add context_offs to the DSS hwmod for am43xx as the driver uses the
+context loss count to determine whether or not to restore context to the
+module. Without this the display does not return after a suspend cycle.
+
+Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
+---
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c |    1 +
+ arch/arm/mach-omap2/prcm43xx.h             |    3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index 978356d..4dcdcef 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -1921,6 +1921,7 @@ static struct omap_hwmod am43xx_dss_core_hwmod = {
+ 	.prcm = {
+ 		.omap4 = {
+ 			.clkctrl_offs = AM43XX_CM_PER_DSS_CLKCTRL_OFFSET,
++			.context_offs = AM43XX_PRM_RM_PER_DSS_CONTEXT,
+ 			.modulemode   = MODULEMODE_SWCTRL,
+ 		},
+ 	},
+diff --git a/arch/arm/mach-omap2/prcm43xx.h b/arch/arm/mach-omap2/prcm43xx.h
+index f5344ab..d804228 100644
+--- a/arch/arm/mach-omap2/prcm43xx.h
++++ b/arch/arm/mach-omap2/prcm43xx.h
+@@ -25,6 +25,9 @@
+ #define AM43XX_PRM_WKUP_INST				0x2000
+ #define AM43XX_PRM_DEVICE_INST				0x4000
+ 
++/* PRM.PRM_PER offsets */
++#define AM43XX_PRM_RM_PER_DSS_CONTEXT			0x1224
++
+ /* RM RSTCTRL offsets */
+ #define AM43XX_RM_PER_RSTCTRL_OFFSET			0x0010
+ #define AM43XX_RM_GFX_RSTCTRL_OFFSET			0x0010
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti-staging/0001-ARM-config-omap-Sync-up-omap2plus-defconfig-with-sav.patch b/recipes-kernel/linux/linux-ti-staging/0001-ARM-config-omap-Sync-up-omap2plus-defconfig-with-sav.patch
new file mode 100644
index 0000000..f666521
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0001-ARM-config-omap-Sync-up-omap2plus-defconfig-with-sav.patch
@@ -0,0 +1,195 @@
+From 0e6113030205a51f16944d4f73e166792200def0 Mon Sep 17 00:00:00 2001
+From: Santosh Shilimkar <santosh.shilimkar@ti.com>
+Date: Thu, 13 Feb 2014 10:51:55 -0500
+Subject: [PATCH 1/6] ARM: config: omap: Sync up omap2plus defconfig with
+ savedefconfig
+
+This is preparatory patch for some of the config fragment updates
+to be done for network performance issue.
+
+Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
+---
+ arch/arm/configs/omap2plus_defconfig |   67 ++++++++++------------------------
+ 1 file changed, 20 insertions(+), 47 deletions(-)
+
+diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
+index f0484a2..2e8dcb9 100644
+--- a/arch/arm/configs/omap2plus_defconfig
++++ b/arch/arm/configs/omap2plus_defconfig
+@@ -23,25 +23,22 @@ CONFIG_PARTITION_ADVANCED=y
+ CONFIG_ARCH_OMAP2PLUS=y
+ CONFIG_ARCH_MULTI_V6=y
+ CONFIG_GPIO_PCA953X=y
++CONFIG_OMAP_RESET_CLOCKS=y
++CONFIG_OMAP_MUX_DEBUG=y
+ CONFIG_ARCH_OMAP2=y
+ CONFIG_ARCH_OMAP3=y
+ CONFIG_ARCH_OMAP4=y
+ CONFIG_SOC_OMAP5=y
+-CONFIG_SOC_AM33XX=y
+ CONFIG_SOC_AM43XX=y
+ CONFIG_SOC_DRA7XX=y
+-CONFIG_OMAP_RESET_CLOCKS=y
+-CONFIG_OMAP_MUX_DEBUG=y
+-CONFIG_ARCH_VEXPRESS_CA9X4=y
+ CONFIG_OMAP4_ERRATA_I688=y
+ CONFIG_ARM_THUMBEE=y
+ CONFIG_ARM_ERRATA_411920=y
+ CONFIG_PCIE_DRA7XX=y
+ CONFIG_SMP=y
+ CONFIG_NR_CPUS=2
+-CONFIG_CMA=y
+ CONFIG_PREEMPT=y
+-CONFIG_LEDS=y
++CONFIG_CMA=y
+ CONFIG_ZBOOT_ROM_TEXT=0x0
+ CONFIG_ZBOOT_ROM_BSS=0x0
+ CONFIG_ARM_APPENDED_DTB=y
+@@ -75,30 +72,13 @@ CONFIG_IP_PNP_RARP=y
+ # CONFIG_INET_LRO is not set
+ # CONFIG_IPV6 is not set
+ CONFIG_NETFILTER=y
+-CONFIG_NETFILTER_ADVANCED=y
+-CONFIG_NETFILTER_XTABLES=y
+-CONFIG_NF_NAT=y
+-CONFIG_NF_NAT_NEEDED=y
+-CONFIG_NF_NAT_IPV4=y
+-CONFIG_NF_DEFRAG_IPV4=y
+ CONFIG_NF_CONNTRACK=y
+ CONFIG_NF_CONNTRACK_IPV4=y
+-CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+ CONFIG_IP_NF_IPTABLES=y
+ CONFIG_IP_NF_FILTER=y
+-CONFIG_IP_NF_TARGET_LOG=y
++CONFIG_NF_NAT_IPV4=y
+ CONFIG_IP_NF_TARGET_MASQUERADE=y
+ CONFIG_BRIDGE=y
+-CONFIG_BRIDGE_IGMP_SNOOPING=y
+-CONFIG_BRIDGE_NETFILTER=y
+-CONFIG_STP=y
+-CONFIG_LLC=y
+-CONFIG_INPUT_UINPUT=y
+-CONFIG_HAS_IOMEM=y
+-CONFIG_HAS_IOPORT=y
+-CONFIG_HAS_DMA=y
+-CONFIG_NLATTR=y
+-CONFIG_AVERAGE=y
+ CONFIG_VLAN_8021Q=y
+ CONFIG_CAN=m
+ CONFIG_CAN_C_CAN=m
+@@ -110,16 +90,13 @@ CONFIG_BT_HCIUART_BCSP=y
+ CONFIG_BT_HCIUART_LL=y
+ CONFIG_BT_HCIBCM203X=m
+ CONFIG_BT_HCIBPA10X=m
+-CONFIG_NL80211_TESTMODE=y
++CONFIG_BT_WILINK=m
+ CONFIG_CFG80211=m
++CONFIG_NL80211_TESTMODE=y
+ CONFIG_MAC80211=m
+ CONFIG_MAC80211_RC_PID=y
+ CONFIG_MAC80211_RC_DEFAULT_PID=y
+-CONFIG_WL_TI=y
+-CONFIG_WL12XX=m
+-CONFIG_WL18XX=m
+-CONFIG_WLCORE=m
+-CONFIG_WLCORE_SDIO=m
++CONFIG_RFKILL=y
+ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+ CONFIG_DEVTMPFS=y
+ CONFIG_DEVTMPFS_MOUNT=y
+@@ -171,6 +148,10 @@ CONFIG_LIBERTAS=m
+ CONFIG_LIBERTAS_USB=m
+ CONFIG_LIBERTAS_SDIO=m
+ CONFIG_LIBERTAS_DEBUG=y
++CONFIG_WL_TI=y
++CONFIG_WL12XX=m
++CONFIG_WL18XX=m
++CONFIG_WLCORE_SDIO=m
+ CONFIG_INPUT_JOYDEV=y
+ CONFIG_INPUT_EVDEV=y
+ CONFIG_KEYBOARD_GPIO=y
+@@ -183,6 +164,7 @@ CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
+ CONFIG_TOUCHSCREEN_PIXCIR=m
+ CONFIG_INPUT_MISC=y
+ CONFIG_INPUT_TWL4030_PWRBUTTON=y
++CONFIG_INPUT_UINPUT=y
+ # CONFIG_LEGACY_PTYS is not set
+ CONFIG_SERIAL_8250=y
+ CONFIG_SERIAL_8250_CONSOLE=y
+@@ -226,7 +208,6 @@ CONFIG_MFD_TPS65217=y
+ CONFIG_MFD_TPS65218=y
+ CONFIG_MFD_TPS65910=y
+ CONFIG_TWL6040_CORE=y
+-CONFIG_REGULATOR_FIXED_VOLTAGE=y
+ CONFIG_REGULATOR_PALMAS=y
+ CONFIG_REGULATOR_PBIAS=y
+ CONFIG_REGULATOR_TPS65023=y
+@@ -240,6 +221,10 @@ CONFIG_MEDIA_SUPPORT=y
+ CONFIG_MEDIA_CAMERA_SUPPORT=y
+ CONFIG_MEDIA_USB_SUPPORT=y
+ CONFIG_USB_VIDEO_CLASS=m
++CONFIG_V4L_PLATFORM_DRIVERS=y
++CONFIG_VIDEO_AM437X_VPFE=y
++# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
++CONFIG_VIDEO_OV2659=y
+ CONFIG_FB=y
+ CONFIG_FIRMWARE_EDID=y
+ CONFIG_FB_TILEBLITTING=y
+@@ -252,6 +237,7 @@ CONFIG_FB_OMAP2=y
+ CONFIG_DISPLAY_ENCODER_TFP410=y
+ CONFIG_DISPLAY_ENCODER_TPD12S015=y
+ CONFIG_DISPLAY_DRA_EVM_ENCODER_TPD12S015=y
++CONFIG_DISPLAY_ENCODER_SIL9022=y
+ CONFIG_DISPLAY_CONNECTOR_DVI=y
+ CONFIG_DISPLAY_CONNECTOR_HDMI=y
+ CONFIG_DISPLAY_PANEL_DPI=y
+@@ -276,6 +262,7 @@ CONFIG_SND_DAVINCI_SOC=m
+ CONFIG_SND_AM33XX_SOC_EVM=m
+ CONFIG_SND_AM43XX_SOC_EPOS_EVM=m
+ CONFIG_SND_OMAP_SOC=m
++CONFIG_SND_OMAP_SOC_DRA7EVM=m
+ CONFIG_SND_OMAP_SOC_OMAP_TWL4030=m
+ CONFIG_SND_OMAP_SOC_OMAP_ABE_TWL6040=m
+ CONFIG_SND_OMAP_SOC_OMAP3_PANDORA=m
+@@ -287,7 +274,6 @@ CONFIG_USB_EHCI_HCD=y
+ CONFIG_USB_MUSB_HDRC=m
+ CONFIG_USB_MUSB_OMAP2PLUS=m
+ CONFIG_USB_MUSB_DSPS=m
+-CONFIG_USB_MUSB_AM335X_CHILD=m
+ CONFIG_USB_TI_CPPI41_DMA=y
+ CONFIG_USB_WDM=y
+ CONFIG_USB_STORAGE=y
+@@ -390,17 +376,11 @@ CONFIG_SCHEDSTATS=y
+ CONFIG_TIMER_STATS=y
+ CONFIG_PROVE_LOCKING=y
+ # CONFIG_DEBUG_BUGVERBOSE is not set
+-CONFIG_RFKILL=y
+-CONFIG_KEYS=y
+-CONFIG_BT_WILINK=m
+-CONFIG_WIRELESS_EXT=y
+ CONFIG_SECURITY=y
+-CONFIG_CRYPTO=y
+-CONFIG_CRYPTO_ARC4=y
+-CONFIG_CRYPTO_ECB=y
+-CONFIG_CRYPTO_AES=y
+ CONFIG_CRYPTO_TEST=m
++CONFIG_CRYPTO_ECB=y
+ CONFIG_CRYPTO_MICHAEL_MIC=y
++CONFIG_CRYPTO_ARC4=y
+ # CONFIG_CRYPTO_ANSI_CPRNG is not set
+ CONFIG_CRYPTO_USER_API_HASH=y
+ CONFIG_CRYPTO_USER_API_SKCIPHER=y
+@@ -415,10 +395,3 @@ CONFIG_LIBCRC32C=y
+ CONFIG_FONTS=y
+ CONFIG_FONT_8x8=y
+ CONFIG_FONT_8x16=y
+-CONFIG_SND_OMAP_SOC_DRA7EVM=y
+-CONFIG_DISPLAY_ENCODER_SIL9022=y
+-CONFIG_VIDEO_V4L2=y
+-CONFIG_V4L_PLATFORM_DRIVERS=y
+-# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
+-CONFIG_VIDEO_AM437X_VPFE=y
+-CONFIG_VIDEO_OV2659=y
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch b/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch
new file mode 100644
index 0000000..0258142
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch
@@ -0,0 +1,36 @@
+From 8ec77cd15997749f51912e75bd47fad032cd3afe Mon Sep 17 00:00:00 2001
+From: Dave Gerlach <d-gerlach@ti.com>
+Date: Wed, 12 Feb 2014 16:05:30 -0600
+Subject: [PATCH 2/2] ARM: OMAP2+: omap_hwmod: Add context ops to am43xx
+ soc_ops
+
+AM43XX contains PRM_*_CONTEXT registers like OMAP4 did to track loss
+of context in modules so utilize the same soc_ops present for OMAP4.
+
+Certain drivers use the context loss count to determine if context was
+truly lost during a suspend operation to decide whether or not a
+context restore is truly necessary. Without this, some drivers may
+choose not to restore context when they have actually lost it and fail
+to properly resume.
+
+Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
+---
+ arch/arm/mach-omap2/omap_hwmod.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
+index 1f766fd..c03c54d 100644
+--- a/arch/arm/mach-omap2/omap_hwmod.c
++++ b/arch/arm/mach-omap2/omap_hwmod.c
+@@ -4296,6 +4296,8 @@ void __init omap_hwmod_init(void)
+ 		soc_ops.deassert_hardreset = _omap4_deassert_hardreset;
+ 		soc_ops.is_hardreset_asserted = _omap4_is_hardreset_asserted;
+ 		soc_ops.init_clkdm = _init_clkdm;
++		soc_ops.update_context_lost = _omap4_update_context_lost;
++		soc_ops.get_context_lost = _omap4_get_context_lost;
+ 	} else if (soc_is_am33xx()) {
+ 		soc_ops.enable_module = _am33xx_enable_module;
+ 		soc_ops.disable_module = _am33xx_disable_module;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti-staging/0002-ARM-config-omap-Make-advanced-networking-features-as.patch b/recipes-kernel/linux/linux-ti-staging/0002-ARM-config-omap-Make-advanced-networking-features-as.patch
new file mode 100644
index 0000000..5c4ad5f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0002-ARM-config-omap-Make-advanced-networking-features-as.patch
@@ -0,0 +1,54 @@
+From c43131183974d2b02140dce3560cf7bba385b459 Mon Sep 17 00:00:00 2001
+From: Santosh Shilimkar <santosh.shilimkar@ti.com>
+Date: Thu, 13 Feb 2014 08:22:42 -0500
+Subject: [PATCH 2/6] ARM: config: omap: Make advanced networking features as
+ modules
+
+Linux networking supports advanced networking features like IPSEC, NETFILTERS,
+BRIDGING etc and should be enabled only when user has specific usecase to
+use them. Thats why all typical distro's build them as modules so that all
+the standard network usecases don't get any additional overhead and specific
+case can load those modules when needed.
+
+Lets align the config accordingly. Created using typical 'savedefconfig' method.
+
+Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
+---
+ arch/arm/configs/omap2plus_defconfig |   18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
+index 2e8dcb9..4c96d0c 100644
+--- a/arch/arm/configs/omap2plus_defconfig
++++ b/arch/arm/configs/omap2plus_defconfig
+@@ -69,16 +69,20 @@ CONFIG_IP_PNP=y
+ CONFIG_IP_PNP_DHCP=y
+ CONFIG_IP_PNP_BOOTP=y
+ CONFIG_IP_PNP_RARP=y
++CONFIG_INET_XFRM_MODE_TRANSPORT=m
++CONFIG_INET_XFRM_MODE_TUNNEL=m
++CONFIG_INET_XFRM_MODE_BEET=m
+ # CONFIG_INET_LRO is not set
++CONFIG_INET_DIAG=m
+ # CONFIG_IPV6 is not set
+ CONFIG_NETFILTER=y
+-CONFIG_NF_CONNTRACK=y
+-CONFIG_NF_CONNTRACK_IPV4=y
+-CONFIG_IP_NF_IPTABLES=y
+-CONFIG_IP_NF_FILTER=y
+-CONFIG_NF_NAT_IPV4=y
+-CONFIG_IP_NF_TARGET_MASQUERADE=y
+-CONFIG_BRIDGE=y
++CONFIG_NF_CONNTRACK=m
++CONFIG_NF_CONNTRACK_IPV4=m
++CONFIG_IP_NF_IPTABLES=m
++CONFIG_IP_NF_FILTER=m
++CONFIG_NF_NAT_IPV4=m
++CONFIG_IP_NF_TARGET_MASQUERADE=m
++CONFIG_BRIDGE=m
+ CONFIG_VLAN_8021Q=y
+ CONFIG_CAN=m
+ CONFIG_CAN_C_CAN=m
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti-staging/0003-ARM-config-omap-Disable-extra-debug-options.patch b/recipes-kernel/linux/linux-ti-staging/0003-ARM-config-omap-Disable-extra-debug-options.patch
new file mode 100644
index 0000000..f515524
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0003-ARM-config-omap-Disable-extra-debug-options.patch
@@ -0,0 +1,47 @@
+From 2d7b208a86b15d2c35336783efa4b604d96ee31e Mon Sep 17 00:00:00 2001
+From: Santosh Shilimkar <santosh.shilimkar@ti.com>
+Date: Thu, 13 Feb 2014 08:33:49 -0500
+Subject: [PATCH 3/6] ARM: config: omap: Disable extra debug options
+
+LOCK debug, SCHED debug, PREEMPT debug are very expensive operations and
+always in fast path of kernel operations. These are typical kernel development
+options and should be disabled in production kernel builds.
+
+Also enable JUMP_LABEL to take advantage of compiler optimisations.
+
+Created using typical 'savedefconfig' method. Hence you see some crypto
+option noise which unrelated and no impact on the end config.
+
+Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
+---
+ arch/arm/configs/omap2plus_defconfig |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
+index 4c96d0c..4106761 100644
+--- a/arch/arm/configs/omap2plus_defconfig
++++ b/arch/arm/configs/omap2plus_defconfig
+@@ -12,6 +12,7 @@ CONFIG_SLAB=y
+ CONFIG_PROFILING=y
+ CONFIG_OPROFILE=y
+ CONFIG_KPROBES=y
++CONFIG_JUMP_LABEL=y
+ CONFIG_MODULES=y
+ CONFIG_MODULE_FORCE_LOAD=y
+ CONFIG_MODULE_UNLOAD=y
+@@ -376,10 +377,9 @@ CONFIG_NLS_ISO8859_1=y
+ CONFIG_PRINTK_TIME=y
+ CONFIG_DEBUG_INFO=y
+ CONFIG_MAGIC_SYSRQ=y
+-CONFIG_SCHEDSTATS=y
+-CONFIG_TIMER_STATS=y
+-CONFIG_PROVE_LOCKING=y
++# CONFIG_SCHED_DEBUG is not set
+ # CONFIG_DEBUG_BUGVERBOSE is not set
++# CONFIG_FTRACE is not set
+ CONFIG_SECURITY=y
+ CONFIG_CRYPTO_TEST=m
+ CONFIG_CRYPTO_ECB=y
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti-staging/0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch b/recipes-kernel/linux/linux-ti-staging/0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
new file mode 100644
index 0000000..3813504
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
@@ -0,0 +1,44 @@
+From adf38b7b71b35fcd1e229399e8eea7628be35815 Mon Sep 17 00:00:00 2001
+From: Santosh Shilimkar <santosh.shilimkar@ti.com>
+Date: Thu, 13 Feb 2014 08:52:41 -0500
+Subject: [PATCH 4/6] Not-for-merge: ARM: config: omap: Disable SMP for AM335x
+ build
+
+SMP and SMP_ON_UP introduces some extra barriers and code many fast paths
+including kernel lock functions.
+
+Performance sensitive usecases like networking gets impacted because of this.
+In typical production kernel which is targeted for single core device
+like AM335x family, you don't want to take this hit.
+
+Ideally one should just create a device specific config feed as done by all
+typical distro's. Other option is to apply this specifically during build
+time using recipe.
+
+Whichever option, one definitely don't want this overhead for performance
+critical usecases.
+
+Disabling SMP in the build introduces one warining in cpuidle44xx.c driver
+and fix is included in the series
+
+Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
+---
+ arch/arm/configs/omap2plus_defconfig |    2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
+index 4106761..bf49ab6 100644
+--- a/arch/arm/configs/omap2plus_defconfig
++++ b/arch/arm/configs/omap2plus_defconfig
+@@ -36,8 +36,6 @@ CONFIG_OMAP4_ERRATA_I688=y
+ CONFIG_ARM_THUMBEE=y
+ CONFIG_ARM_ERRATA_411920=y
+ CONFIG_PCIE_DRA7XX=y
+-CONFIG_SMP=y
+-CONFIG_NR_CPUS=2
+ CONFIG_PREEMPT=y
+ CONFIG_CMA=y
+ CONFIG_ZBOOT_ROM_TEXT=0x0
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti-staging/0005-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch b/recipes-kernel/linux/linux-ti-staging/0005-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch
new file mode 100644
index 0000000..ef6e0a7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0005-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch
@@ -0,0 +1,49 @@
+From a612d323c1e5a88a46323d5ee8547283917dd3b6 Mon Sep 17 00:00:00 2001
+From: Santosh Shilimkar <santosh.shilimkar@ti.com>
+Date: Wed, 12 Feb 2014 16:42:39 -0500
+Subject: [PATCH 5/6] ARM: OMAP: Kill warning in CPUIDLE code with !CONFIG_SMP
+
+for non SMP build, NR_CPUS is 1 and hence the code complains with below
+warnings.
+
+arch/arm/mach-omap2/cpuidle44xx.c:207:8: warning: array subscript is above array bounds [-Warray-bounds]
+arch/arm/mach-omap2/cpuidle44xx.c:212:11: warning: array subscript is above array bounds [-Warray-bounds]
+
+Kill it by making array size fixed.
+
+Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
+---
+ arch/arm/mach-omap2/cpuidle44xx.c |    8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/cpuidle44xx.c b/arch/arm/mach-omap2/cpuidle44xx.c
+index 4c8982a..5e85f1e 100644
+--- a/arch/arm/mach-omap2/cpuidle44xx.c
++++ b/arch/arm/mach-omap2/cpuidle44xx.c
+@@ -23,6 +23,8 @@
+ #include "prm.h"
+ #include "clockdomain.h"
+ 
++#define MAX_CPUS	2
++
+ /* Machine specific information */
+ struct idle_statedata {
+ 	u32 cpu_state;
+@@ -48,11 +50,11 @@ static struct idle_statedata omap4_idle_data[] = {
+ 	},
+ };
+ 
+-static struct powerdomain *mpu_pd, *cpu_pd[NR_CPUS];
+-static struct clockdomain *cpu_clkdm[NR_CPUS];
++static struct powerdomain *mpu_pd, *cpu_pd[MAX_CPUS];
++static struct clockdomain *cpu_clkdm[MAX_CPUS];
+ 
+ static atomic_t abort_barrier;
+-static bool cpu_done[NR_CPUS];
++static bool cpu_done[MAX_CPUS];
+ static struct idle_statedata *state_ptr = &omap4_idle_data[0];
+ 
+ /* Private functions */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 8254cc3..2a9d089 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -40,9 +40,19 @@ SRCREV = "c883f50c5bbf1bf5bfaeb550991caf5fc77a1c4d"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
+SRC_URI += "file://0001-ARM-config-omap-Sync-up-omap2plus-defconfig-with-sav.patch \
+            file://0002-ARM-config-omap-Make-advanced-networking-features-as.patch \
+            file://0003-ARM-config-omap-Disable-extra-debug-options.patch \
+            file://0005-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch \
+            file://0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch \
+            file://0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch \
+            "
+
+SRC_URI_append_ti33x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
+SRC_URI_append_ti43x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
-- 
1.8.3.2


