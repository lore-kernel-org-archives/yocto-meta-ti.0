Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.4851.1609918067805333886
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 23:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t1K5HtEj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1067RkSR017203
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 01:27:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609918066;
	bh=HTNapA2jqWCdFqn93jZHhGvX4CV0Zv6dkis3wxdMDbg=;
	h=From:To:CC:Subject:Date;
	b=t1K5HtEjCabHWtMJEJkYIAjJtW/uTsG9y9TZsAWNMN9JIoFy+VVE0JK/nA4oMb7uj
	 QNZcsJYd3NAJoAoBJYtI8yzL58Foq0J0CysL002Z4Tpt9rRVFWn/Tm08g5vDLyejcE
	 Z/E0P/SY9we/25Y4GuAWGNWvAKnhzBLyJ/UUTYYk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1067RkGT086177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 01:27:46 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 Jan
 2021 01:27:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 Jan 2021 01:27:46 -0600
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1067Rhnv037873;
	Wed, 6 Jan 2021 01:27:44 -0600
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Dan Murphy <dmurphy@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [dunfell/master] [PATCH 0/4] Update pru firmwares to latest version
Date: Wed, 6 Jan 2021 12:57:39 +0530
Message-ID: <20210106072743.23873-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update all the pru firmwares to latest version

Lokesh Vutla (4):
  prueth-fw: Update prueth dual emac firmware to 5.5.13
  prusw-fw: Update switch firmwares to 3.2.7 version
  pruhsr-fw: Update hsr firmware to 2.17.25
  pruprp-fw: Update prp firmware to 2.17.25

 .../prueth-fw/{prueth-fw_5.3.9.bb => prueth-fw_5.5.13.bb}       | 2 +-
 .../pruhsr-fw/{pruhsr-fw_2.16.24.bb => pruhsr-fw_2.17.25.bb}    | 2 +-
 .../pruprp-fw/{pruprp-fw_2.16.24.bb => pruprp-fw_2.17.25.bb}    | 2 +-
 recipes-bsp/prusw-fw/{prusw-fw_3.1.6.bb => prusw-fw_3.2.7.bb}   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-bsp/prueth-fw/{prueth-fw_5.3.9.bb => prueth-fw_5.5.13.bb} (94%)
 rename recipes-bsp/pruhsr-fw/{pruhsr-fw_2.16.24.bb => pruhsr-fw_2.17.25.bb} (94%)
 rename recipes-bsp/pruprp-fw/{pruprp-fw_2.16.24.bb => pruprp-fw_2.17.25.bb} (94%)
 rename recipes-bsp/prusw-fw/{prusw-fw_3.1.6.bb => prusw-fw_3.2.7.bb} (94%)

-- 
2.30.0

