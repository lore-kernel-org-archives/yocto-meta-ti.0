Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26536E00939; Thu,  3 Sep 2015 21:51:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03841E00A81
	for <meta-ti@yoctoproject.org>; Thu,  3 Sep 2015 21:51:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EE41D529D2; Fri,  4 Sep 2015 04:51:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150904045114.EE41D529D2@arago-project.org>
Date: Fri,  4 Sep 2015 04:51:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with latest merges, first 4 SGX patches upstreamed
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
X-List-Received-Date: Fri, 04 Sep 2015 04:51:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 06f0a01c8debed686a50a0ac60d477f831b5fac5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=06f0a01c8debed686a50a0ac60d477f831b5fac5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Sep  4 02:16:18 2015 +0000

linux-ti-staging: update with latest merges, first 4 SGX patches upstreamed

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...0001-DT-gpu-add-binding-for-TI-SGX-driver.patch |   52 --
 ...-dts-DRA7xx-add-device-tree-entry-for-SGX.patch |   37 --
 .../0003-arm-dra7xx-Add-gpu-hwmod-data.patch       |   85 ---
 .../0004-drm-omap-Add-omapdrm-plugin-API.patch     |  585 --------------------
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |   10 +-
 5 files changed, 3 insertions(+), 766 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=06f0a01c8debed686a50a0ac60d477f831b5fac5

