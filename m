Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D46B8E00A08; Thu, 21 May 2015 08:12:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 008E6E009EB
	for <meta-ti@yoctoproject.org>; Thu, 21 May 2015 08:12:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 63DDD52A4B; Thu, 21 May 2015 15:12:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150521151202.63DDD52A4B@arago-project.org>
Date: Thu, 21 May 2015 15:12:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes: move SRCPV from PR to PV, so PRServ can package AUTOINC after patching
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
X-List-Received-Date: Thu, 21 May 2015 15:12:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: a257bfb6ca4f5249ff31385489e960d7449c0763
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a257bfb6ca4f5249ff31385489e960d7449c0763

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 21 07:56:22 2015 +0000

recipes: move SRCPV from PR to PV, so PRServ can package AUTOINC after patching

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb       |    4 ++--
 recipes-bsp/cmem/cmem-mod_git.bb                   |    2 +-
 recipes-bsp/cmem/cmem.inc                          |    2 ++
 recipes-bsp/cmem/cmem_git.bb                       |    2 +-
 recipes-bsp/hplib/hplib-mod_git.bb                 |    2 +-
 recipes-bsp/hplib/hplib.inc                        |    2 +-
 recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb   |    3 ++-
 .../ti-ocf-crypto-module_1.0.bb                    |    3 ++-
 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb      |    3 ++-
 recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb      |    3 ++-
 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb      |    3 ++-
 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |    3 ++-
 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb    |    4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb    |    4 ++--
 recipes-bsp/u-boot/u-boot_2014.07.bb               |    2 --
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb   |    4 ++--
 recipes-kernel/linux/linux-keystone-rt_3.10.bb     |    4 ++--
 recipes-kernel/linux/linux-keystone_3.10.bb        |    4 ++--
 recipes-kernel/linux/linux-keystone_3.13.bb        |    4 ++--
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb         |    4 ++--
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |    4 ++--
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |    4 ++--
 .../linux/sitara-linux-ti-staging_3.14.bb          |    4 ++--
 23 files changed, 40 insertions(+), 34 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=a257bfb6ca4f5249ff31385489e960d7449c0763

