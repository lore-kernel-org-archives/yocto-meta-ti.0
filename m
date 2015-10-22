Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3453EE00A81; Wed, 21 Oct 2015 21:00:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98B5CE00A73
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2015 21:00:15 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9M40Fs3032307
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2015 23:00:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9M40FVY006245
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2015 23:00:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 21 Oct 2015 23:00:15 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9M40Een022512;	Wed, 21 Oct 2015 23:00:15 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Oct 2015 00:00:10 -0400
Message-ID: <1445486410-29445-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] pa-lld: Update to new version 3.0.1.5
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
X-List-Received-Date: Thu, 22 Oct 2015 04:00:18 -0000
Content-Type: text/plain

- Add script to create device independent symbolic link to actual
  device library

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version of patch
- Reformatted symbolic link commands
---
---
 recipes-bsp/pa-lld/pa-lld.inc    |    6 +++---
 recipes-bsp/pa-lld/pa-lld_git.bb |   13 +++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 7d922fb..b8ade64 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -6,9 +6,9 @@ COMPATIBLE_MACHINE = "keystone"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/pa-lld.git;destsuffix=git/ti/drv/pa;protocol=git;branch=${BRANCH}"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.04"
-SRCREV = "92de8879be3712af684bd031ca0ed291c05d6050"
-PV = "03.00.01.04"
+# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.05A"
+SRCREV = "ae3aa3e80ecf64fe5a16515d134a6bc217220e2e"
+PV = "03.00.01.05"
 PR = "r1"
 
 BASEDIR = "${WORKDIR}/git"
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index 63e34ad..468113b 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -4,6 +4,13 @@ DEPENDS = "common-csl-ip rm-lld"
 
 include pa-lld.inc
 
+SRC_URI += "file://init_pa.sh"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "init_pa.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
 do_compile () {
 #   Now build the lld in the updated directory
 	make -f makefile_armv7 DEVICE=k2h clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
@@ -12,4 +19,10 @@ do_compile () {
 
 do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+#   Set the generic device library symbolic link
+    ln -sf libpa.so.1.0.0 ${D}${libdir}/libpa_device.so.1
+    ln -sf libpa_device.so.1 ${D}${libdir}/libpa_device.so
+#   Copy init scripts
+    install -d ${D}${sysconfdir}/init.d/
+    install -c -m 755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
-- 
1.7.9.5


