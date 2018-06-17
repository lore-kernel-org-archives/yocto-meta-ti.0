Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31EA4E010D2; Sun, 17 Jun 2018 12:37:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A478E00DD7
	for <meta-ti@yoctoproject.org>; Sun, 17 Jun 2018 12:37:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 091D920B1F;
	Sun, 17 Jun 2018 19:37:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QCfW0Ec5bXob; Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8DC2020BCF;
	Sun, 17 Jun 2018 19:37:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C827E1634AF;
	Sun, 17 Jun 2018 15:37:25 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Sun, 17 Jun 2018 15:37:22 -0400
Message-Id: <1529264243-32781-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264243-32781-1-git-send-email-denys@ti.com>
References: <1529264243-32781-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 4/5] linux-ti-staging: add defconfigs for K3 SOC family
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-4.14/k3/defconfig         | 1 +
 recipes-kernel/linux/linux-ti-staging-systest-4.14/k3/defconfig | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.14/k3/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.14/k3/defconfig

diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-4.14/k3/defconfig
new file mode 100644
index 0000000..b9bc613
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.14/k3/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_arm64_release
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.14/k3/defconfig
new file mode 100644
index 0000000..56cf930
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.14/k3/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_arm64_debug
-- 
2.7.4


