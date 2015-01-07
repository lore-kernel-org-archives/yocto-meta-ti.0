Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15C08E005A9; Wed,  7 Jan 2015 11:53:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5FEAE002F9
	for <meta-ti@yoctoproject.org>; Wed,  7 Jan 2015 11:53:43 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t07JrhAg000854
	for <meta-ti@yoctoproject.org>; Wed, 7 Jan 2015 13:53:43 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07Jrhxn013775
	for <meta-ti@yoctoproject.org>; Wed, 7 Jan 2015 13:53:43 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 13:53:42 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t07Jrgpc015363;	Wed, 7 Jan 2015 13:53:42 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 7 Jan 2015 14:53:37 -0500
Message-ID: <1420660417-10807-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] pktlib: Adds recipe for pklib component
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
X-List-Received-Date: Wed, 07 Jan 2015 19:53:48 -0000
Content-Type: text/plain

- pktlib: provides library for handling packet descriptor for keystone devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/pktlib/pktlib_git.bb |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-bsp/pktlib/pktlib_git.bb

diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
new file mode 100644
index 0000000..8cd43d9
--- /dev/null
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Provides library for handling packet descriptors for keystone devices"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+
+DEPENDS="common-csl-ip rm-lld qmss-lld cppi-lld"
+COMPATIBLE_MACHINE = "keystone"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/pktlib.git;protocol=git;branch=${BRANCH}"
+
+# Corresponds to DEV.PKTLIB.2.1.0.4
+SRCREV = "a9aa56afed54b0a04f36d2fdb248cad5dcac6ff6"
+PV = "2.1.0.4"
+PR = "r0"
+
+S = "${WORKDIR}/git//ti/runtime/pktlib"
+
+do_compile () {
+#   Now build the pktlib in the updated directory
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


