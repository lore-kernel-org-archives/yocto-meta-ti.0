Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C15BCCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 20:10:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2182.1654719032176946047
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 13:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sk8itau4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 258KAU2i058957;
	Wed, 8 Jun 2022 15:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654719030;
	bh=Ut+8iieMYiIBaUwCY++jLpoAkmwoWnOLM2Gx1My7iAk=;
	h=From:To:CC:Subject:Date;
	b=sk8itau4rxZccE3sjwNAiaV8wmlL+i8SpSrTkvvcF1lJV8/fMl2lnYszVQ7x8bDWA
	 +wJJyrBEM3cY4BUB2HQN0WsgZAxnmOJDYtJZrFr2xKpQL4FLQ/MCnCl1qQNTxVu8Ai
	 b/BVj0/Keis2FEXGsG76nSSf6+k0TTyMxy+2SLrA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 258KAUl1099480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jun 2022 15:10:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Jun 2022 15:10:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Jun 2022 15:10:30 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 258KAT9v027426;
	Wed, 8 Jun 2022 15:10:29 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH v3 1/2] trusted-firmware-a: Update to latest
 upstream master
Date: Wed, 8 Jun 2022 15:10:28 -0500
Message-ID: <20220608201029.29851-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 20:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14807

For TF-A we work against upstream first, our fork has only been
used in the rare cases we need to ship a feature before we can
get it upstream. This is not currently the case so lets switch
to upstream repo until there is a need for our fork.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 68bfa899..207f3dac 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,8 +1,6 @@
 PV_k3 = "2.6"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-BRANCH_k3 = "ti-atf"
-SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
+SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.36.1


