Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C104E00B46; Tue, 15 Dec 2015 08:59:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27ED0E00AFD
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:59:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9D25F52961; Tue, 15 Dec 2015 16:59:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151215165952.9D25F52961@arago-project.org>
Date: Tue, 15 Dec 2015 16:59:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-ipc-rtos: Install firmware to /lib/firmware
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
X-List-Received-Date: Tue, 15 Dec 2015 16:59:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 1483d58d5aa131b2ab38865de1e49527d9c856ba
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1483d58d5aa131b2ab38865de1e49527d9c856ba

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Dec 15 21:12:02 2015 +0000

ti-ipc-rtos: Install firmware to /lib/firmware

* By default libdir = /usr/lib and base_libdir = /lib
* Therefore install firmware to ${base_libdir}/firmware

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index a452dcf..5fb83d0 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,7 +2,7 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 require ti-ipc.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS = "ti-xdctools ti-sysbios"
 DEPENDS_append_keystone = " ti-cgt6x-native \
@@ -14,7 +14,7 @@ DEPENDS_append_omap-a15 = " ti-cgt6x-native \
 "
 
 PACKAGES =+ "${PN}-fw"
-FILES_${PN}-fw = "${libdir}/firmware/*"
+FILES_${PN}-fw = "${base_libdir}/firmware/*"
 FILES_${PN}-dev += "${IPC_INSTALL_DIR_RECIPE}"
 
 INSANE_SKIP_${PN}-fw += "arch"
@@ -55,6 +55,6 @@ do_install() {
     install -d ${D}${IPC_INSTALL_DIR_RECIPE}
     cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
 
-    install -d ${D}${libdir}/firmware
-    find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} ${D}${libdir}/firmware/
+    install -d ${D}${base_libdir}/firmware
+    find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} ${D}${base_libdir}/firmware/
 }


