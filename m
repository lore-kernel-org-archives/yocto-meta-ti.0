Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1172.1637265009246821487
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 11:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Sh2ZcYXK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AIJo7nG087718;
	Thu, 18 Nov 2021 13:50:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637265007;
	bh=OvXoybRXp27K3huFu3Yre/4Pj48PF3JYAQBJYmgqRUU=;
	h=From:To:Subject:Date;
	b=Sh2ZcYXKhEODmpG8G04fA/b/G/Vy7ptDOSiZinwnKG3OO+c7495uapjM+GvaBvj9s
	 hpigW1oiMObk9TLSxn10SAo4uz17kvxxV0ZRq+t8NPlUJK0ElwfEWTioWw+lPQh57J
	 ebsQi8tiFba1w0twjiAuegJLH/0XT2E/4YlsV35s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AIJo74j071148
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 13:50:07 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 13:50:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 13:50:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AIJo7HH055375;
	Thu, 18 Nov 2021 13:50:07 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v3] vxd-dec-fw: Add the recipe for vxd-dec-fw
Date: Thu, 18 Nov 2021 19:50:07 +0000
Message-ID: <20211118195007.4549-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Add the firmware packaging recipe for the video decoder
for j721e.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---

Changes from v2:
1) Fixed the summary
2) Bumped the ti-linux-fw to pick the video decoder binary
3) Added the kernel dependency to build this recipe

 .../ti-img-encode-decode/vxd-dec-fw_git.bb    | 24 +++++++++++++++++++
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb

diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
new file mode 100644
index 00000000..55673b53
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Video Decoding Firmware Packaging recipe"
+LICENSE = "TI-IMG"
+LIC_FILES_CHKSUM = "file://LICENSE.ti-img;md5=84ca7278930db001870686ad997d6bb1"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${IMG_DEC_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "j7"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+TARGET = "pvdec_full_bin.fw"
+
+do_install() {
+        install -d ${D}${base_libdir}/firmware/ti-img
+        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmware/ti-img/${TARGET}
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index c59120b8..ebf133be 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -16,6 +16,7 @@ PRUETH_FW_AM65X_VERSION = "08.00.00.20"
 PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
+IMG_DEC_FW_VERSION = "1.0"
 
 TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
-- 
2.17.1

