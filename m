Return-Path: <a-bhatia1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14CDC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 06:21:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.43281.1683181291689159410
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 May 2023 23:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DqWDWmEC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-bhatia1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3446LUAe058529;
	Thu, 4 May 2023 01:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683181290;
	bh=aWmgNZj2kK8GR15Ry5mfYERS0wF6xg19ehhpSz2pCTo=;
	h=From:To:CC:Subject:Date;
	b=DqWDWmECWc/vE6f9JY/CHtIDo/Ru6bIC3ZluQUPfo9b+WIKy1nbCNFHGvZF4L0xAy
	 /fzn+HoU7qtn7FW3xe5kCeAFGnFJCcsC5mXw8G2UgoiDvJJUb2FdBjr5ZcUagOok87
	 0aIKM9yKlZ3KugEQxLOGAf+62PSbWy4jHfS3WjCA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3446LUmR036376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 May 2023 01:21:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 May 2023 01:21:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 May 2023 01:21:29 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3446LTN0001118;
	Thu, 4 May 2023 01:21:29 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Aradhya Bhatia
	<a-bhatia1@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Sai Sree Kartheek Adivi
	<s-adivi@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [kirkstone-next][PATCH] meta-ti: conf: am6xx: Add display DT overlay support
Date: Thu, 4 May 2023 11:51:28 +0530
Message-ID: <20230504062128.28222-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 May 2023 06:21:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16481

Add the Microtips OLDI Panel DT overlay for AM625-SK, AM62-LP SK and
Rocktech OLDI LCD DT overlay for AM654-EVM.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm.conf    | 1 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 meta-ti-bsp/conf/machine/include/am65xx.inc | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index d54213d4cb7b..0c0170defbfb 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
+    ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index ba1a12a7fdb7..9902987abc34 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -11,6 +11,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = " \
     ti/k3-am62x-lp-sk.dtb \
+    ti/k3-am62-lp-sk-microtips-mf101hie-panel.dtbo \
 "
 
 SPL_BINARY = "tispl.bin_HS"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 7dc234be671e..e0abad3e8f30 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
+    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
 "
 
 # On AM65x the file tiboot3.bin comes from the bootloader not ti-sci-fw
-- 
2.40.1


