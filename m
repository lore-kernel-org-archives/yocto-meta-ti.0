Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.8258.1637060042001908145
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 02:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XvnbK2yI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAs0ii014943;
	Tue, 16 Nov 2021 04:54:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637060040;
	bh=tdMZCtyv0qyzLx2mMMT288RdDc8LilPxO1BKvVEwFtI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XvnbK2yIGo9LrWql+LB8NjYFu7T6AycZGCnQgVlRlxZlgX5oY96XkvMScTH7uYRm7
	 uCPQzNyfaHo3M49TabgSFfFgu2hSzU/VklQxwWcQ1T3ij20GjVVJzmelsLsNlA8kUl
	 SySF1OBsLIbfrTTGfekE4aa33AYyxFwA3uivbq3E=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGAs0mC094502
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Nov 2021 04:54:00 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 04:54:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 04:54:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAs0RC024826;
	Tue, 16 Nov 2021 04:54:00 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] conf: machine: Add j7200 hs platform
Date: Tue, 16 Nov 2021 10:53:58 +0000
Message-ID: <20211116105400.45878-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116105400.45878-1-yogeshs@ti.com>
References: <20211116105400.45878-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Machine conf for J7200 HS platform.
Used am64xx hs and j721e hs as reference.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/j7200-hs-evm-k3r5.conf | 13 +++++++++++++
 conf/machine/j7200-hs-evm.conf      | 22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 conf/machine/j7200-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j7200-hs-evm.conf

diff --git a/conf/machine/j7200-hs-evm-k3r5.conf b/conf/machine/j7200-hs-evm-k3r5.conf
new file mode 100644
index 00000000..488f19ec
--- /dev/null
+++ b/conf/machine/j7200-hs-evm-k3r5.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: J7200 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j7200"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE = "j7200_hs_evm_r5_defconfig"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
new file mode 100644
index 00000000..c55be005
--- /dev/null
+++ b/conf/machine/j7200-hs-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J7200 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM
+
+require conf/machine/j7-evm.conf
+
+UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
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

