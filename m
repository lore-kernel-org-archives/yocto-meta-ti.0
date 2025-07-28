Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF001C87FCB
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 16:54:48 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.86295.1753721679802744763
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 09:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WYeXgGfw;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SGscK82348370;
	Mon, 28 Jul 2025 11:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753721678;
	bh=uru94KLkYYU03fNmudvhY5QNMD1iN/BgMdghWNzse0U=;
	h=From:To:CC:Subject:Date;
	b=WYeXgGfwX69SR1Z7QXFw54U1I1fWh3ubxgpnalWXYhv8qdHDJFuSji0C53Jigj60P
	 YQVQ51+AIGool+FfitxW0oukPI/SBAKUF6XihkZN1mskSbxyzoaJMBWl6jcFDcPu25
	 WCRP/9nSWzePwo6V9D+RJFbYq2qSe9GpqYZgu34c=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SGscnT1824620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 11:54:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 11:54:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 11:54:38 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SGsbUZ2375292;
	Mon, 28 Jul 2025 11:54:37 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 1/3] wic: sdimage-2part-efi: Add rootwait kernel param
Date: Mon, 28 Jul 2025 11:54:35 -0500
Message-ID: <20250728165437.571427-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 16:54:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18836

This is important for many boot media such as MMC/SD as there may be a
delay in mounting rootfs which can cause boot failure if kernel does
not wait for the rootfs. Add this as one of the default params given
to the kernel. This is already the case for most U-Boot kernel cmd
lines, this adds the same when doing EFI boot.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
index ae38daa7..7252411c 100644
--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
@@ -3,6 +3,6 @@
 # supports EFI.  Boot files are located in the first vfat partition with extra
 # reserved space.  We cannot use a GPT here.
 
-bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
+bootloader --timeout=3 --append="rootfstype=ext4 rootwait ${TI_WKS_BOOTLOADER_APPEND}"
 part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.39.2


