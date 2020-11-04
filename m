Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.17065.1604514621424795119
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Nov 2020 10:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n8JcdN/t;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1B9A138C06B0
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2020 10:30:21 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A4IUKlL027231
	for <meta-ti@yoctoproject.org>; Wed, 4 Nov 2020 12:30:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604514620;
	bh=ThZicTHRBxORzDvvcggcIUY57eyyfsfMQl7qUC5wwPs=;
	h=From:To:CC:Subject:Date;
	b=n8JcdN/tbaXo624N7hB3J7I2+LDhoSB6aAY+jXH6Z2fF1P9eD4J7Ui2ua4qgaZCv8
	 XFVu6MRRPhNaHiF1yPS45iZxWlxeEUe/FsIW13RhkEw+ZZd1pkQ6Tk84NoTFiK5Yhu
	 40SVCHj8k9UaZNvo8AE0bAjkjIT8JN1yGM2i8HzA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A4IUKBF025550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 4 Nov 2020 12:30:20 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 4 Nov
 2020 12:30:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 4 Nov 2020 12:30:20 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A4IUI4g059649;
	Wed, 4 Nov 2020 12:30:18 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <dmurphy@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH] recipes-devtools: k3conf: Update SRCREV to latest
Date: Thu, 5 Nov 2020 00:00:15 +0530
Message-ID: <20201104183015.19365-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Use latest SRCREV on master branch.
This adds support for resource management commands

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
index 52c2fcf6..6771eeb7 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV = "0.1+git${SRCPV}"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "9199c3a3b6ec5603a2c4283410b4761e79e81e82"
+SRCREV = "246eb4092d7d111ce10e0a310b9bde678b97ab36"
 
 SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1

