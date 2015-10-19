Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2DEEE0049B; Mon, 19 Oct 2015 12:42:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60BAEE00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:42:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJgXxk010422
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:42:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJgXPC028571
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:42:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:42:33 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJgWSD023970;	Mon, 19 Oct 2015 14:42:32 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:42:31 -0400
Message-ID: <1445283751-10079-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] engine-pkcs11: Update to new version 1.3.0.1
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
X-List-Received-Date: Mon, 19 Oct 2015 19:42:35 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
index 226beac..bd03449 100644
--- a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
+++ b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
@@ -7,10 +7,11 @@ inherit autotools pkgconfig
 
 DEPENDS = "openssl libtool libp11"
 
-PV = "1.3.0.0"
 BRANCH="master"
-# Commit corresponds to DEV.ENGINE_PKCS11-01.03.00.00
-SRCREV = "0b14500b0ea8b37453b6d93aac02278465e7e732"
+
+PV = "1.3.0.1"
+# Commit corresponds to DEV.ENGINE_PKCS11-01.03.00.01
+SRCREV = "56ac060e2245907a442376d586924af26ed7e478"
 
 SRC_URI = "git://git.ti.com/keystone-linux/engine-pkcs11.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
-- 
1.7.9.5


