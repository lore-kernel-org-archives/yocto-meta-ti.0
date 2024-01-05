Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945F0C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 08:33:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19608.1704443611754972754
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 00:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TOIqFQfz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4058XVpr059009
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:33:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704443611;
	bh=Q3Zl8Aq6Ytc3qJtRkQkuxSakzxoj2o+pGEIW4tsXNS0=;
	h=From:To:CC:Subject:Date;
	b=TOIqFQfzud1NwMdcZourDDOgcLHJbh9GGX2iqSz6+ptNeUKPww+atRLnyRylsIfDQ
	 K2N3OsBGRaSIay19meiErUclGlkxulIRghcFGnRde/9knojKwne/DoV1LbU6naclDH
	 yO8rRxy9L74d9zNbAtg9Epp/XL42mv47Hjyfy1Rk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4058XVJH034860
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:33:31 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 02:33:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 02:33:30 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4058XTUU115665;
	Fri, 5 Jan 2024 02:33:29 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master][PATCH 0/2]  powervr: Add j722s support and update preferred provider
Date: Fri, 5 Jan 2024 14:03:22 +0530
Message-ID: <20240105083324.879907-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 08:33:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17381

Darren Etheridge (2):
  meta-ti: powervr: add j722s support
  meta-ti-bsp: j722s: add Rogue GPU driver to machine defintion

 meta-ti-bsp/conf/machine/include/j722s.inc                   | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb      | 5 +++--
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb       | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.34.1


