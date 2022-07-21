Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC960C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 21:02:01 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.609.1658437318761101677
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Jul 2022 14:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XLwb+h6c;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: bb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26LL1sHA022134;
	Thu, 21 Jul 2022 16:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658437314;
	bh=fQzXXaBc6t9BOJehZ64q4+Ogl481Hab8kuRD9ZJmjpo=;
	h=From:To:CC:Subject:Date;
	b=XLwb+h6cFai4ICouyKXQkNYU3U7z4KW2sBqdK6DAKLNibq6yhoxfaL4d1d6FDmXcL
	 d+KmxVo0sXmDCGv9a9PptVLyJjPoccEwUOjlokGULvIpBWS3KjhsziMx3UfT4ORUv6
	 /Ygpa6KwHQpE/ccf04qJrc0h45jTIArAXSVHmIgU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26LL1sHQ073437
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Jul 2022 16:01:54 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Jul 2022 16:01:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Jul 2022 16:01:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26LL1sL5088145;
	Thu, 21 Jul 2022 16:01:54 -0500
From: Bryan Brattlof <bb@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>,
        Res
 Sapp <rs@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: [dunfell PATCH] wic: move uboot/spls mountpoint to /boot/firmware
Date: Thu, 21 Jul 2022 16:01:52 -0500
Message-ID: <20220721210152.28223-1-bb@ti.com>
X-Mailer: git-send-email 2.17.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; h=from:subject;
 bh=+KcbBNaXgFXo/5L96xbQcD/x8x2mEKvhipx6q/QMhkM=;
 b=owEBbQGS/pANAwAKAcD4q9PiE9cMAcsmYgBi2b3P7cYq+lAreIKG9u7x+byUxqNiegOWVLHyalbi
 URP3jjCJATMEAAEKAB0WIQT86LDvkHWcjT+1Kb7A+KvT4hPXDAUCYtm9zwAKCRDA+KvT4hPXDJwpB/
 9dIPwBAAhUdmmTv3tRovTIyB3GmOdG41nb3WjV7jBKtyIGpvMv1sWX2tGcdpIaNKXGnD8h8xFkbKaH
 wjqCN8DW9aiE0Tw/tRcxMGZbIiluNI/TS/oUdXtvHCoemmV0rpoxGwccEV0aLxg4qgvNQrvVfiPdvD
 65hoLOYcRWTogcRvUOQi0w2Kqu3vFZa/RV6aXPogH1+kJVmUr5KUzoK1ch8Cp5CVML2ClTJPDRQKoW
 QNQNcKdvUjeLNau3ROHWjTFxVUsQYkADOTyP7T1jCOOetddav6rZOK/TAZB2XjW3NUN2xE/RckWF59
 y4ZvA1ElgTvKMvpvSdnGoKYTWVEU98
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Jul 2022 21:02:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14894

Currently out boards will auto-mount the sd-card's boot partition into
the /boot folder, effectively hiding the kernel image and dtb files that
are already there.

Move the boot partition mount point to /boot/firmware allowing access to
both the bootloader binares and kernel images.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 wic/sdimage-2part.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wic/sdimage-2part.wks b/wic/sdimage-2part.wks
index 77d6f7b576aef..7567c4429a2eb 100644
--- a/wic/sdimage-2part.wks
+++ b/wic/sdimage-2part.wks
@@ -2,5 +2,5 @@
 # long-description: Creates a partitioned SD card image for TI platforms.
 # Boot files are located in the first vfat partition with extra reserved space.
 
-part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
+part /boot/firmware --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
 part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.17.1


