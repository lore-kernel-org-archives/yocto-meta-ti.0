Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F79ACEDD95
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 13:48:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.16887.1728481677581452786
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 06:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jIank5og;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499DluX0031228;
	Wed, 9 Oct 2024 08:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728481676;
	bh=OHKgjwxe8AzehmS/jpJPNdROtPhXiItsRTCBu0Akn+E=;
	h=From:To:Subject:Date;
	b=jIank5og05E4ZXahgi5+I0knBoDhfOSbMTiasgTuZ3YYKws6+aX6B4wNYKo6iy9BC
	 o5Dwx4ZqxU/iTZtw+VR7EEPch16ITyN8WjzCtbCVGMt+ZBYHy5GYJxPzSc1BpeBzaO
	 t3gv2SAPjyLNPgBm55zm9BAIRbhhhfpZVcbwH8S8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 499Dludl024199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Oct 2024 08:47:56 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 08:47:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 08:47:55 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499DluS5048759;
	Wed, 9 Oct 2024 08:47:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syX2h-0003pU-Sj; Wed, 09 Oct 2024 08:47:55 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v3] ti-bsp: Add RT and systest support
Date: Wed, 9 Oct 2024 08:47:55 -0500
Message-ID: <20241009134755.14496-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Oct 2024 13:48:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18000

We were missing controlling the versions for linux-ti-staging-rt and
linux-ti-staging-systest using the BSP framework.  Since the
PREFERRED_VERSION is not tied to the virtual/kernel we need two
additional settings for those alternate kernel package names.

For BSPs that do not have the -rt and -systest recipes then the two
new variable settings should effectively be ignored and cause no issues.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Typo in commit message.
v2: Remove the extra variables and just set PREFERRED_VERSION.

 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 4cb2aab4..0c8f657d 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -122,6 +122,8 @@ BSP_MESA_PVR_VERSION ?= ""
 # ==========
 PREFERRED_PROVIDER_virtual/kernel ?= "${BSP_KERNEL_PROVIDER}"
 PREFERRED_VERSION_${BSP_KERNEL_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
+PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-rt ?= "${BSP_KERNEL_VERSION}"
+PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-systest ?= "${BSP_KERNEL_VERSION}"
 PREFERRED_PROVIDER_virtual/bootloader ?= "${BSP_BOOTLOADER_PROVIDER}"
 PREFERRED_PROVIDER_u-boot ?= "${BSP_BOOTLOADER_PROVIDER}"
 PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"
-- 
2.17.1


