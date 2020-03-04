Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.16767.1583350441878084406
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2020 11:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=loCCDJ0M;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nikhil.nd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 024JY1oe111985;
	Wed, 4 Mar 2020 13:34:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583350441;
	bh=ytwdE2jn6YCJL6MTXagLupwM0QsOnx6pKhJtA7pCXmI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=loCCDJ0M2tNxCFs6XuHvoydrybWvW4tYEHnUDmK4iV7tZpvu/M0abVOMc7sEY76OD
	 v1Y+oAocUrJs2OB0B5TUcaVSUXLaQqk7Y14EjHrwP3ty3O1Us/Rw0M3f3EY+Wx63u9
	 OdW/gt6I0cgiKql/InEE369rSu4gl9UIgkg+4G6s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 024JY15A063814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Mar 2020 13:34:01 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Mar
 2020 13:34:00 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Mar 2020 13:34:00 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 024JXuTW052767;
	Wed, 4 Mar 2020 13:33:59 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus PATCH v1 2/2] conf: j7-evm: Update the secondary console for jailhouse
Date: Thu, 5 Mar 2020 01:03:47 +0530
Message-ID: <20200304193347.15094-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200304193347.15094-1-nikhil.nd@ti.com>
References: <20200304193347.15094-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Latest upstream jailhouse uses ttyS3 as console.
Update the conf file so that this reflects correctly in the
tiny rootfs.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 conf/machine/j7-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index e73c75bd..9e910067 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/k3.inc
 
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
+SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1

