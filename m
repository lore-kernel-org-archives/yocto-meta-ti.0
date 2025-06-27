Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85902C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:05:04 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.7053.1751004300422444211
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 23:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RwttYEBT;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: anshuld@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55R64xZY1945131
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 01:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751004299;
	bh=eY/+DdtNWvQlHjY3IomiAH4lBzeHjTayk2Rw0x2JEi0=;
	h=From:To:CC:Subject:Date;
	b=RwttYEBT4N4xpbS4IOIYqG8SM/wmfJN6aJrPggteG0zzdL+uiLzvv0nc/Sv0FokTU
	 2V6hZ9jVAkdx8dS4gAq8lbyoScEnsH6JaLNT4jZ4M6Gztv080qOnBCEaz/5j9seBhq
	 VHcjVV9u9aoqoy4ANP33yNrSd4MzuFQssgtldIRw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55R64xev2691646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 01:04:59 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 01:04:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 01:04:59 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55R64wH22307000;
	Fri, 27 Jun 2025 01:04:59 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 1/2] conf: machine: k3: update fitImage load address
Date: Fri, 27 Jun 2025 11:34:13 +0530
Message-ID: <20250627060416.639661-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18698

In yocto, the UBOOT_ENTRYPOINT and UBOOT_*LOADADDRESS variables specify
the entry point and load addresses for the kernel image and the DTB when
creating the fitImage[1].

Currently the load address for the kernel is set to 0x81000000 and
0x83000000 for the DTB for all k3 platforms.

However the region 0x80080000 to 0x81880000 is reserved for OPTEE on
am62xxsip-evm, leading to boot failure[2] when using the fitImage.

This patch fixes the issue by changing the addresses to 0x82000000 for
kernel and 0x88000000 for the DTB. This also allows us to load kernel
images > 32MiB in size when not using initrd while also making the
falcon and standard boot addresses consistent.

[1]:
https://docs.yoctoproject.org/ref-manual/variables.html#term-UBOOT_ENTRYPOINT
[2]:
https://raw.githubusercontent.com/ArchUsr64/ti_boot_logs/HEAD/am62xxsip-evm/failures/fitImage_load_addr_issue.log

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc        | 8 ++++----
 meta-ti-bsp/conf/machine/include/ti-falcon.inc | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 9b85f867..28785173 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -13,12 +13,12 @@ KERNEL_IMAGETYPES = "Image fitImage"
 KERNEL_CLASSES += "kernel-fitimage"
 
 UBOOT_ARCH = "arm"
-UBOOT_ENTRYPOINT = "0x81000000"
-UBOOT_LOADADDRESS = "0x81000000"
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
-UBOOT_DTB_LOADADDRESS = "0x83000000"
-UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTB_LOADADDRESS = "0x88000000"
+UBOOT_DTBO_LOADADDRESS = "0x88080000"
 UBOOT_DTBO_OFFSET = "0x00010000"
 
 SPL_BINARY = "tispl.bin"
diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
index 0b938470..84a62b22 100644
--- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
@@ -1,6 +1,4 @@
 IMAGE_INSTALL:append = " u-boot-ti-staging-falcon"
 KERNEL_CLASSES:remove = "kernel-fitimage"
 KERNEL_CLASSES += "kernel-fitimage-legacyhs"
-UBOOT_DTB_LOADADDRESS = "0x88000000"
-UBOOT_LOADADDRESS = "0x82000000"
 FIT_KERNEL_COMP_ALG = "none"
-- 
2.49.0


