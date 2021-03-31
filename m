Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.492.1617235062397019165
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qQpgjg+2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNveWZ110374;
	Wed, 31 Mar 2021 18:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235060;
	bh=+7yftRE0IW9BESLZZuFdIq2cQ6KuqMcXScOyeqzO6x4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qQpgjg+2YvLneLwCySScJVygqKYelTfFNudyjWoJO2XZwneJ/3XKqWtSIF39uJhaq
	 ETf/XxZSbF9WUtGpAKYHeAttkZW6GnzNHA5fP6Y9Mojaly6boMg8DDN+QDU/93A/Z0
	 PTHdtvg5mguoC4qeT+rZWmVsQS+PNZKl2yATNzS0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNvern087243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:40 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvdG6089331;
	Wed, 31 Mar 2021 18:57:39 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH V2 2/8] conf/machine: am65xx: Document boot images as legacy mode
Date: Wed, 31 Mar 2021 18:57:30 -0500
Message-ID: <20210331235736.30481-3-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331235736.30481-1-nm@ti.com>
References: <20210331235736.30481-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We use the default IMAGE_BOOT_FILES configuration which matches up with
legacy boot configuration. Document the same to allow folks to
understand by just looking at the SoC include file.

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
---
Changes since V1:
- picked up reviewed-by
- Added additional documentation for SR revision.

V1: https://lists.yoctoproject.org/g/meta-ti/message/13608
 conf/machine/include/am65xx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 684fea45b6d7..547c2e8707ce 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -23,6 +23,8 @@ KERNEL_DEVICETREE = " \
 
 BBMULTICONFIG += "k3r5-sr2"
 
+# Use default IMAGE_BOOT_FILES_LEGACY files
+# Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
 IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-- 
2.31.0

