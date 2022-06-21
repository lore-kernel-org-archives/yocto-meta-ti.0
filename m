Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54548C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 19:32:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.47918.1655839966977330810
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 12:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=urTQuFaw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: bb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25LJWfQK075637;
	Tue, 21 Jun 2022 14:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655839961;
	bh=lJLJOuGdp1qrZgCunJUddp8BBjvLUyOVtfd4q3wsOGI=;
	h=From:To:Subject:Date;
	b=urTQuFaw0uPWgiVqe/rQO5yUAusa8leP+w9MQ0qAIoJL12rbDdhNwwKPjAMXVjAOS
	 qAIAa0iWAhKRHFynMpzbmimeStefVIwBr9sYD9SKqHUbWRKgtZEuentW74mvLp3/lO
	 IVprGNn+DJ1XgcISB06mBhqzgi8u0G/9EuWLU0wo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25LJWfjG049034
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jun 2022 14:32:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Jun 2022 14:32:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Jun 2022 14:32:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25LJWeoL046500;
	Tue, 21 Jun 2022 14:32:40 -0500
From: Bryan Brattlof <bb@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Meta-TI <meta-ti@lists.yoctoproject.org>
Subject: [dunfell PATCH v2] k3conf: update SRCREV to add J721S2 support
Date: Tue, 21 Jun 2022 14:32:40 -0500
Message-ID: <20220621193240.7455-1-bb@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jun 2022 19:32:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14836

update the SHA of k3conf to pickup j721s2 support

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
index 3f542da4aa96e..af48337f5cb4d 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "966a5695b73bc53039ca60d196b77de0640088d4"
+SRCREV = "4ca1c3d330bc1de779909e733483b09a1fc4fe44"
 
 SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1


