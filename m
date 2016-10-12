Return-Path: <poojaprajod@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D40FE00CF9; Wed, 12 Oct 2016 08:08:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDC84E00CC1
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 08:08:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9CF8m4K011647
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 10:08:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9CF8mAX021179
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 10:08:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 10:08:48 -0500
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9CF8kja002060;	Wed, 12 Oct 2016 10:08:47 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <1476284923-13475-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:52:03 -0800
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [meta-ti/dspdce] Update dspdce to 1.00.00.08
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
Date: Wed, 12 Oct 2016 15:08:51 -0000
X-Original-Date: Wed, 12 Oct 2016 20:38:43 +0530
X-List-Received-Date: Wed, 12 Oct 2016 15:08:51 -0000
Content-Type: text/plain

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index ee00833..f091c8f 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
 
 SRCREV = "3b9cea492f23d7dabb9ffa0e69631b858ba8e90a"
 
-PV = "1.00.00.06"
+PV = "1.00.00.08"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


