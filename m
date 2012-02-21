Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60FE1E004D2
	for <meta-ti@yoctoproject.org>; Mon, 20 Feb 2012 18:30:14 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id F0EDE52ABC; Tue, 21 Feb 2012 02:30:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120221023013.F0EDE52ABC@arago-project.org>
Date: Tue, 21 Feb 2012 02:30:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Tom Rini : u-boot.inc: Move fw_env.config to main package
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
X-List-Received-Date: Tue, 21 Feb 2012 02:30:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0022cd46d184d1d758fea6eceec7dc1719ad3d5d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0022cd46d184d1d758fea6eceec7dc1719ad3d5d

Author: Tom Rini <trini@ti.com>
Date:   Mon Feb 13 11:40:26 2012 -0700

u-boot.inc: Move fw_env.config to main package

Now that u-boot-fw-utils is a separate recipe (in oe-core) we do not
want to try and build the tools here.  We also want to package the
fw_env.config file in the main package, if it exists.

Acked-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot.inc |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot.inc b/recipes-bsp/u-boot/u-boot.inc
index 9669ade..9303568 100644
--- a/recipes-bsp/u-boot/u-boot.inc
+++ b/recipes-bsp/u-boot/u-boot.inc
@@ -28,7 +28,6 @@ do_compile () {
 	unset CFLAGS
 	unset CPPFLAGS
 	oe_runmake ${UBOOT_MAKE_TARGET}
-	oe_runmake tools env
 }
 
 do_install () {
@@ -37,22 +36,16 @@ do_install () {
 	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 
 	if [ -e ${WORKDIR}/fw_env.config ] ; then
-	    install -d ${D}${base_sbindir}
 		install -d ${D}${sysconfdir}
 		install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
-#		install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-#		install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
 	fi
 
 }
 
-FILES_${PN} = "/boot"
+FILES_${PN} = "/boot ${sysconfdir}"
 # no gnu_hash in uboot.bin, by design, so skip QA
 INSANE_SKIP_${PN} = True
 
-PACKAGES += "${PN}-fw-utils"
-FILES_${PN}-fw-utils = "${sysconfdir} ${base_sbindir}"
-
 inherit deploy
 
 addtask deploy before do_package after do_compile


