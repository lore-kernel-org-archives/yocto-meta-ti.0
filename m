Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70476C4321E
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 00:23:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.4140.1651796628096274391
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 17:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hJZNwl6i;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2460Nj9B086545;
	Thu, 5 May 2022 19:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651796625;
	bh=Ri9kgx4LX7gYuOe9UPB7gXB1DHHwd/SRq9rwgSBhosE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hJZNwl6i9qoWLHicQFKSP47VnJmg9LCRbBuvZsUiKOi2jX+Bsm660OVUMLi3UklMJ
	 Bdvb0EU3YUn3EO54pYE23clNojOn5KTLknFjt9+PmGeuN0XPtzA4qvxCX1QwD3+DJs
	 GLiks5VHiRVL37fqdnttH2febrZzWY+s5XaUR29o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2460NjBn099290
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 May 2022 19:23:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 5
 May 2022 19:23:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 5 May 2022 19:23:45 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2460NjYL030251;
	Thu, 5 May 2022 19:23:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmll3-00012B-4Q; Thu, 05 May 2022 19:23:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] linux-ti-staging-rt: Bump to
 08.03.00.003 release
Date: Thu, 5 May 2022 19:23:44 -0500
Message-ID: <20220506002344.3923-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506002344.3923-1-reatmon@ti.com>
References: <20220506002344.3923-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 May 2022 00:23:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14715

Updated the linux rt version for 08.03.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index bcf5cf6b..233d5dff 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "71d8b949868162e2aaac748ce569c1faf0b4b4f3"
+SRCREV = "44a4e68ecf519fd2e35417371fbac546c416d2d9"
 PV = "5.10.109+git${SRCPV}"
-- 
2.17.1


