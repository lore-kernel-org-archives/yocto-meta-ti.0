Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E843CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:41:12 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.28558.1656610871889043171
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VTeFrLgd;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UHf902004655;
	Thu, 30 Jun 2022 12:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656610869;
	bh=1f/bjMEpkWFpfGqaL9E2jtguuBzpXUcB3jgOD73WaEY=;
	h=From:To:Subject:Date;
	b=VTeFrLgdQEfkOaOvzfzbrjfLh3jTVTFrD9n9zlqHpWcHZKkKtLzngMTW4rHsVFaf5
	 7Z1MvVZTmOXitIrjuX4RjqX44TyFmu+owTq6c04cpztoAmNJZB25zfnoM3ggh7tUju
	 kGs6l75cfG+3oMtJ85gH1Iz4bft+qvx2FBvk52qQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UHf91D086627
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 12:41:09 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 12:41:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 12:41:08 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UHf8Qm108408;
	Thu, 30 Jun 2022 12:41:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6yA8-0002r2-MB; Thu, 30 Jun 2022 12:41:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 0/3] Update to 08.04.00.003
Date: Thu, 30 Jun 2022 12:41:05 -0500
Message-ID: <20220630174108.10935-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 17:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14857

Update u-boot, linux and linux rt to 08.04.00.003 tag

v2: Rebased

Ryan Eatmon (3):
  u-boot-ti-staging: Bump to 08.04.00.003 release
  linux-ti-staging: Bump to 08.04.00.003 release
  linux-ti-staging-rt: Bump to 08.04.00.003 release

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1


