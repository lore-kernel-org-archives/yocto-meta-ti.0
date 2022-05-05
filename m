Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17F7C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 01:30:21 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.5789.1651714211897051047
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 18:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zRJ7P+4s;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2451U7nr086064;
	Wed, 4 May 2022 20:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651714207;
	bh=pXv9qDiBRFGCEsnKRd1Ht6raamHaxb1ExfhHI/6AohA=;
	h=From:To:Subject:Date;
	b=zRJ7P+4sb1vxy/nty9SNjriqN2cQXB/j9w2Pk3bAjG7FZkZFRA6RjV1tbrl9pjZxW
	 jTppuwMS97jf6eRqBz20YaidnSxQRscUl1yr52zJqljaJQyOkwCuiGLvjSClxmFVox
	 g1fYpCDpYfr5xNe+Lyd02K+3RzW4ieCfLa+F5ykk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2451U7ZP128925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 20:30:07 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 20:30:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 20:30:07 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2451U7Ef042203;
	Wed, 4 May 2022 20:30:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmQJi-00074V-K2; Wed, 04 May 2022 20:30:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v3 0/2] am62xx: Upgrade ATF to get LP
 support
Date: Wed, 4 May 2022 20:30:04 -0500
Message-ID: <20220505013006.27140-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 01:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14704

This series upgrades ATF to current master which is 2.6+.
This gets much needed AM62 Low power mode feature.

Changes in v3:
* Fixed the build flag patch as commented by Denys Dmytriyenko
Changes in v2:
* Fixed the build flag patch as provided by Nishanth Menon
* updated RFC patch sent earlier to move from ti-atf-next to ti-atf

Nishanth Menon (1):
  conf/machine: am62xx: Update build flag for low power mode

Praneeth Bajjuri (1):
  trusted-firmware-a: upgrade to v2.6+

 conf/machine/include/am62xx.inc                              | 2 ++
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.17.1


