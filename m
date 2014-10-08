Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1699FE00888; Wed,  8 Oct 2014 11:10:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA0BEE006DB
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 11:09:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A268252973; Wed,  8 Oct 2014 18:09:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141008180957.A268252973@arago-project.org>
Date: Wed,  8 Oct 2014 18:09:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Enric Balletbo i Serra : ti-dsplink: Fix irq mismatch for kernel versions greater than 3.7.0.
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
X-List-Received-Date: Wed, 08 Oct 2014 18:10:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 888ea3744402acafa40e746a92bbca81a8b5a317
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=888ea3744402acafa40e746a92bbca81a8b5a317

Author: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Date:   Wed Oct  8 19:47:45 2014 +0000

ti-dsplink: Fix irq mismatch for kernel versions greater than 3.7.0.

Commit 7d7e1eb (ARM: OMAP2+: Prepare for irqs.h removal) and commit
ec2c082 (ARM: OMAP2+: Remove hardcoded IRQs and enable SPARSE_IRQ)
from kernel updated the way interrupts for OMAP2/3 devices are defined.

Fix irq number as dsplink misses to add the NR_IRQS relative offset.

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/dsplink/ti-dsplink.inc                  |    2 +-
 ...splink_1_65_kernel_3_7_0_fix-irq-mismatch.patch |   16 ++++++++++++++++
 recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb        |    1 +
 3 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index fa1c9dd..78b53cf 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -21,7 +21,7 @@ PROVIDES += "ti-dsplink-examples"
 
 # This package builds a kernel module, use kernel PR as base and append a local version
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "j"
+PR_append = "h"
 
 S = "${WORKDIR}/dsplink_linux_${PV}"
 
diff --git a/recipes-ti/dsplink/ti-dsplink/dsplink_1_65_kernel_3_7_0_fix-irq-mismatch.patch b/recipes-ti/dsplink/ti-dsplink/dsplink_1_65_kernel_3_7_0_fix-irq-mismatch.patch
new file mode 100644
index 0000000..787c22e
--- /dev/null
+++ b/recipes-ti/dsplink/ti-dsplink/dsplink_1_65_kernel_3_7_0_fix-irq-mismatch.patch
@@ -0,0 +1,16 @@
+Index: dsplink_linux_1_65_00_03/dsplink/gpp/src/osal/Linux/2.6.18/isr.c
+===================================================================
+--- dsplink_linux_1_65_00_03.orig/dsplink/gpp/src/osal/Linux/2.6.18/isr.c
++++ dsplink_linux_1_65_00_03/dsplink/gpp/src/osal/Linux/2.6.18/isr.c
+@@ -286,7 +286,11 @@ ISR_Create (IN  IsrProc             fnIS
+ 
+         if (DSP_SUCCEEDED (status)) {
+             (*isrObj)->signature = SIGN_ISR       ;
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0)
+             (*isrObj)->irq       = intObj->intId  ;
++#else
++            (*isrObj)->irq       = intObj->intId + NR_IRQS ;
++#endif
+             (*isrObj)->enabled   = FALSE          ;
+             (*isrObj)->dspId     = intObj->dspId  ;
+             (*isrObj)->checkFunc = intObj->checkFunc  ;
diff --git a/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb b/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
index 1d6fb00..2606cfc 100644
--- a/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
+++ b/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
@@ -9,6 +9,7 @@ PV_DL_PATH = "DSPLink/${PV_major}/${PV}/${PV_dot}"
 
 SRC_URI += "file://dsplink-BKL-fix.patch \
             file://0001-remove-check-for-make-version-3.85-works-fine.patch \
+            file://dsplink_1_65_kernel_3_7_0_fix-irq-mismatch.patch \
            "
 
 SRC_URI[dsplinktarball.md5sum] = "1bda596b631bd2f517edc70f6be4f2ca"


