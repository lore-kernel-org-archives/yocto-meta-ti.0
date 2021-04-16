Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.4957.1618549564396411974
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 22:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wXfngyGM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13G562H3095356;
	Fri, 16 Apr 2021 00:06:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618549562;
	bh=b+I722c0qZmjGMO44CPh2aGH1fPyKZSek/6EgKvRKNU=;
	h=From:To:CC:Subject:Date;
	b=wXfngyGMid3RUMInc3Zg/9gMhHX1XX+Bim88VIMDv74AhUtxix/vLwS9/OCjL4/KU
	 YiQTyqsyZRe7pB26cPby78VY1D9gkVYJ1qHy98K+VgozEj7+/eYDt/otiyf3brhpwo
	 45Ad/RZyCQoDZ5QszRmKxqzxeoIjyWZ9w+4gC704=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13G5624C077252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 00:06:02 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 00:06:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 00:06:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13G561xA118494;
	Fri, 16 Apr 2021 00:06:01 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2 0/6] Remove non-existent 5.10.y dtb/o
Date: Fri, 16 Apr 2021 00:05:54 -0500
Message-ID: <20210416050600.16593-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove non existent ti-linux-5.10.y dtb/o from meta-ti.
Include them back later when the support is added in the integrated
kernel.

Changes from v1:
* Squash all j7 non-existent dtb in one patch
* Remove non-existent dtbs from am335x, am437x, k2g platforms

Praneeth Bajjuri (6):
  conf: j7-evm: Remove unavailable dtb/o from 5.10 kernel
  conf: j7200-evm: Remove jailhouse overlay from 5.10 kernel
  conf: am65xx-evm: Remove non-existent dtb* from 5.10
  conf: k2g-evm: Remove non-existent dtb* from 5.10
  conf: am335x-evm: Remove non-existent dtb* from 5.10
  conf: am437xx-evm: Remove non-existent dtb* from 5.10

 conf/machine/include/am65xx.inc | 11 -----------
 conf/machine/include/ti33x.inc  |  1 -
 conf/machine/include/ti43x.inc  |  4 ++--
 conf/machine/j7-evm.conf        |  4 ----
 conf/machine/j7200-evm.conf     |  1 -
 conf/machine/k2g-evm.conf       |  2 +-
 6 files changed, 3 insertions(+), 20 deletions(-)

-- 
2.17.1

