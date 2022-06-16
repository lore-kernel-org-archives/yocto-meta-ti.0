Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5870CC43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 12:04:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.17120.1655381050603249526
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 05:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dhPZqNcq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25GC49Bt090173;
	Thu, 16 Jun 2022 07:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655381049;
	bh=/RBugLaL5Pk4SjgG2lHp2wbG2GMBRQ/f6xI2fcaynLg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=dhPZqNcqyXoemSdOyrFbrAy5dI4mCkMkDZP+CuPy/GUVBIWkyBgWh/EglWOeenbhW
	 un478sow8m5Zfq6WvmY7QroUOMo7cWpGF9vicm72av686mMMaCFyTm5nfWqh9C70rB
	 45bYZS6NlnnL2lWhPJJuvbzUFkkX1xGcLITTVLVQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25GC49o4044203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jun 2022 07:04:09 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 16
 Jun 2022 07:04:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 16 Jun 2022 07:04:09 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25GC49bR017375;
	Thu, 16 Jun 2022 07:04:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o1oEK-0003l1-U3; Thu, 16 Jun 2022 07:04:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] linux-ti-staging-rt: Bump to
 08.04.00.001 release
Date: Thu, 16 Jun 2022 07:04:07 -0500
Message-ID: <20220616120408.14388-4-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14826

Updated the linux rt version for 08.04.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index c19f9054..1f711c36 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "d9ee8a25c2eea0d2aff22f36ced2513538fbd1a2"
-PV = "5.10.109+git${SRCPV}"
+SRCREV = "bd4b7ce35aa987b5b6f80fc2efd2be9a4e707b84"
+PV = "5.10.120+git${SRCPV}"
-- 
2.17.1


