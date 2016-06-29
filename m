Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22958E00DA3; Wed, 29 Jun 2016 14:12:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB5FAE00DAE
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 14:11:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B2F0252AD1; Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160629211156.B2F0252AD1@arago-project.org>
Date: Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : pa-lld: Bump version
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
Branch: master
Commit: a291c74486dc9ebd1c1f289bcd082d14183ad96d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a291c74486dc9ebd1c1f289bcd082d14183ad96d

Author: Justin Sobota <jsobota@ti.com>
Date:   Tue Jun 28 00:31:05 2016 +0000

pa-lld: Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pa-lld/pa-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index c083bc2..6c51560 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -9,16 +9,16 @@ PA_LLD_GIT_PROTOCOL = "git"
 PA_LLD_GIT_BRANCH = "master"
 PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.08A"
-PA_LLD_SRCREV = "9294e42fd5763555c28e46b51246bab439fd552e"
+# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.12"
+PA_LLD_SRCREV = "d3f3f5d93d3febc24099974bbc77e67c80a83b1e"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
 SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
             file://0001-makefile_armv7-fix-missing-separator-error.patch"
 SRCREV = "${PA_LLD_SRCREV}"
 
-PV = "03.00.01.08"
-INC_PR = "r1"
+PV = "03.00.01.12"
+INC_PR = "r2"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 


