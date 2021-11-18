Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1135.1637195411020042918
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 16:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZAvzkIft;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AI0U797025904;
	Wed, 17 Nov 2021 18:30:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637195407;
	bh=wIVlEOmiBh0UsXM/0OpPJG1kau+cjZekAPBwXP9VVf8=;
	h=From:To:CC:Subject:Date;
	b=ZAvzkIftgP4K15GOyayAyuSMUT58bQinRoQEGlf9T07I7Q/bjwGdP6zvPtAvBR+ww
	 P217NpYMmH5yYiKr6HIn95eP+tlYxxX3fSGs77ZEYxNhGJvOpErAN6BXOZKb9Ubk8/
	 DTSMElxpuVaP+jf64qW6U91/tPO9GxW6yoysPK7E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AI0U6Hh068170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Nov 2021 18:30:07 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 17
 Nov 2021 18:30:07 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 17 Nov 2021 18:30:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AI0U7TP051837;
	Wed, 17 Nov 2021 18:30:07 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Sidraya Jayagond <sidraya.bj@pathpartnertech.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        <prashanth.ka@pathpartnertech.com>
Subject: [dunfell/master PATCHv2] vxd-dec-fw: Add the recipe for vxd-dec-fw
Date: Wed, 17 Nov 2021 18:30:05 -0600
Message-ID: <20211118003005.25238-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Add the firmware packaging recipe for the video decoder
for j721e.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
Changes in v2: Update subject dunfell/master

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

