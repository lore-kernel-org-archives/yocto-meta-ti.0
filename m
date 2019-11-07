Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37F86E00E1A; Thu,  7 Nov 2019 10:09:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8A21E00E08
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:50 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9oXF070493
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150190;
	bh=SyhfgwFeq5Yu63PCGSjNhnGb43Or9VW0iI62znq+jBo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GhP/SQphrqZ5r3loLSDETQ4WC20CuhpQz5jV+sDv79dA1qGEoiBREuwOmsDDpdHmU
	0/lfnc3QEofzyOdniuartHWWkzvxwbaEbETAqZCceUsfZtL5Y8lxXeN+XQvAintb5b
	XPRjfXHo2iqzTOMBe5CC3cHUSWMFGxTLfED1Wn/E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9oV9071188
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:50 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:34 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIJ067418;
	Thu, 7 Nov 2019 12:09:49 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:08 -0500
Message-ID: <1573149037-762-14-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 13/42] i2c-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:54 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
index bf64abf..95bc1b6 100644
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS low level driver for Inter-IC module (I2C)"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c"
@@ -8,19 +9,7 @@ LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a277957
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-I2C_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/i2c-lld.git"
-I2C_LLD_GIT_PROTOCOL = "git"
-I2C_LLD_GIT_BRANCH = "master"
-I2C_LLD_GIT_DESTSUFFIX = "git/ti/drv/i2c"
 
-# Below commit ID corresponds to "DEV.I2C_LLD.01.00.00.16A"
-I2C_LLD_SRCREV = "1524f975a96de004000ce7e5b3367d6640b7d193"
-
-BRANCH = "${I2C_LLD_GIT_BRANCH}"
-SRC_URI = "${I2C_LLD_GIT_URI};destsuffix=${I2C_LLD_GIT_DESTSUFFIX};protocol=${I2C_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${I2C_LLD_SRCREV}"
-PV = "01.00.00.16A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
@@ -43,7 +32,6 @@ DEPENDS_append_j7-evm = " sciclient-rtos \
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-S = "${WORKDIR}/${I2C_LLD_GIT_DESTSUFFIX}"
 
 export PDK_I2C_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
@@ -52,3 +40,4 @@ INSANE_SKIP_${PN} = "arch"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "I2C LLD"
+TI_PDK_COMP = "ti.drv.i2c"
-- 
2.7.4


