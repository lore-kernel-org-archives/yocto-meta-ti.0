Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F21C0E00BEB; Tue, 13 Aug 2019 12:58:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F5CCE007AA
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 12:57:58 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DJvwbm038494
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565726278;
	bh=IDmBJ3fIIqwPmgN7wel/ZAV0d4D2uOV61qXv4RvOca4=;
	h=From:To:Subject:Date;
	b=jc0lUR4mG+h8887bBMu9RzWIdDkVZI+9hbXJH6NogPcXKI6SxionncKeXEbyBXzIa
	Jp3z/sslI2438SqDSj2rCyIByX0V7w7F4uoA5Lz/piXw6ynNUqDgE+g9HFsIqmESPc
	QTxJmMxdCFmgFS/XHmBMCd1MXsO3RqE8e6v4cTkw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DJvvPF123006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:57:58 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 13 Aug 2019 14:57:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 13 Aug 2019 14:57:57 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DJvvl7006894
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:57:57 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Aug 2019 15:57:55 -0400
Message-ID: <1565726275-31049-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-pdk-bbclass: Defining dependants for j7-evm, updated the default core list
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 19:58:01 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/ti-pdk.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index f0e6f2d..563ee2b 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -9,8 +9,10 @@ DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
 DEPENDS_remove_ti43x = "ti-cgt6x-native"
 DEPENDS_append_omapl1 = " ti-cgt-arm-native"
-DEPENDS_remove_k3 = "gcc-arm-none-eabi-native ti-cgt6x-native"
-DEPENDS_append_k3 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
+DEPENDS_remove_am65xx = "gcc-arm-none-eabi-native ti-cgt6x-native"
+DEPENDS_append_am65xx = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
+DEPENDS_remove_j7-evm = "gcc-arm-none-eabi-native"
+DEPENDS_append_j7-evm = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
@@ -43,6 +45,7 @@ export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
 export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
 export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
 export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export C7X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c7x"
 export TOOLCHAIN_PATH_EVE = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-arp32"
 export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
 export TOOLCHAIN_PATH_GCC_ARCH64 = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}"
@@ -59,7 +62,7 @@ export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
 TI_PDK_XDCMAKE ?= "1"
 
 # By default, only build the cores with available toolchains
-TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1"
+TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 mpu1_0 mcu1_0 mcu1_1 mcu2_0 mpu2_1 mpu3_0 mpu3_1 c66x c66xdsp_1 c66xdsp_2 c7x_1 arm9_0 c674x a9host a8host pru_0 pru_1"
 TI_PDK_LIMIT_SOCS ?= ""
 TI_PDK_LIMIT_BOARDS ?= ""
 TI_PDK_MAKE_TARGET ?= "release"
-- 
1.9.1


