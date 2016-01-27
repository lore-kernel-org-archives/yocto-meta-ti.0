Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A3A0E0079A; Wed, 27 Jan 2016 12:57:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81C03E00A7D
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:57:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 469AE529CF; Wed, 27 Jan 2016 20:57:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205718.469AE529CF@arago-project.org>
Date: Wed, 27 Jan 2016 20:57:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : edma3-lld: Upgrade version to 2.12.01.22
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
X-List-Received-Date: Wed, 27 Jan 2016 20:57:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 2440b332f88f81b99ceafbe3eb5101809851caab
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2440b332f88f81b99ceafbe3eb5101809851caab

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 00:12:25 2016 +0000

edma3-lld: Upgrade version to 2.12.01.22

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index 8dc80f7..533de83 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -7,11 +7,11 @@ EDMA3_LLD_GIT_PROTOCOL = "git"
 EDMA3_LLD_GIT_BRANCH = "master"
 
 # The following commit corresponds to tag DEV_EDMA3_LLD_02_12_01_21_RC1
-EDMA3_LLD_SRCREV = "562cba36ccd53e89e6979e99a58374513b543f93"
+EDMA3_LLD_SRCREV = "9a94177958b9269b1b8aeeb2a5d362ca4e64dafa"
 
 BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
 SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${EDMA3_LLD_SRCREV}"
 
-PV = "2.12.01.21"
-INC_PR = "r2"
+PV = "2.12.01.22"
+INC_PR = "r0"


