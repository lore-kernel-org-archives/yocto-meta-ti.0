Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B7D7E00EE3; Fri, 15 Nov 2019 07:34:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74561E00D8B
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:19 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYJtU067945
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832059;
	bh=vT7cmYOnNcIC8BgYMxwwtwlFFj9OZU6KkWZ5NLX2z9A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rPoSN1LeYGVViNdV+73x8/gzcWzINpcpiS5mPSorBUdmnYFGxSTaTF2FPIt9NXa5R
	hAlhqNTiSQTBUObSl0yC4CunrcbM5hC4DXaxF2XOF92hCiv8S5Sc4wq7ds2XInQjE+
	Rf2pisiTmqoHy7x7P81CX1MLH64TtPmsmNChOJdI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYJJo010584
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:19 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:18 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfk041975;
	Fri, 15 Nov 2019 09:34:18 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:44 -0500
Message-ID: <1573830902-17409-25-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 24/42] pru: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:20 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pru/pru-pwm-fw_git.bb    | 11 +++++------
 recipes-bsp/pru/pru-swuart-fw_git.bb | 12 ++++++------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-fw_git.bb
index 0fe7987..a8c7103 100644
--- a/recipes-bsp/pru/pru-pwm-fw_git.bb
+++ b/recipes-bsp/pru/pru-pwm-fw_git.bb
@@ -8,17 +8,16 @@ require recipes-ti/includes/ti-paths.inc
 COMPATIBLE_MACHINE = "am65xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.15B"
-SRCREV = "989f802266d52f50a6db8f2be6967eacd9d2b409"
 
-PV = "01.00.00.15B"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/pruss-lld.git;protocol=git;branch=${BRANCH}"
+inherit ti-pdk-fetch
+
+TI_PDK_COMP = "ti.drv.pruss.example.apps.icssg_pwm.firmware.src"
+
+PE = "1"
 
 DEPENDS = "ti-cgt-pru-native pru-icss common-csl-ip-rtos"
 
-S = "${WORKDIR}/git/example/apps/icssg_pwm/firmware/src"
 
 EXTRA_OEMAKE += " \
     PRU_CGT="${TI_CGT_PRU_INSTALL_DIR}" \
diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-swuart-fw_git.bb
index e22b3be..1cb51f3 100644
--- a/recipes-bsp/pru/pru-swuart-fw_git.bb
+++ b/recipes-bsp/pru/pru-swuart-fw_git.bb
@@ -8,20 +8,20 @@ require recipes-ti/includes/ti-paths.inc
 COMPATIBLE_MACHINE = "ti33x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.15"
-SRCREV = "4493f456549c85749a05b1f46bf0b75d23976db1"
 
-PV = "01.00.00.15"
+inherit ti-pdk-fetch
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/uart-lld.git;protocol=git;branch=${BRANCH} \
+TI_PDK_COMP = "ti.drv.uart"
+
+PE = "1"
+
+SRC_URI_append = " \
 	file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
 	file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
 "
 
 DEPENDS = "ti-cgt-pru-native pru-icss"
 
-S = "${WORKDIR}/git"
 
 export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
 export PRU_SSP = "${STAGING_DIR_TARGET}/usr"
-- 
2.7.4


