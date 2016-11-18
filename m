Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD884E0097C; Fri, 18 Nov 2016 13:51:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F619E00924
	for <meta-ti@yoctoproject.org>; Fri, 18 Nov 2016 13:51:27 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B497920AF8;
	Fri, 18 Nov 2016 21:51:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ON5G1ppG1_Nf; Fri, 18 Nov 2016 21:51:26 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 90E7920AB6;
	Fri, 18 Nov 2016 21:51:25 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id D6A301621A4;
	Fri, 18 Nov 2016 16:51:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 18 Nov 2016 16:51:24 -0500
Message-Id: <1479505884-9325-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479505884-9325-1-git-send-email-denis@denix.org>
References: <1479505884-9325-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] rwmem: fix build with any toolchain and use default CC var
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
X-List-Received-Date: Fri, 18 Nov 2016 21:51:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/rwmem/rwmem_1.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
index 1825e18..2848e1c 100644
--- a/recipes-bsp/rwmem/rwmem_1.1.bb
+++ b/recipes-bsp/rwmem/rwmem_1.1.bb
@@ -7,8 +7,6 @@ SRC_URI = "git://github.com/tomba/rwmem.git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
-
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 rwmem ${D}${bindir}
-- 
2.7.4


