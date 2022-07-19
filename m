Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A54C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:00:11 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.45375.1658260809028736400
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DCOOJ07p;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: bb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26JK062K080609;
	Tue, 19 Jul 2022 15:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658260806;
	bh=JwU70M4titDE4I+YJxA0Hgak3A2t2xlMYNbo4XkY2gM=;
	h=From:To:CC:Subject:Date;
	b=DCOOJ07pLyoWCpiR4q+1Z2P4ayqBibro3GzAyzU2YmJA38wpPJG1bmm1RuYerOAuj
	 p+HEGHHGv74vJ4/FSNPKLAne7mFTJeJQe9amZR1JDzyg+XWP2zHu6F9Eg1dR0u1cwv
	 Kje6iDtZgT/UjiiWFpzGdl4qdlvNCM1Oiutrg99U=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26JK06TC015541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Jul 2022 15:00:06 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 15:00:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 15:00:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26JK05pP016132;
	Tue, 19 Jul 2022 15:00:05 -0500
From: Bryan Brattlof <bb@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Meta-TI
	<meta-ti@lists.yoctoproject.org>, Bryan Brattlof <bb@ti.com>
Subject: [dunfel PATCH v2] k3conf: update SRCREV to add j721S2 fixes
Date: Tue, 19 Jul 2022 14:59:40 -0500
Message-ID: <20220719195940.15129-1-bb@ti.com>
X-Mailer: git-send-email 2.17.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; h=from:subject;
 bh=WmUjDp02oI+39sbXPkoKwrEf65FaJjIOS3np8tyiWKQ=;
 b=owEBbQGS/pANAwAKAcD4q9PiE9cMAcsmYgBi1w0myKZ9hnJFWoaPjaEIUtGKdfpbFz2vLgmgRHuX
 OoeLsR2JATMEAAEKAB0WIQT86LDvkHWcjT+1Kb7A+KvT4hPXDAUCYtcNJgAKCRDA+KvT4hPXDFOJB/
 0YNK+gxigJvFa+2zPqKDi8NPHSh++6dVeoGOvJg81bYFaZICDBl+stCu1cDqEP26z2tS/lMc0CT4XU
 F4VDNwLQCjnXk5CAlx3pIDkU30hZHQUOxvPOycnxqmFXGQMKaGG3JA2sSPKcYjkmxgRueGEVFTrZNL
 xy8tnlHn2LFLX00NqyUJ41tZD0ALg6Jv80CAM9B5YlC36sTKHaTx4LDqO9/S3vDSO3DnxYS+A+ftTI
 oyIJxcZ18xzKyUepmHhNn4fUxCchJz2dDNmrPstfMtXLaV+hRBGtORu6/KNBb4/erQecDUQDOtHaEo
 DOL8hcrnHVCR3lup8lGjAsFELhN+Px
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:00:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14884

update the SHA for k3conf to pickup the j721s2 fixes

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes from v1:
 - send a separate patch for each branch to avoid merge conflicts
 - include the mailing list in the email :(

 recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
index af48337f5cb4d..567e8d55b51ba 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "4ca1c3d330bc1de779909e733483b09a1fc4fe44"
+SRCREV = "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
 
 SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1


