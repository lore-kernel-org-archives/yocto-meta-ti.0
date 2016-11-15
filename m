Return-Path: <jreeder@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27F37E0093B; Tue, 15 Nov 2016 17:44:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 11220 seconds by postgrey-1.32 at yocto-www;
	Tue, 15 Nov 2016 17:44:17 PST
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD244E0081E
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2016 17:44:17 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uAFMbF3a025123
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2016 16:37:15 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uAFMbFtb017526
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2016 16:37:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 15 Nov 2016 16:37:14 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uAFMbFxQ006094;	Tue, 15 Nov 2016 16:37:15 -0600
Received: from localhost (uda0273976.am.dhcp.ti.com [10.219.21.82])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	uAFMbE323843; Tue, 15 Nov 2016 16:37:15 -0600 (CST)
From: Jason Reeder <jreeder@ti.com>
To: meta-ti <meta-ti@yoctoproject.org>
Date: Tue, 15 Nov 2016 16:36:28 -0600
Message-ID: <1479249388-18158-1-git-send-email-jreeder@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pru-icss: bump SRCREV and PV due to updates
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
X-List-Received-Date: Wed, 16 Nov 2016 01:44:21 -0000
Content-Type: text/plain

Due to bug fixes and updates, the package version number
is being incremented to 5.1.0. The commit ID is also being
updated to reflect these changes.

Signed-off-by: Jason Reeder <jreeder@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 1fbfd12..c8c472e 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "5e08c1f7c1f1d642b508e8b9cea246d9d8ef54c8"
+SRCREV = "4efd227bebd8eb0bc12f40fac043dc9c26d4f8c3"
 
-PV = "5.0.1"
+PV = "5.1.0"
 PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
-- 
1.9.1


