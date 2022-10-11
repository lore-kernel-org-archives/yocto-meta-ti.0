Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71404C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 09:18:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5151.1665479925253852159
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 02:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JFBXIQdM;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29B9Ih0A064490
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665479923;
	bh=21wjfNb9mApl22dpC/+yRriUBJbTW45289w1C7n5mX8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JFBXIQdM+7CWoA48yJBZQYLehktu9EM6V0m4ax36KO52aqJYCWEvudVqubKbnxgYp
	 QWmd9vdItb1gf6nCkoaTW/zNL6sglNDSV6MmOV8xGoJ9qJKPGpQKoDsYWi3mTMtbTr
	 nM3Nwm4WrLtVyuyF7n5RIroFAHwPOYnm0o5Mzhm0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29B9IhEE009520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:43 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 04:18:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 04:18:43 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29B9IdG5015392;
	Tue, 11 Oct 2022 04:18:42 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH 1/6] conf: machine: Add J784S4 hs
 platform
Date: Tue, 11 Oct 2022 14:48:34 +0530
Message-ID: <20221011091839.1337077-2-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011091839.1337077-1-m-chawdhry@ti.com>
References: <20221011091839.1337077-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 09:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15139

Machine conf for J784S4 HS platform.
Used J721S2 hs as reference.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
 conf/machine/j784s4-hs-evm.conf      | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j784s4-hs-evm.conf

diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
new file mode 100644
index 00000000..b6f2f6f9
--- /dev/null
+++ b/conf/machine/j784s4-hs-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j784s4"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE = "j784s4_hs_evm_r5_defconfig"
diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
new file mode 100644
index 00000000..41fe26b5
--- /dev/null
+++ b/conf/machine/j784s4-hs-evm.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
+
+require conf/machine/j784s4-evm.conf
+
+UBOOT_MACHINE = "j784s4_hs_evm_a72_defconfig"
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
+UBOOT_BINARY = "u-boot.img_HS"
+UBOOT_SYMLINK = "u-boot.img"
-- 
2.34.1


