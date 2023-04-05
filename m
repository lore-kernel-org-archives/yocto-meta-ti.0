Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E26C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 18:47:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.139067.1680720437597696125
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 11:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nX0Gy+Ti;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 335IlGHA075481;
	Wed, 5 Apr 2023 13:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680720436;
	bh=I8BZ1F/oDCfaBvzXXFn72jcsd5FvSsPK9rvWgxd1cTs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nX0Gy+TioZ02Bzzzt07VhpJGKB/8d6680W40WOGrnfsiSzPItTU0WTQyjx/S/dmSB
	 vY0ce+OPvdrFyF9YMKN6mzZWxc+KOie+JDhwGcjBj+SQe15tmNPmKb9kjwcMpHPOWi
	 /f+f04pot5ezQ/PwT5Pl6pDw2unYu+dlDlJsQOb4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 335IlGht097599
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Apr 2023 13:47:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 5
 Apr 2023 13:47:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 5 Apr 2023 13:47:16 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 335IlEcb016337;
	Wed, 5 Apr 2023 13:47:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 4/4] linux-ti-next: Remove unneeded do_compile append
Date: Wed, 5 Apr 2023 13:47:14 -0500
Message-ID: <20230405184714.26036-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405184714.26036-1-afd@ti.com>
References: <20230405184714.26036-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Apr 2023 18:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16290

Looks to be a leftover copy/paste error from when we did more in this
append for other kernel build types. Not needed here so remove.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index 62831c9c..1e86ed97 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -23,7 +23,3 @@ DEFCONFIG_NAME = "multi_v7_defconfig"
 DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
 DEFCONFIG_NAME:k3 = "defconfig"
 KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
-
-kernel_do_compile:append() {
-	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-}
-- 
2.39.2


