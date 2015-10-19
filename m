Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C979E0049B; Mon, 19 Oct 2015 12:41:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C7E5E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:41:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJfeRA027946
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:41:40 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJfeJR013012
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:41:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:41:40 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJfdmY013140;	Mon, 19 Oct 2015 14:41:40 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:41:38 -0400
Message-ID: <1445283698-10019-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-softhsmv2: Update to new version 1.3.0.4
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
X-List-Received-Date: Mon, 19 Oct 2015 19:41:43 -0000
Content-Type: text/plain

- Update License checksum
- Skip PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index 329fbaa..c1e1654 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI softhsmv2 package"
 LICENSE = "BSD-2-Clause | BSD-3-Clause | ISC | IBM-License | FSFULLR | Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=55144a048ba54f211a1aaa38c7fd2424"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=664f3daf042b19d634189e709d5d558e"
 SECTION = "libs"
 
 mntdir = "/mnt"
@@ -12,10 +12,9 @@ COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
-#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.01
-SRCREV = "c79d93ac2a326567a7245dda1b903ef340b5650c"
-PV = "1.3.0.1"
-PR = "r1"
+#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.04
+SRCREV = "c2688afb9373309751e640088705cb739997665d"
+PV = "1.3.0.4"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


