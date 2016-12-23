Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB5ACE003C1; Fri, 23 Dec 2016 23:19:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 37670 seconds by postgrey-1.32 at yocto-www;
	Fri, 23 Dec 2016 23:19:25 PST
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 712FDE0033D
	for <meta-ti@yoctoproject.org>; Fri, 23 Dec 2016 23:19:25 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBNKpZHU029599
	for <meta-ti@yoctoproject.org>; Fri, 23 Dec 2016 14:51:35 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBNKpYqP010064
	for <meta-ti@yoctoproject.org>; Fri, 23 Dec 2016 14:51:34 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 23 Dec 2016 14:51:34 -0600
Received: from uda0271916 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBNKpYh3006616;
	Fri, 23 Dec 2016 14:51:34 -0600
Received: from a0271916local by uda0271916 with local (Exim 4.82)
	(envelope-from <g-tammana@ti.com>)	id 1cKWoQ-0008U7-Hr; Fri, 23 Dec 2016
	14:51:34 -0600
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Fri, 23 Dec 2016 14:51:12 -0600
Message-ID: <1482526272-32256-1-git-send-email-g-tammana@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-gc320-driver: add support for RT kernel
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
X-List-Received-Date: Sat, 24 Dec 2016 07:19:29 -0000
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 9344e30..8ad7e4b 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 # Need to branch out with ${PV} var
 BRANCH = "ti-${PV}-k4.4"
 
-SRCREV = "7a2b06ad1df46a274336f7ae0e24a9d67e72cd66"
+SRCREV = "65887c911db495fb66c6847c8b6eadc76c7470f4"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git/src"
-- 
1.9.1


