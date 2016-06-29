Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C531DE00DA2; Wed, 29 Jun 2016 14:12:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B230EE00DA2
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 14:11:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0662E52AAF; Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160629211156.0662E52AAF@arago-project.org>
Date: Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : rm-lld: Bump version
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
X-List-Received-Date: Wed, 29 Jun 2016 21:12:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 3aa5480876cbd67a3c212c34f591915bd34350dd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3aa5480876cbd67a3c212c34f591915bd34350dd

Author: Justin Sobota <jsobota@ti.com>
Date:   Tue Jun 28 00:31:06 2016 +0000

rm-lld: Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rm-lld/rm-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld.inc b/recipes-bsp/rm-lld/rm-lld.inc
index 70d9b5b..4236fd2 100644
--- a/recipes-bsp/rm-lld/rm-lld.inc
+++ b/recipes-bsp/rm-lld/rm-lld.inc
@@ -7,15 +7,15 @@ RM_LLD_GIT_PROTOCOL = "git"
 RM_LLD_GIT_BRANCH = "master"
 RM_LLD_GIT_DESTSUFFIX = "git/ti/drv/rm"
 
-# Below commit ID corresponds to DEV.RM_LLD.02.02.00.01
-RM_LLD_SRCREV = "841f2df9726f456d6c026c0aa03095699962d048"
+# Below commit ID corresponds to "DEV.RM_LLD.02.02.00.02"
+RM_LLD_SRCREV = "6165053f88d1ccb5083f797d24800d5400804647"
 
 BRANCH = "${RM_LLD_GIT_BRANCH}"
 SRC_URI = "${RM_LLD_GIT_URI};destsuffix=${RM_LLD_GIT_DESTSUFFIX};protocol=${RM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${RM_LLD_SRCREV}"
 
-PV = "02.02.00.01"
-INC_PR = "r0"
+PV = "02.02.00.02"
+INC_PR = "r1"
 
 COMPATIBLE_MACHINE = "keystone"
 


