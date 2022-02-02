Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2346.1643826806595283868
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tb8rfAf2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IXO4R104907;
	Wed, 2 Feb 2022 12:33:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826804;
	bh=C2xzvMFRKbqqTj5L6m5GB+lqTxhS9meY8C+9EiIZVmI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tb8rfAf2heZ4h8/mLdEmQ+IZxLqzOdCt/7fn1fykNHbNCylr05kXCgXEoFVvw/f95
	 IEP1C6/YIOJZATY+dbeoDYEIuFf9apByeAp0P+FyohOLeo4Mft9pU7smHQAtqpaJA5
	 amd+MfUtilNveyqFe8NOdhZriyKpphQjxuP4+fUo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IXOhC002449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:33:24 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:33:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:33:24 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IXOr4091535;
	Wed, 2 Feb 2022 12:33:24 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKRY-0007fE-2Y; Wed, 02 Feb 2022 12:33:24 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 09/12] recipes-ti/ti-rtos-bin: Fix unavailable binary path
Date: Wed, 2 Feb 2022 12:33:19 -0600
Message-ID: <20220202183322.29360-10-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202183322.29360-1-reatmon@ti.com>
References: <20220202183322.29360-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Hari Nagalla <hnagalla@ti.com>

Lets fix the missing switch firmware binary to point to ping binary
instead. If we attempt to start alternate CPU, we get a very beserk
system.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 44c1ad09..c5852dbd 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -306,7 +306,7 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_
 
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
-- 
2.17.1

