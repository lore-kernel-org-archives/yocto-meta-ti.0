Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A02B0E0136A
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2012 22:29:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0EA7A52AA1; Wed,  8 Feb 2012 06:29:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120208062926.0EA7A52AA1@arago-project.org>
Date: Wed,  8 Feb 2012 06:29:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-tester: bump SRCREV
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 06:29:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d874e605466525bdb189543885597a6a0ebdce71
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d874e605466525bdb189543885597a6a0ebdce71

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb  7 19:50:29 2012 +0100

beaglebone-tester: bump SRCREV

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

---

 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index ee81d2b..b4a94ab 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "02c6005871a83c289ac01a93c3dbd9cc7e4c80be"
+SRCREV = "ab8c1e604575b85eca9a55073f7d50ac465a1072"
 
 S = "${WORKDIR}/git"
 


