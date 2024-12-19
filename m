Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCCFE7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:06 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.139691.1734645243990674053
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ptPJB5xe;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3NV066077
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 15:54:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645243;
	bh=ZP9gZqGSYraT2FcfeT4kEYqjx1mnZOvb6tMssrDNwHY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ptPJB5xex98RWLT5JAjswfg/QVs3DKnk4ULFTm0+058e6vXfo4f/O7hNW2yV0HH32
	 GStGb4WX0iu0NFtAFdw5KFBPTnaHP0vSyOi9I2RZj7txJQDQ0z3CFVcaZVI4UnAVwv
	 ivgGKCTuFLWYDDvSNnWBJH98PcMMNP5vpBAJ8vuc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3sl071239
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:02 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs2kH066766;
	Thu, 19 Dec 2024 15:54:02 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT4-0007T1-IA; Thu, 19 Dec 2024 15:54:02 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 01/13] conf/machine: rename beagleplay machine to beagleplay-ti
Date: Thu, 19 Dec 2024 15:53:50 -0600
Message-ID: <20241219215402.28324-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18146

From: Denys Dmytriyenko <denys@konsulko.com>

BeaglePlay is officially supported by TI "ti-6_6" BSP and is part
of the TI-SDK releases. Switching BSP to BeagleBoard.org "bb_org"
settings for the same machine is possible within the same layer.

But having different machine configs for the same machine name in
multiple layers can be confusing and prone to errors. Hence rename
the config to indicate BeaglePlay with official TI support in order
to re-use the canonical name in a separate layer.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../machine/{beagleplay-k3r5.conf => beagleplay-ti-k3r5.conf}     | 0
 meta-ti-bsp/conf/machine/{beagleplay.conf => beagleplay-ti.conf}  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/conf/machine/{beagleplay-k3r5.conf => beagleplay-ti-k3r5.conf} (100%)
 rename meta-ti-bsp/conf/machine/{beagleplay.conf => beagleplay-ti.conf} (100%)

diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
similarity index 100%
rename from meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
rename to meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
similarity index 100%
rename from meta-ti-bsp/conf/machine/beagleplay.conf
rename to meta-ti-bsp/conf/machine/beagleplay-ti.conf
-- 
2.17.1


