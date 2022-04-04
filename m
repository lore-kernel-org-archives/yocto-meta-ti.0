Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04988C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.30164.1649034566304487587
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Apr 2022 18:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XfF9y77y;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so10119084pjb.4
        for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Apr 2022 18:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6w9ykMloQOo7t/njwTBW22y+auozhUyT0qkEFZj1WjY=;
        b=XfF9y77yaT/pQOpGUxKtXKcqrxJRw2FAS5/Fg7pTO+g5zWMLIbcd2q8jXDv0cAITV6
         VUFqQ1A5XRCVVzIP569GE+5td9Zu3d029B9eli6prTeazmPjG25sCBdkunrmbQRS/AjW
         TgN/86oJ8n8uypZBmODEAnAjDRdfFBOu/gR6/sOYbbiUqEsZOT+GjEW5iPXF5tBVrEjG
         /0xqKAkd5JJRX0ys2KnUeQXQCch8djtQjZ1iycBDoVg7I9T9p91tPwicmlwmuJmoDef+
         E57gZUO4n9413SCzrhM1SaU1BitYF60yEsqodaqn4hhvaiP04LfSDIcLGKZSlig5UrDf
         mPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6w9ykMloQOo7t/njwTBW22y+auozhUyT0qkEFZj1WjY=;
        b=ZtlEkm5MT8NQRpuL0wwZhRBata7WQAKRg3OMxM0yQMRSqCxqXQgAx+36aUPQ/V6w7a
         9g66X3rOETjhjTBtQhkEopGDJgaoLpi0Lt54S34CuZuQ94s+UtYyOYTwjjZow4RpF2ih
         Mbmb6qq2r4Mk44eSnU7Lv6NFOMY6AmuYkw90JUzKlrtLuclg4tzh0/kOQefKaLH4jul0
         6+/H8bC6NvYwo+1mOWLbgtrRvOdS+G7PytgUw/J+70Bg7gVwQAxKOyufqgFol68zMEfX
         QrD4RvQMAPGeXw1yVldBBIKE+wIiZ6wajBZL+OgTE0ybnl2eSNmzICu0tCWpA6xXIdbl
         65/Q==
X-Gm-Message-State: AOAM533Ftz3b3oHASVXmjhyE49boYJKlcC7SyCynONQehoztLCnBKE8S
	+ZowOF/a9bbulFuc8K514fzCs+QDqzH8Lg==
X-Google-Smtp-Source: 
 ABdhPJyWcdc3EWsof7cmT/JVBKMPb8HSIRUPpnm2m2wSQ8/tOttou+9SpCFC2C6b3oY1fbmIsn+nag==
X-Received: by 2002:a17:90b:4f88:b0:1c9:b632:9462 with SMTP id
 qe8-20020a17090b4f8800b001c9b6329462mr23607289pjb.54.1649034565432;
        Sun, 03 Apr 2022 18:09:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 e19-20020a637453000000b003821bdb8103sm8567694pgn.83.2022.04.03.18.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 18:09:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] uim-sysfs: Specify branch and protocol for git fetcher
Date: Sun,  3 Apr 2022 18:09:22 -0700
Message-Id: <20220404010922.2841052-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14587

bitbake git fetcher warns about protocol and fall back branches
therefore be explicit about these parameters in source uri

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
index 8d4f9182..e5912e81 100644
--- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
+++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
@@ -8,7 +8,7 @@ INITSCRIPT_PARAMS = "defaults 03"
 inherit update-rc.d
 
 SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
-SRC_URI = "git://git.ti.com/ti-bt/uim.git"
+SRC_URI = "git://git.ti.com/ti-bt/uim.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


