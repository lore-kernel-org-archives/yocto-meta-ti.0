Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A75C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:38:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.45868.1658263127482181649
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Bli+x7LR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: bb@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26JKchOQ092457;
	Tue, 19 Jul 2022 15:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658263123;
	bh=s86Bp0vMNI8vv0skIc57m9sii314b9G9VvOwamGNnWM=;
	h=From:To:CC:Subject:Date;
	b=Bli+x7LR5Mku4ZyLMG2kaDHO3AR+hw/AnzWfd+q36+KE4N1gkmu/gqinXgXCbv2NO
	 aPG4r42H7n+UZ26PYJVESnO4kcLYUsYuc1MdjiEQxU1z+2cqQEYJgxI77krBHwJP8o
	 +ytdUbIO7Amkog4iCxtQ8M27KyRgwAdc56E27GEI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26JKcgUp080184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Jul 2022 15:38:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 15:38:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 15:38:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26JKcgw1119320;
	Tue, 19 Jul 2022 15:38:42 -0500
From: Bryan Brattlof <bb@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Meta-TI
	<meta-ti@lists.yoctoproject.org>, Bryan Brattlof <bb@ti.com>
Subject: [kirkstone/master PATCH v2] k3conf: update SRCREV to add j721S2
 support
Date: Tue, 19 Jul 2022 15:38:40 -0500
Message-ID: <20220719203840.29751-1-bb@ti.com>
X-Mailer: git-send-email 2.17.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; h=from:subject;
 bh=xsaSL77cJQxdbBTSOszDfXjDPScAXBd8BGGkMENQLI8=;
 b=owEBbQGS/pANAwAKAcD4q9PiE9cMAcsmYgBi1xZM80pFkFDzLfaQb6W1yuy+GGLdsadQiny4bgLu
 xVRklCCJATMEAAEKAB0WIQT86LDvkHWcjT+1Kb7A+KvT4hPXDAUCYtcWTAAKCRDA+KvT4hPXDJBGB/
 4uL/oaENorYiLP/gFs/Hhk9r75PpWVF3QfvjCigjAwPueEERYJEbL7wgxj8GmttIz9GFk3y/mCUTd7
 iTT49jwOfc7WikZWoNqgSbfPUulfQibc12o7KkQ4JQRE2vWt3Qp4Y6F888meRUYLaTt0ld/9RjHHDM
 bkhPTPkcbazrg/CLew/yN0oI1grZnJJ0SBaZyeNDRXvDZnqtCI6knatkiFYUCCDquDPLzforTKT9uE
 bliEZ5Ol4U9SkysgmqEnvBrNQlkpNodeOuHs32ixY+IdOA6A5SYn0R9XlsFUm4saAA/dZ7R1HPQgXn
 sBHuSR0Si4WcIDh0cJ40kSpup4o/Uk
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:38:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14887

update the SHA for k3conf to pickup j721s2 support

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes from v1:
 - send a separate patch for each branch to avoid merge conflicts
 - include the mailing list in the email :(

 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 3f542da4aa96e..567e8d55b51ba 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "966a5695b73bc53039ca60d196b77de0640088d4"
+SRCREV = "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
 
 SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1


