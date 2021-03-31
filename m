Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.533.1617235062086356196
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=M7F0KA2F;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvep8110370;
	Wed, 31 Mar 2021 18:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235060;
	bh=UOzwfTVQdOUe5eXO3yubMlFT7R6ZG8EwCFgU3DKlF3w=;
	h=From:To:CC:Subject:Date;
	b=M7F0KA2FdmG552wEOI5mimv0PIqDHsf2L+tQP8MGEwptzNscaFql1yItHpP4YAoyg
	 NSb8mnkgCfvOgpO/px9l/xaWXYVe2kFlmsGsFsRWC0U2MyJKnlmnzGyf4/OgAdmvgk
	 fHJ2t0m6jAWILR/q1+f6hFkzjEsgv1oH5fdthCA4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNveQv001462
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:40 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvdm6089323;
	Wed, 31 Mar 2021 18:57:39 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH V2 0/7] conf/machine: k3: cleanup wic files
Date: Wed, 31 Mar 2021 18:57:28 -0500
Message-ID: <20210331235736.30481-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi,

	V2 of the series.

lets help cleanup the wic files generated for K3 platforms. This
includes setting up a reusable boot image pattern that we can use, also
generates the bmap file that bmaptool can use and while at it finally
generate bootable images for j7200 and am64 which depend on
multi-certificate images for boot.

Updates:
 - Additional patch to drop the tf-a dependency (review comments)
 - Additional documentation where applicable (review comments)
 - Picked up reviewed-by from Denys where applicable

V1: https://lists.yoctoproject.org/g/meta-ti/message/13602

Nishanth Menon (8):
  conf/machine: k3: Add multi-certificate boot image support
  conf/machine: am65xx: Document boot images as legacy mode
  conf/machine: j7: Document boot images as legacy mode
  conf/machine: am64xx/j7200: Drop trusted-firmware deployment for tar
    wic
  conf/machine: j7200-evm: Switch to multi-certificate boot images
  conf/machine: am64xx: Consolidate image configuration to SoC include
  conf/machine: am64xx: Switch to multi-certificate boot images
  conf/machine: k3: Lets build bmap files by default

 conf/machine/am64xx-evm.conf    | 8 --------
 conf/machine/am64xx-sk.conf     | 8 --------
 conf/machine/include/am64xx.inc | 6 ++++++
 conf/machine/include/am65xx.inc | 2 ++
 conf/machine/include/j7.inc     | 2 ++
 conf/machine/include/k3.inc     | 8 ++++++--
 conf/machine/j7200-evm.conf     | 6 ++----
 7 files changed, 18 insertions(+), 22 deletions(-)

-- 
2.31.0

