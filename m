Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1228AC83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 13:50:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.15427.1753278654708520715
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 06:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=b+U+rkJx;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NDoqTQ1731346;
	Wed, 23 Jul 2025 08:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753278652;
	bh=N4rWo3firOrnyBLyk3R2Dx8Cc3DlpmC2Rm5T7nKaCGQ=;
	h=From:To:Subject:Date;
	b=b+U+rkJxMHhnEEtfb9ZQ35VE0+j4ZiiDgDUR3UbHN7HbRitoLxSMhgo7agPsaYPwq
	 hohoeQMq7f4azjK4e9X/aVba3IJFq/hjlQHVomcKRiOB+P3GAP0MsVj2qTukMj/15I
	 zwh0jXKYQ2A9f4ugMkVeLZayKeZGvBvqcuU+Yk1U=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NDoqsL757547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 23 Jul 2025 08:50:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 08:50:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 08:50:52 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NDoqsA3075655;
	Wed, 23 Jul 2025 08:50:52 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ueZrw-0005tz-8s; Wed, 23 Jul 2025 08:50:52 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 1/2] beagle-bsp: unset KERNEL_DEVICETREE_PREFIX
Date: Wed, 23 Jul 2025 08:50:51 -0500
Message-ID: <20250723135052.22396-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 13:50:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18812

From: Denys Dmytriyenko <denys@konsulko.com>

Beagle machines define both static KERNEL_DEVICETREE list and dynamic
KERNEL_DEVICETREE_PREFIX matching. But BB.org kernel recipes only use
the static list, while TI kernel recipes use dynamic prefix matching
by default.

Since devicetree lists now need to be used outside of the kernel
build, specifically for the new FIT processing wrapper, explicitly
unset KERNEL_DEVICETREE_PREFIX to disable dynamic devicetree prefix
matching, when BB.org BSPs are selected.

This way both kernel build and FIT image wrapper will have the same
list of DTBs to handle, based on the BSP selection.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v1: Backport from master patch.

 meta-beagle/conf/machine/include/beagle-bsp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
index 3f9828f3..d180c297 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -14,6 +14,7 @@ BSP_KERNEL_PROVIDER:bsp-bb_org-6_12 = "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_12 = "6.12.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_12 = "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_12 = "2025.%"
+KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 = ""
 
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 = "1.17%"
@@ -36,6 +37,7 @@ BSP_KERNEL_PROVIDER:bsp-bb_org-6_6 = "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_6 = "6.6.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_6 = "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_6 = "2024.%"
+KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 = ""
 
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 = "1.17%"
-- 
2.17.1


