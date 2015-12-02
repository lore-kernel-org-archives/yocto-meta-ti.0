Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5411E007B2; Wed,  2 Dec 2015 13:50:26 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57D47E00404
	for <meta-ti@yoctoproject.org>; Wed,  2 Dec 2015 13:50:24 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3870C52A48; Wed,  2 Dec 2015 21:50:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151202215024.3870C52A48@arago-project.org>
Date: Wed,  2 Dec 2015 21:50:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : dspdce-fw: Bump SRCREV for build fix
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
X-List-Received-Date: Wed, 02 Dec 2015 21:50:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 0e624e989e542d1c57a68ce8c4a55d1a83124325
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0e624e989e542d1c57a68ce8c4a55d1a83124325

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Dec  3 00:36:28 2015 +0000

dspdce-fw: Bump SRCREV for build fix

* fix issue where dspdce-fw would rebuild dependencies

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dspdce-fw/dspdce-fw_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 3beb4fb..cf4c34c 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
 
-SRCREV = "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
+SRCREV = "88705fd4584edd1289e4bb50658def936de90433"
 
 PV = "1.00.00.06"
 
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r0"
+PR = "r1"
 inherit update-alternatives
 
 DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"


