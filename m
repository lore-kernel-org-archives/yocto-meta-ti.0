Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87D76E00D34; Fri, 29 Apr 2016 18:33:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65393E00D19
	for <meta-ti@yoctoproject.org>; Fri, 29 Apr 2016 18:33:18 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BF5D152A0B; Sat, 30 Apr 2016 01:33:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160430013317.BF5D152A0B@arago-project.org>
Date: Sat, 30 Apr 2016 01:33:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-osal: correct EPL license reference
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
X-List-Received-Date: Sat, 30 Apr 2016 01:33:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9b2e9feb4903fea29a16b62d979309f83ff7bbb5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9b2e9feb4903fea29a16b62d979309f83ff7bbb5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Apr 30 05:53:44 2016 +0000

ti-osal: correct EPL license reference

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/osal/ti-osal.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc
index 09ee883..cb8da35 100644
--- a/recipes-ti/osal/ti-osal.inc
+++ b/recipes-ti/osal/ti-osal.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI Operating System Abstraction Library (OSAL)"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal"
-LICENSE = "BSD & EPL"
+LICENSE = "BSD & EPL-1.0"
 SECTION = "devel"
 
 require ../includes/ti-paths.inc


