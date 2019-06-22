Return-Path: <d-huang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B030E00C81; Sat, 22 Jun 2019 01:37:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB881E00BE9
	for <meta-ti@yoctoproject.org>; Sat, 22 Jun 2019 01:37:37 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5M8bbAq012955
	for <meta-ti@yoctoproject.org>; Sat, 22 Jun 2019 03:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561192657;
	bh=unmCzbHgqgTNWqR1c/3lQl1vCX0jUDl29vYHCkmJsNM=;
	h=From:To:CC:Subject:Date;
	b=gePRIsnWjIM8zrggaQcvvMNtB+zJ41GKl3yooNOQmD2mfNljCbrCmcW0Rh6jz1OES
	NUkrFeYGjC8C1+DN67bkAbZyYJy9SrriDYf9Skn/ITIDFUFQ3Jz9EUfX9TWRArKbTI
	Yn/oqhhPsRE+6ZUxr8PQb+Vy/0UvnjQSQC1KPpwM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5M8bbSw047837
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sat, 22 Jun 2019 03:37:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 22 Jun 2019 03:37:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sat, 22 Jun 2019 03:37:36 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5M8baD4077339;
	Sat, 22 Jun 2019 03:37:36 -0500
Received: from ulb0226152.dhcp.ti.com (ulb0226152.dhcp.ti.com [128.247.77.143])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x5M8bam20002; Sat, 22 Jun 2019 03:37:36 -0500 (CDT)
From: David Huang <d-huang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sat, 22 Jun 2019 03:37:36 -0500
Message-ID: <1561192656-7659-1-git-send-email-d-huang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: sunitan@ti.com
Subject: [thud][PATCH v2] vxd-dec-fw: Add the recipe for vxd-dec-fw
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
X-List-Received-Date: Sat, 22 Jun 2019 08:37:38 -0000
Content-Type: text/plain

Add the firmware packaging recipe for the video decoder
for J721E devices.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: David Huang <d-huang@ti.com>
---
 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb

diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
new file mode 100644
index 000000000000..2812fa2c9caf
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Video Decoding Firmware Packaging recipe"
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84ca7278930db001870686ad997d6bb1"
+
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


