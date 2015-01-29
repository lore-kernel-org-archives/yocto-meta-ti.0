Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 759DCE00824; Thu, 29 Jan 2015 13:13:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44159E00782
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 13:13:32 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TLDV0L005981
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 15:13:31 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TLDUJX004635
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 15:13:30 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 15:13:30 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0TLDUqD030691;	Thu, 29 Jan 2015 15:13:30 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 29 Jan 2015 16:13:28 -0500
Message-ID: <1422566008-4449-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] udma: Add recipe for user space library for udma kernel driver
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
X-List-Received-Date: Thu, 29 Jan 2015 21:13:38 -0000
Content-Type: text/plain

- Provides zero copy access from user-space to packet dma channels
  via udma kernel driver

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/udma/udma_git.bb |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-ti/udma/udma_git.bb

diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
new file mode 100644
index 0000000..0578647
--- /dev/null
+++ b/recipes-ti/udma/udma_git.bb
@@ -0,0 +1,29 @@
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
+	install -c -m 755 ${S}/libudma.so ${D}${libdir}/
+	cd ${D}${libdir}/
+	mv libudma.so libudma.so.1.0.0
+	ln -sf libudma.so.1.0.0 libudma.so.1
+	ln -sf libudma.so.1.0.0 libudma.so
+	install -c -m 755 ${S}/include/* ${D}${includedir}/
+}
-- 
1.7.9.5


