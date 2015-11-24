Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 549B4E00B58; Tue, 24 Nov 2015 10:17:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0629DE00B45
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 10:17:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A8F8952A52; Tue, 24 Nov 2015 18:17:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151124181710.A8F8952A52@arago-project.org>
Date: Tue, 24 Nov 2015 18:17:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-ipc-rtos: Fix omap-a15 DEPENDS
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
X-List-Received-Date: Tue, 24 Nov 2015 18:17:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: d95af02444812d90e5cf7d3a56c2ccd98a2761ed
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d95af02444812d90e5cf7d3a56c2ccd98a2761ed

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Nov 24 04:35:46 2015 +0000

ti-ipc-rtos: Fix omap-a15 DEPENDS

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 2e9dba1..a452dcf 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,11 +2,16 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 require ti-ipc.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "ti-xdctools ti-sysbios"
-DEPENDS_append_keystone += "ti-cgt6x-native gcc-arm-none-eabi-native"
-DEPENDS_append_omap-15 += "ti-cgt6x-native ti-ccsv6-native gcc-arm-none-eabi-native"
+DEPENDS_append_keystone = " ti-cgt6x-native \
+                            gcc-arm-none-eabi-native \
+"
+DEPENDS_append_omap-a15 = " ti-cgt6x-native \
+                            ti-ccsv6-native \
+                            gcc-arm-none-eabi-native \
+"
 
 PACKAGES =+ "${PN}-fw"
 FILES_${PN}-fw = "${libdir}/firmware/*"


