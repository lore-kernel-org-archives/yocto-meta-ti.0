Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93949E00B49; Thu, 18 Dec 2014 10:04:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BA87E00B68
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 10:04:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 53EF0529F7; Thu, 18 Dec 2014 18:04:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141218180451.53EF0529F7@arago-project.org>
Date: Thu, 18 Dec 2014 18:04:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Add new recipe for multiproc transport library and test code
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
X-List-Received-Date: Thu, 18 Dec 2014 18:04:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 1c766f882d990e0dc5c33f0471564ada7d122db3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1c766f882d990e0dc5c33f0471564ada7d122db3

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Dec 18 21:54:17 2014 +0000

mpm-transport: Add new recipe for multiproc transport library and test code

- mpm-transport provide basic transport layer for moving data between different processing nodes
- Support communication with the process nodes using shared memory and hyperlink interface

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |   37 +++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

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


