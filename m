Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.452.1601560407993394391
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 06:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=En7aM8QX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rogerq@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091DrR7P130216
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 08:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601560407;
	bh=rsl3+DsZ4kC3XC5F79BZ8iPP34sSLQYPXNHIUuFPuHM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=En7aM8QXIzxzT16/k5i+KDFq0PSQZz5YbGbE7hAiy3YjUCrMHav0hSSMzp+9IFlJz
	 geGObyqzHNcNSg6roNoong/sUDw+ekMLm1duJOCraD0/xH6Z7KViwsHAc/iqRIFuZv
	 /ROGmQZuFAy7Q5E5eg+Tsn3tK9TcNX6DnZcuXqCs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091DrRUU130218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 08:53:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 08:53:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 08:53:26 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091DrMMa004447;
	Thu, 1 Oct 2020 08:53:25 -0500
From: "Roger Quadros" <rogerq@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>,
        <dmurphy@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [meta-ti][dunfell/master PATCH 1/2] prueth-fw: Update the firmware to 5.3.9 version
Date: Thu, 1 Oct 2020 16:53:20 +0300
Message-ID: <20201001135321.7470-2-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001135321.7470-1-rogerq@ti.com>
References: <20201001135321.7470-1-rogerq@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the firmware to version 5.3.9

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 .../prueth-fw/{prueth-fw_5.2.8.bb => prueth-fw_5.3.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/prueth-fw/{prueth-fw_5.2.8.bb => prueth-fw_5.3.9.bb} (94%)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb b/recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb
similarity index 94%
rename from recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb
rename to recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb
index 04a32dad..ec9d7ffc 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "48e2c46ff62d796345b6587be58f88f0e608addc"
+SRCREV = "b19bf13a16d7f5c1260cf4d48cf967e5c7e15128"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

