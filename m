Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.3548.1636759082572850974
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 15:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tNbrV+EF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ACNI0c1021322;
	Fri, 12 Nov 2021 17:18:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636759080;
	bh=N8MF95tcSkxoEDCWAhozCOvU+hYPkOvm3xJ9BzJIwPQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tNbrV+EFUXVz2YazbDQoQcsCTDdUkqQwjrrRFZ978G2RHoB1gusx/RPebouuS3JI5
	 smMMIacAJ9Gwwrvgb7zFg4zcCdeoVdf3Vz5v+ekqSOWV6qK+YbL0DOgzbnJJOqYnAO
	 rgVsetJYH9txTDMAZxWJrbz7sjZY1LZKhJLGtLZE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ACNI0Td034967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Nov 2021 17:18:00 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 17:18:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 17:18:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ACNI0AG015187;
	Fri, 12 Nov 2021 17:18:00 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] conf: machine: add new am64x hs platform
Date: Fri, 12 Nov 2021 23:17:58 +0000
Message-ID: <20211112231800.64167-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112231800.64167-1-yogeshs@ti.com>
References: <20211112231800.64167-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add new am64x hs platform. This requires two files to be created.
Used am65x and j7  hs platform for reference.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/am64xx-hs-evm-k3r5.conf | 14 ++++++++++++++
 conf/machine/am64xx-hs-evm.conf      | 22 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 conf/machine/am64xx-hs-evm-k3r5.conf
 create mode 100644 conf/machine/am64xx-hs-evm.conf

diff --git a/conf/machine/am64xx-hs-evm-k3r5.conf b/conf/machine/am64xx-hs-evm-k3r5.conf
new file mode 100644
index 00000000..69c6cada
--- /dev/null
+++ b/conf/machine/am64xx-hs-evm-k3r5.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM65xx HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am64x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+SYSFW_SYMLINK = ""
+
+UBOOT_MACHINE = "am64x_hs_evm_r5_defconfig"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
new file mode 100644
index 00000000..44e81463
--- /dev/null
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: AM64xx HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM
+
+require conf/machine/include/am64xx.inc
+
+UBOOT_MACHINE = "am64x_hs_evm_a53_defconfig"
+
+UBOOT_ENTRYPOINT =       "0x80080000"
+UBOOT_LOADADDRESS =      "0x80080000"
+UBOOT_RD_LOADADDRESS =   "0x84000000"
+UBOOT_RD_ENTRYPOINT =    "0x84000000"
+UBOOT_DTB_LOADADDRESS =  "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET =      "0x00010000"
+
+SPL_BINARY = "tispl.bin_HS"
+SPL_BINARYNAME = "tispl.bin"
+UBOOT_BINARY = "u-boot.img_HS"
+IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.17.1

