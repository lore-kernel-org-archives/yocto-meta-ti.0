Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7D34E0140A
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:48:04 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id fg15so1432535wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=b/MGdYm8lM1I2lEDoNlWOpy9jNc+GgFC7OkSpbE0/Uw=;
	b=MxQgd2QuNFXlwDd7BWCIuN334mXE3BiiBKWnIQSfaaNsdF3/MdVhJMn3a8kHhzvCRv
	BzCN7BGYc2lyhhrGDbY70ENFl3u2wmpMjVRRhmq5ADCFk/FUNJBPJZXU1vyurdqtV5/S
	8L1WKJnLlVVMSxzHf/Mm6Ui90dvkz6hueS/TtCo/dS7zIaUtbJPbSzY/jUEcxEl0FGGz
	+QTzbqzd4d+AKcx5SR/1r46h3n6zCrIyrfVjexXNf8C11BqJTCiUKAaq0sRf1g0C3Fxb
	AP0yMY59CnsZOrjNeNaWPVskuctXSAJQiOAA1YNnh09hTpq7H9zYWvBEteKHi2r0CiQw
	wJnQ==
Received: by 10.180.24.35 with SMTP id r3mr6924732wif.7.1334666884610;
	Tue, 17 Apr 2012 05:48:04 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id l5sm26749968wia.11.2012.04.17.05.48.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 05:48:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 17 Apr 2012 14:47:45 +0200
Message-Id: <1334666866-24955-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
References: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlYDZe+RwtU9fjA8UcM+tQ8OA5She98nYypbyd+kXqSC7tzEUaILrwUO9dHtIbEnP+PE0Eq
Cc: denys@ti.com
Subject: [PATCH v2 6/7] linux-ti33x-psp 3.2: include latest MUSB fixes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 12:48:05 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    2 +-
 recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh  |    3 +--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 605a324..0912875 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -2322,7 +2322,7 @@ CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_SMSCUFX=m
 CONFIG_FB_UDL=m
 CONFIG_FB_DA8XX=y
-CONFIG_FB_DA8XX_CONSISTENT_DMA_SIZE=4
+CONFIG_FB_DA8XX_CONSISTENT_DMA_SIZE=5
 # CONFIG_FB_VIRTUAL is not set
 # CONFIG_FB_METRONOME is not set
 # CONFIG_FB_BROADSHEET is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh b/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
index 5215d44..695eb41 100755
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
@@ -7,8 +7,7 @@ set -e
 # don't use builtin 'echo' from /bin/sh
 export ECHO="$(which echo)"
 
-#git tag -f beaglebone-v3.2 09e9651bcf2ee8d86685f2a8075bc6557b1d3b91
-git tag -f beaglebone-v3.2 88dcc46017b970660ff113c1bb4e7d832c5a3693
+git tag -f beaglebone-v3.2 e8004dad869568692ca2a45c04e8464ce48cc4d7
 
 TAG="beaglebone-v3.2"
 EXTRATAG=""
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 082c73c..1dad0fb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,8 +11,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "88dcc46017b970660ff113c1bb4e7d832c5a3693"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+SRCREV = "e8004dad869568692ca2a45c04e8464ce48cc4d7"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.2.5


