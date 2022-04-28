Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFFEC43219
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:24:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.4428.1651105460658106418
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rQ2/5qV9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S0OHlC090400;
	Wed, 27 Apr 2022 19:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651105458;
	bh=fFZn8/TY/Z/mfSC94c8XpGmFRKRl7G0/KbW/Xv+c9lg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=rQ2/5qV9FCi5ixRJiOFt/om9YCcOuE0BcHDPaNd9Z5CVgR0ijg61PB7KrV40j/oOQ
	 /etvZef29chDWmP28CH5dIw11qJbLyboPWlZ3s8JqRgeEIH/cc4A/WbViaG7R2iBTv
	 CX4qra63gvXQs68UHr2A21UmHWCSVNcHJ/Qi7EEg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S0OHup065604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 19:24:17 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 19:24:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 19:24:17 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S0OHKv031745;
	Wed, 27 Apr 2022 19:24:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1njrxB-0007sn-A2; Wed, 27 Apr 2022 19:24:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] linux-ti-staging-rt: Bump to
 08.03.00.002 release
Date: Wed, 27 Apr 2022 19:24:15 -0500
Message-ID: <20220428002416.30029-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428002416.30029-1-reatmon@ti.com>
References: <20220428002416.30029-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 00:24:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14626

Updated the linux rt version for 08.03.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index ef4709df..bcf5cf6b 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "84474b392bd8f1a8ebbabfa6ec685297fa3d51b7"
+SRCREV = "71d8b949868162e2aaac748ce569c1faf0b4b4f3"
 PV = "5.10.109+git${SRCPV}"
-- 
2.17.1


