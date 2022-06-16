Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FB5CCA480
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 12:04:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16840.1655381051384552265
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 05:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t5T8l0Wo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25GC490f015148;
	Thu, 16 Jun 2022 07:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655381049;
	bh=qZBZWflyBmjKnX+W2MCAgLulTkUJYu9XaVSvJMc7eJg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=t5T8l0WoOVh4wBubaW50XI6p5hFRY/3wTAJgJQ5v5eMvA4gmmp/qPbeiM64y+gkKP
	 HjMEVoN17RBNQJOpjDhQAavBopJ5G3a0HIYOrQiaCKRCFalaOJpU+W7nTNU9uch2y5
	 MSsNLy0qc/NhoLWLkLtZy/B3YLKzqhxa9m5CaDT8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25GC49o5044203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jun 2022 07:04:09 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 16
 Jun 2022 07:04:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 16 Jun 2022 07:04:09 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25GC49jG017299;
	Thu, 16 Jun 2022 07:04:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o1oEL-0003l7-0m; Thu, 16 Jun 2022 07:04:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] ti-linux-fw: Bump to 08.04.00.001
 release
Date: Thu, 16 Jun 2022 07:04:08 -0500
Message-ID: <20220616120408.14388-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616120408.14388-1-reatmon@ti.com>
References: <20220616120408.14388-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Jun 2022 12:04:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14829

Updated the ti-linux-fw version for 08.04.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 52766ac0..ffbb1bba 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,12 +20,12 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.03.02"
 
-TI_LINUX_FW_SRCREV ?= "5aa15e59927a5c4acc4dd61d213ab6cef7c0209f"
+TI_LINUX_FW_SRCREV ?= "224f82474e4029dd2e550600ba7e59f687ff7131"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "79492803a70ba1918116ac28e18c74670cdda2b9"
+K3_IMAGE_GEN_SRCREV ?= "c43068a114a86daad9241724ef8e3afda45be9be"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
2.17.1


