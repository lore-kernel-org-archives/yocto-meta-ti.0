Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4AA1AE00D9E; Thu, 14 Dec 2017 08:55:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 989C3E00D94
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 08:55:42 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEGtfWg020038
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 10:55:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513270541;
	bh=Yga9UlM0olE81UzBAmZNBQlt4ROcWUzSqUKPEZ1I8t8=;
	h=From:To:Subject:Date;
	b=skviL/N7WC6V70/5Jci4V1nyN2Lyy3TGZQQoKh/SVzuMD18Wh40C0GVoVUGG15uj5
	yCbad2Isx1Vi2Nf6X9GzYCTPIbLY5lQOeTeFSCDGEiA1hINlf6ipmJm/XdcydBhDAs
	GHyR/r0ELkV2SBrjQ+NrHl2bqKYAZLZgh/RcZHe0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEGtf5C015916
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 10:55:41 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 10:55:41 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 10:55:41 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEGtfEr019955
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 10:55:41 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Dec 2017 11:55:40 -0500
Message-ID: <1513270540-30635-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH ] i2c-lld-rtos: Updating to version 1.0.0.9A
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
X-List-Received-Date: Thu, 14 Dec 2017 16:55:43 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
index 4f711b8..a178c27 100644
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
@@ -13,14 +13,14 @@ I2C_LLD_GIT_PROTOCOL = "git"
 I2C_LLD_GIT_BRANCH = "master"
 I2C_LLD_GIT_DESTSUFFIX = "git/ti/drv/i2c"
 
-# Below commit ID corresponds to "DEV.I2C_LLD.01.00.00.07A"
-I2C_LLD_SRCREV = "85ad56fb6e1f2bdabdd3c371b97170cb62a6fdd7"
+# Below commit ID corresponds to "DEV.I2C_LLD.01.00.00.09A"
+I2C_LLD_SRCREV = "1a0e371f1c992b3f28cb160c6e3ada33d382f6a9"
 
 BRANCH = "${I2C_LLD_GIT_BRANCH}"
 SRC_URI = "${I2C_LLD_GIT_URI};destsuffix=${I2C_LLD_GIT_DESTSUFFIX};protocol=${I2C_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${I2C_LLD_SRCREV}"
-PV = "01.00.00.07A"
+PV = "01.00.00.09A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
-- 
1.9.1


