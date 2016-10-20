Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6671E00848; Wed, 19 Oct 2016 19:36:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	UPPERCASE_50_75 autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C6D4E00756
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2016 19:36:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 949DC52AAC; Thu, 20 Oct 2016 02:36:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161020023636.949DC52AAC@arago-project.org>
Date: Thu, 20 Oct 2016 02:36:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: fix B != S and python3 issues
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
X-List-Received-Date: Thu, 20 Oct 2016 02:36:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 69517353970fd79659a45bd9a903fa4627038dd4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=69517353970fd79659a45bd9a903fa4627038dd4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Oct 18 23:04:26 2016 +0000

u-boot-ti-staging: fix B != S and python3 issues

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Gary Thomas <gary@mlbassoc.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |   36 +++++++++++-----------
 recipes-bsp/u-boot/u-boot-ti.inc                |    6 ++--
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 38f58f7..2b85800 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r21"
+PR = "r22"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
@@ -52,32 +52,32 @@ UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
 
 do_compile_append_am437x-hs-evm () {
-	if [ -f ${S}/u-boot-spl_HS_ISSW ]; then
-		rm -rf ${S}/MLO
-		cp ${S}/u-boot-spl_HS_ISSW ${S}/MLO
+	if [ -f ${B}/u-boot-spl_HS_ISSW ]; then
+		rm -rf ${B}/MLO
+		cp ${B}/u-boot-spl_HS_ISSW ${B}/MLO
 	fi
 }
 
 do_install_append () {
-	if [ -f ${S}/${UBOOT_HS_XLD_BINARY} ]; then
-		install ${S}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
+	if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
+		install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
 		ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
 	fi
-	if [ -f ${S}/${UBOOT_HS_MLO_BINARY} ]; then
-		install ${S}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
+	if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
+		install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
 		ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
 	fi
 }
 
 do_deploy_append () {
-	if [ -f ${S}/${UBOOT_HS_XLD_BINARY} ]; then
-		install ${S}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}
+	if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
+		install ${B}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}
 		rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
 		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
 		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
 	fi
-	if [ -f ${S}/${UBOOT_HS_MLO_BINARY} ]; then
-		install ${S}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
+	if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
+		install ${B}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
 		rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
 		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
 		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
@@ -85,28 +85,28 @@ do_deploy_append () {
 }
 
 do_install_append_keystone () {
-	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
+	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
 	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
 
-	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
+	install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
 	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
 
-	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
+	install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
 }
 
 do_deploy_append_keystone () {
-	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
+	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
 	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
 	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
 	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
 
-	install ${S}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
+	install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
 	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
 	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
 	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
 
-	install ${S}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
+	install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
 	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index b0054c9..661f931 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -4,7 +4,7 @@ def get_git_revision(p):
     import subprocess
 
     try:
-        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE).communicate()[0].rstrip()
+        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE, universal_newlines=True).communicate()[0].rstrip()
     except OSError:
         return None
 
@@ -36,7 +36,7 @@ SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
 do_install_append () {
     if [ "x${SPL_UART_BINARY}" != "x" ]
     then
-        install ${S}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
+        install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
         ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
     fi
 }
@@ -45,7 +45,7 @@ do_deploy_append () {
     cd ${DEPLOYDIR}
     if [ "x${SPL_UART_BINARY}" != "x" ]
     then
-        install ${S}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
+        install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
         rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
         ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
         ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}


