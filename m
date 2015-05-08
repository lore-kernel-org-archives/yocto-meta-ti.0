Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FAD0E00956; Fri,  8 May 2015 05:34:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AE0DE00930
	for <meta-ti@yoctoproject.org>; Fri,  8 May 2015 05:34:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t48CY5lZ008898
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 07:34:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48CY5Eh031686
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 07:34:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 8 May 2015 07:34:04 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t48CY4QD026954;	Fri, 8 May 2015 07:34:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 8 May 2015 08:33:57 -0400
Message-ID: <1431088437-30316-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-cgt6x: Fix installation for native and nativesdk classes.
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
X-List-Received-Date: Fri, 08 May 2015 12:34:09 -0000
Content-Type: text/plain

* Many RTOS packages assume that the entire cgt is installed in a
  single directory as opposed to standard install paths.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cgt6x_8.0.0.bb |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
index 69c6d60..2353ebd 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f1563
 LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
 
 PE = "1"
+PR = "r1"
 
 require ../includes/ti-unpack.inc
 
@@ -49,6 +50,11 @@ do_install() {
         install -m 755 ${binfile} ${D}${bindir}
     done
 
+    install -d ${D}${datadir}/ti/cgt-c6x/bin
+    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
+        install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
+    done
+
     install -d ${D}${datadir}/ti/cgt-c6x/include
     for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
         install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
@@ -102,4 +108,6 @@ do_install_class-target() {
 
 FILES_${PN} += "${datadir}/ti/*"
 
+FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


