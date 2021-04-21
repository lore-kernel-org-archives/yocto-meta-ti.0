Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.3094.1619038408501512674
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 13:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jMlqrIyI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrR06079756;
	Wed, 21 Apr 2021 15:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619038407;
	bh=NixobY78uKaFvm9oDqjH0hXLIMsPgI9VxX70j66NLi4=;
	h=From:To:CC:Subject:Date;
	b=jMlqrIyIN2lhwKzd1/km7IXA3svDwILgCQ4JW+hRkVrpK5aU9YYBN/BEFwKln6GDe
	 qJN+saXD/1nkLqI+J07wyAC8xSY6uy2ccbCH8X41D8GXM2YIBD2Sx+AJJzNOdQnCDU
	 hZ6+kxgAG18L577GmI6B1XDmj6g1IjahWFe7fyjQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13LKrRvk112079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Apr 2021 15:53:27 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Apr 2021 15:53:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Apr 2021 15:53:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrQYL012338;
	Wed, 21 Apr 2021 15:53:26 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Suman Anna <s-anna@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Nishanth Menon
	<nm@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 0/4] K2/AM3/AM4 Build fixes for 5.10
Date: Wed, 21 Apr 2021 15:53:22 -0500
Message-ID: <20210421205326.22047-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This series updates few recipes to latest SRCREV which
contains build fixes for 5.10 kernel.

Note: uio-module-drv has not been maintained for a long time,
hence the fix is carried in the recipe folder as a *.patch instead of
the git repo.

Praneeth Bajjuri (4):
  cmem: Update to new version 4.20.00.00
  gdbc6x: bump SRCREV for kernel 5.10 build fix
  dsptop: bump SRCREV for kernel 5.10 build fix
  uio-module-drv: Build fix for linux kernel 5.10

 recipes-bsp/cmem/cmem.inc                     |  6 ++--
 recipes-bsp/dsptop/dsptop.inc                 |  4 +--
 recipes-bsp/uio-module-drv/uio-module-drv.inc |  7 +++-
 ...Replace-ioremap_nocache-with-ioremap.patch | 35 +++++++++++++++++++
 recipes-devtools/gdbc6x/gdbc6x.inc            |  4 +--
 5 files changed, 48 insertions(+), 8 deletions(-)
 create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch

-- 
2.17.1

