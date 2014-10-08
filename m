Return-Path: <eballetbo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1381AE00877; Wed,  8 Oct 2014 06:48:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DB42E00876
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 06:48:08 -0700 (PDT)
Received: by mail-wi0-f170.google.com with SMTP id hi2so12259528wib.1
	for <meta-ti@yoctoproject.org>; Wed, 08 Oct 2014 06:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7N8tjtxfT3AqflgzvLdAH5aSvQLbr0OdSv0LH16PJhM=;
	b=fvAUS0ovGHJtMnz3IlsLOzPTBPLAUziJ8Q1H5DJOVH+Mx8xeyuGoUxdxafcrZwI9B9
	we81RBlM+DFZhIXZgHvzSkJIpIohsB77+ffvEwZmc0BLwFfFUmGMATtsnAqT17wTvrvg
	aP+Mx2uu49nEwvlQ1XepAPhU6c1mW8kTODb3LJ3KhzZygu+w7lIJQnpSpBy4KTDg497K
	eTCSLcin6ZuINxNYYEW2ZMPU9y22H/nd1/VcUwO1+fcDoNOkWiRVsTWBkx15n7h9lI+y
	5jIUHHnG9pU7WBraLHsbh8jBz8i/U6inhtq2xAY+5WEriRiEAkrLCGGwOPDo1RDELoIz
	yPqQ==
X-Received: by 10.180.108.200 with SMTP id hm8mr4374271wib.63.1412776088004;
	Wed, 08 Oct 2014 06:48:08 -0700 (PDT)
Received: from localhost.localdomain (43.Red-2-139-180.staticIP.rima-tde.net.
	[2.139.180.43])
	by mx.google.com with ESMTPSA id p1sm158375wjy.22.2014.10.08.06.48.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Oct 2014 06:48:07 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@iseebcn.com>
To: meta-ti@yoctoproject.org,
	ebutera@gmail.com,
	martinez.javier@gmail.com
Date: Wed,  8 Oct 2014 15:47:45 +0200
Message-Id: <1412776066-4991-3-git-send-email-eballetbo@iseebcn.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
References: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [PATCH 2/3] ti-dsplink: Fix irq mismatch for kernel versions greater than 3.7.0.
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
X-List-Received-Date: Wed, 08 Oct 2014 13:48:16 -0000

Commit 7d7e1eb (ARM: OMAP2+: Prepare for irqs.h removal) and commit
ec2c082 (ARM: OMAP2+: Remove hardcoded IRQs and enable SPARSE_IRQ)
from kernel updated the way interrupts for OMAP2/3 devices are defined.

Fix irq number as dsplink misses to add the NR_IRQS relative offset.

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 recipes-ti/dsplink/ti-dsplink.inc                        |  2 +-
 .../dsplink_1_65_kernel_3_7_0_fix-irq-mismatch.patch     | 16 ++++++++++++++++
 recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb              |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 recipes-ti/dsplink/ti-dsplink/dsplink_1_65_kernel_3_7_0_fix-irq-mismatch.patch

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
-- 
1.9.1


