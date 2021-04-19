Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1161.1618867004696784924
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 14:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BGcT+8Vm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGh9x043818;
	Mon, 19 Apr 2021 16:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618867003;
	bh=yW2vdW6z45grXJypC1Yeda4wFp9vqw9TXWgHaAQpEck=;
	h=From:To:CC:Subject:Date;
	b=BGcT+8Vm9rceyIOjo4I7rU9VO8H1KB6KCrdeGlhs2S8EtlfocU8YwiBPFeW38TmlA
	 0IpwLQb8U3hTHO6PVEF4pdeNp/0fPHb2WS5yAT/KILa5hvDRoTEjOtkIRzlsWwqgE1
	 z2cNblYebZHaSvSEq3LWpJ0NxIMVq5wRNODH4GNk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JLGh0k092650
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 16:16:43 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 16:16:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 16:16:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGh5O086754;
	Mon, 19 Apr 2021 16:16:43 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v3 0/8] Remove non-existent dtb/o from 5.10.y
Date: Mon, 19 Apr 2021 16:16:35 -0500
Message-ID: <20210419211643.3942-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove non existent ti-linux-5.10.y dtb/o from meta-ti.
Include them back later when the support is added in the integrated
kernel.

Changes from v2:
* updated patch-4 to include keystone-k2g-ice.dtb
* removed missing lcd dt from am57xx and dra7xx platform conf

Changes from v1:
* Squash all j7 non-existent dtb in one patch
* Remove non-existent dtbs from am335x, am437x, k2g platforms

Praneeth Bajjuri (8):
  conf: j7-evm: Remove unavailable dtb/o from 5.10 kernel
  conf: j7200-evm: Remove jailhouse overlay from 5.10 kernel
  conf: am65xx-evm: Remove non-existent dtb* from 5.10
  conf: k2g-evm: Remove keystone-k2g-evm-lcd.dtb from 5.10
  conf: am335x-evm: Remove non-existent dtb* from 5.10
  conf: am437xx-evm: Remove non-existent dtb* from 5.10
  conf: am57xx-evm: Remove non-existent dtb* from 5.10
  conf: dra7xx-evm: Remove non-existent dtb* from 5.10

 conf/machine/am57xx-evm.conf    |  7 -------
 conf/machine/dra7xx-evm.conf    |  9 ---------
 conf/machine/include/am65xx.inc | 11 -----------
 conf/machine/include/ti33x.inc  |  1 -
 conf/machine/include/ti43x.inc  |  4 ++--
 conf/machine/j7-evm.conf        |  4 ----
 conf/machine/j7200-evm.conf     |  1 -
 conf/machine/k2g-evm.conf       |  2 +-
 8 files changed, 3 insertions(+), 36 deletions(-)

-- 
2.17.1

