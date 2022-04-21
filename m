Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1005C4167B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 19:59:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.805.1650563814987568363
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 10:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=exYeCeUx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23LHuqTO092618;
	Thu, 21 Apr 2022 12:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650563812;
	bh=8AZtvC3S1/0rWfQ49/fRArhxu8UOeXnTP9zG89eIXSU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=exYeCeUxMVpzI1oBi0ZLCtSzRrvVUVr82DV4QJ6UJ8FwlssgFrNIXLz6r+L8Gx53b
	 dqAHrdMn87Y0ZuqC1TsSJbTRYqjunHpukTwso+uML3CMJHdgrunD9PNa8hX9Tvge65
	 id8kFsAWc/syJm/+K3h90h5X0NTD5g5U6ecFxs7Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23LHuqaj115830
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Apr 2022 12:56:52 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Apr 2022 12:56:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Apr 2022 12:56:52 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23LHuqfc053000;
	Thu, 21 Apr 2022 12:56:52 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nhb2y-0007wk-AA; Thu, 21 Apr 2022 12:56:52 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] linux-ti-staging-rt: Bump to
 08.03.00.001 release
Date: Thu, 21 Apr 2022 12:56:51 -0500
Message-ID: <20220421175651.30494-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421175651.30494-1-reatmon@ti.com>
References: <20220421175651.30494-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Apr 2022 19:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14613

Updated the linux rt version for 08.03.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 05fe4d12..ef4709df 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "204ec708dc86f4334f585f04835527570be1c4eb"
-PV = "5.10.100+git${SRCPV}"
+SRCREV = "84474b392bd8f1a8ebbabfa6ec685297fa3d51b7"
+PV = "5.10.109+git${SRCPV}"
-- 
2.17.1


