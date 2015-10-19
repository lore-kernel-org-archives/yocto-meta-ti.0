Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD719E0049B; Mon, 19 Oct 2015 12:33:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBA48E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:33:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJX31e023595
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:33:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJX3KD011626
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:33:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:33:03 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJX2wr030956;	Mon, 19 Oct 2015 14:33:02 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:33:01 -0400
Message-ID: <1445283181-9425-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] pktlib: Update to new version 2.1.0.5
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
X-List-Received-Date: Mon, 19 Oct 2015 19:33:06 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/pktlib/pktlib_git.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
index aa21974..17e5041 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -8,9 +8,9 @@ COMPATIBLE_MACHINE = "keystone"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/pktlib.git;protocol=git;branch=${BRANCH}"
 
-# Corresponds to DEV.PKTLIB.2.1.0.4
-SRCREV = "a9aa56afed54b0a04f36d2fdb248cad5dcac6ff6"
-PV = "2.1.0.4"
+# Corresponds to DEV.PKTLIB.2.1.0.5
+SRCREV = "d757026f3d6a837711f4b44b5ffdefed761fc186"
+PV = "2.1.0.5"
 
 S = "${WORKDIR}/git/ti/runtime/pktlib"
 
-- 
1.7.9.5


