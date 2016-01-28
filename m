Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A84ADE0079A; Thu, 28 Jan 2016 10:43:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50A93E0079A
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EEADA52A60; Thu, 28 Jan 2016 18:43:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184349.EEADA52A60@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : hyplnk-lld: Bump SRCREV
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
X-List-Received-Date: Thu, 28 Jan 2016 18:43:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: df7fa1e75866c104a9b832773633ddb433520a4b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=df7fa1e75866c104a9b832773633ddb433520a4b

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:41:03 2016 +0000

hyplnk-lld: Bump SRCREV

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hyplnk-lld/hyplnk-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index ecd68e9..9f7ac6a 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -13,15 +13,15 @@ HYPLNK_GIT_PROTOCOL = "git"
 HYPLNK_GIT_BRANCH = "master"
 HYPLNK_GIT_DESTSUFFIX = "git/ti/drv/${LLDNAME}"
 
-# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.05
-HYPLNK_SRCREV = "ea2a634578626deaa69608a189d5d7e84e5b7127"
+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.05A
+HYPLNK_SRCREV = "2acb36a78fee9691a9433f0ce23cf00561123934"
 
 BRANCH="${HYPLNK_GIT_BRANCH}"
 SRC_URI = "${HYPLNK_GIT_URI};destsuffix=${HYPLNK_GIT_DESTSUFFIX};protocol=${HYPLNK_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${HYPLNK_SRCREV}"
 
 PV = "2.1.0.5"
-INC_PR = "r2"
+INC_PR = "r3"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2e-evm  = "k2e"


