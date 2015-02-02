Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF516E0091D; Mon,  2 Feb 2015 12:39:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB6CBE0095D
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 12:39:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7F62B52AAD; Mon,  2 Feb 2015 20:38:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150202203856.7F62B52AAD@arago-project.org>
Date: Mon,  2 Feb 2015 20:38:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : udma: Add recipe for user space library for udma kernel driver
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
X-List-Received-Date: Mon, 02 Feb 2015 20:39:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 9c1b22c6ba6416dfa05f8a2650e5685fa595e96e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9c1b22c6ba6416dfa05f8a2650e5685fa595e96e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Jan 30 08:59:26 2015 +0000

udma: Add recipe for user space library for udma kernel driver

- Provides zero copy access from user-space to packet dma channels
  via udma kernel driver

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/udma/udma_git.bb |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
new file mode 100644
index 0000000..0374d37
--- /dev/null
+++ b/recipes-ti/udma/udma_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Provides zero copy access from user-space to packet dma channels via udma kernel driver"
+LICENSE = "BSD-3-Clause"
+
+COMPATIBLE_MACHINE = "keystone"
+LIC_FILES_CHKSUM = "file://include/udma.h;startline=1;endline=39;md5=ba3c7f91f970afe073b759ced61d0f27"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-linux/udma.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git"
+# Commit corresponds to UDMA.01.00.00.00
+SRCREV = "53d09fb0bc98c41c5eb43623097e363c497d6fd8"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/udma_test"
+
+do_install_append() {
+	install -d ${D}${bindir}/
+	install -d ${D}${libdir}/
+	install -d ${D}${includedir}/
+	install -c -m 755 ${S}/udma_test ${D}${bindir}/
+	install -c -m 755 ${S}/libudma.a ${D}${libdir}/
+	install -c -m 755 ${S}/libudma.so ${D}${libdir}/libudma.so.1.0.0
+	cd ${D}${libdir}/
+	ln -sf libudma.so.1.0.0 libudma.so.1
+	ln -sf libudma.so.1.0.0 libudma.so
+	install -c -m 755 ${S}/include/* ${D}${includedir}/
+}


