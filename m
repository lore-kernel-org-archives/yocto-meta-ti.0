Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EB0FE00869; Wed, 16 Dec 2015 10:41:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5153BE00321
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 10:41:05 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBGIf54R026338
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 12:41:05 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBGIf4k7022717
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 12:41:05 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Dec 2015 12:41:04 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBGIf4sc014304;	Wed, 16 Dec 2015 12:41:04 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 16 Dec 2015 13:41:03 -0500
Message-ID: <1450291263-29032-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] uio-module-drv: Update dependency on kernel modules
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
X-List-Received-Date: Wed, 16 Dec 2015 18:41:08 -0000
Content-Type: text/plain

- This is to make this module depend on compilation of kernelmodules.
This will make sure uio.ko is built in the kernel before compilation of
this module.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index 445dc1c..e10fdeb 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -4,9 +4,11 @@ include uio-module-drv.inc
 PV = "2.0.0.0+git${SRCPV}"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
+do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"
+
 module_auto_load_uio-module-drv = "uio-module-drv"
 
 inherit module
-- 
1.9.1


