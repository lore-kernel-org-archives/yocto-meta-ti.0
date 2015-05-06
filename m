Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1EECE0095F; Wed,  6 May 2015 10:52:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1000EE008DC
	for <meta-ti@yoctoproject.org>; Wed,  6 May 2015 10:52:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 67407529AA; Wed,  6 May 2015 17:52:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150506175209.67407529AA@arago-project.org>
Date: Wed,  6 May 2015 17:52:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap4/pandaboard: switch from outdated 3.4 kernel to 3. 14-staging
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
X-List-Received-Date: Wed, 06 May 2015 17:52:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 5e84c68eff483f80945d2452e3d7f534a0f53eaf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5e84c68eff483f80945d2452e3d7f534a0f53eaf

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed May  6 23:24:10 2015 +0000

omap4/pandaboard: switch from outdated 3.4 kernel to 3.14-staging

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap4.inc                     |    8 +-
 ...fix-memset-related-crashes-caused-by-rece.patch |  256 --
 .../0004-ARM-7670-1-fix-the-memset-fix.patch       |   83 -
 .../linux/linux-omap4-3.4/pandaboard/defconfig     | 4152 --------------------
 recipes-kernel/linux/linux-omap4_3.4.bb            |   20 -
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |    2 +-
 6 files changed, 5 insertions(+), 4516 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=5e84c68eff483f80945d2452e3d7f534a0f53eaf

