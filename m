Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35B0EE00BDA; Wed, 27 Jan 2016 12:54:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C2EAE0090E
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C2231529E4; Wed, 27 Jan 2016 20:54:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205448.C2231529E4@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : rm-lld: Seperate source info into .inc file
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
X-List-Received-Date: Wed, 27 Jan 2016 20:54:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: ab40312ad3d73538460d6d892a1f315937c96a97
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ab40312ad3d73538460d6d892a1f315937c96a97

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:43 2016 +0000

rm-lld: Seperate source info into .inc file

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rm-lld/rm-lld.inc    |   23 +++++++++++++++++++++++
 recipes-bsp/rm-lld/rm-lld_git.bb |   24 ++----------------------
 2 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld.inc b/recipes-bsp/rm-lld/rm-lld.inc
new file mode 100644
index 0000000..5b3b981
--- /dev/null
+++ b/recipes-bsp/rm-lld/rm-lld.inc
@@ -0,0 +1,23 @@
+DESCRIPTION = "TI Resource Manager Low Level Driver"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
+
+RM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/rm-lld.git"
+RM_LLD_GIT_PROTOCOL = "git"
+RM_LLD_GIT_BRANCH = "master"
+RM_LLD_GIT_DESTSUFFIX = "git/ti/drv/rm"
+
+# Below commit ID corresponds to DEV.RM_LLD.02.01.02.00
+RM_LLD_SRCREV = "b3d711203c6b4cf99fb2f95dc2f4728dfd1b2639"
+
+BRANCH = "${RM_LLD_GIT_BRANCH}"
+SRC_URI = "${RM_LLD_GIT_URI};destsuffix=${RM_LLD_GIT_DESTSUFFIX};protocol=${RM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${RM_LLD_SRCREV}"
+
+PV = "02.01.02.00"
+INC_PR = "r3"
+
+COMPATIBLE_MACHINE = "keystone"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/rm"
diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
index d6cb62b..659e620 100644
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -1,23 +1,6 @@
-DESCRIPTION = "TI Resource Manager Low Level Driver"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
+require rm-lld.inc
 
-RM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/rm-lld.git"
-RM_LLD_GIT_PROTOCOL = "git"
-RM_LLD_GIT_BRANCH = "master"
-RM_LLD_GIT_DESTSUFFIX = "git/ti/drv/rm"
-
-# Below commit ID corresponds to DEV.RM_LLD.02.01.02.00
-RM_LLD_SRCREV = "b3d711203c6b4cf99fb2f95dc2f4728dfd1b2639"
-
-BRANCH = "${RM_LLD_GIT_BRANCH}"
-SRC_URI = "${RM_LLD_GIT_URI};destsuffix=${RM_LLD_GIT_DESTSUFFIX};protocol=${RM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${RM_LLD_SRCREV}"
-
-PV = "02.01.02.00"
-PR = "r2"
-
-COMPATIBLE_MACHINE = "keystone"
+PR = "${INC_PR}.0"
 
 DEPENDS = "ti-ipc libdaemon"
 
@@ -30,9 +13,6 @@ FILES_${PN}-test = "${bindir}/rmDspClientTest.out \
 
 CHOICELIST = "yes no"
 
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/rm"
-
 do_compile () {
 #   Now build the lld
     make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}


