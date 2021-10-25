Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3638.1635197502769663906
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 14:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eq1LxLXB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVf8c054915;
	Mon, 25 Oct 2021 16:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635197501;
	bh=OqtM2iqK5BV2bzMnzmbrqiiwZWuI/MxkTHONGkIn8Xw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=eq1LxLXB3AnB00LEaPSgj7KcXlR+XvPA5Jsx+HXd6DMZ96r7hdZ9rUVE1anVYaU1X
	 pk5MiPuxMk5YJ99clGfh+oEKB7dIFjlDrhzjQjOwG50UCMCDyATzVDIWr+5M0DLklY
	 X4vaA8GA7UQbig5CmrQA5Hu3wHkjQ99wBBVY1EGk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19PLVfZ1042272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Oct 2021 16:31:41 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Oct 2021 16:31:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Oct 2021 16:31:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVfWP073770;
	Mon, 25 Oct 2021 16:31:41 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] linux-ti-staging: Bump to 08.01.00.001 release
Date: Mon, 25 Oct 2021 21:31:40 +0000
Message-ID: <20211025213140.17826-5-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025213140.17826-1-yogeshs@ti.com>
References: <20211025213140.17826-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux version for 08.01.00.001

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 4b34756d..d620b022 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "85ac70d78c4ec6889dec24685ec4cea3bb4d5a59"
+SRCREV = "f22103162c771ddd47372b579682445e6dc8dd0e"
 PV = "5.10.65+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

