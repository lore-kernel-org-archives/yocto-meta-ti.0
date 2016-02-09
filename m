Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08F9BE00DAA; Tue,  9 Feb 2016 06:06:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA8D6E00DA5
	for <meta-ti@yoctoproject.org>; Tue,  9 Feb 2016 06:06:34 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 63DED52A75; Tue,  9 Feb 2016 14:06:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160209140634.63DED52A75@arago-project.org>
Date: Tue,  9 Feb 2016 14:06:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : pru-icss: actually bump SRCREV for previous change
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
X-List-Received-Date: Tue, 09 Feb 2016 14:06:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e16e6caf6a035f41c7d4e17f3dcb3e5ba8478be7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e16e6caf6a035f41c7d4e17f3dcb3e5ba8478be7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb  9 12:23:33 2016 +0000

pru-icss: actually bump SRCREV for previous change

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/pru-icss_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 9061e8c..2d78fa5 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,7 +8,7 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "c21ff82cf0a8864a66505be88be1d579a66a983a"
+SRCREV = "6f42b6006ba7a98c7ad9075424b8f77e8d531ab0"
 
 PV = "4.0.1"
 PR = "r2"


