Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.3531.1636759082567239448
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 15:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w8wD13d2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ACNI0It021320;
	Fri, 12 Nov 2021 17:18:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636759080;
	bh=dwglUh0L30wSPQQTYsFfo3qsT5S067kS4k43ya411XM=;
	h=From:To:Subject:Date;
	b=w8wD13d2RreAZiwOU1ysAQU/VWJDCQPhkOYWA21xT8BKKgj5d1fQpdfnLHuIk3aRS
	 cohOavBWyqczEyHjevk5qysGFjCM64JijwNJn8kCnkcclopa+SxXmObjYAF6sZ3XSY
	 B5rVDA/sVRWCa3T1zyWgWeisPQPhMuvA/Vyr7N/s=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ACNI0Tc034967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Nov 2021 17:18:00 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 17:18:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 17:18:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ACNI0pV019283;
	Fri, 12 Nov 2021 17:18:00 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Add AM64x HS platform support
Date: Fri, 12 Nov 2021 23:17:57 +0000
Message-ID: <20211112231800.64167-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This series adds AM64x HS support for HS-SE devices

Yogesh Siraswar (3):
  conf: machine: add new am64x hs platform
  ti-sci-fw: changes to build combined boot image for hs build
  am64xx-hs: changes to support new hs platform

 conf/machine/am64xx-hs-evm-k3r5.conf          | 14 ++++++++++++
 conf/machine/am64xx-hs-evm.conf               | 22 +++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 20 +++++++++++++++--
 .../trusted-firmware-a_%.bbappend             |  8 +++++++
 recipes-bsp/u-boot/u-boot-ti.inc              |  6 +++++
 recipes-security/optee/optee-os_%.bbappend    |  4 ++++
 6 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 conf/machine/am64xx-hs-evm-k3r5.conf
 create mode 100644 conf/machine/am64xx-hs-evm.conf

-- 
2.17.1

