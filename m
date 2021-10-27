Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.4096.1635375460198554376
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 15:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kObQu5cP;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: hnagalla@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19RMvcjK002304
	for <meta-ti@lists.yoctoproject.org>; Wed, 27 Oct 2021 17:57:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635375458;
	bh=GfPLb8bUhzAixwW22Td7BNpRD9GuoGBSw4M3uQJl8Eo=;
	h=From:To:CC:Subject:Date;
	b=kObQu5cPU1PJf7zNLkVIxNd8Kh6BmJJOanVb7026iu9V+aldtoKfu2dyNi4cb58kQ
	 D25GMT1oha1IiglN0vxcBKYiseJPh8SL3S3G6Znbi5KNWnllTKyFByXtpT7d97PMSm
	 2o+/WX4KvAcjU7AVGFYRGjVaJgBY/g5EzsxebKa0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19RMvcR2061505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 27 Oct 2021 17:57:38 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Oct 2021 17:57:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Oct 2021 17:57:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19RMvcdW055943;
	Wed, 27 Oct 2021 17:57:38 -0500
From: "Hari Nagalla" <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <yogeshs@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/dunfell PATCH v2] ti-rtos-firmware: Update M4F binary for AM64x SoCs
Date: Wed, 27 Oct 2021 17:57:35 -0500
Message-ID: <20211027225735.21697-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

AM64x SoCs have a Cortex-M4F core in MCU domain. This core is used a
standalone device for safety applications. For non safety applications,
the device is exposed as a remote processor with Linux rpmsg framework.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 43de1ec2..db630ecc 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -62,6 +62,7 @@ do_install_prepend_am64xx() {
                 mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
                 mv am64-main-r5f1_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
                 mv am64-main-r5f1_1-fw ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f; \
+                mv am64-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f; \
         )
 }
 
@@ -124,6 +125,7 @@ ALTERNATIVE_${PN}_am64xx = "\
                     am64-main-r5f0_1-fw \
                     am64-main-r5f1_0-fw \
                     am64-main-r5f1_1-fw \
+                    am64-mcu-m4f0_0-fw \
                     "
 
 ALTERNATIVE_${PN}_j7 = "\
@@ -154,6 +156,7 @@ TARGET_MAIN_R5FSS0_0_am64xx = "am64-main-r5f0_0-fw"
 TARGET_MAIN_R5FSS0_1_am64xx = "am64-main-r5f0_1-fw"
 TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
+TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
 
 TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
@@ -177,6 +180,7 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_M
 ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
 ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
 
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
@@ -202,6 +206,7 @@ ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
 ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
 
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-- 
2.17.1

