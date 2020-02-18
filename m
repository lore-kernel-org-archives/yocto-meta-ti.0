Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.126.1582041982677185384
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Feb 2020 08:06:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ybxic7jf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IG6LCL110887
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Feb 2020 10:06:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582041981;
	bh=cP3KxQhY8NY5JfHxyBasNu4xxmM9uO+4LZq+5TniaIE=;
	h=From:To:CC:Subject:Date;
	b=Ybxic7jf97cZEEI0ZPiWgHwifp97FgPBrurcyMN24cmi2EECqb7ovA12yIgLe5+lr
	 MUKMapqUteSPokPB05u8wa9T0jjILDcGBBuzTyaxKnVqoZX4gv5WRaPRgEInJfLdBg
	 RbaMcqc2dKBjMdu+FeMdA9ycxgLX23dNg8VaKaNg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IG6L5j124344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Feb 2020 10:06:21 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 10:06:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 10:06:22 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IG6LZV031028;
	Tue, 18 Feb 2020 10:06:21 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][zeus/master][PATCH] ti-sgx-ddk-um: Add runtime dependency on the SGX kernel module
Date: Tue, 18 Feb 2020 11:06:21 -0500
Message-ID: <20200218160621.26272-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The UM doesn't work too well without the KM side, add this dependency.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 129d5cee..d4bc0232 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -28,7 +28,7 @@ inherit update-rc.d
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
 
 DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
-RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
+RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat ti-sgx-ddk-km"
 
 RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
 RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-- 
2.17.1

