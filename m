Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C62BCE0098A; Fri,  8 May 2015 07:22:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A95BE0097D
	for <meta-ti@yoctoproject.org>; Fri,  8 May 2015 07:22:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t48EM6Hi003865
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 09:22:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48EM6W2030454
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 09:22:06 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 8 May 2015 09:22:06 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t48EM6Jc001868;	Fri, 8 May 2015 09:22:06 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 8 May 2015 10:22:04 -0400
Message-ID: <1431094924-13197-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-ipc-rtos: Add the TI-RTOS IPC package version 3.35.01.07
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
X-List-Received-Date: Fri, 08 May 2015 14:22:11 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos.inc           |   18 ++++++++++++++++++
 recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb |    8 ++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-ipc-rtos.inc
 create mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
new file mode 100644
index 0000000..dc18bf9
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
+INSANE_SKIP_${PN} = "installed-vs-shipped"
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
-- 
1.7.9.5


