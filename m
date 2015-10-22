Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70F9DE00B67; Thu, 22 Oct 2015 10:01:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE13AE00B4D
	for <meta-ti@yoctoproject.org>; Thu, 22 Oct 2015 10:01:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 916DE52A89; Thu, 22 Oct 2015 17:01:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151022170101.916DE52A89@arago-project.org>
Date: Thu, 22 Oct 2015 17:01:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : sa-lld: Update to new version 3.0.0.11
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
X-List-Received-Date: Thu, 22 Oct 2015 17:01:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: e9eabffd060ab53b4525daa9e5441cc333acb2fb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e9eabffd060ab53b4525daa9e5441cc333acb2fb

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Oct 22 10:03:01 2015 +0000

sa-lld: Update to new version 3.0.0.11

- Add device independent symbolic link for dynamic library
- Add utils to test build

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/sa-lld/sa-lld-test_git.bb |    2 +-
 recipes-bsp/sa-lld/sa-lld.inc         |    7 +++----
 recipes-bsp/sa-lld/sa-lld_git.bb      |    4 ++++
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index 2069d41..7cb0ac7 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -15,7 +15,7 @@ do_compile () {
 		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S}
 		for choice in ${CHOICELIST}
 		do
-			make -f makefile_armv7 examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+			make -f makefile_armv7 examples utils PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
 		done
 	done
 }
diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index 6dc8566..8066279 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=4709d353574a
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/sa-lld.git;destsuffix=git/ti/drv/sa;protocol=git;branch=${BRANCH}"
-# Following commit DEV.SA_LLD.03.00.00.10
-SRCREV = "533aec7ef0e28c3faff4ee64a861c8935262dc33"
-PV = "03.00.00.10"
-PR = "r1"
+# Following commit DEV.SA_LLD.03.00.00.11A
+SRCREV = "bf5b097e868b20d23d386abc34a1902903d7d9ea"
+PV = "03.00.00.11"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/sa"
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_git.bb
index f345895..3df2c6c 100644
--- a/recipes-bsp/sa-lld/sa-lld_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld_git.bb
@@ -11,4 +11,8 @@ do_compile () {
 
 do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+
+#   Set the generic device library symbolic link
+	ln -sf libsa.so.1.0.0 ${D}${libdir}/libsa_device.so.1
+	ln -sf libsa_device.so.1 ${D}${libdir}/libsa_device.so
 }


