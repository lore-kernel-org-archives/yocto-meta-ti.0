Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4B4C87FCA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 05:50:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.18630.1754459419188222909
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 22:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PhSNNZea;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5765oHv5504065;
	Wed, 6 Aug 2025 00:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754459417;
	bh=JIhyUmv73foiMtGMoKpSHiAJlY6MPTaw4KlDF32btts=;
	h=From:To:CC:Subject:Date;
	b=PhSNNZeaSVPBPRk4IAR4GetHDjMRJzy5PUfb/MEQU+uwzymlKayP5NqXiPLOmw0JC
	 vaa/1yaPON5C1TuWHoCq7Yt3aMXAStv/dISkxY9noX4GBwe26YDYdUxWM+Pl7Lb6Bc
	 5vAn2OtELgV2mwv1mqXNsYf4J9PJI5qaQfl9PFF0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5765oHu63994683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 00:50:17 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 00:50:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 00:50:17 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5765oEcg3341730;
	Wed, 6 Aug 2025 00:50:15 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v2] licenses: Add INSIDE-Secure LICENSE
Date: Wed, 6 Aug 2025 11:20:14 +0530
Message-ID: <20250806055014.2606773-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 05:50:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18893

Add the INSIDE-Secure LICENSE and update the PKA recipe to use this
license.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Added only INSIDE-Secure license.

Link to v1:
https://lore.kernel.org/all/20250801044441.1059527-1-b-padhi@ti.com/

 meta-ti-bsp/licenses/INSIDE-Secure            | 19 +++++++++++++++++++
 .../recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb    |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/licenses/INSIDE-Secure

diff --git a/meta-ti-bsp/licenses/INSIDE-Secure b/meta-ti-bsp/licenses/INSIDE-Secure
new file mode 100644
index 00000000..3eb3a465
--- /dev/null
+++ b/meta-ti-bsp/licenses/INSIDE-Secure
@@ -0,0 +1,19 @@
+//---------------------------------------------------------------------
+//Inside Secure Copyright Notice for PKA Firmware
+//---------------------------------------------------------------------
+
+/* */
+/* Copyright (c) 2004-2015 INSIDE Secure B.V. All Rights Reserved */
+/* */
+/* This confidential and proprietary software may be used only as authorized */
+/* by a licensing agreement from INSIDE Secure. */
+/* */
+/* The entire notice above must be reproduced on all authorized copies that */
+/* may only be made to the extent permitted by a licensing agreement from */
+/* INSIDE Secure. */
+/* */
+/* For more information or support, please go to our online support system at */
+/* https://essoemsupport.insidesecure.com. */
+/* In case you do not have an account for this system, please send an e-mail */
+/* to ESSEmbeddedHW-Support.com. */
+/*----------------------------------------------------------------------------*/
diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
index 49ae0251..c3d2bce4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "PKA prebuilt binary firmware image"
 
-LICENSE = "TI-TFL & INSIDE Secure"
+LICENSE = "TI-TFL & INSIDE-Secure"
 LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
 
 COMPATIBLE_MACHINE = "k3"
-- 
2.34.1


