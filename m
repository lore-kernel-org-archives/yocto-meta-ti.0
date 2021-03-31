Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.285.1617209500493145908
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pct2K3+N;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYpR077620;
	Wed, 31 Mar 2021 11:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617209494;
	bh=WF0c6E5UMyn/xJ1OVBBXvTHpBvbpAzpIlPxOoHyt74M=;
	h=From:To:CC:Subject:Date;
	b=Pct2K3+NKCgCPOvi8tTP9K83lghaUI7uY2cLfB4mZp6qPKym0l0UAWnspbX+S5qGz
	 TEXx/H9QaC99ffvCsSIUItGdEq7JA1Ob8wIrdVco8rgA2VGd3Ap9VNqSv+5KPusXN9
	 8TZnkH53adI7f5nE93v483W9ak0xHQvKHJwYczGM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VGpYtQ072179
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 11:51:34 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 11:51:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpY8F085047;
	Wed, 31 Mar 2021 11:51:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH 0/7] conf/machine: k3: cleanup wic files
Date: Wed, 31 Mar 2021 11:51:26 -0500
Message-ID: <20210331165133.3746-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi,

lets help cleanup the wic files generated for K3 platforms. This
includes setting up a reusable boot image pattern that we can use, also
generates the bmap file that bmaptool can use and while at it finally
generate bootable images for j7200 and am64 which depend on
multi-certificate images for boot.

Nishanth Menon (7):
  conf/machine: k3: Add multi-certificate boot image support
  conf/machine: am65xx: Document boot images as legacy mode
  conf/machine: j7: Document boot images as legacy mode
  conf/machine: j7200-evm: Switch to multi-certificate boot images
  conf/machine: am64xx: Consolidate image configuration to SoC include
  conf/machine: am64xx: Switch to multi-certificate boot images
  conf/machine: k3: Lets build bmap files by default

 conf/machine/am64xx-evm.conf    | 8 --------
 conf/machine/am64xx-sk.conf     | 8 --------
 conf/machine/include/am64xx.inc | 7 +++++++
 conf/machine/include/am65xx.inc | 1 +
 conf/machine/include/j7.inc     | 2 ++
 conf/machine/include/k3.inc     | 8 ++++++--
 conf/machine/j7200-evm.conf     | 3 ++-
 7 files changed, 18 insertions(+), 19 deletions(-)

-- 
2.31.0

