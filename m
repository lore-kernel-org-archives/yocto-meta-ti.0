Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD41DC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 05:54:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.14543.1684216468075680843
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 May 2023 22:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c4QN8Izi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-luthra@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34G5sPpQ032471;
	Tue, 16 May 2023 00:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684216465;
	bh=Pfi38rQQuz0V8TwTJ1GodkFY4j0x4Lpa2D2cSKeV8vY=;
	h=From:To:CC:Subject:Date;
	b=c4QN8IziZJDrPUlgT2J9H3LWjq1l2D2jkzjCf1a0dJ0i0GgFrlUww3KSqWYukkatO
	 TknBDwcsumyo+wn5MCxC1TkHhQEcNzHbt0Aa4BFiPfuOUi1YZhDIHmrCRg8Qe68FfE
	 Xj1YINpddu6nYuvD2jzdVj4xGn7QU17FFcaTTkAs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34G5sP9r002719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 00:54:25 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 00:54:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 00:54:12 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34G5sCws062405;
	Tue, 16 May 2023 00:54:12 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH] conf: machine: am62axx: Use generic fpdlink prefix
Date: Tue, 16 May 2023 11:24:11 +0530
Message-ID: <20230516055411.3793327-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 05:54:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16534

The FPDLink overlays are platform-agnostic, and have been renamed to
match that in the tiL6.1 kernel [1]. So use the generic k3-fpdlink
prefix to pick the overlays in the builds.

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti/Makefile?id=13ef48e91#n62

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 691a074b..d48109ae 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/am62axx.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62a7 \
-    ti/k3-j721e-fpdlink \
+    ti/k3-fpdlink \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.40.1


