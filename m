Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 043DBE00E31; Mon, 19 Dec 2016 15:16:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D15F8E00D71
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0AF2752AC9; Mon, 19 Dec 2016 23:15:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231551.0AF2752AC9@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : common-csl-ip: Upstream version 3.3.0.5A
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
X-List-Received-Date: Mon, 19 Dec 2016 23:16:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: e3bf02aa14a70cd833cd4a17cb8853bdb0f2252d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e3bf02aa14a70cd833cd4a17cb8853bdb0f2252d

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:42 2016 +0000

common-csl-ip: Upstream version 3.3.0.5A

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/common-csl-ip/common-csl-ip.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 76181e8..166eaa4 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 
-PV = "03.03.00.04B"
+PV = "03.03.00.05A"
 INC_PR = "r0"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
@@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "master"
 CSL_GIT_DESTSUFFIX = "git"
 
-# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.04B"
-CSL_SRCREV = "a74dc132a21085214b49c3ae8884825d87b6dd2f"
+# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.05A"
+CSL_SRCREV = "811646f507d985dac04544c60c965cadf5e26a4f"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"


