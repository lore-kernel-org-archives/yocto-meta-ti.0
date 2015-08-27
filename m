Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93CA7E00B56; Thu, 27 Aug 2015 12:45:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47CF7E00AD7
	for <meta-ti@yoctoproject.org>; Thu, 27 Aug 2015 12:45:16 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTR00B0EAU6FX40@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 27 Aug 2015 14:44:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=NDsDeTV9zZzQxE-W1IUA:9 a=sFKqdHlmlTfOLKA1:21
	a=0Sp5wIFLmIA8i8aU:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 64D9C161B79;	Thu,
	27 Aug 2015 15:44:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 27 Aug 2015 15:44:29 -0400
Message-id: <1440704669-21586-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux-ti-staging: bump rev, update J6/AM5 GFX patches to rev3
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
X-List-Received-Date: Thu, 27 Aug 2015 19:45:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...0001-DT-gpu-add-binding-for-TI-SGX-driver.patch | 25 ++++++-----
 ...dts-DRA7xx-add-device-tree-entry-for-SGX.patch} | 24 ++++++-----
 ...02-ARM-dts-DRA7xx-add-gpu-interface-clock.patch | 34 ---------------
 ...ch => 0003-arm-dra7xx-Add-gpu-hwmod-data.patch} | 48 ++++------------------
 ... => 0004-drm-omap-Add-omapdrm-plugin-API.patch} | 22 +++++-----
 recipes-kernel/linux/linux-ti-staging_4.1.bb       | 11 +++--
 6 files changed, 52 insertions(+), 112 deletions(-)
 rename recipes-kernel/linux/linux-ti-staging-4.1/{0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch => 0002-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch} (50%)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch
 rename recipes-kernel/linux/linux-ti-staging-4.1/{0004-arm-dra7xx-Add-gpu-hwmod-data.patch => 0003-arm-dra7xx-Add-gpu-hwmod-data.patch} (65%)
 rename recipes-kernel/linux/linux-ti-staging-4.1/{0005-drm-omap-Add-omapdrm-plugin-API.patch => 0004-drm-omap-Add-omapdrm-plugin-API.patch} (97%)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0001-DT-gpu-add-binding-for-TI-SGX-driver.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0001-DT-gpu-add-binding-for-TI-SGX-driver.patch
index d4ad985..e7cf88f 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0001-DT-gpu-add-binding-for-TI-SGX-driver.patch
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0001-DT-gpu-add-binding-for-TI-SGX-driver.patch
@@ -1,22 +1,22 @@
-From cab4b45daa65a79d24a4ae1345e2591986c7c73e Mon Sep 17 00:00:00 2001
+From 4b4e3b2f13798a581171abb09b400c033ece9211 Mon Sep 17 00:00:00 2001
 From: Anand Balagopalakrishnan <anandb@ti.com>
-Date: Sat, 15 Aug 2015 22:37:38 +0000
-Subject: [PATCH 1/5] DT: gpu: add binding for TI SGX driver
+Date: Wed, 26 Aug 2015 09:34:49 +0000
+Subject: [PATCH 1/4] DT: gpu: add binding for TI SGX driver
 
 This patch adds the devicetree binding for TI SGX device driver.
 
 Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
 ---
- Documentation/devicetree/bindings/gpu/ti-sgx.txt | 27 ++++++++++++++++++++++++
- 1 file changed, 27 insertions(+)
+ Documentation/devicetree/bindings/gpu/ti-sgx.txt | 30 ++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/gpu/ti-sgx.txt
 
 diff --git a/Documentation/devicetree/bindings/gpu/ti-sgx.txt b/Documentation/devicetree/bindings/gpu/ti-sgx.txt
 new file mode 100644
-index 0000000..a13e105
+index 0000000..6b7886a
 --- /dev/null
 +++ b/Documentation/devicetree/bindings/gpu/ti-sgx.txt
-@@ -0,0 +1,27 @@
+@@ -0,0 +1,30 @@
 +TI SGX 3D Graphics Accelerator
 +
 +Required properties:
@@ -30,19 +30,22 @@ index 0000000..a13e105
 + - reg: base address and length of the SGX registers
 + - interrupts : SGX interrupt number
 +
-+Recommended properties:
++Optional properties:
 + - ti,hwmods: Name of the hwmod associated with the SGX
 + - clocks : from SoC clock binding
 + - clock-names : names of clocks listed in clocks property in the same order
++ - reg-names : names of registers listed in reg property in same order
 +
 +Example:
 +	sgx@0x56000000 {
 +		compatible = "ti,dra7-sgx544", "img,sgx544";
-+		reg = <0x56000000 0x100000>;
++		reg = <0x5600fe00 0x200>;
++		reg-names = "gpu_wrapper";
 +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 +		ti,hwmods = "gpu";
-+		clocks = <&gpu_l3_iclk>, <&gpu_core_gclk_mux>, <&gpu_hyd_gclk_mux>;
-+		clock-names = "sys", "core", "hyd";
++		clocks = <&l3_iclk_div>, <&gpu_core_gclk_mux>,
++			 <&gpu_hyd_gclk_mux>;
++		clock-names = "gpu_iclk", "gpu_fclk1", "gpu_fclk2";
 +	};
 -- 
 2.2.0
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch
similarity index 50%
rename from recipes-kernel/linux/linux-ti-staging-4.1/0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch
rename to recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch
index df4dbc3..ac168c7 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch
@@ -1,30 +1,32 @@
-From e3ac183fe81a9bbd43a0f889253054d9311d5431 Mon Sep 17 00:00:00 2001
+From 20d10ea071c2b9eebb740f94f1fd0a7e4c9f7c03 Mon Sep 17 00:00:00 2001
 From: Anand Balagopalakrishnan <anandb@ti.com>
-Date: Sat, 15 Aug 2015 22:37:40 +0000
-Subject: [PATCH 3/5] ARM: dts: DRA7xx: add device tree entry for SGX
+Date: Wed, 26 Aug 2015 09:34:50 +0000
+Subject: [PATCH 2/4] ARM: dts: DRA7xx: add device tree entry for SGX
 
 Addition of SGX to DRA7xx DTS to enable graphics support.
 
 Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
 ---
- arch/arm/boot/dts/dra7.dtsi | 9 +++++++++
- 1 file changed, 9 insertions(+)
+ arch/arm/boot/dts/dra7.dtsi | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
 
 diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
-index e599b29..dd974f9 100644
+index ce10ce3..c117ed0 100644
 --- a/arch/arm/boot/dts/dra7.dtsi
 +++ b/arch/arm/boot/dts/dra7.dtsi
-@@ -889,6 +889,15 @@
+@@ -889,6 +889,17 @@
  			status = "disabled";
  		};
  
 +		sgx: sgx@0x56000000 {
-+			compatible = "ti,omap5-sgx544", "img,sgx544";
-+			reg = <0x56000000 0x100000>;
++			compatible = "ti,dra7-sgx544", "img,sgx544";
++			reg = <0x5600fe00 0x200>;
++			reg-names = "gpu_wrapper";
 +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 +			ti,hwmods = "gpu";
-+			clocks = <&gpu_l3_iclk>, <&gpu_core_gclk_mux>, <&gpu_hyd_gclk_mux>;
-+			clock-names = "sys", "core", "hyd";
++			clocks = <&l3_iclk_div>, <&gpu_core_gclk_mux>,
++				 <&gpu_hyd_gclk_mux>;
++			clock-names = "gpu_iclk", "gpu_fclk1", "gpu_fclk2";
 +		};
 +
  		i2c1: i2c@48070000 {
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch
deleted file mode 100644
index c4282cb..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f50b88d4be286d744361f7dadff0e6ae8ba107ff Mon Sep 17 00:00:00 2001
-From: Anand Balagopalakrishnan <anandb@ti.com>
-Date: Sat, 15 Aug 2015 22:37:39 +0000
-Subject: [PATCH 2/5] ARM: dts: DRA7xx: add gpu interface clock
-
-Addition of SGX interface sys clock to DRA7xx device tree.
-
-Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
----
- arch/arm/boot/dts/dra7xx-clocks.dtsi | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
-index bd11c46..c734f75 100644
---- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
-+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
-@@ -753,6 +753,14 @@
- 		ti,index-power-of-two;
- 	};
- 
-+	gpu_l3_iclk: gpu_l3_iclk {
-+		#clock-cells = <0>;
-+		compatible = "fixed-factor-clock";
-+		clocks = <&l3_iclk_div>;
-+		clock-mult = <1>;
-+		clock-div = <1>;
-+	};
-+
- 	l4_root_clk_div: l4_root_clk_div {
- 		#clock-cells = <0>;
- 		compatible = "fixed-factor-clock";
--- 
-2.2.0
-
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0004-arm-dra7xx-Add-gpu-hwmod-data.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0003-arm-dra7xx-Add-gpu-hwmod-data.patch
similarity index 65%
rename from recipes-kernel/linux/linux-ti-staging-4.1/0004-arm-dra7xx-Add-gpu-hwmod-data.patch
rename to recipes-kernel/linux/linux-ti-staging-4.1/0003-arm-dra7xx-Add-gpu-hwmod-data.patch
index 99b3473..57ee268 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0004-arm-dra7xx-Add-gpu-hwmod-data.patch
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0003-arm-dra7xx-Add-gpu-hwmod-data.patch
@@ -1,18 +1,19 @@
-From 738de270894a7a2296c612ced981634df641f093 Mon Sep 17 00:00:00 2001
+From cbfdfed432347a3c52cf1c62cba5141b540d8d09 Mon Sep 17 00:00:00 2001
 From: Hemant Hariyani <hemanthariyani@ti.com>
-Date: Sat, 15 Aug 2015 22:37:41 +0000
-Subject: [PATCH 4/5] arm:dra7xx: Add gpu hwmod data
+Date: Wed, 26 Aug 2015 09:34:51 +0000
+Subject: [PATCH 3/4] arm:dra7xx: Add gpu hwmod data
 
 GPU hwmod data for DRA7xx
 
 Signed-off-by: Hemant Hariyani <hemanthariyani@ti.com>
 Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
 ---
- arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 74 +++++++++++++++++++++++++++++++
- 1 file changed, 74 insertions(+)
+ arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 43 +++++++++++++++++++++++++++++++
+ 1 file changed, 43 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
-index 0641f03..e1cc927 100644
+index 0641f03..03982b7 100644
 --- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
 +++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
 @@ -1318,6 +1318,40 @@ static struct omap_hwmod dra7xx_gpmc_hwmod = {
@@ -56,53 +57,22 @@ index 0641f03..e1cc927 100644
   * 'hdq1w' class
   *
   */
-@@ -3686,6 +3720,45 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpmc = {
+@@ -3686,6 +3720,14 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpmc = {
  	.user		= OCP_USER_MPU | OCP_USER_SDMA,
  };
  
-+static struct omap_hwmod_addr_space dra7xx_gpu_addrs[] = {
-+	{
-+		.name           = "klio",
-+		.pa_start       = 0x56000000,
-+		.pa_end         = 0x56001fff,
-+	},
-+	{
-+		.name           = "hydra2",
-+		.pa_start       = 0x56004000,
-+		.pa_end         = 0x56004fff,
-+	},
-+	{
-+		.name           = "klio_0",
-+		.pa_start       = 0x56008000,
-+		.pa_end         = 0x56009fff,
-+	},
-+	{
-+		.name           = "klio_1",
-+		.pa_start       = 0x5600c000,
-+		.pa_end         = 0x5600dfff,
-+	},
-+	{
-+		.name           = "klio_hl",
-+		.pa_start       = 0x5600fe00,
-+		.pa_end         = 0x5600ffff,
-+		.flags          = ADDR_TYPE_RT
-+	},
-+	{ }
-+};
-+
 +/* l3_main_1 -> gpu */
 +static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpu = {
 +	.master         = &dra7xx_l3_main_1_hwmod,
 +	.slave          = &dra7xx_gpu_hwmod,
 +	.clk            = "l3_iclk_div",
-+	.addr           = dra7xx_gpu_addrs,
 +	.user           = OCP_USER_MPU | OCP_USER_SDMA,
 +};
 +
  static struct omap_hwmod_addr_space dra7xx_hdq1w_addrs[] = {
  	{
  		.pa_start	= 0x480b2000,
-@@ -4461,6 +4534,7 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
+@@ -4461,6 +4503,7 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
  	&dra7xx_l4_per1__gpio7,
  	&dra7xx_l4_per1__gpio8,
  	&dra7xx_l3_main_1__gpmc,
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/0005-drm-omap-Add-omapdrm-plugin-API.patch b/recipes-kernel/linux/linux-ti-staging-4.1/0004-drm-omap-Add-omapdrm-plugin-API.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti-staging-4.1/0005-drm-omap-Add-omapdrm-plugin-API.patch
rename to recipes-kernel/linux/linux-ti-staging-4.1/0004-drm-omap-Add-omapdrm-plugin-API.patch
index b458ecf..c89a49d 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.1/0005-drm-omap-Add-omapdrm-plugin-API.patch
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/0004-drm-omap-Add-omapdrm-plugin-API.patch
@@ -1,10 +1,9 @@
-From 7635957dc5dde6de6753fcadb1b4f6044f1d16fa Mon Sep 17 00:00:00 2001
+From a5ddaecfdf950bd47560ac0a9b1ca9e57afc0c2e Mon Sep 17 00:00:00 2001
 From: Rob Clark <rob@ti.com>
-Date: Sat, 15 Aug 2015 22:37:42 +0000
-Subject: [PATCH 5/5] drm/omap: Add omapdrm plugin API
+Date: Wed, 26 Aug 2015 09:34:52 +0000
+Subject: [PATCH 4/4] drm/omap: Add omapdrm plugin API
 
-This patch enables SGX driver to be added as a plugin to omapdrm. Plugins can
-be loaded/unloaded at runtime. Currently, only SGX registers as a plugin.
+This patch enables SGX driver to be added as a plugin to omapdrm.
 
 Main changes involved:
 
@@ -37,12 +36,12 @@ Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
 ---
  drivers/gpu/drm/omapdrm/omap_drv.c | 125 +++++++++++++++++++++++++++++++++++--
  drivers/gpu/drm/omapdrm/omap_drv.h |  60 ++++++++++++++++--
- drivers/gpu/drm/omapdrm/omap_gem.c |  89 ++++++++++++++++++++++++++
+ drivers/gpu/drm/omapdrm/omap_gem.c |  90 ++++++++++++++++++++++++++
  include/uapi/drm/omap_drm.h        |  10 +--
- 4 files changed, 269 insertions(+), 15 deletions(-)
+ 4 files changed, 270 insertions(+), 15 deletions(-)
 
 diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
-index ea537a5..1b0fb19 100644
+index ea537a5..00876c7 100644
 --- a/drivers/gpu/drm/omapdrm/omap_drv.c
 +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
 @@ -34,11 +34,20 @@
@@ -61,7 +60,7 @@ index ea537a5..1b0fb19 100644
 +/* keep track of whether we are already loaded.. we may need to call
 + * plugin's load() if they register after we are already loaded
 + */
-+static bool loaded = false;
++static bool loaded;
 +
  /*
   * mode config funcs
@@ -338,7 +337,7 @@ index 1f13c96..502d7b9 100644
 +
  #endif /* __OMAP_DRV_H__ */
 diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
-index f9ddbf5..49f5222 100644
+index f9ddbf5..8634fc6 100644
 --- a/drivers/gpu/drm/omapdrm/omap_gem.c
 +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
 @@ -117,6 +117,14 @@ struct omap_gem_object {
@@ -475,7 +474,7 @@ index f9ddbf5..49f5222 100644
  
  /* don't call directly.. called from GEM core when it is time to actually
   * free the object..
-@@ -1485,3 +1510,67 @@ void omap_gem_deinit(struct drm_device *dev)
+@@ -1485,3 +1510,68 @@ void omap_gem_deinit(struct drm_device *dev)
  	 */
  	kfree(usergart);
  }
@@ -500,6 +499,7 @@ index f9ddbf5..49f5222 100644
 +	obj = omap_gem_new(dev, gsize, flags | OMAP_BO_EXT_MEM);
 +	if (obj) {
 +		struct omap_gem_object *omap_obj = to_omap_bo(obj);
++
 +		omap_obj->paddr = paddr;
 +		omap_obj->pages = pages;
 +		omap_obj->ops = ops;
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 6ce53bb..dff9867 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -50,11 +50,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "77889ef34c567c94faf6ba7b39aa7c65a6f3e841"
+SRCREV = "4d8b97ba78fe68be2ce19008a6968a2aea0af8bb"
 PV = "4.1.6+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
@@ -72,9 +72,8 @@ SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
            "
 
 GFX_PATCHES = "file://0001-DT-gpu-add-binding-for-TI-SGX-driver.patch \
-            file://0002-ARM-dts-DRA7xx-add-gpu-interface-clock.patch \
-            file://0003-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch \
-            file://0004-arm-dra7xx-Add-gpu-hwmod-data.patch \
-            file://0005-drm-omap-Add-omapdrm-plugin-API.patch"
+            file://0002-ARM-dts-DRA7xx-add-device-tree-entry-for-SGX.patch \
+            file://0003-arm-dra7xx-Add-gpu-hwmod-data.patch \
+            file://0004-drm-omap-Add-omapdrm-plugin-API.patch"
 
 SRC_URI_append_dra7xx = " ${GFX_PATCHES}"
-- 
2.2.0


