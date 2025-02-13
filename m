Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E912C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 23:48:35 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.8735.1739490505313462358
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 15:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EeCKuyf+;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmOMO019861
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Feb 2025 17:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739490504;
	bh=vwMExl+XWYN4nj8T5FW8pz+cmM+q9Qciw7eaWtD5Ghg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EeCKuyf+j4+6VqE1pyQNFWcKxymeiAXZfsJtm5NSNSbRmQJ+MNNpni3NOw1zkvsBx
	 SCn2VoRgZSoe9XbY8393JYhJNM/RrGS3k2sfMhrk4t6c5187smuGztrbeZZN/rQ2z2
	 izHZw3eZIbYokFxGIFNZ8PUpGQA3xUZQBNUhbTlQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmOgF050150;
	Thu, 13 Feb 2025 17:48:24 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 17:48:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 17:48:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmNcS056749;
	Thu, 13 Feb 2025 17:48:23 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][scarthgap][PATCH 7/7] beagle-bsp: 6.6 select newer mesa version
Date: Thu, 13 Feb 2025 17:48:13 -0600
Message-ID: <20250213234813.3618729-8-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213234813.3618729-1-rs@ti.com>
References: <20250213234813.3618729-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2025 23:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18308

From: Randolph Sapp <rs@ti.com>

Update the bb_org-6.6 bsp provider to pick the correct version of
mesa-pvr. This probably should have be a part of the previous patch
switching ti bsp logic as well.

Fixes: 0be0a5f6 (ti-bsp: select the graphics 24.2 packages, 2025-01-22)
Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/conf/machine/include/beagle-bsp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
index 06483ba9..dbfd70bd 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -43,7 +43,7 @@ BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_6 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 = "24%"
-BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "23%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "24%"
 
 # GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
 MACHINE_FEATURES:remove:bsp-bb_org-6_6 = "gc320"
-- 
2.48.1


