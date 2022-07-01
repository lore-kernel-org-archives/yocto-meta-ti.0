Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F052DC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 17:38:20 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.41624.1656697094595027921
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 10:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=B7bjhrcX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 261HcD9p127236;
	Fri, 1 Jul 2022 12:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656697093;
	bh=K/KfGm361lX1VNs5xIaREfYqI3P7ICL/of6V6/PQirI=;
	h=From:To:Subject:Date;
	b=B7bjhrcXtO9bgUFJA7L0XC1QW7WtBFEfzAqyFh9o+8Lv9ZNNFHVxSoFwXri6yDS+z
	 /byROEI1asSrsrLWl+xyXPDonqrlQ059nIO3IjoGGV6c8So41fIZDP/lkl0t1ESMga
	 ximgQyyhq+nxRXsuwucBug7hc2ZhLOe/3F4z7SDc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 261HcDlc006537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Jul 2022 12:38:13 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Jul 2022 12:38:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Jul 2022 12:38:13 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 261HcDVc059254;
	Fri, 1 Jul 2022 12:38:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o7Kaq-0003uK-UP; Fri, 01 Jul 2022 12:38:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH] conf: machine: j721s2: add new dtb
 for GESI
Date: Fri, 1 Jul 2022 12:38:12 -0500
Message-ID: <20220701173812.14981-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Jul 2022 17:38:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14858

The following commits in ti-linux-5.10.y kernel has introduced a new dtb.

commit: 9b05b2a89ff ("arm64: dts: ti: Add overlay for GESI to enable main CPSW2G in J721S2")

This patch on j721s2 conf is to include the new dtb.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/j721s2-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index e5ed0b73..8cf3a414 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -13,6 +13,7 @@ OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
+    ti/k3-j721s2-gesi-exp-board.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
-- 
2.17.1


