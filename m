Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEA77E007DD
	for <meta-ti@yoctoproject.org>; Fri, 14 Feb 2014 13:53:44 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1000ITPA46I120@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 14 Feb 2014 15:53:09 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F405A200BE; Fri,
	14 Feb 2014 16:52:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 14 Feb 2014 16:52:53 -0500
Message-id: <1392414773-13517-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: update with v2 of LCD resume fixes
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
X-List-Received-Date: Fri, 14 Feb 2014 21:53:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...2-am43xx-Add-context-offset-for-dss-hwmod.patch |   44 -----------
 ...RM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch |   42 ++++++++++
 ...map_hwmod-Add-context-ops-to-am43xx-soc_o.patch |   36 ---------
 ...p_hwmod-Add-context-ops-to-am43xx-soc_ops.patch |   81 ++++++++++++++++++++
 ...2-am43xx-Add-context-offset-for-dss-hwmod.patch |   44 +++++++++++
 ..._hwmod-Maintain-legacy-context-loss-count.patch |   65 ++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |   14 +++-
 7 files changed, 242 insertions(+), 84 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0003-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0004-ARM-OMAP2-omap_hwmod-Maintain-legacy-context-loss-count.patch

diff --git a/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch b/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
deleted file mode 100644
index 52594a1..0000000
--- a/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 52502d8e52ecd82cd802ee6900942d041f9a79ef Mon Sep 17 00:00:00 2001
-From: Dave Gerlach <d-gerlach@ti.com>
-Date: Wed, 12 Feb 2014 16:06:46 -0600
-Subject: [PATCH 1/2] ARM: OMAP2+: am43xx: Add context offset for dss hwmod
-
-Add context_offs to the DSS hwmod for am43xx as the driver uses the
-context loss count to determine whether or not to restore context to the
-module. Without this the display does not return after a suspend cycle.
-
-Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
----
- arch/arm/mach-omap2/omap_hwmod_33xx_data.c |    1 +
- arch/arm/mach-omap2/prcm43xx.h             |    3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
-index 978356d..4dcdcef 100644
---- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
-+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
-@@ -1921,6 +1921,7 @@ static struct omap_hwmod am43xx_dss_core_hwmod = {
- 	.prcm = {
- 		.omap4 = {
- 			.clkctrl_offs = AM43XX_CM_PER_DSS_CLKCTRL_OFFSET,
-+			.context_offs = AM43XX_PRM_RM_PER_DSS_CONTEXT,
- 			.modulemode   = MODULEMODE_SWCTRL,
- 		},
- 	},
-diff --git a/arch/arm/mach-omap2/prcm43xx.h b/arch/arm/mach-omap2/prcm43xx.h
-index f5344ab..d804228 100644
---- a/arch/arm/mach-omap2/prcm43xx.h
-+++ b/arch/arm/mach-omap2/prcm43xx.h
-@@ -25,6 +25,9 @@
- #define AM43XX_PRM_WKUP_INST				0x2000
- #define AM43XX_PRM_DEVICE_INST				0x4000
- 
-+/* PRM.PRM_PER offsets */
-+#define AM43XX_PRM_RM_PER_DSS_CONTEXT			0x1224
-+
- /* RM RSTCTRL offsets */
- #define AM43XX_RM_PER_RSTCTRL_OFFSET			0x0010
- #define AM43XX_RM_GFX_RSTCTRL_OFFSET			0x0010
--- 
-1.7.9.5
-
diff --git a/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch b/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch
new file mode 100644
index 0000000..00dceaf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch
@@ -0,0 +1,42 @@
+Subject: [v2,1/3] ARM: OMAP2+: am43xx: Use omap4 prm context ops
+Date: Sat, 15 Feb 2014 02:07:33 -0000
+From: Dave Gerlach <d-gerlach@ti.com>
+
+Context loss counting relies on several prm function pointers that
+serve as a "mapping" into the context loss registers and actually
+allow reading and clearing of the registers. Use the same
+from omap4 for am43xx as the layout of the prcm is similar.
+
+Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
+
+---
+arch/arm/mach-omap2/io.c      |    1 +
+ arch/arm/mach-omap2/prm44xx.c |    3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-omap2/io.c b/arch/arm/mach-omap2/io.c
+index 295e3e6..3eb9ae5 100644
+--- a/arch/arm/mach-omap2/io.c
++++ b/arch/arm/mach-omap2/io.c
+@@ -619,6 +619,7 @@ void __init am43xx_init_early(void)
+ 	omap_prm_base_init();
+ 	omap_cm_base_init();
+ 	omap3xxx_check_revision();
++	omap44xx_prm_init();
+ 	am33xx_check_features();
+ 	am43xx_powerdomains_init();
+ 	am43xx_clockdomains_init();
+diff --git a/arch/arm/mach-omap2/prm44xx.c b/arch/arm/mach-omap2/prm44xx.c
+index 03a6034..2c97e53 100644
+--- a/arch/arm/mach-omap2/prm44xx.c
++++ b/arch/arm/mach-omap2/prm44xx.c
+@@ -660,7 +660,8 @@ static struct prm_ll_data omap44xx_prm_ll_data = {
+ 
+ int __init omap44xx_prm_init(void)
+ {
+-	if (!cpu_is_omap44xx() && !soc_is_omap54xx() && !soc_is_dra7xx())
++	if (!soc_is_am43xx() && !cpu_is_omap44xx() &&
++				!soc_is_omap54xx() && !soc_is_dra7xx())
+ 		return 0;
+ 
+ 	return prm_register(&omap44xx_prm_ll_data);
diff --git a/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch b/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch
deleted file mode 100644
index 0258142..0000000
--- a/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8ec77cd15997749f51912e75bd47fad032cd3afe Mon Sep 17 00:00:00 2001
-From: Dave Gerlach <d-gerlach@ti.com>
-Date: Wed, 12 Feb 2014 16:05:30 -0600
-Subject: [PATCH 2/2] ARM: OMAP2+: omap_hwmod: Add context ops to am43xx
- soc_ops
-
-AM43XX contains PRM_*_CONTEXT registers like OMAP4 did to track loss
-of context in modules so utilize the same soc_ops present for OMAP4.
-
-Certain drivers use the context loss count to determine if context was
-truly lost during a suspend operation to decide whether or not a
-context restore is truly necessary. Without this, some drivers may
-choose not to restore context when they have actually lost it and fail
-to properly resume.
-
-Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
----
- arch/arm/mach-omap2/omap_hwmod.c |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
-index 1f766fd..c03c54d 100644
---- a/arch/arm/mach-omap2/omap_hwmod.c
-+++ b/arch/arm/mach-omap2/omap_hwmod.c
-@@ -4296,6 +4296,8 @@ void __init omap_hwmod_init(void)
- 		soc_ops.deassert_hardreset = _omap4_deassert_hardreset;
- 		soc_ops.is_hardreset_asserted = _omap4_is_hardreset_asserted;
- 		soc_ops.init_clkdm = _init_clkdm;
-+		soc_ops.update_context_lost = _omap4_update_context_lost;
-+		soc_ops.get_context_lost = _omap4_get_context_lost;
- 	} else if (soc_is_am33xx()) {
- 		soc_ops.enable_module = _am33xx_enable_module;
- 		soc_ops.disable_module = _am33xx_disable_module;
--- 
-1.7.9.5
-
diff --git a/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch b/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch
new file mode 100644
index 0000000..246595f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch
@@ -0,0 +1,81 @@
+Subject: [v2,2/3] ARM: OMAP2+: omap_hwmod: Add context ops to am43xx soc_ops
+Date: Sat, 15 Feb 2014 02:07:34 -0000
+From: Dave Gerlach <d-gerlach@ti.com>
+
+AM43XX contains PRM_*_CONTEXT registers like OMAP4 did to track loss
+of context in modules so utilize the same get_context_loss_count soc_op
+present for OMAP4 but define a custom update context loss function for
+am43xx. Because we do not define context_offs for each hwmod, introduce
+a new flag to indicate when we have so we only bother to update when
+we know that it is valid.
+
+Certain drivers use the context loss count to determine if context was
+truly lost during a suspend operation to decide whether or not a
+context restore is truly necessary. Without this, some drivers may
+choose not to restore context when they have actually lost it and fail
+to properly resume.
+
+Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
+
+---
+arch/arm/mach-omap2/omap_hwmod.c |   27 +++++++++++++++++++++++++++
+ arch/arm/mach-omap2/omap_hwmod.h |    1 +
+ 2 files changed, 28 insertions(+)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
+index 1f766fd..ad98b7f 100644
+--- a/arch/arm/mach-omap2/omap_hwmod.c
++++ b/arch/arm/mach-omap2/omap_hwmod.c
+@@ -2165,6 +2165,31 @@ static void _omap4_update_context_lost(struct omap_hwmod *oh)
+ }
+ 
+ /**
++ * _am437x_update_context_lost - increment hwmod context loss counter if
++ * hwmod context was lost, and clear hardware context loss reg
++ * @oh: hwmod to check for context loss
++ *
++ * If the PRCM indicates that the hwmod @oh lost context, increment
++ * our in-memory context loss counter, and clear the RM_*_CONTEXT
++ * bits. No return value.
++ */
++static void _am437x_update_context_lost(struct omap_hwmod *oh)
++{
++	if (!(oh->prcm.omap4.flags & HWMOD_AM437X_HAS_CONTEXT_LOSS_BIT))
++		return;
++
++	if (!prm_was_any_context_lost_old(oh->clkdm->pwrdm.ptr->prcm_partition,
++					  oh->clkdm->pwrdm.ptr->prcm_offs,
++					  oh->prcm.omap4.context_offs))
++		return;
++
++	oh->prcm.omap4.context_lost_counter++;
++	prm_clear_context_loss_flags_old(oh->clkdm->pwrdm.ptr->prcm_partition,
++					 oh->clkdm->pwrdm.ptr->prcm_offs,
++					 oh->prcm.omap4.context_offs);
++}
++
++/**
+  * _omap4_get_context_lost - get context loss counter for a hwmod
+  * @oh: hwmod to get context loss counter for
+  *
+@@ -4296,6 +4321,8 @@ void __init omap_hwmod_init(void)
+ 		soc_ops.deassert_hardreset = _omap4_deassert_hardreset;
+ 		soc_ops.is_hardreset_asserted = _omap4_is_hardreset_asserted;
+ 		soc_ops.init_clkdm = _init_clkdm;
++		soc_ops.update_context_lost = _am437x_update_context_lost;
++		soc_ops.get_context_lost = _omap4_get_context_lost;
+ 	} else if (soc_is_am33xx()) {
+ 		soc_ops.enable_module = _am33xx_enable_module;
+ 		soc_ops.disable_module = _am33xx_disable_module;
+diff --git a/arch/arm/mach-omap2/omap_hwmod.h b/arch/arm/mach-omap2/omap_hwmod.h
+index f16afc6..dad6b2d 100644
+--- a/arch/arm/mach-omap2/omap_hwmod.h
++++ b/arch/arm/mach-omap2/omap_hwmod.h
+@@ -450,6 +450,7 @@ struct omap_hwmod_omap2_prcm {
+  *     flag bit should be set in those cases
+  */
+ #define HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT		(1 << 0)
++#define HWMOD_AM437X_HAS_CONTEXT_LOSS_BIT		(1 << 1)
+ 
+ /**
+  * struct omap_hwmod_omap4_prcm - OMAP4-specific PRCM data
diff --git a/recipes-kernel/linux/linux-ti-staging/0003-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch b/recipes-kernel/linux/linux-ti-staging/0003-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
new file mode 100644
index 0000000..5dc3725
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0003-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch
@@ -0,0 +1,44 @@
+Subject: [v2,3/3] ARM: OMAP2+: am43xx: Add context offset for dss hwmod
+Date: Sat, 15 Feb 2014 02:07:35 -0000
+From: Dave Gerlach <d-gerlach@ti.com>
+
+Add context_offs to the DSS hwmod for am43xx as the driver uses the
+context loss count to determine whether or not to restore context to the
+module. Also add prcm flag indicating this bit is valid. Without this the
+display does not return after a suspend cycle.
+
+Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
+
+---
+arch/arm/mach-omap2/omap_hwmod_33xx_data.c |    2 ++
+ arch/arm/mach-omap2/prcm43xx.h             |    3 +++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index 978356d..b298d6d 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -1921,7 +1921,9 @@ static struct omap_hwmod am43xx_dss_core_hwmod = {
+ 	.prcm = {
+ 		.omap4 = {
+ 			.clkctrl_offs = AM43XX_CM_PER_DSS_CLKCTRL_OFFSET,
++			.context_offs = AM43XX_PRM_RM_PER_DSS_CONTEXT,
+ 			.modulemode   = MODULEMODE_SWCTRL,
++			.flags = HWMOD_AM437X_HAS_CONTEXT_LOSS_BIT,
+ 		},
+ 	},
+ };
+diff --git a/arch/arm/mach-omap2/prcm43xx.h b/arch/arm/mach-omap2/prcm43xx.h
+index f5344ab..55c41bb 100644
+--- a/arch/arm/mach-omap2/prcm43xx.h
++++ b/arch/arm/mach-omap2/prcm43xx.h
+@@ -25,6 +25,9 @@
+ #define AM43XX_PRM_WKUP_INST				0x2000
+ #define AM43XX_PRM_DEVICE_INST				0x4000
+ 
++/* PRM.PRM_PER offsets */
++#define AM43XX_PRM_RM_PER_DSS_CONTEXT			0x0A24
++
+ /* RM RSTCTRL offsets */
+ #define AM43XX_RM_PER_RSTCTRL_OFFSET			0x0010
+ #define AM43XX_RM_GFX_RSTCTRL_OFFSET			0x0010
diff --git a/recipes-kernel/linux/linux-ti-staging/0004-ARM-OMAP2-omap_hwmod-Maintain-legacy-context-loss-count.patch b/recipes-kernel/linux/linux-ti-staging/0004-ARM-OMAP2-omap_hwmod-Maintain-legacy-context-loss-count.patch
new file mode 100644
index 0000000..65e89e9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0004-ARM-OMAP2-omap_hwmod-Maintain-legacy-context-loss-count.patch
@@ -0,0 +1,65 @@
+Subject: ARM: OMAP2+: omap_hwmod: Maintain legacy context loss count
+Date: Sat, 15 Feb 2014 03:14:40 -0000
+From: Dave Gerlach <d-gerlach@ti.com>
+
+In the case of am43xx, make sure we allow hwmods that don't use the hwmod
+context_offs for context loss counting to still use powerdomains to count
+context loss.
+
+Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
+
+---
+arch/arm/mach-omap2/omap_hwmod.c |   17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
+index ad98b7f..3fe29a2 100644
+--- a/arch/arm/mach-omap2/omap_hwmod.c
++++ b/arch/arm/mach-omap2/omap_hwmod.c
+@@ -182,6 +182,9 @@
+  * device drivers.  Until then, this should avoid huge blocks of cpu_is_*()
+  * conditionals in this code.
+  */
++
++#define SOC_HWMOD_CHECK_FOR_CONTEXT_FLAG	(0x1 << 0)
++
+ struct omap_hwmod_soc_ops {
+ 	void (*enable_module)(struct omap_hwmod *oh);
+ 	int (*disable_module)(struct omap_hwmod *oh);
+@@ -195,6 +198,7 @@ struct omap_hwmod_soc_ops {
+ 	int (*init_clkdm)(struct omap_hwmod *oh);
+ 	void (*update_context_lost)(struct omap_hwmod *oh);
+ 	int (*get_context_lost)(struct omap_hwmod *oh);
++	u8 flags;
+ };
+ 
+ /* soc_ops: adapts the omap_hwmod code to the currently-booted SoC */
+@@ -4193,9 +4197,19 @@ int omap_hwmod_get_context_loss_count(struct omap_hwmod *oh)
+ 	struct powerdomain *pwrdm;
+ 	int ret = 0;
+ 
+-	if (soc_ops.get_context_lost)
++	if (soc_ops.get_context_lost) {
++		/*
++		 * On SoCs like AM437x where we dont use hwmod to check context
++		 * loss on certain devices..
++		 */
++		if ((soc_ops.flags & SOC_HWMOD_CHECK_FOR_CONTEXT_FLAG) &&
++		    !(oh->prcm.omap4.flags & HWMOD_AM437X_HAS_CONTEXT_LOSS_BIT))
++			goto get_pwrdm_context_loss_count;
++
+ 		return soc_ops.get_context_lost(oh);
++	}
+ 
++get_pwrdm_context_loss_count:
+ 	pwrdm = omap_hwmod_get_pwrdm(oh);
+ 	if (pwrdm)
+ 		ret = pwrdm_get_context_loss_count(pwrdm);
+@@ -4323,6 +4337,7 @@ void __init omap_hwmod_init(void)
+ 		soc_ops.init_clkdm = _init_clkdm;
+ 		soc_ops.update_context_lost = _am437x_update_context_lost;
+ 		soc_ops.get_context_lost = _omap4_get_context_lost;
++		soc_ops.flags = SOC_HWMOD_CHECK_FOR_CONTEXT_FLAG;
+ 	} else if (soc_is_am33xx()) {
+ 		soc_ops.enable_module = _am33xx_enable_module;
+ 		soc_ops.disable_module = _am33xx_disable_module;
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 2a9d089..29d1a4f 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -40,19 +40,25 @@ SRCREV = "c883f50c5bbf1bf5bfaeb550991caf5fc77a1c4d"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
+
+# Performance fixes
 SRC_URI += "file://0001-ARM-config-omap-Sync-up-omap2plus-defconfig-with-sav.patch \
             file://0002-ARM-config-omap-Make-advanced-networking-features-as.patch \
             file://0003-ARM-config-omap-Disable-extra-debug-options.patch \
             file://0005-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch \
-            file://0001-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch \
-            file://0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_o.patch \
             "
-
 SRC_URI_append_ti33x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
 SRC_URI_append_ti43x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
+
+# LCD resume fixes
+SRC_URI += "0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch \
+            0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch \
+            0003-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch \
+            0004-ARM-OMAP2-omap_hwmod-Maintain-legacy-context-loss-count.patch \
+            "
-- 
1.7.9.5


