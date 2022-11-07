Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12D9C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:21:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.1502.1667812854724799454
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 01:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NomAPf6u;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A79KrnT056312
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 03:20:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667812853;
	bh=f+k6lIV5697wkHxP1teM3DWgRR8EB7xzMY+zB4Sepwk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NomAPf6u1OfeFpVoTBD9iJy3IxEovZOEYE5PLFo+cuJIfjeszMh4qB3RJyZFr7ccF
	 h6kz84FM4MOwIiuRAjPKY+Gz9X7HzPwwJKJIo737Abtr3eIg6gRbi+83VQInxRIr4h
	 wvOb2WwT089Bc7CLAsp5nxotPyyrCE27FcGO1EwI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A79KrWv031970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 03:20:53 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 7 Nov
 2022 03:20:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 7 Nov 2022 03:20:53 -0600
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A79KnXJ049504;
	Mon, 7 Nov 2022 03:20:51 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v4 1/6] conf: machine: Add J784S4 hs platform
Date: Mon, 7 Nov 2022 14:50:43 +0530
Message-ID: <20221107092048.555881-2-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107092048.555881-1-m-chawdhry@ti.com>
References: <20221107092048.555881-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Nov 2022 09:21:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15325

Machine conf for J784S4 HS platform.
Used J721S2 hs as reference.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
 conf/machine/j784s4-hs-evm.conf      | 11 +++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j784s4-hs-evm.conf

diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
new file mode 100644
index 00000000..80a228a0
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
+UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
new file mode 100644
index 00000000..62357d62
--- /dev/null
+++ b/conf/machine/j784s4-hs-evm.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
+
+require conf/machine/j784s4-evm.conf
+
+UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
+
+SPL_BINARY = "tispl.bin_HS"
+UBOOT_BINARY = "u-boot.img_HS"
+UBOOT_SYMLINK = "u-boot.img"
-- 
2.34.1


