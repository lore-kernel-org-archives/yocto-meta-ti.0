Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C05C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:39:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6060.1658839174653830228
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 05:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=buPVsQob;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdWRa079752;
	Tue, 26 Jul 2022 07:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658839172;
	bh=KNF2t0IYtgRgENYHXNT4Y4GwJvNcEsAyY5eBFXmaGrg=;
	h=From:To:Subject:Date;
	b=buPVsQobo3DqWTIA1Yu0c7YbiJHkaeqqi5IwQPg1St0EXgYdXC8jtMUIk8YH4vRlX
	 /9VHZ30vCa4NcBnIwrx7IWGyqhZ57CvnR6FRXccT8+y6YcJ8lOmE1y1agY4lxM8Fch
	 DgGo2iSgWtoXow2itaZA+uxp12sSQoZ0ALc6E6lE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QCdWIx024652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 07:39:32 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 07:39:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 07:39:32 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdWMo022810;
	Tue, 26 Jul 2022 07:39:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oGJqW-0005Gn-48; Tue, 26 Jul 2022 07:39:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Update to 08.04.00.005
Date: Tue, 26 Jul 2022 07:39:29 -0500
Message-ID: <20220726123932.20216-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Jul 2022 12:39:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14905

Update u-boot, linux and linux rt to 08.04.00.005 tag

Ryan Eatmon (3):
  u-boot-ti-staging: Bump to 08.04.00.005 release
  linux-ti-staging: Bump to 08.04.00.005 release
  linux-ti-staging-rt: Bump to 08.04.00.005 release

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1


