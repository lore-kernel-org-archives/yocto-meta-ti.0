Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2163E00D69; Thu, 27 Oct 2016 17:32:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EE0BE00D3F
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 17:32:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5D7820863;
	Fri, 28 Oct 2016 00:32:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gHRx5tpTFP08; Fri, 28 Oct 2016 00:32:41 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C6D81201FD;
	Fri, 28 Oct 2016 00:32:40 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 96C6C162173;
	Thu, 27 Oct 2016 20:32:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 27 Oct 2016 20:32:38 -0400
Message-Id: <1477614758-4933-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libulm: pass CC to work with internal toolchains that depend on sysroot flag
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
X-List-Received-Date: Fri, 28 Oct 2016 00:32:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/dsptop/libulm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm_git.bb
index 306d86f..7bf7f09 100644
--- a/recipes-bsp/dsptop/libulm_git.bb
+++ b/recipes-bsp/dsptop/libulm_git.bb
@@ -14,7 +14,7 @@ DEVICE_keystone = "C66AK2Hxx"
 EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
 
 do_compile() {
-    oe_runmake arm XPORT_ONLY
+    oe_runmake arm XPORT_ONLY CC="${CC}"
     oe_runmake dsp C6X_C_DIR=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x/include
 }
 
-- 
2.7.4


