Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A745DCCA473
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:41:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.28474.1656610870557903683
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MneJrHxu;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UHf9Zl089128;
	Thu, 30 Jun 2022 12:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656610869;
	bh=e3k989OOlv8qt97HQBNW41vRNho1XPK3YFKgwolo0Fs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MneJrHxuWsmtqA6EfvEhaLRiD6iNmNgiQCsIXQAdSBigVubimPm9y74SKcTS53EPA
	 E2vZCYNTDSq0YcCX7t00/KrqKvUFriZgNnKSfmgi8bM8DotUsh04jh3dOoxeWdKH60
	 HxaYvpm7E63QihTKEcV2+AymquP2f+HsYlXaoRNk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UHf9gi052974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 12:41:09 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 12:41:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 12:41:09 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UHf9NP092038;
	Thu, 30 Jun 2022 12:41:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6yA8-0002rG-W5; Thu, 30 Jun 2022 12:41:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 3/3] linux-ti-staging-rt: Bump to
 08.04.00.003 release
Date: Thu, 30 Jun 2022 12:41:08 -0500
Message-ID: <20220630174108.10935-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220630174108.10935-1-reatmon@ti.com>
References: <20220630174108.10935-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 17:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14855

Updated the linux rt version for 08.04.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rebased

 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 9ca20ac7..828bee43 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "7e2ed4859e948ee827abe3c8b59dfa4e046e51ce"
+SRCREV = "70d8aea23ac37d6a72bfd18fd8661ca6f1136c0a"
 PV = "5.10.120+git${SRCPV}"
-- 
2.17.1


