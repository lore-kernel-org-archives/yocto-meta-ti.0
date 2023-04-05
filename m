Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3946FC761AF
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 18:47:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.139202.1680720437693682239
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 11:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NC3plWUF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 335IlGnA075473;
	Wed, 5 Apr 2023 13:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680720436;
	bh=JcVTPaRD/2sKoltIPpK30LpS9yx1Dx9xbwXSk8VLIzs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NC3plWUFZyQu6GxwyG9M7xzSoxAnIukQR8Bykm0sil1E0Uh6uPvgUq21XNuHDWc/y
	 Gbz9nwM1QloFqnzXXc8U4WN86niLiNURgVbXcWhd8tF3EZr+hH11lfsmU+wHgOjtOY
	 LH/desC2hOA698b/NKpzUUhZaSllX41jLUkMQcVM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 335IlGgU007170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Apr 2023 13:47:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 5
 Apr 2023 13:47:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 5 Apr 2023 13:47:16 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 335IlEca016337;
	Wed, 5 Apr 2023 13:47:15 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/4] linux-ti-next: Add defconfig for OMAP-L138
Date: Wed, 5 Apr 2023 13:47:13 -0500
Message-ID: <20230405184714.26036-3-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16291

Not sure if anyone is testing on this device with -next, but for
completeness add its defconfig.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index b540e508..62831c9c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -20,6 +20,7 @@ PV = "6.1.0-rc1+git${SRCPV}"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
 
 DEFCONFIG_NAME = "multi_v7_defconfig"
+DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
 DEFCONFIG_NAME:k3 = "defconfig"
 KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
 
-- 
2.39.2


