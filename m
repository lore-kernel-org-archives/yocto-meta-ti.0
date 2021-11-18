Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1265.1637265472881265034
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 11:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GpmYIo8K;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AIJvp61089767;
	Thu, 18 Nov 2021 13:57:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637265471;
	bh=cZgOHwjUHccl2XLQM64huKtL/bFgLsI8AM0HM5IXRWc=;
	h=From:To:Subject:Date;
	b=GpmYIo8KSgt1NJ6l798EOOVupd6Tgj/lEXs6qtNLc0RXHvHUIZXhTCu8EyOq5w1Nr
	 tn8h8lCD8JJ72h5Ic1KeQtsW+LMGfIad9KfeWe1vghqaP7qKOUUmZJP5G5GcX6Q2CK
	 /S/3AmLxZVHz3ctNhXDL2ObIcrWzUhP8VqV8crz0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AIJvpl9011995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 13:57:51 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 13:57:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 13:57:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AIJvoHq066943;
	Thu, 18 Nov 2021 13:57:50 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v4] vxd-dec-fw: Add the recipe for vxd-dec-fw
Date: Thu, 18 Nov 2021 19:57:50 +0000
Message-ID: <20211118195750.4658-1-yogeshs@ti.com>
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

resend v3 as v4

Changes from v2:
1) Fixed the summary
2) Bumped the ti-linux-fw to pick the video decoder binary
3) Added the kernel dependency to build this recipe

 .../ti-img-encode-decode/vxd-dec-fw_git.bb    | 24 +++++++++++++++++++
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  5 ++--
 recipes-kernel/linux/kernel-rdepends.inc      |  3 +++
 3 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb

diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
new file mode 100644
index 00000000..cccda6bb
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Video Decoding Firmware"
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
index c59120b8..f6d5b8d1 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -13,11 +13,12 @@ NETCP_SA_FW_VERSION = "1.0.0"
 NETCP_PA_FW_VERSION = "3.0.2.3"
 QMSS_PDSP_FW_VERSION = "1.0.0.9"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.07"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
+IMG_DEC_FW_VERSION = "1.0"
 
-TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
+TI_LINUX_FW_SRCREV ?= "c96a734a059889e571dcf30c0638157c690a6e6e"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 5e5241c9..76b7a508 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -39,3 +39,6 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
+
+# Add run-time dependency for Video Decoding firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
-- 
2.17.1

