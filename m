Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99371E00753; Fri, 16 Jan 2015 05:08:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32BADE004D6
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 05:07:56 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0GD7twe032708
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 07:07:55 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0GD7tYN032600
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 07:07:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 07:07:55 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0GD7tWI016606;	Fri, 16 Jan 2015 07:07:55 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Jan 2015 07:20:25 -0500
Message-ID: <1421410826-27466-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] multiprocmgr: Moved recipe verbatim from meta-arago
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
X-List-Received-Date: Fri, 16 Jan 2015 13:08:00 -0000
Content-Type: text/plain

- Original location: meta-arago:
  meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr_git.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr_git.bb

diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
new file mode 100644
index 0000000..3f2e52c
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI Multiproc Manager for KeyStone II"
+HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+
+PR = "r1"
+
+BRANCH ?= "master"
+SRCREV = "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
+
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
+}
-- 
1.7.9.5


