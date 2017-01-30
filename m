Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50C2AE00480; Mon, 30 Jan 2017 07:56:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17D0BE003C1
	for <meta-ti@yoctoproject.org>; Mon, 30 Jan 2017 07:55:55 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0UFts4T007738
	for <meta-ti@yoctoproject.org>; Mon, 30 Jan 2017 09:55:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0UFtsWR029214
	for <meta-ti@yoctoproject.org>; Mon, 30 Jan 2017 09:55:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 30 Jan 2017 09:55:53 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v0UFtrpr028377;	Mon, 30 Jan 2017 09:55:53 -0600
Received: from uda0271916b.am.dhcp.ti.com (uda0271916b.am.dhcp.ti.com
	[128.247.77.97])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with
	ESMTP id v0UFtr324419;	Mon, 30 Jan 2017 09:55:53 -0600 (CST)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Mon, 30 Jan 2017 09:55:57 -0600
Message-ID: <1485791757-22979-1-git-send-email-g-tammana@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-gc320-driver: Update SRCREV
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
X-List-Received-Date: Mon, 30 Jan 2017 15:56:08 -0000
Content-Type: text/plain

This update includes the following
  - Remove dependency on dmac_flus/inv/clean_range
  - Remove spurious page count increment

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 8ad7e4b..976904f 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -11,7 +11,7 @@ PR = "${MACHINE_KERNEL_PR}"
 # Need to branch out with ${PV} var
 BRANCH = "ti-${PV}-k4.4"
 
-SRCREV = "65887c911db495fb66c6847c8b6eadc76c7470f4"
+SRCREV = "7c0f4dc755dc2ecb95195ed42ef24fea16ef2667"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git/src"
-- 
2.7.4


