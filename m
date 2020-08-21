Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.128581.1597995162539758435
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 00:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=j6svlQ98;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: lokeshvutla@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07L7WfF1084536
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 02:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597995161;
	bh=IiyumbPxCK33MPrbglAhDLnX11dRUdbvdD53zVODyVE=;
	h=From:To:CC:Subject:Date;
	b=j6svlQ98Twe2XlrZfa7HxhG0ww29fRYUic7H2vMZLz9dS5jVOioSGIBTz+uL55maR
	 tiqKG7wcmWfqazCIRrRtFIYrXF4ajZlJEXiszb2N8VtVtVxXTV2ygfeKVTTLJXx7HH
	 oL2THJRW8Dgp+GhBDzT3wcGaQK4EsXXz2SB7+/y0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07L7Wf7G031017
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 02:32:41 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 21
 Aug 2020 02:32:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 21 Aug 2020 02:32:41 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07L7Wcag041602;
	Fri, 21 Aug 2020 02:32:39 -0500
From: lokeshvutla@ti.com
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 0/3] prueth: Update all prueth firmwares
Date: Fri, 21 Aug 2020 13:02:35 +0530
Message-ID: <20200821073238.18926-1-lokeshvutla@ti.com>
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

Lokesh Vutla (3):
  prueth-hsr/prp: Update hsr/prp firmwares to latest
  prueth-fw: Package the firmware images from ti-linux-firmware
  prusw-fw: Package the firmware images from ti-linux-firmware

 recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb      | 38 +++++++++++++++
 recipes-bsp/prueth-fw/prueth-fw_git.bb        | 47 -------------------
 ...{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} |  4 +-
 ...{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} |  4 +-
 recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb        | 38 +++++++++++++++
 recipes-bsp/prusw-fw/prusw-fw_git.bb          | 40 ----------------
 recipes-kernel/linux/linux-ti-staging_5.4.bb  |  1 -
 7 files changed, 82 insertions(+), 90 deletions(-)
 create mode 100644 recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
 delete mode 100644 recipes-bsp/prueth-fw/prueth-fw_git.bb
 rename recipes-bsp/pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} (93%)
 rename recipes-bsp/pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} (93%)
 create mode 100644 recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb
 delete mode 100644 recipes-bsp/prusw-fw/prusw-fw_git.bb

-- 
2.23.0

