Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0713C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 08:29:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19573.1704443366581178646
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 00:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xKJbGH3I;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4058TQQX057998
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:29:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704443366;
	bh=Q3Zl8Aq6Ytc3qJtRkQkuxSakzxoj2o+pGEIW4tsXNS0=;
	h=From:To:CC:Subject:Date;
	b=xKJbGH3ItrAfNmC3hAaEV0ZC4a5gA7+GY078T8I0cd5FyKmlWOhnsNub95PM9x7tL
	 GrMydPZcXlIEPkoR8067UP0GHwRMni8/gSkzpz6vaL4uYN6EnekFmrvBeK4HY6t1sR
	 CGMWN7X4W7yagAB7y/Fa+32BJfTUdByPggx+UVdw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4058TQNB116145
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:29:26 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 02:29:25 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 02:29:25 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4058TNS3114539;
	Fri, 5 Jan 2024 02:29:24 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-nandan@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/2] powervr: Add j722s support and update preferred provider
Date: Fri, 5 Jan 2024 13:58:42 +0530
Message-ID: <20240105082844.879372-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 08:29:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17378

Darren Etheridge (2):
  meta-ti: powervr: add j722s support
  meta-ti-bsp: j722s: add Rogue GPU driver to machine defintion

 meta-ti-bsp/conf/machine/include/j722s.inc                   | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb      | 5 +++--
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb       | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.34.1


