Return-Path: <tom.rini@gmail.com>
Received: from mail-gx0-f176.google.com (mail-gx0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 766E7E01363
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:15:00 -0700 (PDT)
Received: by mail-gx0-f176.google.com with SMTP id s6so1237182ggc.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KZsp4LLouCbQ4WW2LMydYYq+CgcMgszESd0KRst6MOE=;
	b=ARud56IaI+Vzrk740+eufqTj+neh7ypPz5ALi60sLbon2fvPrsVbvn8fkWsR9MnIlV
	eZ36wK4x6ysCOI+HcbEBLKs41qvKpcRyDYxZmrDzfpwqCyyab0QqX97RvQudOozqpSio
	7Rh7aj2LmGUj4GErazEk7FaHBuZafSH9l8dRHCb/um+xgNiXCJfzosIvbGTsHGjM286h
	B7ySWXhfGHrNeTzlSwYQby7hVRW6umk4pljrs6ro1iggM2K3Qq/kPfr6hHWlbqk/GOtu
	8L7dQaZT0OEfAt4XbkzDOXcRDnzQHWtH1ktxmB7TZi8cFwhxYw+pItFP3KoxLY3pUx2Z
	HY1g==
Received: by 10.60.4.162 with SMTP id l2mr41290724oel.3.1332958500090;
	Wed, 28 Mar 2012 11:15:00 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.14.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:14:59 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:43 -0700
Message-Id: <1332958485-967-8-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 08/10] beaglebone.conf: Use '=+' not '+=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:15:00 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/beaglebone.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 3803edf..e8a0627 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -15,7 +15,7 @@ EXTRA_IMAGEDEPENDS = "u-boot"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 
-IMAGE_FSTYPES += "tar.bz2 "
+IMAGE_FSTYPES =+ "tar.bz2"
 
 # Guesswork
 SERIAL_CONSOLE = "115200 ttyO0"
-- 
1.7.0.4


