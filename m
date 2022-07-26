Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A0CC43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:39:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6063.1658839175240817043
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 05:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xxGSu5Wx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdX4B096325;
	Tue, 26 Jul 2022 07:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658839173;
	bh=rH8/tyxuAHofc8v+Z7TDP4w7OgnBfAKR009MDYQ3eyI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xxGSu5WxGAQCGdTbu1XybQA7OgX06br6iADy6cPyrgFgd/Ng4alpMHe1n2FOXNmjI
	 /k8UkgNDacKKYe5ZmLCsOaTojdycBxvqZm82/zpIoMqr1/jSjWIfYuIkulG7SDkm4D
	 AknWY98YY3N2usbhZ9pCt0kouePMpQwNf8SNmQxM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QCdXNJ024668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 07:39:33 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 07:39:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 07:39:32 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdWUW019770;
	Tue, 26 Jul 2022 07:39:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oGJqW-0005H1-F4; Tue, 26 Jul 2022 07:39:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] linux-ti-staging-rt: Bump to
 08.04.00.005 release
Date: Tue, 26 Jul 2022 07:39:32 -0500
Message-ID: <20220726123932.20216-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220726123932.20216-1-reatmon@ti.com>
References: <20220726123932.20216-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Jul 2022 12:39:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14907

Updated the linux rt version for 08.04.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index deae742c..239c9f5a 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "1872082f52dc08d10c9db367dd3530fb9b4e5a9c"
+SRCREV = "adb96c641cb03198db729962eb348ca1a16978e2"
 PV = "5.10.120+git${SRCPV}"
-- 
2.17.1


