Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 257E6E00DAF; Wed, 13 Nov 2019 17:21:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DACFFE00BF7
	for <meta-ti@yoctoproject.org>; Wed, 13 Nov 2019 17:21:46 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F418540BF2;
	Thu, 14 Nov 2019 01:21:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id optfOYLpCE43; Thu, 14 Nov 2019 01:21:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C25CF40BE5;
	Thu, 14 Nov 2019 01:21:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7C8B61742EA;
	Wed, 13 Nov 2019 20:21:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 13 Nov 2019 20:21:44 -0500
Message-Id: <1573694504-30345-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] vis: mark as compatible with dra7xx family
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
X-List-Received-Date: Thu, 14 Nov 2019 01:21:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/vis-fw/vis_01.50.07.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 5b9834c..6eaf8de 100644
--- a/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Radio Application Firmware"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
 
-COMPATIBLE_MACHINE = "dra7xx-evm"
+COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PR = "r1"
 
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exports/vis-${MACHINE}-01.50.07.15.tar.gz;protocol=http"
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exports/vis-dra7xx-evm-01.50.07.15.tar.gz;protocol=http"
 
 SRC_URI[md5sum] = "fe8b00e398fb3b7ada0c15b601867acb"
 SRC_URI[sha256sum] = "6e2aa47ae892910616ebdc96646af778af9a59ca0657716ab4fa4b24a9afae69"
-- 
2.7.4


