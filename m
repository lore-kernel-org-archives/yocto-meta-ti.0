Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.61113.1643783685909391804
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Feb 2022 22:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Zt0RxAX5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2126YgmK033245;
	Wed, 2 Feb 2022 00:34:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643783682;
	bh=kBJkUQn0FJghG3zrxmH8+a9D1TGTjFouawfRWsUT5O0=;
	h=From:To:CC:Subject:Date;
	b=Zt0RxAX5F9KWWLrinZ1FHeRBud5ttxLFRd0DBtQTBRAxZO4nhlDuSk74B0q1z0imH
	 ZTWmySrEuQKEitTgfgJW5jbqLitDUgqL1ji+8BjjfS6Vdtp2dUzDgc7xK5y4vxUd9t
	 aCbots+up9w3yFTZfo7lJZ+1TpQeIeevOajHY9Fg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2126YgcD007305
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 00:34:42 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 00:34:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 00:34:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2126YbnN019005;
	Wed, 2 Feb 2022 00:34:37 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>,
        Ryan Eatmon <reatmon@ti.com>
Subject: [dunfell/master PATCH 0/2] Fixes and Upgrades on TIFS/DM
Date: Wed, 2 Feb 2022 00:34:35 -0600
Message-ID: <20220202063437.8036-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This series is to
* upgrade K3-image-gen and ti-linux-firmware to pick latest sysfw
  release v2022.01 which introduces j721s2 platform.
* Revert temp fix carried in meta-ti for HS combined boot flow since
  the patch is now part of k3-image-gen repo.

Praneeth Bajjuri (2):
  ti-linux-fw: Bump up TIFS and DM to v2022.01
  Revert "ti-sci-fw: Fix for k3-image-gen issue for combined boot
    images"

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  8 +--
 ...gning-of-binaries-for-combined-boot-.patch | 64 -------------------
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  5 --
 3 files changed, 4 insertions(+), 73 deletions(-)
 delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch

-- 
2.17.1

