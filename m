Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29B58E00BFD; Wed, 27 Jan 2016 12:54:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE2A1E00948
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 60D1352AAC; Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205449.60D1352AAC@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : gdbc6x: Extend support to keystone SOCs
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
X-List-Received-Date: Wed, 27 Jan 2016 20:54:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: cc621fd2a784a1277a0b65b0e019831a91da11dc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cc621fd2a784a1277a0b65b0e019831a91da11dc

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:51 2016 +0000

gdbc6x: Extend support to keystone SOCs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-devtools/gdbc6x/gdbc6x.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
index 8256127..4513a91 100644
--- a/recipes-devtools/gdbc6x/gdbc6x.inc
+++ b/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -1,8 +1,13 @@
 # This corresponds to version 1.1.0
 SRCREV = "1ab06f8bcfe7540754558bac331a0312c4b59142"
+SRCREV_keystone = "913f18db6325e08f634be6dda91f57fb0ec8c838"
+
 PV = "1.1.0"
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
+BRANCH_keystone = "k2h"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"


