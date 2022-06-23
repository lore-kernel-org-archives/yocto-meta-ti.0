Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484BBCCA47E
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 14:41:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8249.1655995301576873469
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 07:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U7rG6zUg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25NEfeEV013268;
	Thu, 23 Jun 2022 09:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655995300;
	bh=Rk+lWFlY1IarE3EZuVnUWwhJMZL25cQKSDyIuUXUfSE=;
	h=From:To:Subject:Date;
	b=U7rG6zUgfCson3GnlKE0HU7/6InJeDiYIUAl8OsyRHyBg6B0iZ1DMILypgx3OOCKq
	 xoEGjcJ/W4AR0KUxCJwYlp0QnHms0mdhj/9L/lor5KDkHpvaEMnrixItwlFa4Jggie
	 KeisCxvHzG8KxCt9wST+9ZAocImEPBRalvJ6xNNA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25NEfexx018033
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jun 2022 09:41:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Jun 2022 09:41:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Jun 2022 09:41:39 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25NEfd1i101261;
	Thu, 23 Jun 2022 09:41:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o4O1b-0004ts-Nd; Thu, 23 Jun 2022 09:41:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to 08.04.00.002
Date: Thu, 23 Jun 2022 09:41:35 -0500
Message-ID: <20220623144139.18799-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jun 2022 14:41:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14837

Update u-boot, linux, linux rt and ti-linux-fw to 08.04.00.002 tag

Ryan Eatmon (4):
  u-boot-ti-staging: Bump to 08.04.00.002 release
  linux-ti-staging: Bump to 08.04.00.002 release
  linux-ti-staging-rt: Bump to 08.04.00.002 release
  ti-linux-fw: Bump to 08.04.00.002 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1


