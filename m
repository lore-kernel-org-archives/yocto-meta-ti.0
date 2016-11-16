Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 962E1E00C4F; Wed, 16 Nov 2016 11:40:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36882E00712
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2016 11:40:25 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7A4E752A4B; Wed, 16 Nov 2016 19:40:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161116194022.7A4E752A4B@arago-project.org>
Date: Wed, 16 Nov 2016 19:40:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux: k2g: use k2g-evm files for all k2g SOCs
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
X-List-Received-Date: Wed, 16 Nov 2016 19:40:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 6cf0211e8a72e076d1409ae52e43e6be497db475
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6cf0211e8a72e076d1409ae52e43e6be497db475

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov 16 09:01:22 2016 -0500

linux: k2g: use k2g-evm files for all k2g SOCs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/files/{k2g-evm => k2g}/cmem.dtsi         |    0
 .../{k2g-evm => k2g}/defconfig                     |    0
 .../{k2g-evm => k2g}/defconfig                     |    0
 .../{k2g-evm => k2g}/defconfig                     |    0
 4 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/files/k2g-evm/cmem.dtsi b/recipes-kernel/linux/files/k2g/cmem.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/k2g-evm/cmem.dtsi
rename to recipes-kernel/linux/files/k2g/cmem.dtsi
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/k2g-evm/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.4/k2g-evm/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.4/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g-evm/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g-evm/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g/defconfig


