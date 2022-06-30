Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF67CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 12:19:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.24315.1656591563989727762
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 05:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Z5JsgGBx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJN7v115393;
	Thu, 30 Jun 2022 07:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656591563;
	bh=6bTx4g47iiOZGw/zcHBHG6VvJRd8GGEA1xPwdxqQ4fg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Z5JsgGBx9yg4UNYCKvSpNP2u00rt5OV3aiWCxS9Evi87fMwRCJfUfJ+rv79m5TvWo
	 VH61NbWXesD6NIIh70+0lr445sWQKVxKUpMyJiECzirR2lPoDSPtf4nOeBMy9t4HB4
	 T66T0VxHOteTQOOGIIaOaotjxJnGmept1endi3yQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UCJMhC024139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 07:19:23 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 07:19:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 07:19:22 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJMY3051520;
	Thu, 30 Jun 2022 07:19:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6t8k-0006gE-Is; Thu, 30 Jun 2022 07:19:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] linux-ti-staging-rt: Bump to
 08.04.00.003 release
Date: Thu, 30 Jun 2022 07:19:21 -0500
Message-ID: <20220630121922.25624-4-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14849

Updated the linux rt version for 08.04.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 19ade575..828bee43 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "fb0a0333fbbb73679e719745575df8efd800380b"
-PV = "..+git${SRCPV}"
+SRCREV = "70d8aea23ac37d6a72bfd18fd8661ca6f1136c0a"
+PV = "5.10.120+git${SRCPV}"
-- 
2.17.1


