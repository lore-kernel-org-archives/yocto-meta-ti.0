Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279A7C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 16:53:46 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1061.1739465621356608757
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 08:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EqFRjC14;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DGrcH44044870
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 10:53:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739465618;
	bh=2fRitHjDNS2/Uhu6zmyZRfZeCqtpHs4qgPu2hyUXxag=;
	h=From:To:Subject:Date;
	b=EqFRjC142kJDwSQ1NUIDUFPjQKQi+vuyNkn/WsdJI4onmoDqyYjw7Qu6njY1Mwp/7
	 nzsiO887QhMji0ewq+xD779rXAYFipRS+/TvMr1QU/p7NMP1hmYSc2lIAU0xdG3EkI
	 7XiSEAvtKpDlUe0/XuvsOQ2NskTWk1SpVh9hhzUA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51DGrcnT001209
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 10:53:38 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 10:53:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 10:53:37 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DGrceb128870;
	Thu, 13 Feb 2025 10:53:38 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ticT4-0002wr-9w; Thu, 13 Feb 2025 10:53:38 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] wic: sdimage-2part-efi: Add variable for adding bootloader options
Date: Thu, 13 Feb 2025 10:53:38 -0600
Message-ID: <20250213165338.11294-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2025 16:53:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18307

We have a need for some platforms to add kernel options to the bootloader
during wic creation time.  Create a new variable and add that to the
sdimage-2part-efi.wks.in file so that a machine can override it if
needed.

Add an override for am64 to point the kernel at console=ttyS2.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am64xx.inc | 2 ++
 meta-ti-bsp/conf/machine/include/k3.inc     | 2 ++
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in    | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 49e996c8..56b56afe 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -34,3 +34,5 @@ TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am64x"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
+
+TI_WKS_BOOTLOADER_APPEND="console=ttyS2,115200n8"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index dd3cbeca..faf820a0 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -55,6 +55,8 @@ MACHINE_FEATURES += "efi"
 
 WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
 
+TI_WKS_BOOTLOADER_APPEND ?= ""
+
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
index ca042be1..ae38daa7 100644
--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
@@ -3,6 +3,6 @@
 # supports EFI.  Boot files are located in the first vfat partition with extra
 # reserved space.  We cannot use a GPT here.
 
-bootloader --timeout=3 --append="rootfstype=ext4"
+bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
 part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.17.1


