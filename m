Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26AB0E0141C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2012 13:14:02 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EB39F52A90; Wed, 17 Oct 2012 20:14:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121017201401.EB39F52A90@arago-project.org>
Date: Wed, 17 Oct 2012 20:14:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-tester: FTDI eeprom test, v2
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
X-List-Received-Date: Wed, 17 Oct 2012 20:14:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: fe1242c26539a931e1307b66cbd6cb9760db0d6d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fe1242c26539a931e1307b66cbd6cb9760db0d6d

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sat Sep  1 13:46:43 2012 +0200

beaglebone-tester: FTDI eeprom test, v2

Check descriptor instead of VID/PID

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>

---

 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 7512e76..66b98a4 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r19"
+PR = "r20"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "bb93cdaa95173eb4a772523a37fe0bf8bd62d78f"
+SRCREV = "487a13e2e4faaafa40ba5430600e6aeecf9581a8"
 
 S = "${WORKDIR}/git"
 


