Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23DE8E00B81; Tue, 15 Dec 2015 06:12:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7444E00BAA
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 06:11:48 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBFEBmhC032120
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:11:48 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFEBmh7030898
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:11:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Dec 2015 08:11:47 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBFEBl1N007865;	Tue, 15 Dec 2015 08:11:47 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 15 Dec 2015 09:11:46 -0500
Message-ID: <1450188706-1777-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr: Update to new version 3.0.0.2
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
X-List-Received-Date: Tue, 15 Dec 2015 14:12:02 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index f875396..ebe2eee 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
 SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "linux41"
-# The following commits correspond to DEV.MPM-3.00.00.01_ENG
-SRCREV = "c1c245814b835509b99d144b52e00316665ac477"
-PV = "3.0.0.1"
+BRANCH = "master"
+# The following commits correspond to DEV.MPM-3.00.00.02
+SRCREV = "319c6cfe15054df08eb70cbedc99a88dd5a06cda"
+PV = "3.0.0.2"
 
 SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


