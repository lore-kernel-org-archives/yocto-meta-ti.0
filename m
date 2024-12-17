Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCC4E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 17:24:29 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.87049.1734456259624901743
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 09:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W21VDntM;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHHOGfa035746
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 11:24:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734456256;
	bh=qU4ta0m7AA+ldNXWYlnmeJ6MNS2fkgHu6q1DuzVKpGU=;
	h=From:To:Subject:Date;
	b=W21VDntMguPjszFmX+YRMafBx688Aim4NKp/XsEL1rd4eWc+0JrwxsShmx70IgTE3
	 gCm6paoSWX7X3XycnAu6rF23Wqiobnd/czuvMDqOh1GHvNVe1+h6BVElEIeRwTMlId
	 0lMNAhZBpmQfSyjSMwtQ9dFoj99rMc87a8+txseI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHHOG5J082773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 11:24:16 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 11:24:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 11:24:16 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHHOGI0126837;
	Tue, 17 Dec 2024 11:24:16 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tNbIu-000890-1V; Tue, 17 Dec 2024 11:24:16 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] meta-beagle: Add SECURITY file
Date: Tue, 17 Dec 2024 11:24:16 -0600
Message-ID: <20241217172416.31267-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2024 17:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18125

Add missing SECURITY file required by yocto-check-layer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 {meta-ti-bsp => meta-beagle}/SECURITY | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 copy {meta-ti-bsp => meta-beagle}/SECURITY (100%)

diff --git a/meta-ti-bsp/SECURITY b/meta-beagle/SECURITY
similarity index 100%
copy from meta-ti-bsp/SECURITY
copy to meta-beagle/SECURITY
-- 
2.17.1


