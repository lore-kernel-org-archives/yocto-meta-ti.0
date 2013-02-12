Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id DEEF4E006AD
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:53 -0800 (PST)
Received: by mail-oa0-f50.google.com with SMTP id l20so6846166oag.23
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=IIbYAoc4fWEl/gfFkhRzOc+m8RMuuxu/A/5CDYhaDG0=;
	b=czMqj4tNfXmRESSjYNBKEetixgiTo5ia/0sbzGegEikycFJGZywkMhrP7+TvD8/Uv9
	ZaQ3lHPOzYr8TzjH9kR8Ss4pO+56qBpAX61X3p6477xIMBzUVKeL3ne+bL9KLpl3hCUL
	47+lYYxQlg1JBBbPvi8D/zfbr8Eiti98k/pA52XauY5jzbyVoPjdiUuzGMZzYLXqCmdS
	mRIscUuB+wAe6th7Skqk3HG5i8443O7Q4kjyqVSSYxktEoukws+dy8241RkmRdZfZR/+
	wC1+QTpE4pOWfkcIIvUTDMBl4FpvDUJevYXEUeXLDrtFErCN2ntaKrd/Zvc2YbXDPcdk
	LL1w==
X-Received: by 10.60.10.226 with SMTP id l2mr12444937oeb.67.1360631093080;
	Mon, 11 Feb 2013 17:04:53 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v2sm51155307obl.10.2013.02.11.17.04.50
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 17:04:51 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Mon, 11 Feb 2013 19:04:37 -0600
Message-Id: <1360631082-29015-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360631082-29015-1-git-send-email-fcooper@ti.com>
References: <1360631082-29015-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 2/7] linux-omapl138-psp_2.6.37: Add MACHINE_KERNEL_PR and fix white space issues.
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
X-List-Received-Date: Tue, 12 Feb 2013 01:04:54 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add MACHINE_KERNEL_PR variable to enable future tweaks to this recipe.
* Convert tabs to whitespaces

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index 5441675..ec472d7 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -6,6 +6,8 @@ KERNEL_IMAGETYPE = "uImage"
 require multi-kernel.inc
 require tipspkernel.inc
 
+MACHINE_KERNEL_PR_append = "a"
+
 S = "${WORKDIR}/git"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
@@ -16,14 +18,14 @@ SRCREV = "v2.6.37_DAVINCIPSP_03.21.00.04"
 COMPATIBLE_MACHINE = "(omapl138)"
 
 SRC_URI += "git://arago-project.org/git/projects/linux-davinci.git;protocol=git;branch=${BRANCH} \
-	file://defconfig"
+    file://defconfig"
 
 PATCHES_OVER_PSP = " \
-	file://0001-TI-WL12xx-MMC-patches-03.21.00.04.patch \
-	file://0002-da850-Set-maximum-OPP-frequency-to-456MHz.patch \
-	file://0003-AM18xx-WL1271-Enable-BT.patch \
-	file://0004-PSP03.21.00.04.sdk-activate-wireless-extensions.patch \
-	file://0005-Davinci-da850-Add-Mistral-WL12XX-config-support-to.patch \
-	file://0006-Add-wlan-and-BT-config-switches.patch \
-	file://uio_pruss.patch \
-	"
+    file://0001-TI-WL12xx-MMC-patches-03.21.00.04.patch \
+    file://0002-da850-Set-maximum-OPP-frequency-to-456MHz.patch \
+    file://0003-AM18xx-WL1271-Enable-BT.patch \
+    file://0004-PSP03.21.00.04.sdk-activate-wireless-extensions.patch \
+    file://0005-Davinci-da850-Add-Mistral-WL12XX-config-support-to.patch \
+    file://0006-Add-wlan-and-BT-config-switches.patch \
+    file://uio_pruss.patch \
+"
-- 
1.7.0.4


