Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C9DBE013D6
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 23:22:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CDC5252A8D; Fri, 23 Mar 2012 06:22:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120323062217.CDC5252A8D@arago-project.org>
Date: Fri, 23 Mar 2012 06:22:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux 3.0: update to 3.0.25
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 06:22:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c5f7a7cb9a208a3d185b047df9eef5bd5aa06c1a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c5f7a7cb9a208a3d185b047df9eef5bd5aa06c1a

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Mar 21 09:02:22 2012 +0100

linux 3.0: update to 3.0.25

Backport Nishants OPP/hwmod fix to get more than 600MHz out of 37xx, but don't
activate it yet. 3630ES1.2 derived silicon gets misdetected:

xM revision A:
[    0.000000] OMAP3630 ES1.0 (l2cache iva sgx neon isp 192mhz_clk )

new xM revision C:
[    0.000000] OMAP3630 ES1.2 (l2cache neon isp 192mhz_clk )

Since the iva hwmod is missing the OPP tables will fail and clock it back to
600MHz. But with the patch the kernel hangs in early init. This problem isn't
specific to this kernel update, it just coincided with ES1.2 silicon arriving
on my desk.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap3.inc                     |    2 +-
 ...llow-OPP-enumeration-to-continue-if-devic.patch |   43 ++++++++++++++++++++
 recipes-kernel/linux/linux_3.0.bb                  |    8 ++--
 3 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 9cafe85..16078db 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r117"
+MACHINE_KERNEL_PR = "r118"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-3.0/misc/0002-OMAP2-OPP-allow-OPP-enumeration-to-continue-if-devic.patch b/recipes-kernel/linux/linux-3.0/misc/0002-OMAP2-OPP-allow-OPP-enumeration-to-continue-if-devic.patch
new file mode 100644
index 0000000..7019381
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.0/misc/0002-OMAP2-OPP-allow-OPP-enumeration-to-continue-if-devic.patch
@@ -0,0 +1,43 @@
+From c15f217f7d07c460763a092f31f61b1975a18563 Mon Sep 17 00:00:00 2001
+From: Nishanth Menon <nm@ti.com>
+Date: Fri, 16 Mar 2012 11:19:09 -0500
+Subject: [PATCH 2/2] OMAP2+: OPP: allow OPP enumeration to continue if device is not present
+
+On platforms such as OMAP3, certain variants may not have IVA, SGX
+or some specific component. We currently have a check to aid fixing
+wrong population of OPP entries for issues such as typos. This however
+causes a conflict with valid requirement where the SoC variant does
+not actually have the module present.
+
+So, reduce the severity of the print to a debug statement and skip
+registering that specific OPP, but continue down the list.
+
+Reported-by: Steve Sakoman <steve@sakoman.com>
+Reported-by: Maximilian Schwerin <mvs@tigris.de>
+Acked-by: Steve Sakoman <steve@sakoman.com>
+Tested-by: Maximilian Schwerin <mvs@tigris.de>
+Signed-off-by: Nishanth Menon <nm@ti.com>
+---
+ arch/arm/mach-omap2/opp.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/opp.c b/arch/arm/mach-omap2/opp.c
+index ab8b35b..f111b82 100644
+--- a/arch/arm/mach-omap2/opp.c
++++ b/arch/arm/mach-omap2/opp.c
+@@ -64,10 +64,10 @@ int __init omap_init_opp_table(struct omap_opp_def *opp_def,
+ 		}
+ 		oh = omap_hwmod_lookup(opp_def->hwmod_name);
+ 		if (!oh || !oh->od) {
+-			pr_warn("%s: no hwmod or odev for %s, [%d] "
++			pr_debug("%s: no hwmod or odev for %s, [%d] "
+ 				"cannot add OPPs.\n", __func__,
+ 				opp_def->hwmod_name, i);
+-			return -EINVAL;
++			continue;
+ 		}
+ 		dev = &oh->od->pdev.dev;
+ 
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index c95542e..a817c1d 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.23"
-# v3.0.23 tag
-SRCREV_pn-${PN} = "bf6a68d2a214e07f7c0d6538e00e17b826714160"
+PV = "3.0.25"
+# v3.0.25 tag
+SRCREV_pn-${PN} = "9bf176a3e029ae7f2dc6feae185091525a988be2"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 


