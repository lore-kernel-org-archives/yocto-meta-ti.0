Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3EF4E00D90; Thu, 12 Sep 2019 20:11:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A116E009DC
	for <meta-ti@yoctoproject.org>; Thu, 12 Sep 2019 20:11:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A76240BF9;
	Fri, 13 Sep 2019 03:11:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Vv6sVhEfHQ9W; Fri, 13 Sep 2019 03:11:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3CB5840BCF;
	Fri, 13 Sep 2019 03:10:59 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 727F4173BBA;
	Thu, 12 Sep 2019 23:10:58 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 12 Sep 2019 23:10:58 -0400
Message-Id: <1568344258-30407-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-softhsmv2, libp11, engine-pkcs11: openssl10 is no longer available
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
X-List-Received-Date: Fri, 13 Sep 2019 03:11:03 -0000

These packages still need to be migrated from 1.0 API to 1.1
Specific to Keystone2 platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb | 2 +-
 recipes-ti/libp11/libp11_git.bb               | 2 +-
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
index 7dd6f09..01bd58f 100644
--- a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
+++ b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 inherit autotools pkgconfig
 
-DEPENDS = "openssl10 libtool libp11"
+DEPENDS = "openssl libtool libp11"
 
 COMPATIBLE_MACHINE = "keystone"
 
diff --git a/recipes-ti/libp11/libp11_git.bb b/recipes-ti/libp11/libp11_git.bb
index 9b1ea3e..a768f15 100644
--- a/recipes-ti/libp11/libp11_git.bb
+++ b/recipes-ti/libp11/libp11_git.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 inherit autotools pkgconfig
 
-DEPENDS = "openssl10 libtool"
+DEPENDS = "openssl libtool"
 RDEPENDS_${PN} = "ti-softhsmv2"
 
 COMPATIBLE_MACHINE = "keystone"
diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index d281a51..6a196ae 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -7,7 +7,7 @@ mntdir = "/mnt"
 
 inherit autotools pkgconfig
 
-DEPENDS = "openssl10 libdaemon zlib"
+DEPENDS = "openssl libdaemon zlib"
 COMPATIBLE_MACHINE = "keystone"
 
 BRANCH = "ti-softhsm-rebase"
-- 
2.7.4


