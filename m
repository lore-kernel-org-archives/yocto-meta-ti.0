Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA07C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 12:19:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.24522.1656591563998854444
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 05:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=M4Bfwy+s;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJNkr011238;
	Thu, 30 Jun 2022 07:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656591563;
	bh=4TrLJT3TE6dZVsm5elYsziwhtaB9W1GKrZpu8fq1iwQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=M4Bfwy+sjEpbEaH05pJau+/LLWLr6v1qk6VBWOfZQ4GUNIu1hJjm8/ksN1CDfjxMQ
	 yJUL1RJ1Wedn2y6K+2iYOStfcnUcSwGo8GN7lh6NecNl1KCPpCIv0nyMVOg4UQVpT5
	 ARHFmZD88dvaMksF3icInqF81dv/PhU96BcEVZbw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UCJNig013867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 07:19:23 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 07:19:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 07:19:22 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJMqx021207;
	Thu, 30 Jun 2022 07:19:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6t8k-0006gK-Mf; Thu, 30 Jun 2022 07:19:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] ti-linux-fw: Bump to 08.04.00.003
 release
Date: Thu, 30 Jun 2022 07:19:22 -0500
Message-ID: <20220630121922.25624-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220630121922.25624-1-reatmon@ti.com>
References: <20220630121922.25624-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 12:19:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14848

Updated the ti-linux-fw version for 08.04.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 69826e94..a8b3422d 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,7 +20,7 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.03.02"
 
-TI_LINUX_FW_SRCREV ?= "fb0a0333fbbb73679e719745575df8efd800380b"
+TI_LINUX_FW_SRCREV ?= "2d9a1002663a20673d942826c558ba4b472ffe9a"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-- 
2.17.1


