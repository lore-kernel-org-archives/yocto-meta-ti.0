Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514AECAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 11:50:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.32018.1759751428152277274
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 04:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x0c6DAf2;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: m-shah@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596BoRpF4051227;
	Mon, 6 Oct 2025 06:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759751427;
	bh=PUbhPN6C83W6tVNcVXjukrqyduEYpnCRj2Jlu0qwO1U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x0c6DAf2kTDQENoqY7CTmkJE+aa9xUDlrciiIPp3+6zy/Jz6szgVQzTfTfKmF1Wf2
	 EpUxuZ+pQV7w/ZnkYznXr44Ea1HgSlLkR3qoQOP13tfPJmQF5GBc7qxDUjGTMBhrcV
	 3fwc5XJ1hdi4XKMcY1CCc56F62Q8G6tXHmWYVx8k=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596BoRU32204237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 6 Oct 2025 06:50:27 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 06:50:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 06:50:27 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596BoAwQ3371433;
	Mon, 6 Oct 2025 06:50:23 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v4 3/4] meta-ti-bsp: wic: Add initramfs path to to grub config
Date: Mon, 6 Oct 2025 17:20:09 +0530
Message-ID: <20251006115010.1530509-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006115010.1530509-1-m-shah@ti.com>
References: <20251006115010.1530509-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Oct 2025 11:50:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19108

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


