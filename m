Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2192AEB64D7
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 01:22:16 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.1654.1688001731476200166
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 18:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=ceC/cV4g;
 spf=pass (domain: foundries.io, ip: 209.85.210.49, mailfrom: ricardo@foundries.io)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6b2e1023f30so149290a34.1
        for <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 18:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1688001730; x=1690593730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGuZU5iMZw8RVPZ24hTCFZPex9+tlXKL0FAFTv80flo=;
        b=ceC/cV4gW+rcsERyJKwo4Q2lkNxnkgZnnLbDmkYjXDGUlrACGDsuDgGT8tD2Crsc9i
         TQnVogT7A8eH8aBesSql3ndJA4erzjmNU0i1jFUt90MXq2g0FuvV1DnkuMTvFpst4Zu7
         G+Ou5ZLVgcfDfQrK6ftKvJB99YTDQfsi814vv/eWHQOtp2l+At78UjAHru9dtfkmf28i
         KaRca1qMAV/qpSqqY0vPpNopI/+YiHoL8dBBLoA85Xj0ZE0X+kbaHFjcREiYFNJlrjEh
         gzZxH4NqTiFeRdg6g6mHQP0YwqNmWWp4vUZzhwKQ8ZaRAsAVyzeQXCKZEu0q8qYUB/kR
         e35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688001730; x=1690593730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGuZU5iMZw8RVPZ24hTCFZPex9+tlXKL0FAFTv80flo=;
        b=NfDXN7uKV63yraegYpM6JK9HIngiY/Lad8ZNm1z0Zw7HJkfc9Cp3ORMVLyhMfyBzyJ
         nPeiMky3rNpRwkcbh7HfHy862nlDkQkUhQtYRhAGNWlI70ei2I62UFlcRQ2ICv9lgA/5
         RuZPnT99PjuZ6pM5nZVyzaLcX3vHVr0A9bIoeASWUIhG/L+EGMzT5REhlLOL6l9zLkIV
         8rTCwyVyiGDfPYKkcupeHZBXfb1GxGw1wktkjx8uHmGMDmz7midWjOnYoGS8M3O7fkRk
         cNhsIHt8aIGrolfwLV0DzUTNPbVm4ao1WYN6w1JFkOBwdtw6vpvbwP0xW0Au32y6xS/E
         +Ptg==
X-Gm-Message-State: AC+VfDwdMaBG8TrGW0KYP5lbh/4mxyuDK5sCANRHAmEZ/SPl194gKe+C
	nQt/TStNx+WUa1UR/nUEHoOtwyGRravnO5iuDg==
X-Google-Smtp-Source: ACHHUZ7N6JRlK8XYtn83+/gYl3siwdkrda6ralmUvPpo8YF/R5taX3Q1V322MYrLJFUyTA8S7Id5kA==
X-Received: by 2002:a9d:6343:0:b0:6b1:d368:557c with SMTP id y3-20020a9d6343000000b006b1d368557cmr34441634otk.30.1688001730020;
        Wed, 28 Jun 2023 18:22:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:badc:84a8:b2bf:f140:2a0f:2bf])
        by smtp.gmail.com with ESMTPSA id t19-20020a9d66d3000000b006b757c307afsm2648603otm.23.2023.06.28.18.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 18:22:09 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: rs@ti.com,
	jose.quaresma@foundries.io
Subject: [PATCH] ti-img-rogue-umlibs: use image path to avoid local path expansion
Date: Wed, 28 Jun 2023 22:21:45 -0300
Message-Id: <20230629012145.407276-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Jun 2023 01:22:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16798

Provide a package file list based on the image path to avoid it later be
expanded by using the host system path.

Fixes a package QA error when files named similarly are provided by the
host system (e.g. /usr/bin/oclock is a match for /usr/bin/ocl*).

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index c012859f..229fc081 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -38,32 +38,39 @@ PACKAGECONFIG[vulkan] = ",,,${VULKAN_LIB_PACKAGES}"
 PACKAGECONFIG[opencl] = ",,,${OPENCL_LIB_PACKAGES},libopencl-rogue-tools"
 
 def get_file_list(package_list_var, d):
+    import os
+    image_dir = d.getVar("D")
     file_list = []
     package_list = d.getVar(package_list_var)
     if package_list:
         for package in package_list.split():
             package_files = d.getVar(f"FILES:{package}")
             if package_files:
-                file_list.append(package_files)
+                for f in package_files.split():
+                    if os.path.isabs(f):
+                        f = '.' + f
+                    if not f.startswith("./"):
+                        f = './' + f
+                    file_list.append(os.path.join(image_dir, f))
     return " ".join(file_list)
 
 do_install:append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
         for file in ${@get_file_list('GLES_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+            rm -rf ${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${file})
         done
     fi
     if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
         for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+            rm -rf ${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${file})
         done
     fi
     if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
         for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+            rm -rf ${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${file})
         done
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-- 
2.34.1


