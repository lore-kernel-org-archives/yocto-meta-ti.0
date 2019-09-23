Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6EF0E00D46; Mon, 23 Sep 2019 13:53:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED0C6E00A49
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2019 13:53:00 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NKqx6Z021939
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2019 15:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569271979;
	bh=+WBrVjRbNuH0xERsAr4CcA2EqpJoWTAtUWEFwNqMeDU=;
	h=From:To:CC:Subject:Date;
	b=sep9lZgfla2VciMTTZuI3Sp//tdIHfWdyFOrKfr/CQbkW9Y+/XmhcnFAszwEh0nUF
	/ASoV3ydx6sIPNOeWyc/gsa2TL7puytNMKiY+X5RV3jy1C9eOjoc8OSQgzn0QvsFiz
	B2KgFvGnp5e1M57LwKC1qGqmTKgzDFqr3Y2SPK+4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NKqxiH078813
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2019 15:52:59 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 23 Sep 2019 15:52:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 23 Sep 2019 15:52:59 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NKqx1g032975;
	Mon, 23 Sep 2019 15:52:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 23 Sep 2019 20:37:35 +0000
Message-ID: <20190923203735.29094-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] conf/machine: mtools and dosfsutils are now in wic depends by default
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
X-List-Received-Date: Mon, 23 Sep 2019 20:53:03 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 2 +-
 conf/machine/beagle-x15.conf | 2 --
 conf/machine/beaglebone.conf | 1 -
 conf/machine/j7-evm.conf     | 2 +-
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 0652a0af..cc15d73f 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -32,4 +32,4 @@ OPTEEOUTPUTMACHINE = "k3"
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 WKS_FILE ?= "sdimage-bootpart.wks"
 
-do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
+do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
index 1386ff05..d5e05ec7 100644
--- a/conf/machine/beagle-x15.conf
+++ b/conf/machine/beagle-x15.conf
@@ -16,8 +16,6 @@ WKS_FILE ?= "sdimage-bootpart.wks"
 IMAGE_BOOT_FILES = "MLO u-boot.img"
 IMAGE_FSTYPES += "tar.xz wic.xz"
 
-do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 69db4215..d8fd4062 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -15,7 +15,6 @@ SERIAL_CONSOLES = "115200;ttyS0"
 
 WKS_FILE ?= "sdimage-bootpart.wks"
 
-do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
 IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY}"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index da3cc8e7..0a0c5bd5 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -29,7 +29,7 @@ OPTEEOUTPUTMACHINE = "k3"
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 WKS_FILE ?= "sdimage-bootpart.wks"
 
-do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
+do_image_wic[depends] += "u-boot:do_deploy"
 
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "j721e"
-- 
2.17.1


