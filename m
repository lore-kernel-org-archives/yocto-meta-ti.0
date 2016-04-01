Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05550E00CA2; Fri,  1 Apr 2016 11:40:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 908C4E00911
	for <meta-ti@yoctoproject.org>; Fri,  1 Apr 2016 11:40:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BB0ED529EF; Fri,  1 Apr 2016 18:40:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160401184034.BB0ED529EF@arago-project.org>
Date: Fri,  1 Apr 2016 18:40:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux: remove old and outdated kernel recipes and configs
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
X-List-Received-Date: Fri, 01 Apr 2016 18:40:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 31 21:53:58 2016 +0000

linux: remove old and outdated kernel recipes and configs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-3.13/defconfig |    1 -
 recipes-kernel/linux/linux-keystone-rt/defconfig   |    1 -
 recipes-kernel/linux/linux-keystone-rt_3.10.bb     |   33 -----
 recipes-kernel/linux/linux-keystone/defconfig      |    1 -
 recipes-kernel/linux/linux-keystone_3.10.bb        |   33 -----
 recipes-kernel/linux/linux-keystone_3.13.bb        |   34 -----
 recipes-kernel/linux/linux-mainline/defconfig      |    1 -
 recipes-kernel/linux/linux-mainline_3.14.bb        |   41 ------
 recipes-kernel/linux/linux-ti-glsdk/defconfig      |    1 -
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb         |   32 -----
 .../linux/linux-ti-staging-3.14/configs/systest    |    1 -
 .../linux/linux-ti-staging-3.14/defconfig          |    1 -
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |   67 ----------
 recipes-kernel/linux/multi-kernel.inc              |  140 --------------------
 .../linux/sitara-linux-ti-staging-3.14/defconfig   |    1 -
 .../linux/sitara-linux-ti-staging_3.14.bb          |   51 -------
 16 files changed, 0 insertions(+), 439 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7

