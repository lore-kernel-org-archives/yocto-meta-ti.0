Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1B8C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 17:08:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.980.1750612081392159484
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 10:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VlyBmTZ4;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23602481460so29244045ad.0
        for <meta-ti@lists.yoctoproject.org>; Sun, 22 Jun 2025 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750612080; x=1751216880; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ5YwXk4eEbodksfJ1XlQB6vVel+oagpNaWWc9bGkaE=;
        b=VlyBmTZ43vCkGjNhBhqxT4AWaj8XQ9dJ+4kH0UDuVQWa/FH2kH1fiyjL3hzMz+OcxU
         +nR9jcq37trEozU7BJghfCML1Yt0xgIKUVuYCyfyaaDQFW9WwS4D0ldKQn5m/Q1jG1kU
         euTWsSgVJOzodgGtYPeXSAlXUx+5hUGpYwwqHz2tvIaGYClhcDy1Hg59+S+zr7N/diWn
         b8CY1ntfjLQk/R4u/kjWE1P0GRQ/BA/4Cha29HFkAKI84tQFKAnb6m8IDRTvlCVJGc8d
         ce8D4raZhd8okdb1zSTC6eKF1+m3MzSqWU7Ngwx/HALDvlNQxvfr6ZQBm3X+fEXnEvEH
         oszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750612080; x=1751216880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ5YwXk4eEbodksfJ1XlQB6vVel+oagpNaWWc9bGkaE=;
        b=wt1bE6Z9HZ8k93JnOCwQUYoLTR5E7wohOtIzt6aOCIZbus5DShiddBsoafc2gdH4lA
         k12hTPDgr6F7tZKNFfWNDw1xKC8Fh2nnIN38FFgDSjVRHOwW/03nuP+xwnPQnNPeGy28
         9BYj+mqNe3VJP6AlFfgtgfDaNLD9RFWh7EXm9jSjsJnrEfTBY5VkgmOMr/8rpasoL463
         MzaxOyDg5JiG5YYok79ZPLhEKJXRUqp1yYKulDxAwg88kfGnKzBT0ParwizZVMqMFnEl
         UH+AGDYIFZwdG2/zsT8MUIeqmkIjEUm9kRowcUufqZ73OFKvkZr9iKYLjHGz5OzxDy6I
         o4Pw==
X-Gm-Message-State: AOJu0YypLRIyaRofIEvFeQTihcg2vEMTw/HUni0XVeDdaIfXTqc4VYo2
	ZaYLYlBHQea2ETkvqZ1TjRAmzG9TE+7KWEPOoUvEeNC6ENwcHFlpwuez9TSDBQ==
X-Gm-Gg: ASbGncvwjWe9MTmV3GYRFz4aZGe+LwVU1r+CjhcTVWtb/04lh/6luNY50KT03foXvpF
	n419sOMaqiv8Rfjdenq4kLJcm0ahF1Cg7xDZKPJLPGNUOTwJy2qds3vdgaAWW6JTFgnE0NfSH2V
	oWPv77aIyeLBO3Zsyk7jiWwW6uDB3VZI/osxSBW8Mljm4/iIY4MlwuHe39eI9iS7X+EL+CwnRRH
	u5UdZ0UCKuHVTTYLc4JynxMhLwiECIBhEdtmu1A/VBS0ksyYsW0j4uoAYMYg85GEbYUI85QKvtk
	OMl7QZB5/UnM0BC8bNsryKy9Cka9JyLg4OFaj78+9WOcHO5uLec0LScOtGLfW60yhoFc5/VdV64
	F3w==
X-Google-Smtp-Source: AGHT+IFvbffX6DN+HzWhWUxOwIoe6sncEkKKDXDbnIVvHGRpc9vjJlhjZEY/0dl6fQ31j1Ttq43QSw==
X-Received: by 2002:a17:902:ce0b:b0:236:6f7b:bf33 with SMTP id d9443c01a7336-237d99984e3mr186083605ad.24.1750612080480;
        Sun, 22 Jun 2025 10:08:00 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:9542:348b:4dc5:d486:ed09:1ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86c47f2sm64852095ad.199.2025.06.22.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 10:08:00 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [master][PATCH] meta-ti: layer.conf: add compatibility with the new whinlatter release
Date: Sun, 22 Jun 2025 14:07:31 -0300
Message-Id: <20250622170731.11233-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 22 Jun 2025 17:08:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18664

From: Hiago De Franco <hiago.franco@toradex.com>

Update all layers with the new Yocto release, fixing the current build
error:

ERROR: Layer meta-ti-bsp is not compatible with the core layer which
only supports these series: whinlatter (layer is compatible with styhead
walnascar)

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta-beagle/conf/layer.conf    | 2 +-
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
index b5d3eaaa770c..d036bb08b36a 100644
--- a/meta-beagle/conf/layer.conf
+++ b/meta-beagle/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-beagle"
 BBFILE_PATTERN_meta-beagle := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-beagle = "6"
 
-LAYERSERIES_COMPAT_meta-beagle = "styhead walnascar"
+LAYERSERIES_COMPAT_meta-beagle = "walnascar whinlatter"
 
 LAYERDEPENDS_meta-beagle = " \
     meta-ti-bsp \
diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 6d2b0a9a14b0..481daf2cc997 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp = "6"
 
-LAYERSERIES_COMPAT_meta-ti-bsp = "styhead walnascar"
+LAYERSERIES_COMPAT_meta-ti-bsp = "walnascar whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
index bd13967322fc..d340c414fc60 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras = "6"
 
-LAYERSERIES_COMPAT_meta-ti-extras = "styhead walnascar"
+LAYERSERIES_COMPAT_meta-ti-extras = "walnascar whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.39.5


