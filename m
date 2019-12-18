Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.12073.1576684399197665501
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2019 07:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Q8y408Vx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-stiffler@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIFrIJv118319
	for <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2019 09:53:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576684398;
	bh=DzIJtBJ6hfyHb5AFUANuowoAbCeD2myA4CBfQLQTDC4=;
	h=From:To:CC:Subject:Date;
	b=Q8y408VxQXmGCbaRXoxdbk77oO6K2JfzAZCarryjHoflM8j5qgrfNuQpsYWnAzL0I
	 a68+o0afVhRgcEMuNHnp/IRn5V/PraSDCiXz9bF3UdG93PAcv7xq5hhY9OSCuuKzZ0
	 kMLAtse0zxSdFZQM1DMXl+7QTm5hsLYQRFMImfxw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIFrIDP033703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2019 09:53:18 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Dec 2019 09:53:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Dec 2019 09:53:18 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIFrHr3012773;
	Wed, 18 Dec 2019 09:53:18 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud/ti2019.05][PATCH] ti-pdk-fetch: bump SRCREV for prusw-fw update
Date: Wed, 18 Dec 2019 10:34:15 -0500
Message-ID: <1576683255-32082-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

* STP switch support for per-port MAC addresses

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index ac3b154..e544f90 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "release/PROCESSOR-SDK_06.02.00"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "7e19ea1c7e6e2d5a14e73d980ced0964e848c585"
+TI_PDK_SRCREV ?= "db6617355928f9aed72bd3158ed86eea2fa81f35"
 
-TI_PDK_VERSION ?= "2019.12.0"
+TI_PDK_VERSION ?= "2019.12.1"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.7.4

