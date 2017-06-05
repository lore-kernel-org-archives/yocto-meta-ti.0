Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A612E00B1B; Mon,  5 Jun 2017 07:47:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90950E0080F
	for <meta-ti@yoctoproject.org>; Mon,  5 Jun 2017 07:47:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v55ElGwi002706
	for <meta-ti@yoctoproject.org>; Mon, 5 Jun 2017 09:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496674036;
	bh=/IBtwuMxYzCOaY+b2uRMepNkGxUbEoKhi8RrsSDp0Jc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IQL0Y9bwnL3LSguHw/TkIWLaMbP9CIVA0wuFuplXxsQWtTk/6nMmL0G64aTQt1Q0F
	f2nnN7kU6bDocySYJTaBN+2HQ1/kJ3NhOY+lTHGOVAzGm/Xs3T/9Tc2KMxYMz6y/Yc
	HCosAZhJIpVgNB2yqhME5nhqKjvqmkaxfN1rrejI=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55ElGvf005861
	for <meta-ti@yoctoproject.org>; Mon, 5 Jun 2017 09:47:16 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Jun 2017 09:47:15 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v55ElF7m012868;	Mon, 5 Jun 2017 09:47:15 -0500
Received: from localhost ([172.22.137.163])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v55ElF310617;
	Mon, 5 Jun 2017 09:47:15 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 5 Jun 2017 09:47:09 -0500
Message-ID: <20170605144709.3342-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170605144709.3342-1-dmurphy@ti.com>
References: <20170605144709.3342-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] netcp-pa-fw: update to version 3.0.2.3
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
X-List-Received-Date: Mon, 05 Jun 2017 14:47:19 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
index 3b6e0132..492313e3 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "NETCP PA firmware for Keystone"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "3.0.1.17"
-PR = "r0"
+PV = "3.0.2.3"
+PR = "r1"
 
 CLEANBROKEN = "1"
 
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "k2hk|k2l-evm|k2e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "f43b4f61315e3642e05edb9c58b098f9cc69fdb6"
+SRCREV = "953ab647b0b6af411965242ecd919b1cb0e570d6"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.12.2


