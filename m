Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2515E00C46; Wed, 16 Nov 2016 06:08:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 267 seconds by postgrey-1.32 at yocto-www;
	Wed, 16 Nov 2016 06:08:11 PST
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 900A3E00C82
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2016 06:08:11 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uAGE3igB021819
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2016 08:03:44 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uAGE3iaY028714
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2016 08:03:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 08:03:43 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uAGE3hhv014463;	Wed, 16 Nov 2016 08:03:43 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 16 Nov 2016 09:01:22 -0500
Message-ID: <1479304882-8116-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] linux: k2g: use k2g-evm files for all k2g SOCs
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
X-List-Received-Date: Wed, 16 Nov 2016 14:08:23 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/files/{k2g-evm => k2g}/cmem.dtsi                     | 0
 recipes-kernel/linux/linux-ti-staging-4.4/{k2g-evm => k2g}/defconfig      | 0
 recipes-kernel/linux/linux-ti-staging-rt-4.4/{k2g-evm => k2g}/defconfig   | 0
 .../linux/linux-ti-staging-systest-4.4/{k2g-evm => k2g}/defconfig         | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-kernel/linux/files/{k2g-evm => k2g}/cmem.dtsi (100%)
 rename recipes-kernel/linux/linux-ti-staging-4.4/{k2g-evm => k2g}/defconfig (100%)
 rename recipes-kernel/linux/linux-ti-staging-rt-4.4/{k2g-evm => k2g}/defconfig (100%)
 rename recipes-kernel/linux/linux-ti-staging-systest-4.4/{k2g-evm => k2g}/defconfig (100%)

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
-- 
2.7.4


