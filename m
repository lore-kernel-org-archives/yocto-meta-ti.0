Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4CFDE00CAB; Fri,  7 Oct 2016 18:01:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86DE4E00C75
	for <meta-ti@yoctoproject.org>; Fri,  7 Oct 2016 18:01:51 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3A00752A93; Sat,  8 Oct 2016 01:01:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161008010150.3A00752A93@arago-project.org>
Date: Sat,  8 Oct 2016 01:01:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: also copy HS MLO variant
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
X-List-Received-Date: Sat, 08 Oct 2016 01:01:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 6cb779a6ba1b0693f6bf82777e1a333effe6fca5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6cb779a6ba1b0693f6bf82777e1a333effe6fca5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Oct  8 07:00:00 2016 +0000

u-boot-ti-staging: also copy HS MLO variant

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 0facc23..38f58f7 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r20"
+PR = "r21"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
@@ -46,6 +46,11 @@ UBOOT_HS_XLD_BINARY = "u-boot-spl_HS_X-LOADER"
 UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_XLD_SYMLINK = "u-boot-spl_HS_X-LOADER-${MACHINE}"
 
+# HS MLO
+UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
+UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
+
 do_compile_append_am437x-hs-evm () {
 	if [ -f ${S}/u-boot-spl_HS_ISSW ]; then
 		rm -rf ${S}/MLO
@@ -58,6 +63,10 @@ do_install_append () {
 		install ${S}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
 		ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
 	fi
+	if [ -f ${S}/${UBOOT_HS_MLO_BINARY} ]; then
+		install ${S}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
+		ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
+	fi
 }
 
 do_deploy_append () {
@@ -67,6 +76,12 @@ do_deploy_append () {
 		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
 		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
 	fi
+	if [ -f ${S}/${UBOOT_HS_MLO_BINARY} ]; then
+		install ${S}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
+		rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
+		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
+		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
+	fi
 }
 
 do_install_append_keystone () {


