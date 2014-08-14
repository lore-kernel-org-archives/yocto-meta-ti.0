Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC660E004F2; Thu, 14 Aug 2014 09:53:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E02BE0044A
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 09:53:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4642B52A51; Thu, 14 Aug 2014 16:53:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140814165306.4642B52A51@arago-project.org>
Date: Thu, 14 Aug 2014 16:53:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3.14.17 stable
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
X-List-Received-Date: Thu, 14 Aug 2014 16:53:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 96cf07485bb25df46ec0c8fd9d81cc240e069deb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=96cf07485bb25df46ec0c8fd9d81cc240e069deb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Aug 14 08:26:23 2014 +0000

linux-ti-staging: update to 3.14.17 stable

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 37e6259..46c3ded 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -44,8 +44,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "8f69b4c2243fb3b0d85fd2a0b575d5170d53dbea"
-PV = "3.14.16"
+SRCREV = "367e55fbd8b6a7fb853f44a4f854eaadbbfd68c2"
+PV = "3.14.17"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"


