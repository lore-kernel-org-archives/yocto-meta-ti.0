Return-Path: <angelabaker@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4951EE00E34; Thu, 20 Jun 2019 15:33:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96629E008E0
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 15:33:20 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KMXJVR021566
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 17:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561069999;
	bh=B6BtzrpaInYwuuxcrcj1D3c93rBsH+pTn+hbkDifjMY=;
	h=From:To:CC:Subject:Date;
	b=RkycN9o5NvYNH64aJ+MzljdewqtX+e8ACt/1enq02nhC6wD3of4WJ+8pexvR35pqI
	IzOySl3ZgXV8E2AjpwyGyIc1h/QYwOHXs88900SzuCQwbBDgSkQCOO6k1Xrif7zIEo
	rfZPXEn2nluIbFYsuB7BzUjWs6qPiRMUSaXceRu4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KMXJko116688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 17:33:19 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 17:33:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 17:33:19 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KMXJRr062559;
	Thu, 20 Jun 2019 17:33:19 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x5KMXJm18511; Thu, 20 Jun 2019 17:33:19 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 20 Jun 2019 17:32:57 -0500
Message-ID: <1561069977-5243-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] vxd-dec-fw: Add the recipe for vxd-dec-fw
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
X-List-Received-Date: Thu, 20 Jun 2019 22:33:21 -0000
Content-Type: text/plain

Add the firmware packaging recipe for the video decoder
for J721E devices.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb

diff --git a/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb b/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
new file mode 100644
index 0000000..e8a1f72
--- /dev/null
+++ b/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Video Decoding Firmware Packaging recipe"
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84ca7278930db001870686ad997d6bb1"
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "0acbf1d0a7c7eaca0ef14c1a30ce313ea82147e5"
+
+SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+PV = "1.0-git${SRCPV}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+VXD_FW_DIR = "${S}/decoder/firmware/"
+
+# make sure that lib/firmware, and all its contents are part of the package
+FILES_${PN} += "${base_libdir}/firmware"
+
+do_install() {
+  install -d ${D}${base_libdir}/firmware
+  install -m 0755 ${VXD_FW_DIR}/pvdec_full_bin.fw ${D}${base_libdir}/firmware
+}
+
+# This is used to prevent the build system to strip the executables
+INHIBIT_PACKAGE_STRIP = "1"
+# This is used to prevent the build system to split the debug info in a separate file
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
+INSANE_SKIP_${PN} += "arch"
+
+# we don't want to configure and build the source code
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
-- 
1.9.1


