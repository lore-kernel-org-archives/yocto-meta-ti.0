Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DE60E00D12; Fri,  8 Mar 2019 15:44:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C9B4E00D04
	for <meta-ti@yoctoproject.org>; Fri,  8 Mar 2019 15:44:33 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D74BE40BB9;
	Fri,  8 Mar 2019 23:44:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id d2qa4DxnYUUk; Fri,  8 Mar 2019 23:44:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C01BF40AF7;
	Fri,  8 Mar 2019 23:44:31 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id ED41116BF63;
	Fri,  8 Mar 2019 18:44:30 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri,  8 Mar 2019 18:44:30 -0500
Message-Id: <1552088670-2471-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] libgbm: provide virtual/libgbm for easy switching b/w providers
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
X-List-Received-Date: Fri, 08 Mar 2019 23:44:34 -0000

Follow a similar change in mesa in oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=5f8050722169a931b8e9078b8757216ba7a84506

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/gbm/libgbm_10.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb b/recipes-graphics/gbm/libgbm_10.0.0.bb
index 9e3c7ed..6d058b7 100644
--- a/recipes-graphics/gbm/libgbm_10.0.0.bb
+++ b/recipes-graphics/gbm/libgbm_10.0.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c
 
 DEPENDS = "libdrm udev"
 
+PROVIDES += "virtual/libgbm"
+
 inherit autotools pkgconfig
 
 BRANCH = "next"
-- 
2.7.4


