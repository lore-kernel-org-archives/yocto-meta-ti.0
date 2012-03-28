Return-Path: <tom.rini@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E1FFE00747
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:15:03 -0700 (PDT)
Received: by mail-ob0-f176.google.com with SMTP id ef5so2318832obb.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=83hqmfqcgW7A6zfX+bOt8K7792ietAPTpwE0gVELozI=;
	b=wTdfdBPimZpTrSGjyURD5gAIEGGcxWVjsD+rYNzIICTpcQPH8tyK/cmLhkq8ZtVJFU
	5EvG7r3Yi7+/vR4a8rheZqwAG5LDekrKco1I3LNjVMlapLNpN4Ny3LqkvCDfL9dDRcdi
	Mv8OtG9eOfuxagJJU8Q+KeqBHjCf/3OfPD4xlc94sMj4IGofVHoPBxc3nE9OXx0Iy8F0
	0GbFYwsyZ/v0xQqInjxqEK8f8NMcfkXklPETjPB20bWaZAGLF37l8v4+GLbP82EyUZQ7
	qJ5qphj43DskHvOQwguRvAqsslhJTNSlMEQHX0dD8dlRzGgJQCD2xlPAEN7H698orph5
	AVHQ==
Received: by 10.182.13.8 with SMTP id d8mr39469121obc.36.1332958503248;
	Wed, 28 Mar 2012 11:15:03 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.15.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:15:02 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:45 -0700
Message-Id: <1332958485-967-10-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 10/10] pandaboard.conf: Use '=+' not '+=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:15:03 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/pandaboard.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index 2c37b4f..22953af 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -8,7 +8,7 @@ UBOOT_MACHINE = "omap4_panda_config"
 
 GUI_MACHINE_CLASS = "bigscreen"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES =+ "tar.bz2"
 
 SERIAL_CONSOLE = "115200 ttyO2"
 
-- 
1.7.0.4


