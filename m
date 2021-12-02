Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.6969.1638444248800189162
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Dec 2021 03:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ie/S6XAx;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B2BO7m1129711;
	Thu, 2 Dec 2021 05:24:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638444247;
	bh=D2DZ89I5q+B9i+JVvV/2qHCGfZHXboteuWsfq/CTFpQ=;
	h=From:To:Subject:Date;
	b=Ie/S6XAxDwUZG97Ff5NCYF3RmUhMQB+/NKsPzrja26DK2gzCzsAkPcCqEdJ9+Ejnz
	 02NoEcESR3MXfvEBBhCbVQfP/ymEdvJckI+9ciSjjF3J7vKk2qq9wy1d7zd7EqeeUk
	 aYizMxqFrTa/8XdGKO7zIb2Oc/8OqVlPLT7fwg0A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B2BO7Ni035915
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Dec 2021 05:24:07 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Dec 2021 05:24:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Dec 2021 05:24:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B2BO64b113492;
	Thu, 2 Dec 2021 05:24:06 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] vxd-dec-fw: Move firmware one folder up in target
Date: Thu, 2 Dec 2021 11:24:06 +0000
Message-ID: <20211202112406.64679-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The application expects the pvdec_full_bin.fw to be in /lib/fimware
directory.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
index cccda6bb..478c8c16 100644
--- a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -17,8 +17,8 @@ S = "${WORKDIR}/git"
 TARGET = "pvdec_full_bin.fw"
 
 do_install() {
-        install -d ${D}${base_libdir}/firmware/ti-img
-        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmware/ti-img/${TARGET}
+        install -d ${D}${base_libdir}/firmware
+        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
 }
 
 FILES_${PN} = "${base_libdir}/firmware"
-- 
2.17.1

