Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AFDF8E00DAF; Thu, 31 Oct 2019 17:52:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3223E00973
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2019 17:52:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C28540BF0;
	Fri,  1 Nov 2019 00:52:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id F2A80fewp0Xk; Fri,  1 Nov 2019 00:52:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 01D0540BCF;
	Fri,  1 Nov 2019 00:52:28 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3DF661742CE;
	Thu, 31 Oct 2019 20:52:28 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 31 Oct 2019 20:52:28 -0400
Message-Id: <1572569548-34442-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] arm-trusted-firmware: update to 2.2
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
X-List-Received-Date: Fri, 01 Nov 2019 00:52:31 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{arm-trusted-firmware_2.1.bb => arm-trusted-firmware_2.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/arm-trusted-firmware/{arm-trusted-firmware_2.1.bb => arm-trusted-firmware_2.2.bb} (93%)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
similarity index 93%
rename from recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb
rename to recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
index a065cd8..f15570c 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
@@ -7,7 +7,7 @@ Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
 HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://license.rst;md5=90153916317c204fade8b8df15739cde"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
 
 inherit deploy
 
@@ -22,7 +22,7 @@ PV_append = "+git${SRCPV}"
 BRANCH = "ti-atf"
 SRC_URI = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
 
-SRCREV ?= "ce3f1512bfc3f346900178c5ef870fbef3ab205e"
+SRCREV ?= "e516a389ac12fbe1597f61fea80ed3f230b9c5fd"
 
 # Make ATF "aware" of OPTEE, no build dependency
 PACKAGECONFIG[optee] = "SPD=opteed"
-- 
2.7.4


