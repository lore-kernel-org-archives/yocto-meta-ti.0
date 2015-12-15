Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F0A0E00B9D; Tue, 15 Dec 2015 06:11:30 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE550E0048C
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 06:11:28 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBFEBRqq032096
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:11:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFEBQX6030678
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:11:26 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Dec 2015 08:11:26 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBFEBQ7W007446;	Tue, 15 Dec 2015 08:11:26 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 15 Dec 2015 09:11:25 -0500
Message-ID: <1450188685-1736-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mpm-transport: Update to new version 2.0.0.1
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
X-List-Received-Date: Tue, 15 Dec 2015 14:11:30 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 812ae04..beb744c 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -14,12 +14,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
-BRANCH = "linux41"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.00.00_ENG
-SRCREV = "892e93238b7f9f480ddceb7ade042026a4d178bd"
+BRANCH = "master"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.00.01
+SRCREV = "7220df9263a57629a564afb3f99f6f7fb33e40d6"
 
-PV = "2.0.0.0"
-PR = "r1"
+PV = "2.0.0.1"
+PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
-- 
1.9.1


