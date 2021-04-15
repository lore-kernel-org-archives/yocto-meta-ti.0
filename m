Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2937.1618463468454317918
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 22:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FJjV5UY3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B6pl119565;
	Thu, 15 Apr 2021 00:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618463466;
	bh=MVpU9wdPX24z82rSykzoT1y4l20LMrwkjhflljyOlC0=;
	h=From:To:CC:Subject:Date;
	b=FJjV5UY3291QY6ztuFdJGeB0JJvHWuEtBnnvLs2qdp8hPs9eZFJxOyYmVViXA1gOw
	 F9JabUmFTivD2JxM46PohOfBPKP8SqV432D+N4cByVKWEvaYVtUqJNj2GZYzI7vPlO
	 32E1UfLYZNoyMiFN9ePGBXHm/BpH+bl5pzrV8wew=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13F5B5mQ114868
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 00:11:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 00:11:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 00:11:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B5SU050017;
	Thu, 15 Apr 2021 00:11:05 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 0/6] am65x/j7*: Remove non-existent 5.10.y dtb*
Date: Thu, 15 Apr 2021 00:10:59 -0500
Message-ID: <20210415051105.1626-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

The current ti-linux-5.10.y integration branch doesnt have support for
non base board dtb/o form the primary latest processor board on am65 and
j7* evms yet.

Removing these dtb/o for enabling the builds to continue.
Plan to add these blob and overlays back once the equivalent support is
added in the integrated ti-linux-5.10.y kernel.

Praneeth Bajjuri (6):
  Revert "conf: j7-evm: Add jailhouse dtbo"
  Revert "j7-evm: add new k3-j721e-proc-board-tps65917.dtb"
  Revert "j7-evm: add new infotainment DTBO file"
  Revert "j7-evm: add k3-j721e-pcie-backplane.dtbo"
  Revert "conf: machine: j7200-evm: Add Jailhouse overlay"
  conf/machine: am65xx: Remove non-existent dtb* from 5.10

 conf/machine/include/am65xx.inc | 11 -----------
 conf/machine/j7-evm.conf        |  4 ----
 conf/machine/j7200-evm.conf     |  1 -
 3 files changed, 16 deletions(-)

-- 
2.17.1

