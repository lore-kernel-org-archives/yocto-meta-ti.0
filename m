Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.6174.1598417790718930792
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 21:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NsXzEQm9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: lokeshvutla@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07Q4uTgT074213
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 23:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598417789;
	bh=Z8eg1j/YK/K5IE6F72MuIcpVLtRkoLVNCwY/kmrDsek=;
	h=From:To:CC:Subject:Date;
	b=NsXzEQm9/driEJBpzLRKnYzC1KyMpl8qDPQjxrhZ6cocVWsa1QWdeLHJoBXpaNfUK
	 1uf0+shTGuzc6PmqjAseGJRPt/8Dh9DPzv4dVabbu6DjS0GZ1zWmmbvMXvssE8zHro
	 LQq39HFYki7tR5/0WovCwcnzPhhXFf+igpzqti30=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07Q4uTsQ062956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 23:56:29 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 23:56:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 23:56:28 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07Q4uQig093597;
	Tue, 25 Aug 2020 23:56:26 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 0/3] prueth: Update all prueth firmwares
Date: Wed, 26 Aug 2020 10:26:22 +0530
Message-ID: <20200826045625.19492-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the following firmwares to latest version:
- Prueth dual emac
- Prueth switch firmware
- Prueth HSR firmware
- Prueth PRP firmware

Also change the recipe to pick the dual emac and swith firmwares from
ti-linux-firmware repos.

Re-sending this series after subscribing to lists.yoctoproject.org
as the previous post was rejected.

Changes since v1:
- Dropped duplicate PV from hsr/prp recipes
- Used SUMMARY instead of DESCRIPTION

Lokesh Vutla (3):
  prueth-hsr/prp: Update hsr/prp firmwares to latest
  prueth-fw: Package the firmware images from ti-linux-firmware
  prusw-fw: Package the firmware images from ti-linux-firmware

 recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb      | 37 +++++++++++++++
 recipes-bsp/prueth-fw/prueth-fw_git.bb        | 47 -------------------
 ...{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} |  5 +-
 ...{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} |  5 +-
 recipes-bsp/prusw-fw/prusw-fw_3.0.3.bb        | 37 +++++++++++++++
 recipes-bsp/prusw-fw/prusw-fw_git.bb          | 40 ----------------
 recipes-kernel/linux/linux-ti-staging_5.4.bb  |  1 -
 7 files changed, 80 insertions(+), 92 deletions(-)
 create mode 100644 recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
 delete mode 100644 recipes-bsp/prueth-fw/prueth-fw_git.bb
 rename recipes-bsp/pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} (93%)
 rename recipes-bsp/pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} (93%)
 create mode 100644 recipes-bsp/prusw-fw/prusw-fw_3.0.3.bb
 delete mode 100644 recipes-bsp/prusw-fw/prusw-fw_git.bb

-- 
2.23.0

