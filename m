Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BDDBE009EF; Tue, 27 Oct 2015 09:56:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E340DE00814
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 09:56:50 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9RGunUC018208
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 11:56:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RGunSI030822
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 11:56:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 11:56:49 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9RGujOA000414;	Tue, 27 Oct 2015 11:56:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 27 Oct 2015 12:56:44 -0400
Message-ID: <1445965004-1470-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445965004-1470-1-git-send-email-j-stiffler@ti.com>
References: <1445965004-1470-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC 2/2] cppi-lld: Only build binaries relevent to the machine
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
X-List-Received-Date: Tue, 27 Oct 2015 16:56:51 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld.inc    |  9 +++++++--
 recipes-bsp/cppi-lld/cppi-lld_git.bb | 13 ++++++++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index ae81a3f..cbcad34 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -1,6 +1,9 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 
+COMPATIBLE_MACHINE = "keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 CPPI_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git"
 CPPI_LLD_GIT_PROTOCOL = "git"
 CPPI_LLD_GIT_BRANCH = "master"
@@ -14,8 +17,10 @@ SRC_URI = "${CPPI_LLD_GIT_URI};destsuffix=${CPPI_LLD_GIT_DESTSUFFIX};protocol=${
 
 SRCREV = "${CPPI_LLD_SRCREV}"
 PV = "02.01.00.10"
-INC_PR = "r1"
+INC_PR = "r2"
 
-DEVICELIST = "k2h k2k k2l k2e"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2e-evm  = "k2e"
 
 S = "${WORKDIR}/${CPPI_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
index 169e0fc..e526ea8 100644
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -1,11 +1,10 @@
 DESCRIPTION = "TI CPPI Module low level driver"
-COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS = "common-csl-ip rm-lld qmss-lld"
 
 include cppi-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://init_cppi.sh"
 
@@ -25,10 +24,18 @@ do_compile () {
 
 do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+
 #   Set the generic device library symbolic link to default k2h
     cd ${D}${libdir}
-    ln -sf libcppi_k2h.so.1.0.0 libcppi_device.so.1
+
+    # Link only the first device in the list
+    for device in ${DEVICELIST}
+    do
+        ln -sf libcppi_${device}.so.1.0.0 libcppi_device.so.1
+        break
+    done
     ln -sf libcppi_device.so.1 libcppi_device.so
+
 #   Copy init scripts
     install -d ${D}${sysconfdir}/init.d/
     install -c -m 755 ${WORKDIR}/init_cppi.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-- 
1.9.1


