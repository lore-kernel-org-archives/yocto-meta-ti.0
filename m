Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21D24E00CB2; Fri, 28 Aug 2015 17:04:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84216E00CB2
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 17:04:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A132352AB5; Sat, 29 Aug 2015 00:04:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150829000430.A132352AB5@arago-project.org>
Date: Sat, 29 Aug 2015 00:04:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: bump rev, update GFX patches w/ AM3/ AM4 support
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
X-List-Received-Date: Sat, 29 Aug 2015 00:04:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 3d13f0b19acf8525806e504a3bfe032beaca0a47
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3d13f0b19acf8525806e504a3bfe032beaca0a47

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug 29 03:25:07 2015 +0000

linux-ti-staging: bump rev, update GFX patches w/ AM3/AM4 support

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...0001-DT-gpu-add-binding-for-TI-SGX-driver.patch |    4 +-
 ...-dts-DRA7xx-add-device-tree-entry-for-SGX.patch |    4 +-
 .../0003-arm-dra7xx-Add-gpu-hwmod-data.patch       |    4 +-
 .../0004-drm-omap-Add-omapdrm-plugin-API.patch     |    4 +-
 ...cache-flush-management-symbols-when-MULTI.patch |   36 +++++
 .../0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch  |  150 ++++++++++++++++++++
 .../0007-ARM-dts-am437x-add-DT-node-for-gpu.patch  |  102 +++++++++++++
 ...se-pdata-quirks-for-sgx-deassert_hardrese.patch |   96 +++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |   27 ++--
 9 files changed, 408 insertions(+), 19 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=3d13f0b19acf8525806e504a3bfe032beaca0a47

