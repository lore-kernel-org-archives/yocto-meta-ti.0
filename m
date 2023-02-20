Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16C0C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 11:30:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.10886.1676892657811547128
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 03:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Do4FYj/2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31KBUuxQ019924
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 05:30:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676892656;
	bh=5j54IqLIILjz4ZcrY50d+9u7VBPZO92EpF6ueH1nAVc=;
	h=From:To:CC:Subject:Date;
	b=Do4FYj/2MFq9vn+8tNZc2rmHBTRlEGxto3S89j1kBWYfbueqgSe/07BPonOAQf0XM
	 7Q8LYxssU3fd6i295+bs1yjGx56I0zviMTa1Riwf7SJPQ3Rahg0qXXcZ8j5kfE1Lyp
	 J+TeEUczkwopWFnR2AwHh8SUGO5yOmZ+8jxNtOjo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31KBUujs028328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 05:30:56 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 20
 Feb 2023 05:30:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 20 Feb 2023 05:30:56 -0600
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31KBUs4l106625;
	Mon, 20 Feb 2023 05:30:55 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Manorit
 Chawdhry <m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH] optee: fix the sha for 3.20 tag
Date: Mon, 20 Feb 2023 17:00:53 +0530
Message-ID: <20230220113053.63144-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 11:30:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15882

The SHA for optee_os had been of 3.20-rc1 tag instead of 3.20 tag which
had been marked stable. Change the tag to 3.20.

Fixes: 280e7b4b3a17 ("optee: update optee components to 3.20 tag")

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 5c6c9d4a7d80..0de67276551f 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,5 +1,5 @@
 PV_ti-soc = "3.20.0+git${SRCPV}"
-SRCREV_ti-soc = "3bc3809afe372ca7e8216fc5d7a64e965bb4ad70"
+SRCREV_ti-soc = "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.34.1


