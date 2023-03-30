Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D3AC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:24:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.39254.1680211482746998336
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 14:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lQ4QTw8U;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32ULOeUq090589;
	Thu, 30 Mar 2023 16:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680211480;
	bh=LtMaI1WXDFu6Qbvc+Ss4X05n40BY3SCEblQ9SqkzBG4=;
	h=From:To:Subject:Date;
	b=lQ4QTw8UUP3vjK0CkfJ0e+MtWiODQ08iXUceAlYuyzd9ny08i7LtRMlqgEk+XX5D5
	 cqiRSHouSC4go+rq5YSEFg1OCbKejdZbt4uD10XOaYhL0gTfQ97WeFfX2dFymdOsOY
	 acAjQXdc8/IS/b1Yj5N1m4jnRVh3kYCF2tVvmYVk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32ULOeY8112942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Mar 2023 16:24:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 30
 Mar 2023 16:24:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 30 Mar 2023 16:24:40 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32ULOem6015948;
	Thu, 30 Mar 2023 16:24:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1phzlA-00054G-5a; Thu, 30 Mar 2023 16:24:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 0/4] Sync up from dunfell
Date: Thu, 30 Mar 2023 16:24:36 -0500
Message-ID: <20230330212440.19437-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 21:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16258

These changes were made to bring us to a stable sync up point with
dunfell.  Everything (that can) can be built and boot.  From these
patches things will begin to diverge as we start our LTS mirgration to
Linux v6.1 and U-boot 2023.04.

Ryan Eatmon (4):
  u-boot-ti-staging: Fix u-boot configs to match oe-core fitImage
  trusted-firmware-a: Only sign files for platforms that support it
  optee-os: Only sign files for platforms that support it
  kernel-fitimage: Add signing of fitImage entries for 5.10 kernel

 .../classes/kernel-fitimage-ti-u-boot.bbclass | 214 ++++++++++++++++++
 .../trusted-firmware-a_%.bbappend             |  40 +++-
 ...e-to-support-oe-core-fitImage-naming.patch | 144 ++++++++++++
 .../u-boot/u-boot-ti-staging_2021.01.bb       |   8 +-
 .../linux/linux-ti-staging_5.10.bb            |   2 +
 .../optee/optee-os_3.16%.bbappend             |  44 +++-
 6 files changed, 448 insertions(+), 4 deletions(-)
 create mode 100644 meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch

-- 
2.17.1


