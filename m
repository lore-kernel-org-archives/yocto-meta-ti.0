Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 977E8E00F58; Wed,  7 Mar 2018 11:15:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E30DCE00F22
	for <meta-ti@yoctoproject.org>; Wed,  7 Mar 2018 11:15:53 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w27JFqiL008486
	for <meta-ti@yoctoproject.org>; Wed, 7 Mar 2018 13:15:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520450152;
	bh=G095LssgqE5GN+sNES0H/pDHZ8Ua10m5YeLRMQJmFxA=;
	h=From:To:CC:Subject:Date;
	b=SuLSpQQ6VAuC2AO66pF9sYAq4raLWnxiS0xQoZdPddSR2Fdu7NBc+S/pROMMEgnfo
	E+/RjH39cZfnd8xoX5/Wboy0XADztLmKAoAys/cOVu36cZHvLi76AkmRfCZ3IWenNC
	3POGi/LAnU4pCEhy7h2vbchcQwFf/zShZd2FELYk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w27JFq0l011905
	for <meta-ti@yoctoproject.org>; Wed, 7 Mar 2018 13:15:52 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 7 Mar 2018 13:15:52 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 7 Mar 2018 13:15:52 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w27JFqvr006484;
	Wed, 7 Mar 2018 13:15:52 -0600
Received: from uda0271916b.am.dhcp.ti.com (uda0271916b.am.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w27JFqx04145; Wed, 7 Mar 2018 13:15:52 -0600 (CST)
From: Gowtham Tammana <g-tammana@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
Date: Wed, 7 Mar 2018 13:16:46 -0600
Message-ID: <1520450206-4527-1-git-send-email-g-tammana@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-gc320-driver: move to k4.14
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
X-List-Received-Date: Wed, 07 Mar 2018 19:15:54 -0000
Content-Type: text/plain

Updated the recipe to pick the sources for k4.14.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 7beb9aa..94485b6 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "e"
 PR = "${MACHINE_KERNEL_PR}"
 
 # Need to branch out with ${PV} var
-BRANCH = "ti-${PV}-k4.9"
+BRANCH = "ti-${PV}-k4.14"
 
-SRCREV = "295443bf56f2100b7b2714c2c30b31ba86e96a0c"
+SRCREV = "a36799d9329efcfff19e30e690156d5ebf7e0c55"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git/src"
-- 
2.7.4


