Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C95FE00930; Thu, 18 Dec 2014 07:54:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9664EE00837
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 07:54:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBIFsKDB002101
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 09:54:20 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBIFsJ6H032378
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 09:54:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 18 Dec 2014 09:54:19 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sBIFsJL6004038;	Thu, 18 Dec 2014 09:54:19 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 18 Dec 2014 10:54:17 -0500
Message-ID: <1418918057-13812-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] mpm-transport: Add new recipe for multiproc transport library and test code
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
X-List-Received-Date: Thu, 18 Dec 2014 15:54:23 -0000
Content-Type: text/plain

- mpm-transport provide basic transport layer for moving data between different processing nodes
- Support communication with the process nodes using shared memory and hyperlink interface

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb |   37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 recipes-ti/mpm-transport/mpm-transport_git.bb

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
new file mode 100644
index 0000000..fe67195
--- /dev/null
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Multiproc transport layer for KeyStone devices: Provide basic transport layer for moving data between different processing nodes"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/mpm-transport.git"
+LICENSE = "BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c17cd1dc60dc06a4c4f2a2c45472a51"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld"
+
+SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "master"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.04.00E
+SRCREV = "56640c6296f9f4816140364b7620b1d1a483ac40"
+PV = "1.0.4.0"
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+PACKAGES =+ "${PN}-test"
+FILES_${PN}-test = "${bindir}/mpm_transport_test.out ${bindir}/mpm_transport_hyplnk_loopback.out ${bindir}/mpm_transport_hyplnk_remote.out ${bindir}/mpm_transport_hyplnk_loopback_dma.out ${bindir}/mpm_transport_hyplnk_loopback64.out"
+
+do_compile () {
+	cd ${S}
+	make PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install() {
+	make installbin BASE_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
+
+	install -d ${D}${includedir}/
+	install -c -m 755 ${S}/include/* ${D}${includedir}/
+
+	install -d ${D}${libdir}/
+	cp  -a ${S}/lib/* ${D}${libdir}/
+
+	install -d ${D}${sysconfdir}/mpm/
+	install -c -m 755 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
+}
-- 
1.7.9.5


