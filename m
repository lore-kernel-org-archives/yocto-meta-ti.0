Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CF1EE00BE6; Thu, 15 Jun 2017 10:38:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05771E00BA2
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 10:38:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5FHcF3U019311
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 12:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497548295;
	bh=0K6dA7+5wDifN3eJVQCEFPuwr6g4VcMYKbwIrO+zowc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Si4MGjiMtoIzaVNe0LEpi2mqYpHxbamAnt55zg4tZmMk0NGHrlXobdvmlbvkWmhoq
	fr6xSl+tT+xXFY/h8qRaFw2KGWpPLg2UpJZOrJdXKWUveQ+7e4B+Z5nqG04d15sUwn
	HP2e25yYW3Pe0tU8HUs/yIVioZf9PyzgRPI13ptk=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5FHcAeN027729
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 12:38:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 12:38:09 -0500
Received: from udc0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5FHc8bU026872;	Thu, 15 Jun 2017 12:38:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Jun 2017 13:38:05 -0400
Message-ID: <1497548285-24793-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1497548285-24793-1-git-send-email-j-stiffler@ti.com>
References: <1497548285-24793-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] omapl137, omapl137-evm: add SOC family and machine configuration
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
X-List-Received-Date: Thu, 15 Jun 2017 17:38:28 -0000
Content-Type: text/plain

* The omapl137 family does not have linux support and is only
  supported by baremetal and TI RTOS.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/machine/include/omapl137.inc |  5 +++++
 conf/machine/omapl137-evm.conf    | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 conf/machine/include/omapl137.inc
 create mode 100644 conf/machine/omapl137-evm.conf

diff --git a/conf/machine/include/omapl137.inc b/conf/machine/include/omapl137.inc
new file mode 100644
index 0000000..5d8a6dd
--- /dev/null
+++ b/conf/machine/include/omapl137.inc
@@ -0,0 +1,5 @@
+require conf/machine/include/omapl1.inc
+SOC_FAMILY_append = ":omapl137"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "omapl137"
diff --git a/conf/machine/omapl137-evm.conf b/conf/machine/omapl137-evm.conf
new file mode 100644
index 0000000..a8039f3
--- /dev/null
+++ b/conf/machine/omapl137-evm.conf
@@ -0,0 +1,15 @@
+#@TYPE: Machine
+#@NAME: OMAP-L137 EVM
+#@DESCRIPTION: Machine configuration for the TI OMAP-L137 EVM board
+
+require conf/machine/include/davinci.inc
+require conf/machine/include/omapl137.inc
+
+# HACK: The omapl137 family does not have linux kernel support.
+PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
+EXTRA_IMAGEDEPENDS = ""
+
+IMAGE_FSTYPES = "tar.xz"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_BOARDS = "evmOMAPL137"
-- 
1.9.1


