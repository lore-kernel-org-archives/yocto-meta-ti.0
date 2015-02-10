Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0129E0095D; Tue, 10 Feb 2015 04:35:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62FC1E00949
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 04:34:53 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1ACYrgk028674
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 06:34:53 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1ACYqpl028668
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 06:34:52 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 06:34:51 -0600
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1ACYpFT001161;	Tue, 10 Feb 2015 06:34:51 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Feb 2015 07:34:37 -0500
Message-ID: <1423571677-28830-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] vpe-tests: Add kernel dependency.
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
X-List-Received-Date: Tue, 10 Feb 2015 12:35:02 -0000
Content-Type: text/plain

- Build includes kernel headers, so depend on virtual/kernel.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/vpe-tests/vpe-tests_git.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
index a8ee7f8..70557b7 100644
--- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -1,10 +1,14 @@
 DESCRIPTION = "VPE test program"
 
+DEPENDS += "virtual/kernel"
+
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
+PR = "r1"
+
 SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?= "master"
 
-- 
1.7.9.5


