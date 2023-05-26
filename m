Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C21C7EE39
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:27:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1414.1685125656412053227
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 11:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lJYM4dAH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRY1x022773;
	Fri, 26 May 2023 13:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685125654;
	bh=fMVQFE3Fe1RhCcn+diRxQK2mHdDeXY8hCpEFvwuFx94=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lJYM4dAHRIrigVQazuoRCSTmZnc1zze7QgJyrisRD7oMf5Mj4yt1xVBjop4WLDTKS
	 7+NGf4zZ9yn4pFJ7NvONTJJBoZhiCVV9PFlhL0tqUd/q+PCF6FbBXkoM/2W4N1euTW
	 tpazDTkabct2CvnWpEG5zJAtxVSnQtCEpcAq1LQk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QIRY4b054622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 13:27:34 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 13:27:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 13:27:34 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRWlr013297;
	Fri, 26 May 2023 13:27:33 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/8] conf: machine: j721s2: Include the non-HS config in the HS config
Date: Fri, 26 May 2023 13:27:26 -0500
Message-ID: <20230526182731.284783-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526182731.284783-1-afd@ti.com>
References: <20230526182731.284783-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 18:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16603

Everything is the same, so just include the non-HS config to set vars.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 564b571d..4cf32a28 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -2,19 +2,4 @@
 #@NAME: J721S2 HS EVM
 #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
 
-require conf/machine/include/j721s2.inc
-
-TFA_K3_USART = "0x8"
-OPTEE_K3_USART = "0x8"
-
-KERNEL_DEVICETREE_PREFIX = " \
-    ti/k3-j721s2 \
-    ti/k3-j7200-mcspi-loopback \
-    ti/k3-am68-sk \
-"
-
-KERNEL_DEVICETREE = " \
-    ti/k3-j721s2-common-proc-board.dtb \
-"
-
-UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
+require conf/machine/j721s2-evm.conf
-- 
2.39.2


