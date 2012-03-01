Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4473E01400
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 00:48:49 -0800 (PST)
Received: by werm13 with SMTP id m13so225603wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 01 Mar 2012 00:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.7.231 as permitted sender)
	client-ip=10.180.7.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.7.231 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.7.231])
	by 10.180.7.231 with SMTP id m7mr30399754wia.3.1330591728687 (num_hops
	= 1); Thu, 01 Mar 2012 00:48:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.7.231 with SMTP id m7mr24381130wia.3.1330591728527;
	Thu, 01 Mar 2012 00:48:48 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id p10sm40957234wic.0.2012.03.01.00.48.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 00:48:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  1 Mar 2012 09:48:34 +0100
Message-Id: <1330591716-30218-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
References: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlv3bOxmi8bSFnpsaAFeNGtEmrMHgdISkypNUl4D5KXhS7UcLojKA6Sc+L61L6oP1+4ST6p
Subject: [PATCH 1/3] linux 3.0: enable 'option' serial for beagleboard
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
X-List-Received-Date: Thu, 01 Mar 2012 08:48:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../linux/linux-3.0/beagleboard/defconfig          |    5 +++--
 recipes-kernel/linux/linux_3.0.bb                  |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
index 5f2a7eb..5be7772 100644
--- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
+++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Linux/arm 3.0.14 Kernel Configuration
+# Linux/arm 3.0.22 Kernel Configuration
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -2785,7 +2785,8 @@ CONFIG_USB_SERIAL_SIERRAWIRELESS=m
 # CONFIG_USB_SERIAL_TI is not set
 CONFIG_USB_SERIAL_CYBERJACK=m
 # CONFIG_USB_SERIAL_XIRCOM is not set
-# CONFIG_USB_SERIAL_OPTION is not set
+CONFIG_USB_SERIAL_WWAN=m
+CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_SERIAL_OPTICON=m
 CONFIG_USB_SERIAL_VIVOPAY_SERIAL=m
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 65084fb..fac6348 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -10,7 +10,7 @@ PV = "3.0.22"
 SRCREV_pn-${PN} = "a4a663513af05a98d6085d92f85c16bb64ac4050"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
-- 
1.7.2.5


