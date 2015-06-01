Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF2D1E00A28; Mon,  1 Jun 2015 07:23:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA439E009E1
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:23:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7B37E52A14; Mon,  1 Jun 2015 14:23:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601142306.7B37E52A14@arago-project.org>
Date: Mon,  1 Jun 2015 14:23:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-ipc-rtos: Add the TI-RTOS IPC package version 3.35.01. 07
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
X-List-Received-Date: Mon, 01 Jun 2015 14:23:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 74356ce9c00eb9c6aa45515a9d98468ddfa7a2ee
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=74356ce9c00eb9c6aa45515a9d98468ddfa7a2ee

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 17:58:00 2015 +0000

ti-ipc-rtos: Add the TI-RTOS IPC package version 3.35.01.07

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos.inc           |   18 ++++++++++++++++++
 recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb |    8 ++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
new file mode 100644
index 0000000..fe179f5
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+
+LICENSE = "BSD"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_${PV}.zip;name=ipczip"
+
+S = "${WORKDIR}/ipc_${PV}"
+
+do_install() {
+    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN} += "${IPC_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb b/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
new file mode 100644
index 0000000..4c67c6e
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
@@ -0,0 +1,8 @@
+require ti-ipc-rtos.inc
+
+PV = "3_35_01_07"
+
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
+
+SRC_URI[ipczip.md5sum] = "9e62e35b8c2d44b1ac5f7ad9554b1a34"
+SRC_URI[ipczip.sha256sum] = "006ac780ded0a5fa843397bbde0cb597338dc521544121f697c2efdd80f86314"


