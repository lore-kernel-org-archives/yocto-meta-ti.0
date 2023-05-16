Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C48C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 22:29:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.36359.1684276161003172160
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 15:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VPI8Uxs3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GMTFlt005103;
	Tue, 16 May 2023 17:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684276155;
	bh=EYwQK0L+0/ZQ3ROCkl66tXhqpK2TH1/fce77xJ24czo=;
	h=From:To:CC:Subject:Date;
	b=VPI8Uxs34W7QDYrcAVNe5/lpZI5hzXw1NravLSX9yXSzkqCyY38g8ZzUc5VnyvJ+9
	 vQG22lpsZMBscjGlfBtSZsMcdUF/RSWuoObZ808i7kZp4dQVSCLkZ+GjQZcR/52LUV
	 U6S5D4fXQHTrYD5a+Npf5nP6i1gsnLkQhsMmn7tE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GMTFn5031795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 17:29:15 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 17:29:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 17:29:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GMTFVN110682;
	Tue, 16 May 2023 17:29:15 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH] meta-ti-bsp: sdimage-2part-efi: rename to load variables
Date: Tue, 16 May 2023 17:29:04 -0500
Message-ID: <20230516222904.1178426-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 22:29:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16546

From: Randolph Sapp <rs@ti.com>

Rename the .wks to .wks.in so the EFI_PROVIDER variable is expanded
properly. We only ever set a soft recommendation for GRUB. If anyone
attempted to change that previously it was ignored (for more than just
the reason here, but that's out of my control).

Add a timeout for the bootloader menu. Currently setting it to 3
seconds.

Remove the read only flag on the rootfs. Not sure why that was there.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc                       | 2 +-
 .../wic/{sdimage-2part-efi.wks => sdimage-2part-efi.wks.in}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-ti-bsp/wic/{sdimage-2part-efi.wks => sdimage-2part-efi.wks.in} (63%)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index fff15505..c6b55239 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -50,7 +50,7 @@ IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 EFI_PROVIDER ?= "grub-efi"
 MACHINE_FEATURES += "efi"
 
-WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks", "sdimage-2part.wks", d)}"
+WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
 
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_complete[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
similarity index 63%
rename from meta-ti-bsp/wic/sdimage-2part-efi.wks
rename to meta-ti-bsp/wic/sdimage-2part-efi.wks.in
index ffb8d24b..2213a348 100644
--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks
+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
@@ -2,6 +2,6 @@
 # long-description: Creates a partitioned SD card image for TI platforms that
 # supports EFI.  Boot files are located in the first vfat partition with extra
 # reserved space.  We cannot use a GPT here.
-bootloader --append="rootfstype=ext4 ro"
-part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+bootloader --timeout=3 --append="rootfstype=ext4"
+part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.40.1


