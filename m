Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.7986.1616729987038003256
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 20:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GBXlH521;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12Q3dkmG073161;
	Thu, 25 Mar 2021 22:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616729986;
	bh=44jAPM4HCJJVJxMwBAWcLP7jPTkc7WOqo8/e531CLag=;
	h=From:To:CC:Subject:Date;
	b=GBXlH521YT5VqWcAsUQAAnYwJeL5f5UDUASI4onWbI71p0AMRizwQKzRhB4/EKp0Z
	 ElOAdLI20ol6ECv6/rjacG/nZPA+y2y3NaIALzhpZMHdm07xcCM5jy79u2TMfFvnNq
	 fjR4pbgNTvzMjMhOHjFj5Gy0fBllG3OEygHG66iM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12Q3dkNN098137
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Mar 2021 22:39:46 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 25
 Mar 2021 22:39:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 25 Mar 2021 22:39:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12Q3dj6P113538;
	Thu, 25 Mar 2021 22:39:45 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Nishanth Menon <nm@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>
Subject: [dunfell/master PATCH v2] trusted-firmware-a: am64xx: fix target board name
Date: Thu, 25 Mar 2021 22:39:45 -0500
Message-ID: <20210326033945.15324-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

am64xx is the first generation of k3 device that uses
a updated board defintion as "lite" platform.[1]

This patch fixes the TFA board to appropriate target as
"lite" instead of "generic" for am64xx.

[1]: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=84af89563e1b17def844d3672bc601ae51f0257f

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/k3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index c727d724..a96ebb76 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -28,6 +28,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 TFA_PLATFORM = "k3"
 TFA_BOARD = "generic"
+TFA_BOARD_am64xx = "lite"
 
 MACHINE_GUI_CLASS = "smallscreen"
 
-- 
2.17.1

