Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FCE7E00A81; Thu,  3 Sep 2015 21:59:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9261DE00A81
	for <meta-ti@yoctoproject.org>; Thu,  3 Sep 2015 21:59:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4A82A529F0; Fri,  4 Sep 2015 04:59:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150904045934.4A82A529F0@arago-project.org>
Date: Fri,  4 Sep 2015 04:59:34 +0000 (UTC)
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
X-List-Received-Date: Fri, 04 Sep 2015 04:59:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: a854519df8cc1cdc77ef6af2d211cefe5c20ff79
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a854519df8cc1cdc77ef6af2d211cefe5c20ff79

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Sep  4 10:53:54 2015 +0000

linux-ti-staging: update with latest merges, first 4 SGX patches upstreamed

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...0001-DT-gpu-add-binding-for-TI-SGX-driver.patch |   52 --
 ...-dts-DRA7xx-add-device-tree-entry-for-SGX.patch |   37 --
 .../0003-arm-dra7xx-Add-gpu-hwmod-data.patch       |   85 ---
 .../0004-drm-omap-Add-omapdrm-plugin-API.patch     |  585 --------------------
 recipes-kernel/linux/linux-ti-staging-4.1/sgx.cfg  |    1 +
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |   25 +-
 6 files changed, 14 insertions(+), 771 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=a854519df8cc1cdc77ef6af2d211cefe5c20ff79

