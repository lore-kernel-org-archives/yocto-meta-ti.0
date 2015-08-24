Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A8F8E00BEC; Mon, 24 Aug 2015 10:50:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0344E00927
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 10:50:51 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTL00LI0LJPM650@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 24 Aug 2015 12:50:14 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=Mm_uttcNOKYYH6NvZf0A:9 a=2Y-nws-V89Dhvptd:21
	a=LPU6NZPCIQJ3_W7U:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 90F9B161BA9;	Mon,
	24 Aug 2015 13:50:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 24 Aug 2015 13:50:12 -0400
Message-id: <1440438612-7962-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux-ti-staging: bump rev, add interim GFX patches for J6/AM5
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
X-List-Received-Date: Mon, 24 Aug 2015 17:50:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...0001-DT-gpu-add-binding-for-TI-SGX-driver.patch |  49 ++
 ...02-ARM-dts-DRA7xx-add-gpu-interface-clock.patch |  34 ++
 ...-dts-DRA7xx-add-device-tree-entry-for-SGX.patch |  35 ++
 .../0004-arm-dra7xx-Add-gpu-hwmod-data.patch       | 115 ++++
 .../0005-drm-omap-Add-omapdrm-plugin-API.patch     | 585 +++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |  12 +-
 6 files changed, 828 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0001-DT-gpu-add-binding-for-TI-SGX-driver.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0004-arm-dra7xx-Add-gpu-hwmod-data.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0005-drm-omap-Add-omapdrm-plugin-API.patch

diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0001-DT-gpu-add-binding-for-TI-SGX-driver.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0001-DT-gpu-add-binding-for-TI-SGX-driver.patch
new file mode 100644
index 0000000..d4ad985
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0001-DT-gpu-add-binding-for-TI-SGX-driver.patch
@@ -0,0 +1,49 @@
+From cab4b45daa65a79d24a4ae1345e2591986c7c73e Mon Sep 17 00:00:00 2001
+From: Anand Balagopalakrishnan <anandb@ti.com>
+Date: Sat, 15 Aug 2015 22:37:38 +0000
+Subject: [PATCH 1/5] DT: gpu: add binding for TI SGX driver
+
+This patch adds the devicetree binding for TI SGX device driver.
+
+Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
+---
+ Documentation/devicetree/bindings/gpu/ti-sgx.txt | 27 ++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+ create mode 100644 Documentation/devicetree/bindings/gpu/ti-sgx.txt
+
+diff --git a/Documentation/devicetree/bindings/gpu/ti-sgx.txt b/Documentation/devicetree/bindings/gpu/ti-sgx.txt
+new file mode 100644
+index 0000000..a13e105
+--- /dev/null
++++ b/Documentation/devicetree/bindings/gpu/ti-sgx.txt
+@@ -0,0 +1,27 @@
++TI SGX 3D Graphics Accelerator
++
++Required properties:
++ - compatible : value should take the following format:
++	"ti,<soc>-<gpuversion>", "img,<gpuversion>"
++
++   accepted values:
++	(a) "ti,dra7-sgx544", "img,sgx544" for TI DRA7xx / AM57x
++	(b) "ti,am4-sgx530", "img,sgx530" for TI AM43x
++	(c) "ti,am3-sgx530", "img,sgx530" for TI AM33x
++ - reg: base address and length of the SGX registers
++ - interrupts : SGX interrupt number
++
++Recommended properties:
++ - ti,hwmods: Name of the hwmod associated with the SGX
++ - clocks : from SoC clock binding
++ - clock-names : names of clocks listed in clocks property in the same order
++
++Example:
++	sgx@0x56000000 {
++		compatible = "ti,dra7-sgx544", "img,sgx544";
++		reg = <0x56000000 0x100000>;
++		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
++		ti,hwmods = "gpu";
++		clocks = <&gpu_l3_iclk>, <&gpu_core_gclk_mux>, <&gpu_hyd_gclk_mux>;
++		clock-names = "sys", "core", "hyd";
++	};
+-- 
+2.2.0
+
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch
new file mode 100644
index 0000000..c4282cb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch
@@ -0,0 +1,34 @@
+From f50b88d4be286d744361f7dadff0e6ae8ba107ff Mon Sep 17 00:00:00 2001
+From: Anand Balagopalakrishnan <anandb@ti.com>
+Date: Sat, 15 Aug 2015 22:37:39 +0000
+Subject: [PATCH 2/5] ARM: dts: DRA7xx: add gpu interface clock
+
+Addition of SGX interface sys clock to DRA7xx device tree.
+
+Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
+---
+ arch/arm/boot/dts/dra7xx-clocks.dtsi | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
+index bd11c46..c734f75 100644
+--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
++++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
+@@ -753,6 +753,14 @@
+ 		ti,index-power-of-two;
+ 	};
+ 
++	gpu_l3_iclk: gpu_l3_iclk {
++		#clock-cells = <0>;
++		compatible = "fixed-factor-clock";
++		clocks = <&l3_iclk_div>;
++		clock-mult = <1>;
++		clock-div = <1>;
++	};
++
+ 	l4_root_clk_div: l4_root_clk_div {
+ 		#clock-cells = <0>;
+ 		compatible = "fixed-factor-clock";
+-- 
+2.2.0
+
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch
new file mode 100644
index 0000000..df4dbc3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch
@@ -0,0 +1,35 @@
+From e3ac183fe81a9bbd43a0f889253054d9311d5431 Mon Sep 17 00:00:00 2001
+From: Anand Balagopalakrishnan <anandb@ti.com>
+Date: Sat, 15 Aug 2015 22:37:40 +0000
+Subject: [PATCH 3/5] ARM: dts: DRA7xx: add device tree entry for SGX
+
+Addition of SGX to DRA7xx DTS to enable graphics support.
+
+Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
+---
+ arch/arm/boot/dts/dra7.dtsi | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
+index e599b29..dd974f9 100644
+--- a/arch/arm/boot/dts/dra7.dtsi
++++ b/arch/arm/boot/dts/dra7.dtsi
+@@ -889,6 +889,15 @@
+ 			status = "disabled";
+ 		};
+ 
++		sgx: sgx@0x56000000 {
++			compatible = "ti,omap5-sgx544", "img,sgx544";
++			reg = <0x56000000 0x100000>;
++			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
++			ti,hwmods = "gpu";
++			clocks = <&gpu_l3_iclk>, <&gpu_core_gclk_mux>, <&gpu_hyd_gclk_mux>;
++			clock-names = "sys", "core", "hyd";
++		};
++
+ 		i2c1: i2c@48070000 {
+ 			compatible = "ti,omap4-i2c";
+ 			reg = <0x48070000 0x100>;
+-- 
+2.2.0
+
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0004-arm-dra7xx-Add-gpu-hwmod-data.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0004-arm-dra7xx-Add-gpu-hwmod-data.patch
new file mode 100644
index 0000000..99b3473
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0004-arm-dra7xx-Add-gpu-hwmod-data.patch
@@ -0,0 +1,115 @@
+From 738de270894a7a2296c612ced981634df641f093 Mon Sep 17 00:00:00 2001
+From: Hemant Hariyani <hemanthariyani@ti.com>
+Date: Sat, 15 Aug 2015 22:37:41 +0000
+Subject: [PATCH 4/5] arm:dra7xx: Add gpu hwmod data
+
+GPU hwmod data for DRA7xx
+
+Signed-off-by: Hemant Hariyani <hemanthariyani@ti.com>
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 74 +++++++++++++++++++++++++++++++
+ 1 file changed, 74 insertions(+)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+index 0641f03..e1cc927 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+@@ -1318,6 +1318,40 @@ static struct omap_hwmod dra7xx_gpmc_hwmod = {
+ };
+ 
+ /*
++ * 'gpu' class
++ * 3d graphics accelerator
++ */
++
++static struct omap_hwmod_class_sysconfig dra7xx_gpu_sysc = {
++	.rev_offs       = 0x0000,
++	.sysc_offs      = 0x0010,
++	.sysc_flags     = (SYSC_HAS_MIDLEMODE | SYSC_HAS_SIDLEMODE),
++	.idlemodes      = (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
++			   SIDLE_SMART_WKUP | MSTANDBY_FORCE | MSTANDBY_NO |
++			   MSTANDBY_SMART | MSTANDBY_SMART_WKUP),
++	.sysc_fields    = &omap_hwmod_sysc_type2,
++};
++
++static struct omap_hwmod_class dra7xx_gpu_hwmod_class = {
++	.name   = "gpu",
++	.sysc   = &dra7xx_gpu_sysc,
++};
++
++static struct omap_hwmod dra7xx_gpu_hwmod = {
++	.name           = "gpu",
++	.class          = &dra7xx_gpu_hwmod_class,
++	.clkdm_name     = "gpu_clkdm",
++	.main_clk       = "gpu_core_gclk_mux",
++	.prcm = {
++		.omap4 = {
++			.clkctrl_offs = DRA7XX_CM_GPU_GPU_CLKCTRL_OFFSET,
++			.context_offs = DRA7XX_RM_GPU_GPU_CONTEXT_OFFSET,
++			.modulemode   = MODULEMODE_SWCTRL,
++		},
++	},
++};
++
++/*
+  * 'hdq1w' class
+  *
+  */
+@@ -3686,6 +3720,45 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpmc = {
+ 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
+ };
+ 
++static struct omap_hwmod_addr_space dra7xx_gpu_addrs[] = {
++	{
++		.name           = "klio",
++		.pa_start       = 0x56000000,
++		.pa_end         = 0x56001fff,
++	},
++	{
++		.name           = "hydra2",
++		.pa_start       = 0x56004000,
++		.pa_end         = 0x56004fff,
++	},
++	{
++		.name           = "klio_0",
++		.pa_start       = 0x56008000,
++		.pa_end         = 0x56009fff,
++	},
++	{
++		.name           = "klio_1",
++		.pa_start       = 0x5600c000,
++		.pa_end         = 0x5600dfff,
++	},
++	{
++		.name           = "klio_hl",
++		.pa_start       = 0x5600fe00,
++		.pa_end         = 0x5600ffff,
++		.flags          = ADDR_TYPE_RT
++	},
++	{ }
++};
++
++/* l3_main_1 -> gpu */
++static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpu = {
++	.master         = &dra7xx_l3_main_1_hwmod,
++	.slave          = &dra7xx_gpu_hwmod,
++	.clk            = "l3_iclk_div",
++	.addr           = dra7xx_gpu_addrs,
++	.user           = OCP_USER_MPU | OCP_USER_SDMA,
++};
++
+ static struct omap_hwmod_addr_space dra7xx_hdq1w_addrs[] = {
+ 	{
+ 		.pa_start	= 0x480b2000,
+@@ -4461,6 +4534,7 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
+ 	&dra7xx_l4_per1__gpio7,
+ 	&dra7xx_l4_per1__gpio8,
+ 	&dra7xx_l3_main_1__gpmc,
++	&dra7xx_l3_main_1__gpu,
+ 	&dra7xx_l4_per1__hdq1w,
+ 	&dra7xx_l4_per1__i2c1,
+ 	&dra7xx_l4_per1__i2c2,
+-- 
+2.2.0
+
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0005-drm-omap-Add-omapdrm-plugin-API.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0005-drm-omap-Add-omapdrm-plugin-API.patch
new file mode 100644
index 0000000..b458ecf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0005-drm-omap-Add-omapdrm-plugin-API.patch
@@ -0,0 +1,585 @@
+From 7635957dc5dde6de6753fcadb1b4f6044f1d16fa Mon Sep 17 00:00:00 2001
+From: Rob Clark <rob@ti.com>
+Date: Sat, 15 Aug 2015 22:37:42 +0000
+Subject: [PATCH 5/5] drm/omap: Add omapdrm plugin API
+
+This patch enables SGX driver to be added as a plugin to omapdrm. Plugins can
+be loaded/unloaded at runtime. Currently, only SGX registers as a plugin.
+
+Main changes involved:
+
+1. SGX specific GEM VM operations
+	SGX requires contiguous memory for both texture memory as well as
+	framebuffers. Memory allocation of FB is done through GEM and is
+	guaranteed to be contiguous.
+
+	Texture memory can be non-contiguous if:
+	a. user space allocates memory
+	b. memory is allocated by other cores
+	c. memory comes from CMA
+
+	We want to wrap such memory regions as GEM objects so that the graphics
+	pipeline remains consistent.
+
+2. Support for ioctls from plugin driver
+	SGX driver registers as a plugin to the omapdrm driver. During
+	registration, SGX specific ioctls are added to omapdrm. This allows
+	user space to control specific SGX feature sets using the DRM FD.
+
+3. Make GEM operations public
+	SGX driver needs to work directly on GEM objects for DSS
+	synchronization, getting Tiler address, etc.
+
+Signed-off-by: Rob Clark <rob@ti.com>
+Signed-off-by: Subhajit Paul <subhajit_paul@ti.com>
+Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
+Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
+---
+ drivers/gpu/drm/omapdrm/omap_drv.c | 125 +++++++++++++++++++++++++++++++++++--
+ drivers/gpu/drm/omapdrm/omap_drv.h |  60 ++++++++++++++++--
+ drivers/gpu/drm/omapdrm/omap_gem.c |  89 ++++++++++++++++++++++++++
+ include/uapi/drm/omap_drm.h        |  10 +--
+ 4 files changed, 269 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
+index ea537a5..1b0fb19 100644
+--- a/drivers/gpu/drm/omapdrm/omap_drv.c
++++ b/drivers/gpu/drm/omapdrm/omap_drv.c
+@@ -34,11 +34,20 @@
+ #define DRIVER_MINOR		0
+ #define DRIVER_PATCHLEVEL	0
+ 
++struct drm_device *drm_device;
++
+ static int num_crtc = CONFIG_DRM_OMAP_NUM_CRTCS;
+ 
+ MODULE_PARM_DESC(num_crtc, "Number of overlays to use as CRTCs");
+ module_param(num_crtc, int, 0600);
+ 
++static struct omap_drm_plugin *sgx_plugin;
++
++/* keep track of whether we are already loaded.. we may need to call
++ * plugin's load() if they register after we are already loaded
++ */
++static bool loaded = false;
++
+ /*
+  * mode config funcs
+  */
+@@ -615,6 +624,19 @@ static int ioctl_set_param(struct drm_device *dev, void *data,
+ 	return 0;
+ }
+ 
++static int ioctl_get_base(struct drm_device *dev, void *data,
++		struct drm_file *file_priv)
++{
++	struct drm_omap_get_base *args = data;
++
++	if (!sgx_plugin)
++		return -ENODEV;
++
++	args->ioctl_base = sgx_plugin->ioctl_base;
++
++	return 0;
++}
++
+ static int ioctl_gem_new(struct drm_device *dev, void *data,
+ 		struct drm_file *file_priv)
+ {
+@@ -693,9 +715,10 @@ static int ioctl_gem_info(struct drm_device *dev, void *data,
+ 	return ret;
+ }
+ 
+-static const struct drm_ioctl_desc ioctls[DRM_COMMAND_END - DRM_COMMAND_BASE] = {
++static struct drm_ioctl_desc ioctls[DRM_COMMAND_END - DRM_COMMAND_BASE] = {
+ 	DRM_IOCTL_DEF_DRV(OMAP_GET_PARAM, ioctl_get_param, DRM_UNLOCKED|DRM_AUTH),
+ 	DRM_IOCTL_DEF_DRV(OMAP_SET_PARAM, ioctl_set_param, DRM_UNLOCKED|DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
++	DRM_IOCTL_DEF_DRV(OMAP_GET_BASE, ioctl_get_base, DRM_UNLOCKED|DRM_AUTH),
+ 	DRM_IOCTL_DEF_DRV(OMAP_GEM_NEW, ioctl_gem_new, DRM_UNLOCKED|DRM_AUTH),
+ 	DRM_IOCTL_DEF_DRV(OMAP_GEM_CPU_PREP, ioctl_gem_cpu_prep, DRM_UNLOCKED|DRM_AUTH),
+ 	DRM_IOCTL_DEF_DRV(OMAP_GEM_CPU_FINI, ioctl_gem_cpu_fini, DRM_UNLOCKED|DRM_AUTH),
+@@ -725,6 +748,8 @@ static int dev_load(struct drm_device *dev, unsigned long flags)
+ 
+ 	DBG("load: dev=%p", dev);
+ 
++	drm_device = dev;
++
+ 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+ 	if (!priv)
+ 		return -ENOMEM;
+@@ -770,6 +795,11 @@ static int dev_load(struct drm_device *dev, unsigned long flags)
+ 
+ 	drm_kms_helper_poll_init(dev);
+ 
++	loaded = true;
++
++	if (sgx_plugin)
++		sgx_plugin->load(dev, flags);
++
+ 	return 0;
+ }
+ 
+@@ -779,6 +809,9 @@ static int dev_unload(struct drm_device *dev)
+ 
+ 	DBG("unload: dev=%p", dev);
+ 
++	if (sgx_plugin)
++		sgx_plugin->unload(dev);
++
+ 	drm_kms_helper_poll_fini(dev);
+ 
+ 	if (priv->fbdev)
+@@ -797,15 +830,18 @@ static int dev_unload(struct drm_device *dev)
+ 
+ 	dev_set_drvdata(dev->dev, NULL);
+ 
++	loaded = false;
++
+ 	return 0;
+ }
+ 
+ static int dev_open(struct drm_device *dev, struct drm_file *file)
+ {
+-	file->driver_priv = NULL;
+-
+ 	DBG("open: dev=%p, file=%p", dev, file);
+ 
++	if (sgx_plugin)
++		sgx_plugin->open(dev, file);
++
+ 	return 0;
+ }
+ 
+@@ -862,6 +898,9 @@ static void dev_preclose(struct drm_device *dev, struct drm_file *file)
+ 
+ 	DBG("preclose: dev=%p", dev);
+ 
++	if (sgx_plugin)
++		sgx_plugin->release(dev, file);
++
+ 	/*
+ 	 * Unlink all pending CRTC events to make sure they won't be queued up
+ 	 * by a pending asynchronous commit.
+@@ -874,6 +913,8 @@ static void dev_preclose(struct drm_device *dev, struct drm_file *file)
+ 		}
+ 	}
+ 	spin_unlock_irqrestore(&dev->event_lock, flags);
++
++	kfree(file->driver_priv);
+ }
+ 
+ static void dev_postclose(struct drm_device *dev, struct drm_file *file)
+@@ -883,8 +924,8 @@ static void dev_postclose(struct drm_device *dev, struct drm_file *file)
+ 
+ static const struct vm_operations_struct omap_gem_vm_ops = {
+ 	.fault = omap_gem_fault,
+-	.open = drm_gem_vm_open,
+-	.close = drm_gem_vm_close,
++	.open = omap_gem_vm_open,
++	.close = omap_gem_vm_close,
+ };
+ 
+ static const struct file_operations omapdriver_fops = {
+@@ -934,6 +975,80 @@ static struct drm_driver omap_drm_driver = {
+ 	.patchlevel = DRIVER_PATCHLEVEL,
+ };
+ 
++int omap_drm_register_plugin(struct omap_drm_plugin *plugin)
++{
++	struct drm_device *dev = drm_device;
++	int i;
++
++	DBG("register plugin: %p (%s)", plugin, plugin->name);
++
++	if (sgx_plugin)
++		return -EBUSY;
++
++	for (i = 0; i < plugin->num_ioctls; i++) {
++		int nr = i + DRM_OMAP_NUM_IOCTLS;
++
++		/* check for out of bounds ioctl or already registered ioctl */
++		if (nr > ARRAY_SIZE(ioctls) || ioctls[nr].func) {
++			dev_err(dev->dev, "invalid ioctl: %d (nr=%d)\n", i, nr);
++			return -EINVAL;
++		}
++	}
++
++	plugin->ioctl_base = DRM_OMAP_NUM_IOCTLS;
++
++	/* register the plugin's ioctl's */
++	for (i = 0; i < plugin->num_ioctls; i++) {
++		int nr = i + DRM_OMAP_NUM_IOCTLS;
++
++		DBG("register ioctl: %d %08x", nr, plugin->ioctls[i].cmd);
++
++		ioctls[nr] = plugin->ioctls[i];
++	}
++
++	omap_drm_driver.num_ioctls = DRM_OMAP_NUM_IOCTLS + plugin->num_ioctls;
++
++	sgx_plugin = plugin;
++
++	if (loaded)
++		plugin->load(dev, 0);
++
++	return 0;
++}
++EXPORT_SYMBOL(omap_drm_register_plugin);
++
++int omap_drm_unregister_plugin(struct omap_drm_plugin *plugin)
++{
++	int i;
++
++	for (i = 0; i < plugin->num_ioctls; i++) {
++		const struct drm_ioctl_desc empty = { 0 };
++		int nr = i + DRM_OMAP_NUM_IOCTLS;
++
++		ioctls[nr] = empty;
++	}
++
++	omap_drm_driver.num_ioctls = DRM_OMAP_NUM_IOCTLS;
++
++	sgx_plugin = NULL;
++
++	return 0;
++}
++EXPORT_SYMBOL(omap_drm_unregister_plugin);
++
++void *omap_drm_file_priv(struct drm_file *file)
++{
++	return file->driver_priv;
++}
++EXPORT_SYMBOL(omap_drm_file_priv);
++
++void omap_drm_file_set_priv(struct drm_file *file, void *priv)
++{
++	file->driver_priv = priv;
++}
++EXPORT_SYMBOL(omap_drm_file_set_priv);
++
++
+ static int pdev_probe(struct platform_device *device)
+ {
+ 	int r;
+diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
+index 1f13c96..502d7b9 100644
+--- a/drivers/gpu/drm/omapdrm/omap_drv.h
++++ b/drivers/gpu/drm/omapdrm/omap_drv.h
+@@ -36,12 +36,6 @@
+ 
+ #define MODULE_NAME     "omapdrm"
+ 
+-/* max # of mapper-id's that can be assigned.. todo, come up with a better
+- * (but still inexpensive) way to store/access per-buffer mapper private
+- * data..
+- */
+-#define MAX_MAPPERS 2
+-
+ /* parameters which describe (unrotated) coordinates of scanout within a fb: */
+ struct omap_drm_window {
+ 	uint32_t rotation;
+@@ -276,4 +270,58 @@ fail:
+ 	return -ENOENT;
+ }
+ 
++/****** PLUGIN API specific ******/
++
++/* interface that plug-in drivers (for now just PVR) can implement */
++struct omap_drm_plugin {
++	const char *name;
++
++	/* drm functions */
++	int (*load)(struct drm_device *dev, unsigned long flags);
++	int (*unload)(struct drm_device *dev);
++	int (*open)(struct drm_device *dev, struct drm_file *file);
++	int (*release)(struct drm_device *dev, struct drm_file *file);
++
++	struct drm_ioctl_desc *ioctls;
++	int num_ioctls;
++	int ioctl_base;
++};
++
++int omap_drm_register_plugin(struct omap_drm_plugin *plugin);
++int omap_drm_unregister_plugin(struct omap_drm_plugin *plugin);
++
++void *omap_drm_file_priv(struct drm_file *file);
++void omap_drm_file_set_priv(struct drm_file *file, void *priv);
++
++void *omap_gem_priv(struct drm_gem_object *obj);
++void omap_gem_set_priv(struct drm_gem_object *obj, void *priv);
++void omap_gem_vm_open(struct vm_area_struct *vma);
++void omap_gem_vm_close(struct vm_area_struct *vma);
++
++/* for external plugin buffers wrapped as GEM object (via. omap_gem_new_ext())
++ * a vm_ops struct can be provided to get callback notification of various
++ * events..
++ */
++struct omap_gem_vm_ops {
++	void (*open)(struct vm_area_struct *area);
++	void (*close)(struct vm_area_struct *area);
++	/*maybe: int (*fault)(struct vm_area_struct *vma,
++	  struct vm_fault *vmf)*/
++
++	/* note: mmap isn't expected to do anything. it is just to allow buffer
++	 * allocate to update it's own internal state
++	 */
++	void (*mmap)(struct file *, struct vm_area_struct *);
++};
++
++struct drm_gem_object *omap_gem_new_ext(struct drm_device *dev,
++		union omap_gem_size gsize, uint32_t flags,
++		dma_addr_t paddr, struct page **pages,
++		struct omap_gem_vm_ops *ops);
++
++void omap_gem_op_update(void);
++int omap_gem_set_sync_object(struct drm_gem_object *obj, void *syncobj);
++/*********************************/
++
++
+ #endif /* __OMAP_DRV_H__ */
+diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
+index f9ddbf5..49f5222 100644
+--- a/drivers/gpu/drm/omapdrm/omap_gem.c
++++ b/drivers/gpu/drm/omapdrm/omap_gem.c
+@@ -117,6 +117,14 @@ struct omap_gem_object {
+ 		uint32_t read_pending;
+ 		uint32_t read_complete;
+ 	} *sync;
++
++	struct omap_gem_vm_ops *ops;
++
++	/**
++	 * per-mapper private data..
++	 */
++	void *priv;
++
+ };
+ 
+ static int get_pages(struct drm_gem_object *obj, struct page ***pages);
+@@ -300,6 +308,7 @@ uint32_t omap_gem_flags(struct drm_gem_object *obj)
+ {
+ 	return to_omap_bo(obj)->flags;
+ }
++EXPORT_SYMBOL(omap_gem_flags);
+ 
+ /** get mmap offset */
+ static uint64_t mmap_offset(struct drm_gem_object *obj)
+@@ -329,6 +338,7 @@ uint64_t omap_gem_mmap_offset(struct drm_gem_object *obj)
+ 	mutex_unlock(&obj->dev->struct_mutex);
+ 	return offset;
+ }
++EXPORT_SYMBOL(omap_gem_mmap_offset);
+ 
+ /** get mmap size */
+ size_t omap_gem_mmap_size(struct drm_gem_object *obj)
+@@ -361,6 +371,7 @@ int omap_gem_tiled_size(struct drm_gem_object *obj, uint16_t *w, uint16_t *h)
+ 	}
+ 	return -EINVAL;
+ }
++EXPORT_SYMBOL(omap_gem_tiled_size);
+ 
+ /* Normal handling for the case of faulting in non-tiled buffers */
+ static int fault_1d(struct drm_gem_object *obj,
+@@ -593,6 +604,9 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
+ 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+ 	}
+ 
++	if (omap_obj->ops && omap_obj->ops->mmap)
++		omap_obj->ops->mmap(obj->filp, vma);
++
+ 	return 0;
+ }
+ 
+@@ -804,6 +818,7 @@ fail:
+ 
+ 	return ret;
+ }
++EXPORT_SYMBOL(omap_gem_get_paddr);
+ 
+ /* Release physical address, when DMA is no longer being performed.. this
+  * could potentially unpin and unmap buffers from TILER
+@@ -834,6 +849,7 @@ void omap_gem_put_paddr(struct drm_gem_object *obj)
+ 
+ 	mutex_unlock(&obj->dev->struct_mutex);
+ }
++EXPORT_SYMBOL(omap_gem_put_paddr);
+ 
+ /* Get rotated scanout address (only valid if already pinned), at the
+  * specified orientation and x,y offset from top-left corner of buffer
+@@ -864,6 +880,7 @@ int omap_gem_tiled_stride(struct drm_gem_object *obj, uint32_t orient)
+ 		ret = tiler_stride(gem2fmt(omap_obj->flags), orient);
+ 	return ret;
+ }
++EXPORT_SYMBOL(omap_gem_tiled_stride);
+ 
+ /* acquire pages when needed (for example, for DMA where physically
+  * contiguous buffer is not required
+@@ -913,6 +930,7 @@ int omap_gem_get_pages(struct drm_gem_object *obj, struct page ***pages,
+ 	mutex_unlock(&obj->dev->struct_mutex);
+ 	return ret;
+ }
++EXPORT_SYMBOL(omap_gem_get_pages);
+ 
+ /* release pages when DMA no longer being performed */
+ int omap_gem_put_pages(struct drm_gem_object *obj)
+@@ -923,6 +941,7 @@ int omap_gem_put_pages(struct drm_gem_object *obj)
+ 	 */
+ 	return 0;
+ }
++EXPORT_SYMBOL(omap_gem_put_pages);
+ 
+ /* Get kernel virtual address for CPU access.. this more or less only
+  * exists for omap_fbdev.  This should be called with struct_mutex
+@@ -1118,17 +1137,20 @@ void omap_gem_op_update(void)
+ 	sync_op_update();
+ 	spin_unlock(&sync_lock);
+ }
++EXPORT_SYMBOL(omap_gem_op_update);
+ 
+ /* mark the start of read and/or write operation */
+ int omap_gem_op_start(struct drm_gem_object *obj, enum omap_gem_op op)
+ {
+ 	return sync_op(obj, op, true);
+ }
++EXPORT_SYMBOL(omap_gem_op_start);
+ 
+ int omap_gem_op_finish(struct drm_gem_object *obj, enum omap_gem_op op)
+ {
+ 	return sync_op(obj, op, false);
+ }
++EXPORT_SYMBOL(omap_gem_op_finish);
+ 
+ static DECLARE_WAIT_QUEUE_HEAD(sync_event);
+ 
+@@ -1181,6 +1203,7 @@ int omap_gem_op_sync(struct drm_gem_object *obj, enum omap_gem_op op)
+ 	}
+ 	return ret;
+ }
++EXPORT_SYMBOL(omap_gem_op_sync);
+ 
+ /* call fxn(arg), either synchronously or asynchronously if the op
+  * is currently blocked..  fxn() can be called from any context
+@@ -1227,6 +1250,7 @@ int omap_gem_op_async(struct drm_gem_object *obj, enum omap_gem_op op,
+ 
+ 	return 0;
+ }
++EXPORT_SYMBOL(omap_gem_op_async);
+ 
+ /* special API so PVR can update the buffer to use a sync-object allocated
+  * from it's sync-obj heap.  Only used for a newly allocated (from PVR's
+@@ -1264,6 +1288,7 @@ unlock:
+ 	spin_unlock(&sync_lock);
+ 	return ret;
+ }
++EXPORT_SYMBOL(omap_gem_set_sync_object);
+ 
+ /* don't call directly.. called from GEM core when it is time to actually
+  * free the object..
+@@ -1485,3 +1510,67 @@ void omap_gem_deinit(struct drm_device *dev)
+ 	 */
+ 	kfree(usergart);
+ }
++
++/****** PLUGIN API specific ******/
++
++/* This constructor is mainly to give plugins a way to wrap their
++ * own allocations
++ */
++struct drm_gem_object *omap_gem_new_ext(struct drm_device *dev,
++		union omap_gem_size gsize, uint32_t flags,
++		dma_addr_t paddr, struct page **pages,
++		struct omap_gem_vm_ops *ops)
++{
++	struct drm_gem_object *obj;
++
++	BUG_ON((flags & OMAP_BO_TILED) && !pages);
++
++	if (paddr)
++		flags |= OMAP_BO_DMA;
++
++	obj = omap_gem_new(dev, gsize, flags | OMAP_BO_EXT_MEM);
++	if (obj) {
++		struct omap_gem_object *omap_obj = to_omap_bo(obj);
++		omap_obj->paddr = paddr;
++		omap_obj->pages = pages;
++		omap_obj->ops = ops;
++	}
++	return obj;
++}
++EXPORT_SYMBOL(omap_gem_new_ext);
++
++void omap_gem_vm_open(struct vm_area_struct *vma)
++{
++	struct drm_gem_object *obj = vma->vm_private_data;
++	struct omap_gem_object *omap_obj = to_omap_bo(obj);
++
++	if (omap_obj->ops && omap_obj->ops->open)
++		omap_obj->ops->open(vma);
++	else
++		drm_gem_vm_open(vma);
++
++}
++
++void omap_gem_vm_close(struct vm_area_struct *vma)
++{
++	struct drm_gem_object *obj = vma->vm_private_data;
++	struct omap_gem_object *omap_obj = to_omap_bo(obj);
++
++	if (omap_obj->ops && omap_obj->ops->close)
++		omap_obj->ops->close(vma);
++	else
++		drm_gem_vm_close(vma);
++
++}
++
++void *omap_gem_priv(struct drm_gem_object *obj)
++{
++	return to_omap_bo(obj)->priv;
++}
++EXPORT_SYMBOL(omap_gem_priv);
++
++void omap_gem_set_priv(struct drm_gem_object *obj, void *priv)
++{
++	to_omap_bo(obj)->priv = priv;
++}
++EXPORT_SYMBOL(omap_gem_set_priv);
+diff --git a/include/uapi/drm/omap_drm.h b/include/uapi/drm/omap_drm.h
+index 1d0b117..5292b93 100644
+--- a/include/uapi/drm/omap_drm.h
++++ b/include/uapi/drm/omap_drm.h
+@@ -33,6 +33,12 @@ struct drm_omap_param {
+ 	uint64_t value;			/* in (set_param), out (get_param) */
+ };
+ 
++struct drm_omap_get_base {
++	char plugin_name[64];           /* in */
++	uint32_t ioctl_base;            /* out */
++	uint32_t __pad;
++};
++
+ #define OMAP_BO_SCANOUT		0x00000001	/* scanout capable (phys contiguous) */
+ #define OMAP_BO_CACHE_MASK	0x00000006	/* cache type mask, see cache modes */
+ #define OMAP_BO_TILED_MASK	0x00000f00	/* tiled mapping mask, see tiled modes */
+@@ -101,9 +107,7 @@ struct drm_omap_gem_info {
+ 
+ #define DRM_OMAP_GET_PARAM		0x00
+ #define DRM_OMAP_SET_PARAM		0x01
+-/* placeholder for plugin-api
+ #define DRM_OMAP_GET_BASE		0x02
+-*/
+ #define DRM_OMAP_GEM_NEW		0x03
+ #define DRM_OMAP_GEM_CPU_PREP		0x04
+ #define DRM_OMAP_GEM_CPU_FINI		0x05
+@@ -112,9 +116,7 @@ struct drm_omap_gem_info {
+ 
+ #define DRM_IOCTL_OMAP_GET_PARAM	DRM_IOWR(DRM_COMMAND_BASE + DRM_OMAP_GET_PARAM, struct drm_omap_param)
+ #define DRM_IOCTL_OMAP_SET_PARAM	DRM_IOW (DRM_COMMAND_BASE + DRM_OMAP_SET_PARAM, struct drm_omap_param)
+-/* placeholder for plugin-api
+ #define DRM_IOCTL_OMAP_GET_BASE		DRM_IOWR(DRM_COMMAND_BASE + DRM_OMAP_GET_BASE, struct drm_omap_get_base)
+-*/
+ #define DRM_IOCTL_OMAP_GEM_NEW		DRM_IOWR(DRM_COMMAND_BASE + DRM_OMAP_GEM_NEW, struct drm_omap_gem_new)
+ #define DRM_IOCTL_OMAP_GEM_CPU_PREP	DRM_IOW (DRM_COMMAND_BASE + DRM_OMAP_GEM_CPU_PREP, struct drm_omap_gem_cpu_prep)
+ #define DRM_IOCTL_OMAP_GEM_CPU_FINI	DRM_IOW (DRM_COMMAND_BASE + DRM_OMAP_GEM_CPU_FINI, struct drm_omap_gem_cpu_fini)
+-- 
+2.2.0
+
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index ec2d1bd..6ce53bb 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -50,11 +50,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "e8f07af182399ef8f7fc331918163e11ee9a5870"
+SRCREV = "77889ef34c567c94faf6ba7b39aa7c65a6f3e841"
 PV = "4.1.6+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
@@ -70,3 +70,11 @@ KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig \
            "
+
+GFX_PATCHES = "file://0001-DT-gpu-add-binding-for-TI-SGX-driver.patch \
+            file://0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch \
+            file://0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch \
+            file://0004-arm-dra7xx-Add-gpu-hwmod-data.patch \
+            file://0005-drm-omap-Add-omapdrm-plugin-API.patch"
+
+SRC_URI_append_dra7xx = " ${GFX_PATCHES}"
-- 
2.2.0


