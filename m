Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62CFBE00B3A; Thu, 27 Aug 2015 12:59:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A754E00B3A
	for <meta-ti@yoctoproject.org>; Thu, 27 Aug 2015 12:59:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0C33B52A9D; Thu, 27 Aug 2015 19:59:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150827195919.0C33B52A9D@arago-project.org>
Date: Thu, 27 Aug 2015 19:59:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: bump rev, update J6/ AM5 GFX patches to rev3
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
X-List-Received-Date: Thu, 27 Aug 2015 19:59:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b5be811d51b61c2d10f54f9c52152cff37c04f2c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b5be811d51b61c2d10f54f9c52152cff37c04f2c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Aug 28 01:44:29 2015 +0000

linux-ti-staging: bump rev, update J6/AM5 GFX patches to rev3

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...0001-DT-gpu-add-binding-for-TI-SGX-driver.patch |   25 ++++++-----
 ...dts-DRA7xx-add-device-tree-entry-for-SGX.patch} |   24 +++++-----
 ...02-ARM-dts-DRA7xx-add-gpu-interface-clock.patch |   34 --------------
 ...ch => 0003-arm-dra7xx-Add-gpu-hwmod-data.patch} |   48 ++++----------------
 ... => 0004-drm-omap-Add-omapdrm-plugin-API.patch} |   22 +++++-----
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |   11 ++---
 6 files changed, 52 insertions(+), 112 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=b5be811d51b61c2d10f54f9c52152cff37c04f2c

