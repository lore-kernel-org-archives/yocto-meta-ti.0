Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E787DE009C2; Tue, 16 May 2017 12:17:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77E44E0059A
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 12:17:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4GJHEaH012284
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 14:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494962234;
	bh=ptNTfqsumEve8O2/qMrQ1f/bt+IE6B+aCA6YN6tERH0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BAnUhskXaZc9Fj5CyLayHfyRfABPw2QP0ZjGuRBrDHaaH+XvjdVpKVtCGbHqFa9Qx
	paSnZODcjgmTUfyYwfBG3UtgqgTSzwT9Y7/4ILF3gUF618taWmf+U6PcmncmvFIvd9
	HNJ6oSoHI/o4nZ7K41wxVVKX9eoSoR6FCG6vzp6k=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4GJHEGJ003640
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 14:17:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 May 2017 14:17:13 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4GJHC7K013647;	Tue, 16 May 2017 14:17:14 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 16 May 2017 15:11:40 -0400
Message-ID: <1494961900-8068-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494961900-8068-1-git-send-email-j-stiffler@ti.com>
References: <1494961900-8068-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] c66x: add basic machine configuration
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
X-List-Received-Date: Tue, 16 May 2017 19:17:16 -0000
Content-Type: text/plain

* The c66x SOCs (e.g. c665x-evm and c667x-evm) are DSP-only devices,
  and therefore do not have a supported kernel nor an integrated
  toolchain.
* Add these machines to allow the creation of baremetal and TI RTOS
  packages.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/machine/c665x-evm.conf   | 9 +++++++++
 conf/machine/c667x-evm.conf   | 9 +++++++++
 conf/machine/include/c66x.inc | 9 +++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 conf/machine/c665x-evm.conf
 create mode 100644 conf/machine/c667x-evm.conf
 create mode 100644 conf/machine/include/c66x.inc

diff --git a/conf/machine/c665x-evm.conf b/conf/machine/c665x-evm.conf
new file mode 100644
index 0000000..d0af754
--- /dev/null
+++ b/conf/machine/c665x-evm.conf
@@ -0,0 +1,9 @@
+#@TYPE: Machine
+#@NAME: Keystone 1 c665x machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 1 c665x EVM
+
+require conf/machine/include/c66x.inc
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "c6657"
+TI_PDK_LIMIT_BOARDS = "evmC6657"
diff --git a/conf/machine/c667x-evm.conf b/conf/machine/c667x-evm.conf
new file mode 100644
index 0000000..11a90e4
--- /dev/null
+++ b/conf/machine/c667x-evm.conf
@@ -0,0 +1,9 @@
+#@TYPE: Machine
+#@NAME: Keystone 1 c667x machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 1 c667x EVM
+
+require conf/machine/include/c66x.inc
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "c6678"
+TI_PDK_LIMIT_BOARDS = "evmC6678"
diff --git a/conf/machine/include/c66x.inc b/conf/machine/include/c66x.inc
new file mode 100644
index 0000000..e35f2ed
--- /dev/null
+++ b/conf/machine/include/c66x.inc
@@ -0,0 +1,9 @@
+require conf/machine/include/keystone.inc
+SOC_FAMILY_append = ":c66x"
+
+# HACK: The c66x family is composed of devices with only DSP cores, and no ARM
+#       cores. The Linux kernel is not supported on these machines.
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
+EXTRA_IMAGEDEPENDS = ""
+
+IMAGE_FSTYPES = "tar.xz"
-- 
2.7.4


