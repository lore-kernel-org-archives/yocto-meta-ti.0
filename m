Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE541C43217
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 19:59:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.858.1650563814196426705
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 10:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KUm3Gygs;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23LHuqUU029857;
	Thu, 21 Apr 2022 12:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650563812;
	bh=iWFJgVl3rg72vGPnD8O5FBv28lusCyA2EZMkkJWeMaU=;
	h=From:To:Subject:Date;
	b=KUm3GygsligJ0l5Ig+AtvvdOkiRRFiKEEi/DIwX6nfc7NiSjik/+P/RhFKW95hkML
	 pIOGT0e2wZab5QR3pXZ5s8QkZuzMGn79gI4Z9SqyQX4CLqwvoGuGX4VWKepmMUb6Hy
	 /NLnGv+Us9w0TkPglkMPdkeTs7H2BQH4vlamo3vs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23LHuqif069651
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Apr 2022 12:56:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Apr 2022 12:56:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Apr 2022 12:56:52 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23LHuqNM052996;
	Thu, 21 Apr 2022 12:56:52 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nhb2x-0007wV-Qe; Thu, 21 Apr 2022 12:56:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Update to 08.03.00.001
Date: Thu, 21 Apr 2022 12:56:48 -0500
Message-ID: <20220421175651.30494-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Apr 2022 19:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14612

Update u-boot, linux and linux rt to 08.03.00.001 tag

Ryan Eatmon (3):
  u-boot-ti-staging: Bump to 08.03.00.001 release
  linux-ti-staging: Bump to 08.03.00.001 release
  linux-ti-staging-rt: Bump to 08.03.00.001 release

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1


