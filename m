Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16C5CE00EBF; Wed, 28 Feb 2018 16:09:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AF33E00E44
	for <meta-ti@yoctoproject.org>; Wed, 28 Feb 2018 16:09:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3AEDF20059;
	Thu,  1 Mar 2018 00:09:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id x-Uaa8oztnoV; Thu,  1 Mar 2018 00:09:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ED97220B6F;
	Thu,  1 Mar 2018 00:09:52 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 354CE1632DB;
	Wed, 28 Feb 2018 19:09:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Feb 2018 19:09:46 -0500
Message-Id: <1519862990-49259-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519862990-49259-1-git-send-email-denis@denix.org>
References: <1519862990-49259-1-git-send-email-denis@denix.org>
Subject: [rocko/master][PATCH 2/5] engine-pkcs11, libp11, ti-softhsmv2: update compatibility
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
X-List-Received-Date: Thu, 01 Mar 2018 00:09:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb | 2 ++
 recipes-ti/libp11/libp11_git.bb               | 2 ++
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb   | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
index bd03449..3d6d221 100644
--- a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
+++ b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
@@ -7,6 +7,8 @@ inherit autotools pkgconfig
 
 DEPENDS = "openssl libtool libp11"
 
+COMPATIBLE_MACHINE = "keystone"
+
 BRANCH="master"
 
 PV = "1.3.0.1"
diff --git a/recipes-ti/libp11/libp11_git.bb b/recipes-ti/libp11/libp11_git.bb
index 459c751..cacdf58 100644
--- a/recipes-ti/libp11/libp11_git.bb
+++ b/recipes-ti/libp11/libp11_git.bb
@@ -8,6 +8,8 @@ inherit autotools pkgconfig
 DEPENDS = "openssl libtool"
 RDEPENDS_${PN} = "ti-softhsmv2"
 
+COMPATIBLE_MACHINE = "keystone"
+
 SRC_URI = "git://git.ti.com/keystone-linux/libp11.git;protocol=git;branch=${BRANCH}"
 BRANCH="master"
 # Following commit corresponds to DEV.LIBP11-01.03.00.00
diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index 7367211..d2430f0 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -8,7 +8,7 @@ mntdir = "/mnt"
 inherit autotools pkgconfig
 
 DEPENDS = "openssl libdaemon zlib"
-COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
+COMPATIBLE_MACHINE = "keystone"
 
 BRANCH="ti-softhsm-rebase"
 SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
-- 
2.7.4


