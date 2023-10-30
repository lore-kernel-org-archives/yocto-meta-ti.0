Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65B4C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 09:01:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.144523.1698656472340720464
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 02:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yD1WVrYq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39U9169B124862;
	Mon, 30 Oct 2023 04:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698656466;
	bh=XsQULYRzpkUc3JkTDRUw7pSYe1Mg2no9A91wn8DcKew=;
	h=From:To:CC:Subject:Date;
	b=yD1WVrYqUphG0FlBSAIyWd9UhzOBCL3yZGUB39yKZS8ZvTNbophbRUgh2Fg0OYt3G
	 73W2QPLXnryku1cuGT1CtugVxSLNfCUCMoRGwI8LS3dwIy+cArUS6VKLJ2tf83cFdT
	 pLMKBqYqC9GF1OO94ZQxkPKlC5KWOnsmUIdm6Jbw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39U916tu020598
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Oct 2023 04:01:06 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 30
 Oct 2023 04:01:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 30 Oct 2023 04:01:05 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39U914HV090863;
	Mon, 30 Oct 2023 04:01:05 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: Update OPTEEMACHINE for am62pxx
Date: Mon, 30 Oct 2023 14:30:50 +0530
Message-ID: <20231030090050.1514922-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Oct 2023 09:01:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17218

- OPTEEMACHINE for am62pxx should be k3-am62x.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62pxx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index d61ad62b..1c95a480 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -12,7 +12,7 @@ IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-OPTEEMACHINE = "k3-am62px"
+OPTEEMACHINE = "k3-am62x"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
 
-- 
2.34.1


