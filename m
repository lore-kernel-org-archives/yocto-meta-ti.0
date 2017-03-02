Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4384E00887; Thu,  2 Mar 2017 14:37:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6A45E0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 14:37:03 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8BF5C20B64;
	Thu,  2 Mar 2017 22:37:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id A1LkC6CDBKQk; Thu,  2 Mar 2017 22:37:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6B3812088F;
	Thu,  2 Mar 2017 22:37:01 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EFF711623A5;
	Thu,  2 Mar 2017 17:37:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu,  2 Mar 2017 17:37:00 -0500
Message-Id: <1488494220-53121-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] libgbm: depend on udev, as it uses libudev, cleanup
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
X-List-Received-Date: Thu, 02 Mar 2017 22:37:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/gbm/libgbm_10.0.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb b/recipes-graphics/gbm/libgbm_10.0.0.bb
index a55074a..848a5f6 100644
--- a/recipes-graphics/gbm/libgbm_10.0.0.bb
+++ b/recipes-graphics/gbm/libgbm_10.0.0.bb
@@ -1,8 +1,10 @@
-DESCRIPTION = "Userspace interface for the kernel GBM services."
-HOMEPAGE = "http://git.ti.com"
+SUMMARY = "Userspace interface for the kernel GBM services"
+HOMEPAGE = "http://git.ti.com/glsdk/libgbm.git"
+
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
-DEPENDS = "libdrm"
+
+DEPENDS = "libdrm udev"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


