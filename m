Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7397.1619583948537735868
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 21:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h67uzoJ6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13S4PlNr004100;
	Tue, 27 Apr 2021 23:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619583947;
	bh=3+hVj7/ECIlFSrhAmkl4ByhZu2UJV/akfB58+06rXvk=;
	h=From:To:CC:Subject:Date;
	b=h67uzoJ6kTuHBJ8oCqLcVEWOiGQWNNsXUO2QfCSsv+qR1nn+ZhU+ysis1173JUlla
	 KSVMAhfGslXKIGS+ioVtzSyX57s5j3urwfsb8UoeIVAMA8gYDgYKbCzynHODWEBLAB
	 jUbtt2j0NXbmOAPAuVJbgihrQVLc0/uvrsSDDMRo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13S4PlaV122579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 23:25:47 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Apr 2021 23:25:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Apr 2021 23:25:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13S4PkYE124496;
	Tue, 27 Apr 2021 23:25:46 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/3] ti-sci-fw: Update image gen and linux-firmware to latest
Date: Tue, 27 Apr 2021 23:25:34 -0500
Message-ID: <20210428042536.6478-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

update image gen and linux-firmware projects to latest commit

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 7e7e11f3..72430ab6 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2021.01a"
 
-SRCREV = "306e8b92bcce0fe88b494732c0a614079f8ff73a"
+SRCREV = "34062b5670aac524ce3074b184ef2ef62daafca0"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "a6b09643aa1acbcfa59bd2c1c080e3ad6c9e8074"
+SRCREV_imggen = "7b6f3832af6d334d335309d66d206ab829765c0e"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

