Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACBF3E0156C
	for <meta-ti@yoctoproject.org>; Mon,  9 Sep 2013 19:02:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSW00GC40AYJTE5@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 09 Sep 2013 21:02:02 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C49CB20011; Mon,
	09 Sep 2013 22:01:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 09 Sep 2013 22:01:46 -0400
Message-id: <1378778506-1004-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] ti-ocf-crypto-module: let module.bbclass package modules automatically
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
X-List-Received-Date: Tue, 10 Sep 2013 02:02:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

The new method is to automatically package modules into kernel-module-<modname>
and make the custom name depend on the standard unified one. Messing with
FILES_${PN} usually causes problems, so avoid it and let module.bbclass do
it's magic.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
index ece63d0..ad1d5ef 100644
--- a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
+++ b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/trunk"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+svnr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
@@ -32,5 +32,3 @@ do_install () {
         install -d ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
         install -m 0755 ${S}/ocf_omap3_cryptok.ko ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
 }
-
-FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/crypto/ocf/ocf_omap3_cryptok.ko"
-- 
1.8.3.2


