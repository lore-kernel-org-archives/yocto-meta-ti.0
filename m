Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50F6AE0088C; Tue, 15 Dec 2015 07:12:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE7FCE00863
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 07:12:05 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBFFC4Tk005833
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 09:12:04 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFFC44P024315
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 09:12:04 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Dec 2015 09:12:04 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBFFC4PH000897;	Tue, 15 Dec 2015 09:12:04 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 15 Dec 2015 10:12:02 -0500
Message-ID: <1450192322-31370-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc-rtos: Install firmware to /lib/firmware
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
X-List-Received-Date: Tue, 15 Dec 2015 15:12:10 -0000
Content-Type: text/plain

* By default libdir = /usr/lib and base_libdir = /lib
* Therefore install firmware to ${base_libdir}/firmware

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
-- 
1.9.1


