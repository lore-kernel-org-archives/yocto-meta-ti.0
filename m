Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CB1DE013EB
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:32:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 22361529A4; Thu, 26 Jul 2012 01:32:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120726013211.22361529A4@arago-project.org>
Date: Thu, 26 Jul 2012 01:32:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-tester: re-enable pmic test
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
X-List-Received-Date: Thu, 26 Jul 2012 01:32:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2257c7b47ae135416b29ba12e8e76c28a01c2b45
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2257c7b47ae135416b29ba12e8e76c28a01c2b45

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Jun 15 00:07:20 2012 +0200

beaglebone-tester: re-enable pmic test

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 9995556..82c5a83 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r16"
+PR = "r17"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "4f6335aedf520917a0bc0c83e9c1ac1135b8a2af"
+SRCREV = "c748d157b9afbb71e6eadf1dca7a787a456c0149"
 
 S = "${WORKDIR}/git"
 


