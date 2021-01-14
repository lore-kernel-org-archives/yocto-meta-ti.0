Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.288.1610651659998355248
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ppe6clnq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10EJEIC6094569
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Jan 2021 13:14:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610651658;
	bh=R9PF+X7z+rt5igbYfrd65x8V//z71Esj3pfpppfKggs=;
	h=From:To:CC:Subject:Date;
	b=ppe6clnqNP3+AeM+3Oi9ssFNHzowH5k8/0yND/9xB39ID+BO+tASQq0vH39+Nt1QZ
	 J83AuyfiBj2u07Ia6iuOb6JpwdSJ6KJ698Nhg8YdyiWBC+ZWpB90mbGDA2LJ3MdGb0
	 hnxNydQYRPn/2FlGqt2oOz5ncwS7PaNyfjKjaOlo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10EJEIeo126982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Jan 2021 13:14:18 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 Jan 2021 13:14:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 Jan 2021 13:14:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10EJEGXk095776;
	Thu, 14 Jan 2021 13:14:17 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-sci-fw: Update image gen and sysfw to v2020.12
Date: Thu, 14 Jan 2021 13:14:15 -0600
Message-ID: <20210114191415.11467-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update the image gen and linux-firmware commit SHAs so that
am65x, j7200 and j721e also picks v2020.12 sysfw and the applicable
DM update on j7200 and j721e based on 07.02.00.05 tag

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index ae22b7a5..b880e15d 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,12 +3,12 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2020.08b"
+PV = "2020.12"
 PV_am64xx-evm-k3r5 = "2020.12"
 
-SRCREV = "0c268f292f3b3a71d3bd0b367f492304b45e37b1"
+SRCREV = "183b487f02ce48b47df02cfe7ea9579b4c1e280b"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "a4796e5f1304fe8197cba54ccea3d18b9998ff02"
+SRCREV_imggen = "0388c32f31bc4dd57b72a3b5faf3ca7ff4209c79"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

