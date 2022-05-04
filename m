Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A893C433FE
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 23:49:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4848.1651708174831245877
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 16:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rx46/S7E;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244NnU28073238;
	Wed, 4 May 2022 18:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651708170;
	bh=kx29PKMl6ycXQBvUOCc9dk7jRZsAwFNCXkMd8gmD0jY=;
	h=From:To:CC:Subject:Date;
	b=rx46/S7EjMLcwr7xnmtMdhK95E1bYAFPsIpowU/lREvj6gf06oG9KhOhrpkNUpAkk
	 qvDqgOl3zbSgq+LE21er7KUq5R9fMKPY5N0F/CcwA/h0E7DdjLwGRL4T23ULYOB+3J
	 DQuva9c6bPj2mPErIfGAXKAAsgBTaEHeowjsq31A=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244NnUtC119154
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 18:49:30 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 18:49:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 18:49:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244NnUCQ108312;
	Wed, 4 May 2022 18:49:30 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Dave
 Gerlach <d-gerlach@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell PATCH v2 0/2] am62xx: Upgrade ATF to get LP support
Date: Wed, 4 May 2022 18:49:28 -0500
Message-ID: <20220504234930.6508-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 23:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14699

This series upgrades ATF to current master which is 2.6+.
This gets much needed AM62 Low power mode feature.

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


