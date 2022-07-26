Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DF3CCA47E
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:39:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.6098.1658839175679591996
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 05:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KGcnLHo2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdWXO096794;
	Tue, 26 Jul 2022 07:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658839172;
	bh=NkHUIa8STX/dpQ6r/OwAmMLs6vZp9ZakWgvX2pAgrDU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KGcnLHo2JbLQLDnlTr/3fc1csP0jc4R1FosyaaDatskmZbi1Wkw/Wn+1pTx72Gpbb
	 JDJTvWKyN4acOPeEOLm0CMFuvei6rpj8yIq8S7vj49JOVylPYqYxnV4iQfUK1yCN4j
	 XYWgvgVOC30ZUWVePCxYDOQvlOGSxehDJzDQmLy4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QCdWc5015180
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 07:39:32 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 07:39:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 07:39:32 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdWtO017983;
	Tue, 26 Jul 2022 07:39:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oGJqW-0005Gv-BF; Tue, 26 Jul 2022 07:39:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/3] linux-ti-staging: Bump to 08.04.00.005
 release
Date: Tue, 26 Jul 2022 07:39:31 -0500
Message-ID: <20220726123932.20216-3-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14908

Updated the linux version for 08.04.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index d7cb9914..605c778d 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "b56b1fd4a1c0e331114d15f7030bc8397a7e7b9b"
+SRCREV = "95b90aa828165df6c45d6bb0e1cce905e83a66a7"
 PV = "5.10.120+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1


