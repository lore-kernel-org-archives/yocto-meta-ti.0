Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C18C4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 19:24:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3832.1699385080629049578
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 11:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wj57/Yna;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7JOdwZ128935;
	Tue, 7 Nov 2023 13:24:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699385079;
	bh=CnGsr+4pJR6fmDe1HyrJxC/m8KXTXWUwK+4C7xVM0u4=;
	h=From:To:Subject:Date;
	b=Wj57/Yna0V0yCOH6BFZ+oMVqamNNyWvNkcK4Ki/KXwn5raCcT8Py6UQfpTYeAsRc3
	 jqHrdsYqeef/IjQqH0FXaxVcg6/9Gya1G6/Bslz7E4JvP2I3CfctOYwoo9IT9v0qQK
	 4XkQMfrX7bNaw4Ocw5G91R5yPn2N04Z4vDbbKj5E=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7JOdV3036522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 13:24:39 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 13:24:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 13:24:38 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7JOc4u101030;
	Tue, 7 Nov 2023 13:24:38 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1r0Rgk-0004yF-Rd; Tue, 07 Nov 2023 13:24:38 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] linux-ti-mainline: Update to v6.6 mainline version
Date: Tue, 7 Nov 2023 13:24:37 -0600
Message-ID: <20231107192438.19067-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 19:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17259

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index a7b5ca74..16fe2eb1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -14,9 +14,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 
 S = "${WORKDIR}/git"
 
-# 6.2 Mainline version
-SRCREV = "c9c3395d5e3dcc6daee66c6908354d47bf98cb0c"
-PV = "6.2+git${SRCPV}"
+# 6.6 Mainline version
+SRCREV = "ffc253263a1375a65fa6c9f62a893e9767fbebfa"
+PV = "6.6+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
-- 
2.17.1


