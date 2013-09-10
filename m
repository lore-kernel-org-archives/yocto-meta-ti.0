Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF593E005A3
	for <meta-ti@yoctoproject.org>; Tue, 10 Sep 2013 10:42:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F167752A19; Tue, 10 Sep 2013 17:42:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130910174210.F167752A19@arago-project.org>
Date: Tue, 10 Sep 2013 17:42:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ocf-crypto-module: let module. bbclass package modules automatically
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
X-List-Received-Date: Tue, 10 Sep 2013 17:42:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f3c7afb5a3f762894fb0476081d862cb3d54e2dd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f3c7afb5a3f762894fb0476081d862cb3d54e2dd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep  9 21:57:18 2013 -0400

ti-ocf-crypto-module: let module.bbclass package modules automatically

The new method is to automatically package modules into kernel-module-<modname>
and make the custom name depend on the standard unified one. Messing with
FILES_${PN} usually causes problems, so avoid it and let module.bbclass do
it's magic.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../ti-ocf-crypto-module_1.0.bb                    |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

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


