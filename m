Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDEE9E00D29; Tue, 26 Apr 2016 11:55:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF5ACE00D2C
	for <meta-ti@yoctoproject.org>; Tue, 26 Apr 2016 11:55:17 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 46987529ED; Tue, 26 Apr 2016 18:55:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160426185516.46987529ED@arago-project.org>
Date: Tue, 26 Apr 2016 18:55:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : sgx: drop old outdated omap3-sgx-modules and libgles-omap3 recipes
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
X-List-Received-Date: Tue, 26 Apr 2016 18:55:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6dea1b68af73cc1c6bcf4c3f780ed6fcce770adb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6dea1b68af73cc1c6bcf4c3f780ed6fcce770adb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Apr 25 23:56:27 2016 +0000

sgx: drop old outdated omap3-sgx-modules and libgles-omap3 recipes

Besides being outdated and deprecated in favor of new ti-sgx-ddk recipes
(previously known as omapdrm-pvr and omap5-sgx-ddk), 3D graphics drivers
are kernel specific and corresponding kernel versions (prior to 4.0) have
all been dropped already.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...SDK-Make-5_01_01_01-work-against-3.14-LTS.patch |   52 ---
 ...x-use-platform-data-to-provide-reset-info.patch |  121 ------
 ...class-am335x-am437x-fix-mutex-deadlock-wa.patch |  153 -------
 ...-make-it-building-against-ti-linux-3.14.y.patch |   45 --
 .../omap3-sgx-modules-x11_4.09.00.01.bb            |   81 ----
 .../Compile-fixes-for-38-kernel.patch              |  346 ---------------
 .../omap3-sgx-modules/kernel-30.patch              |   38 --
 .../omap3-sgx-modules_4.05.00.03.bb                |   39 --
 .../omap3-sgx-modules_4.09.00.01.bb                |   53 ---
 .../omap3-sgx-modules_5.01.01.01.bb                |   62 ---
 .../omap3-sgx-modules_5.01.01.02.bb                |   58 ---
 .../libgles/libgles-omap3-4.09.00.01/rc.pvr        |  124 ------
 .../libgles/libgles-omap3-4.09.00.01/rc_dri.pvr    |  136 ------
 .../libgles/libgles-omap3-5.01.01.01/rc.pvr        |  134 ------
 .../libgles/libgles-omap3-5.01.01.01/rc_dri.pvr    |  145 -------
 .../libgles/libgles-omap3-5.01.01.02/rc.pvr        |  134 ------
 .../libgles/libgles-omap3-5.01.01.02/rc_dri.pvr    |  145 -------
 recipes-graphics/libgles/libgles-omap3-no-x.inc    |  341 ---------------
 .../99-bufferclass.rules                           |    7 -
 .../libgles/libgles-omap3-x11-4.09.00.01/cputype   |   17 -
 .../libgles/libgles-omap3-x11-4.09.00.01/rc.pvr    |  125 ------
 .../libgles-omap3-x11-4.09.00.01/rc_dri.pvr        |  137 ------
 .../libgles-omap3-x11-4.09.00.01/sample.desktop    |    8 -
 recipes-graphics/libgles/libgles-omap3-x11.inc     |  333 ---------------
 .../libgles/libgles-omap3-x11_4.09.00.01.bb        |   90 ----
 recipes-graphics/libgles/libgles-omap3.inc         |  439 --------------------
 .../libgles/libgles-omap3/99-bufferclass.rules     |    7 -
 recipes-graphics/libgles/libgles-omap3/cputype     |   25 --
 recipes-graphics/libgles/libgles-omap3/rc.pvr      |  124 ------
 .../libgles/libgles-omap3/sample.desktop           |    8 -
 .../libgles/libgles-omap3_4.05.00.03.bb            |   29 --
 .../libgles/libgles-omap3_4.09.00.01.bb            |   46 --
 .../libgles/libgles-omap3_5.01.01.01.bb            |   50 ---
 .../libgles/libgles-omap3_5.01.01.02.bb            |   50 ---
 34 files changed, 0 insertions(+), 3702 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=6dea1b68af73cc1c6bcf4c3f780ed6fcce770adb

