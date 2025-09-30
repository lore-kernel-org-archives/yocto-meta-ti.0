Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E319CCA471
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 13:41:51 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.25571.1759239709522775365
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 06:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=teFPfOxH;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58UDfmAJ2465303;
	Tue, 30 Sep 2025 08:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759239708;
	bh=PUbhPN6C83W6tVNcVXjukrqyduEYpnCRj2Jlu0qwO1U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=teFPfOxH3CUHy8XjA9e3XIY+0mSdIBz+VNE0TFb0Ttg2pvcev7Jm7Ff3LPd/wfCd6
	 OiSIaB1x5amn3MWt6G6Q8GkxaiJKOEEiGwwWdygaOHy1nlLVuiR/jY+1ApuZHTQArk
	 ZzyAsIayneJQSE+uJPiqRcakQcgjAbXtLfbJhOJI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58UDfme83954571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 30 Sep 2025 08:41:48 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 08:41:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 08:41:48 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58UDfWMB2988223;
	Tue, 30 Sep 2025 08:41:44 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH 3/4 v3] meta-ti-bsp: wic: Add initramfs path to to grub config
Date: Tue, 30 Sep 2025 19:11:30 +0530
Message-ID: <20250930134131.1149453-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930134131.1149453-1-m-shah@ti.com>
References: <20250930134131.1149453-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 13:41:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19086

Add initrd path to grub.cfg config so that it picks up
the initramfs image from the boot partition and includes
it in the boot process.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
index ae38daa7..6a7046a4 100644
--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
@@ -4,5 +4,5 @@
 # reserved space.  We cannot use a GPT here.
 
 bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
-part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=ti-core-initramfs.cpio.xz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.34.1


