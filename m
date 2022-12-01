Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2C4C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 06:48:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.36612.1669877289296703781
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 22:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GRYk+XRq;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so1036305pjj.4
        for <meta-ti@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2r+K6LCQnLbL0tLubbWciV1EAQXqqrPbHI7fb7Vwlk=;
        b=GRYk+XRqvgBTrIiSNhgKy6FGweCdgmvcYjAc1XSErRTjGb1LB1MCqaJ0lst/ewPEPH
         BMUMqED1BF7wAwSzQWpO6wmwy7fYbR86KgF31F4h4BFrW70hfS2f4KtQuye3pt5BUSKh
         XSzLJ0P45qtCnRnP+rrAXO8flXdXF1rfC9Oe1En7ahkcK1HU4gm+Gi1M1rz5CAsXoLVM
         p5hE75FB7anTRx49bTdG6qmUxNbyC5vdF/tLXAS4UbsisKniHL8zlibfngsHtFT3SBZO
         lMe/ECL4FEXk+bnhlAKVi917obR33XJ5R0pm3y2dncLIiMv3/VZVWXuy/BsbwwyCmVN8
         ZS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2r+K6LCQnLbL0tLubbWciV1EAQXqqrPbHI7fb7Vwlk=;
        b=S+1yhty9DkEvMFhhgxR6OfgocBHU39DClFNEAQVhEs4kV1/+VMuIvG6QN/XOV1QE7f
         Gcs+4SObG8+vNsGi/lSwBJVVKCq5FEkK9cONA/qS2PyBTSUV1ASynCOSjlp9LZE81t/7
         YQP3w2680ItgzwwOBEsNzNUmn6NvUbVJHoU1X9Xg8/4qWE2JXLcpdZ1j/Q5YmkKPkicn
         aW8NpTaSpFP6tcLOax4nmscVy/30o/4m1EhonoaB/9lp+2O5jnz/3knPnHRSJ5KnPTDm
         2G4TLSm6ZVi9SVtaBovCp6i4ClLBrFaOpQB5Q2CvEyFmNQFXjdgWgAZ4ZgQHUMYeoL4Z
         H9Sw==
X-Gm-Message-State: ANoB5pnq1YcDBOTRtBiWreqMaPlx5ca3CehaMJ14IrjQytyrbsxEFWgx
	KUIpDVqEz1F70VaEkIvj6cswfIx0HpU=
X-Google-Smtp-Source: AA0mqf4uc7YspQN4otki2bYlc30x9tD0L19Hlit4jRB0Pl50UUBmWDGvmTwffW7TY8UeLkeJpSX42g==
X-Received: by 2002:a17:902:8203:b0:186:e2c3:91c6 with SMTP id x3-20020a170902820300b00186e2c391c6mr16066893pln.27.1669877288211;
        Wed, 30 Nov 2022 22:48:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id f14-20020a170902684e00b0018971fba556sm2696134pln.139.2022.11.30.22.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 22:48:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linux-ti: Drop unneeded update_data calls
Date: Wed, 30 Nov 2022 22:48:05 -0800
Message-Id: <20221201064805.2094474-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Dec 2022 06:48:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15381

 datastore works dynamically we don't need the update_data calls
 anymore, so far they were no-ops, now bitbake has recently dropped this
 API and hence compile fails with core/master

 Fixes
  *** 0052:        bb.data.update_data(localdata)
     0053:
     0054:        cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
     0055:
     0056:    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
Exception: AttributeError: module 'bb.data' has no attribute 'update_data'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-ti-bsp/recipes-kernel/linux/cmem.inc        | 2 --
 meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
index fd913f6c..f560932c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/cmem.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
@@ -49,7 +49,6 @@ python do_unpack() {
         # Create copy of data for additional override
         localdata = bb.data.createCopy(d)
         localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
-        bb.data.update_data(localdata)
 
         cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
 
@@ -67,7 +66,6 @@ python do_setup_cmem() {
             # Create copy of data for additional override
             localdata = bb.data.createCopy(d)
             localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
-            bb.data.update_data(localdata)
 
             # Get source directory and dtsi filename
             src_dir  = localdata.getVar('WORKDIR')
diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
index 46bfb957..13068843 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
@@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
         bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
 
     localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
 
     binfile  = localdata.getVar('BINFILE')
     binfile  = bb.data.expand(binfile, localdata)
-- 
2.38.1


