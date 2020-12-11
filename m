Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.6643.1607693534433435464
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 05:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xpdTrXuJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDWD1M058099
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 07:32:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607693533;
	bh=n9xQF6QssvEuyNDFAbcVgyysBsoDvTx4+jxCQGsqixE=;
	h=From:To:CC:Subject:Date;
	b=xpdTrXuJlACyewGjJEQDLnIEw/Lej195O2BWlZESnknVgpnHj6Y47BVIkCu1VYTZh
	 vJerIyKY6htgVsAaYScJEY0JpqXP8T9ViU9StEHznXWVC7RpWCNDwL9t99OsweNPyN
	 3rbrLInJhyAW98J6d5LRl6k7QDT0A6di/I5kAZd8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBDWD47070848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 07:32:13 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 07:32:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 07:32:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDWClG063835;
	Fri, 11 Dec 2020 07:32:12 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/4] machine: am64xx-evm.conf: Add machine definition for AM64xx platform
Date: Fri, 11 Dec 2020 07:31:58 -0600
Message-ID: <20201211133201.10923-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The AM64 is a follow on device of the AM65xx K3 multicore SoC architecture.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 conf/machine/am64xx-evm-k3r5.conf | 13 +++++++++++++
 conf/machine/am64xx-evm.conf      |  7 +++++++
 conf/machine/include/am64xx.inc   | 21 +++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 conf/machine/am64xx-evm-k3r5.conf
 create mode 100644 conf/machine/am64xx-evm.conf
 create mode 100644 conf/machine/include/am64xx.inc

diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
new file mode 100644
index 000000000000..26230da499af
--- /dev/null
+++ b/conf/machine/am64xx-evm-k3r5.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: AM64xx EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+# UPdate for am64
+SYSFW_SOC = "am65x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+SYSFW_SYMLINK = "sysfw.itb"
+
+UBOOT_MACHINE = "am64x_evm_r5_defconfig"
diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
new file mode 100644
index 000000000000..c6ba2a8735f3
--- /dev/null
+++ b/conf/machine/am64xx-evm.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: AM64xx EVM
+#@DESCRIPTION: Machine configuration for the TI AM64xx EVM
+
+require conf/machine/include/am64xx.inc
+
+UBOOT_MACHINE = "am64x_evm_a53_defconfig"
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
new file mode 100644
index 000000000000..a96bda1c71e7
--- /dev/null
+++ b/conf/machine/include/am64xx.inc
@@ -0,0 +1,21 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY_append = ":am64xx"
+
+MACHINE_FEATURES += "screen touchscreen gpu"
+
+SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am642-evm.dtb \
+"
+
+#IMAGE_BOOT_FILES += "sysfw-am64x-evm.itb"
+
+OPTEEMACHINE = "k3-am65x"
+OPTEEOUTPUTMACHINE = "k3"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "am64xx"
+TI_PDK_LIMIT_BOARDS = "am64xx_evm"
+TI_PDK_LIMIT_CORES = "mcu1_0 mpu1_0"
-- 
2.17.1

