Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD747E00B9D; Mon, 24 Aug 2015 11:34:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EBABE00BE6
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 11:34:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B638F52AB4; Mon, 24 Aug 2015 18:34:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150824183402.B638F52AB4@arago-project.org>
Date: Mon, 24 Aug 2015 18:34:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: bump rev, add interim GFX patches for J6/AM5
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
X-List-Received-Date: Mon, 24 Aug 2015 18:34:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a5d4b009b9dacfaf06bd1d09e1b163d2829e2a2d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a5d4b009b9dacfaf06bd1d09e1b163d2829e2a2d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Aug 24 23:50:12 2015 +0000

linux-ti-staging: bump rev, add interim GFX patches for J6/AM5

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...0001-DT-gpu-add-binding-for-TI-SGX-driver.patch |   49 ++
 ...02-ARM-dts-DRA7xx-add-gpu-interface-clock.patch |   34 ++
 ...-dts-DRA7xx-add-device-tree-entry-for-SGX.patch |   35 ++
 .../0004-arm-dra7xx-Add-gpu-hwmod-data.patch       |  115 ++++
 .../0005-drm-omap-Add-omapdrm-plugin-API.patch     |  585 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |   12 +-
 6 files changed, 828 insertions(+), 2 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=a5d4b009b9dacfaf06bd1d09e1b163d2829e2a2d

