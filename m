Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACC1CE009CD; Thu,  2 Feb 2017 15:35:31 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5010EE00998
	for <meta-ti@yoctoproject.org>; Thu,  2 Feb 2017 15:35:28 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1153C52B36; Thu,  2 Feb 2017 23:35:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170202233527.1153C52B36@arago-project.org>
Date: Thu,  2 Feb 2017 23:35:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: add version 2017.01
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
X-List-Received-Date: Thu, 02 Feb 2017 23:35:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f5ae3a3dc23045b1488ff4732bd45f2137b48001
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f5ae3a3dc23045b1488ff4732bd45f2137b48001

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb  2 04:04:07 2017 +0000

u-boot-ti-staging: add version 2017.01

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
new file mode 100644
index 0000000..e07b874
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -0,0 +1,5 @@
+require u-boot-ti.inc
+
+BRANCH = "ti-u-boot-2017.01"
+
+SRCREV = "d31a991ba516f814b340e0b0d280624ca902d563"


