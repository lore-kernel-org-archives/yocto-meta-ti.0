Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFD1C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 16:54:48 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.86706.1753721680101859070
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 09:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=To8XFCxm;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SGsdtg2803674;
	Mon, 28 Jul 2025 11:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753721679;
	bh=A7U55Hsfupj1UtrBzNsKpnrqg4jWuHkWrzA/f2IZTk4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=To8XFCxmvaumvHX+2hG4/DdKeW3NRwgzaE1gIoFGDfwAJjXjYuVhsXRNE7Cric5RN
	 iQAQX9LrzZx5OfGIXpjMuOTLN/ypaVG6vI5gHU7+6eWjehhYlJ7oaQTv/LmFLxTTca
	 ACa+9x51IMyqbuUflrjQTcS3ufOZg6pMFCTFz4w0=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SGsdxT1192536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 11:54:39 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 11:54:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 11:54:38 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SGsbUb2375292;
	Mon, 28 Jul 2025 11:54:38 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi: Remove 3 second menu delay
Date: Mon, 28 Jul 2025 11:54:37 -0500
Message-ID: <20250728165437.571427-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250728165437.571427-1-afd@ti.com>
References: <20250728165437.571427-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 16:54:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18837

For all our platforms booting with EFI there is only one option today.
The timeout gives the user 3 seconds to choose a different option, but
as there is only one, this just causes a needless 3 second delay in
boot time. Remove this delay and boot the only option immediately.
If we ever have more than one option we can always add this back.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
index 7252411c..c1089762 100644
--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
@@ -3,6 +3,6 @@
 # supports EFI.  Boot files are located in the first vfat partition with extra
 # reserved space.  We cannot use a GPT here.
 
-bootloader --timeout=3 --append="rootfstype=ext4 rootwait ${TI_WKS_BOOTLOADER_APPEND}"
+bootloader --timeout=0 --append="rootfstype=ext4 rootwait ${TI_WKS_BOOTLOADER_APPEND}"
 part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.39.2


