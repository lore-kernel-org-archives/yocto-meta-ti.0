Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD41FC3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 17:25:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.10182.1721496342409835310
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 20 Jul 2024 10:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d93nHGdQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46KHPf9H012705;
	Sat, 20 Jul 2024 12:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721496341;
	bh=dSOo84fRCK/FOobkM6tBKS2glm/5N1Im5TAjWJAFXOY=;
	h=From:To:Subject:Date;
	b=d93nHGdQZdvAg5HjOvPu/bkkwJ0Mg9RksOldRwAww5zyC/KSvoJnzxrqIdiMvVYkF
	 regmhphNdJO5NVC4bgqCzQ59sk4oBRJFKFT9cFJgRgnog5MbXl29YrOzr1c3wfw0g9
	 zGuC+YrdjC6wl3kIAFaeM3N+VUtutrZQJp2VQB30=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46KHPe6I025084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 20 Jul 2024 12:25:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 20
 Jul 2024 12:25:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 20 Jul 2024 12:25:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46KHPeie020584;
	Sat, 20 Jul 2024 12:25:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sVDq0-0007GM-Hc; Sat, 20 Jul 2024 12:25:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-sysbios: remove install log to avoid "buildpaths" QA error
Date: Sat, 20 Jul 2024 12:25:40 -0500
Message-ID: <20240720172540.27876-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 20 Jul 2024 17:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17898

Installer log contains absolute paths and is not really needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-ti/bios/ti-sysbios.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
index f31decec..8cc9e309 100644
--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
@@ -17,6 +17,8 @@ do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
     cp ${CP_ARGS} ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
+
+    rm ${D}${SYSBIOS_INSTALL_DIR_RECIPE}/bios_${PV}*.log
 }
 
 ALLOW_EMPTY:${PN} = "1"
-- 
2.17.1


