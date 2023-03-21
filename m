Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FF0C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 18:07:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.21483.1679422071955069874
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 11:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T6gVwyyn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32LI7nON017733;
	Tue, 21 Mar 2023 13:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679422069;
	bh=G2eZMfpz7/Uf4ZWQV8RUcaRSbH+U5oyVwFD2oAcGOEY=;
	h=From:To:Subject:Date;
	b=T6gVwyynePUb5jpUf6kXSrb8P9ckdSBmjNHqGH3Ug1tyO4LwKBq3GqkOPmCt8a0F3
	 GQ2cUEmA9faM4qgg0Qa2hSC6YO92FNRoOkgfxeUFJq97s8EQV0g7quEJJhFnocwfuO
	 p735Z/7y2kTivKCpo2OEsS5/Iqp/KCPJJThMS7Yk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32LI7ngu000665
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Mar 2023 13:07:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Mar 2023 13:07:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Mar 2023 13:07:49 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32LI7n01026557;
	Tue, 21 Mar 2023 13:07:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pegOi-00067l-TB; Tue, 21 Mar 2023 13:07:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] ti-sci-fw: Fix some syntax issues
Date: Tue, 21 Mar 2023 13:07:48 -0500
Message-ID: <20230321180748.23502-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 18:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16221

Fixing some syntax issues from the last dunfell to kirkstone sync up
patch series.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 4fcda026..31b2910a 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -43,8 +43,8 @@ SYSFW_PREFIX:am62xx-evm-k3r5-gp = "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-hs-se = "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5-hs-fs = "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 = "fs"
-SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
-SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-fs = "fs"
+SYSFW_PREFIX:am62xx-lp-evm-k3r5-hs-se = "fs"
+SYSFW_PREFIX:am62xx-lp-evm-k3r5-hs-fs = "fs"
 SYSFW_PREFIX:am62axx-evm-k3r5-gp = "fs"
 SYSFW_PREFIX:am62axx-evm-k3r5-hs-fs = "fs"
 SYSFW_PREFIX:am62axx-evm-k3r5-hs-se = "fs"
-- 
2.17.1


