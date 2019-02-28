Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF621E00D31; Wed, 27 Feb 2019 17:06:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73ACAE00D00
	for <meta-ti@yoctoproject.org>; Wed, 27 Feb 2019 17:06:11 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D66840AF7;
	Thu, 28 Feb 2019 01:06:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QZstWlKMywjL; Thu, 28 Feb 2019 01:06:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 830EB40A2D;
	Thu, 28 Feb 2019 01:06:09 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1839216B9FF;
	Wed, 27 Feb 2019 20:06:09 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 27 Feb 2019 20:06:08 -0500
Message-Id: <1551315968-32635-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] arm-trusted-firmware: update to latest snapshot based on 2.0
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
X-List-Received-Date: Thu, 28 Feb 2019 01:06:14 -0000

Upstream has changed copyright guidelines, no actual license change:

| Copyright guidance has been changed for migration of the
| ARM run project to trustedfirmware.org where the project
| governance is different.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{arm-trusted-firmware_1.5.bb => arm-trusted-firmware_2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/arm-trusted-firmware/{arm-trusted-firmware_1.5.bb => arm-trusted-firmware_2.0.bb} (92%)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
similarity index 92%
rename from recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
rename to recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
index fdbf8f1..76522c0 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
@@ -7,7 +7,7 @@ Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
 HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
+LIC_FILES_CHKSUM = "file://license.rst;md5=c709b197e22b81ede21109dbffd5f363"
 
 inherit deploy
 
@@ -22,7 +22,7 @@ PV_append = "+git${SRCPV}"
 BRANCH = "ti-atf"
 SRC_URI = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
 
-SRCREV ?= "d7b4c6e1fdb4553fc23a02776bca111bdcdf6b9f"
+SRCREV ?= "a9361e0ee6e6725346bf1f395b4d3d049bc20a7f"
 
 # Make ATF "aware" of OPTEE, no build dependency
 PACKAGECONFIG[optee] = "SPD=opteed"
-- 
2.7.4


