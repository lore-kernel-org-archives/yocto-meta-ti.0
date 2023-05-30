Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34594C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 18:09:48 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.1393.1685470182687631514
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 11:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dmdkQwMp;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so5341719e87.1
        for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 11:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685470180; x=1688062180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+gFs9LmIEvhVIIWkmoq0VoypcV2OWmroDrizOL7c/ww=;
        b=dmdkQwMpdPRUmM4tWqLHuz27zmYQi8vv3oq6roq8mP0pXBwuPncWgsaPi2nNthqSac
         s3pvIMp6nvyXd9rIem8CWlkm2OPaW2GE2bIjLePNwYXbhDHhH1GK6oaTuAYnX0rAe3yA
         B+IeZIp/1rkchHs3tmLJEVzxFezM5AYqd1xjTbnmP0sFHOd01/4voOJOGL7n/IqwxBn4
         ZoSkWj/bZYmV7GtstOYumPxWcqdFyIyydNlI2d1fsyojgJGXZCpgK1Y3k4S1c20BEOkJ
         R3wESXDU05Zst7ac0vN0Ge57w4YXJ25Fgr+NcqmHpsit7y360d1DQp3b6mqx7PU6ArAh
         uYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685470180; x=1688062180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gFs9LmIEvhVIIWkmoq0VoypcV2OWmroDrizOL7c/ww=;
        b=KEB5BTPyllAirbZUy1dvc/e4w+XGSNPGNkXcNxHyn8N10b2iKRwHPdiDytG95DPvGI
         6KvmIPafoG3b8BIl99My+3AGQlEZqoZFhv0WgrPEVVKg+MUNyClHZdnfl9kH7sGnLqz7
         O3DD1qUXAiqeJS58SJGCGLQ3V6zph5IskXahznPB53N+4o92sPg0SSvkZ/Z/MIuHbZz6
         17TfuyGk35MzHI8EitaQ2+R97MiVmfo70oy2hGLRZxDaaWP3xh5wHRr7g/2+ylAzXdEr
         EuK4Rr8dWcgbJRE6GNm2huPMEvizJxo+Nn81X5/F2lYY19iIt0NeEjZgMOGKYlSw6Dl5
         MGUw==
X-Gm-Message-State: AC+VfDyd1cskeYuNGxKvaEom1DUrVAzjM8gTNQcu5qYOtsjZM7Q6KykC
	pyoGDgQaoUSxrm6A9V+jmfMb3EXgLrI=
X-Google-Smtp-Source: ACHHUZ6C2KgLJRgqrqK0BLNOo8QZS54UE4Yhv66yoBCg4HsOd5Nog83Ck+anb7Y7k8+4+a5rngl1Mg==
X-Received: by 2002:ac2:5292:0:b0:4f2:5c4b:e69b with SMTP id q18-20020ac25292000000b004f25c4be69bmr1475467lfm.67.1685470180321;
        Tue, 30 May 2023 11:09:40 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id b8-20020a056512218800b004f3ab10016bsm416442lft.16.2023.05.30.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 11:09:40 -0700 (PDT)
From: liu.ming50@gmail.com
To: meta-ti@lists.yoctoproject.org
Cc: max.krummenacher@toradex.com,
	francesco.dolcini@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-ti-bsp] [PATCH] ti-localversion.bbclass: introduce bbclass
Date: Tue, 30 May 2023 20:09:26 +0200
Message-Id: <20230530180926.265920-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 18:09:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16628

From: Ming Liu <liu.ming50@gmail.com>

An error was observed as follows:
ERROR: ExpansionError during parsing .../meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
Traceback (most recent call last):
  File "Var <KERNEL_LOCALVERSION>", line 1, in <module>
  File ".../openembedded-core/bitbake/lib/bb/fetch2/__init__.py", line 788, in get_srcrev(d=<bb.data_smart.DataSmart object at 0x7fe9da2f0c70>, method_name='sortable_revision'):
         if not scms:
    >        raise FetchError("SRCREV was used yet no valid SCM was found in SRC_URI")

with the latest bitbake on commit: 893f3b116b6
[ fetch2/npm: evaluate PATH before patching HOME ]

the root cause is the variable SRCPV could not be expanded during
recipe parsing stage due to some uri variables in bitbake being unset.

Insteadly, it has to be expanded in recipe finializing stage, let's
introduce a RecipeParsed event handler to set it.

We need set UBOOT_LOCALVERSION in this handler as well, because that
has the same problem.

Meanwhile, I have sent a patch to OE:
https://patchwork.yoctoproject.org/project/oe-core/patch/20230530170949.12045-1-liu.ming50@gmail.com/

to make KERNEL_LOCALVERSION to be a standard OE variable, just like how
UBOOT_LOCALVERSION being handled in OE.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-ti-bsp/classes/ti-localversion.bbclass       | 15 +++++++++++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc      |  8 +++-----
 .../recipes-kernel/linux/setup-defconfig.inc      |  4 +---
 3 files changed, 19 insertions(+), 8 deletions(-)
 create mode 100644 meta-ti-bsp/classes/ti-localversion.bbclass

diff --git a/meta-ti-bsp/classes/ti-localversion.bbclass b/meta-ti-bsp/classes/ti-localversion.bbclass
new file mode 100644
index 00000000..6e7246af
--- /dev/null
+++ b/meta-ti-bsp/classes/ti-localversion.bbclass
@@ -0,0 +1,15 @@
+# Helper class to append a string to the name of the local version of kernel/uboot images.
+
+# Take 'KERNEL', 'UBOOT', set 'KERNEL_LOCALVERSION' and 'UBOOT_LOCALVERSION' accordingly
+LOCALVERSION_VAR ??= "KERNEL"
+
+python localversion_handler () {
+    import bb.event
+
+    if isinstance(e, bb.event.RecipeParsed):
+        srcpv = bb.fetch2.get_srcrev(e.data)
+        e.data.setVar('%s_LOCALVERSION' % e.data.getVar('LOCALVERSION_VAR'), "-g%s" % srcpv.replace('AUTOINC+','')[:10])
+}
+
+addhandler localversion_handler
+localversion_handler[eventmask] = "bb.event.RecipeParsed"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 8e236dfe..2f461ad4 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,7 +1,3 @@
-# UBOOT_LOCALVERSION can be set to add a tag to the end of the
-# U-boot version string.  such as the commit id
-UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
-
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
 
@@ -61,7 +57,9 @@ PKG:${PN}-dbg = "u-boot-dbg"
 S = "${WORKDIR}/git"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
-inherit ti-secdev
+inherit ti-secdev ti-localversion
+
+LOCALVERSION_VAR = "UBOOT"
 
 SYSROOT_DIRS += "/boot"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
index df7d9ac8..2db2bb84 100644
--- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
@@ -1,6 +1,4 @@
-# KERNEL_LOCALVERSION can be set to add a tag to the end of the
-# kernel version string.  such as the commit id
-KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
+inherit ti-localversion
 
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
-- 
2.25.1


