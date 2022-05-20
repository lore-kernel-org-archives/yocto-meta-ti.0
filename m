Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9FBC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 18:28:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.927.1653071296969121188
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 May 2022 11:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sl28l/uC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24KISBok058655;
	Fri, 20 May 2022 13:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653071292;
	bh=ZKyCn3r/PfMiCbZHDWS82OqBq8c3yiJWrRHXxvrChYU=;
	h=From:To:Subject:Date;
	b=sl28l/uCrEx75x7sMgc858/VxZKEeBua8sN4HfYyVDFP5BeS5vms/zkFfLP0aMh1J
	 Dws7fn/Z1/Ntroouy2DXrobDNIGcdiNGKlr9/dQqkn/BWgAlUsunQlDGmXTfpE+rVz
	 ZKotO44q6bSCFXhQynTWVjVxbNfLARV9+SdymEH0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24KISBnj074862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 May 2022 13:28:11 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 20
 May 2022 13:28:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 20 May 2022 13:28:11 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24KISBv3114351;
	Fri, 20 May 2022 13:28:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ns7MB-0006La-FF; Fri, 20 May 2022 13:28:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to 08.03.00.005
Date: Fri, 20 May 2022 13:28:07 -0500
Message-ID: <20220520182811.24357-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 May 2022 18:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14750

Update u-boot, linux, linux rt and ti-linux-fw to 08.03.00.005 tag

Ryan Eatmon (4):
  u-boot-ti-staging: Bump to 08.03.00.005 release
  linux-ti-staging: Bump to 08.03.00.005 release
  linux-ti-staging-rt: Bump to 08.03.00.005 release
  ti-linux-fw: Bump to 08.03.00.005 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1


