Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2370.1602614206577454939
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 11:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rhyrKfL6;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id y1so318421plp.6
        for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2020 11:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y1OSf4q3WcT5f6slWMqnf+ct1ABzWIlXUK/PhmcvkMU=;
        b=rhyrKfL6HhuFzklejNispkntm2QF/4jcdBiJZGQeHLPZ33SRf6HqnQGw3sQS70BTwV
         z7PvGawKYN+qWebDs3ThMYTvmmjFVME8f4+l9Xs69B/H8QTetCHUL0AeecoWO1Fx6KNj
         SAQyRvuyDbLI2VbqgRGHCL1nIWSW1FmgyK7P5daoZEUF/W34orOS88eueE8mfAesvb3W
         vEs0jrDQLnut1cGpdfclqPoPzzCz4cbSyZftmn9yh1k+dBrjPsmvrWqC4El8pxh6kw3j
         YcPgOpqShg4/DyamLr28yNIqXOlpJlFBS6blp1nx11fk+TbGS7XjBUQqpcNO1TlCfEIY
         H8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y1OSf4q3WcT5f6slWMqnf+ct1ABzWIlXUK/PhmcvkMU=;
        b=kP08ej62hJx+gUFsMly3OkpdrE6ChcyMpBIipOgyO0nh3Yxdil2gR7ob1lhJKDwq39
         FDQXSoLlAo6ZpbF5R032kO6LW4ojnjzsYsHsX5xK2qSdYHPfFqzM0jMZ7XsZNaYn4dh3
         iug3l2M7QYYNYQAlCDwaSA4BuQDVhqV/jC9qjyzxdnCKKL7QAvS6Pt1ZJuEm44jE589U
         hj5jZ3CMpuwy42OohwStn/DaAAn/CRUr52FKhqADLOB/S9lDZwGbRHfn9DVe9iGB5p+8
         If2TYukSpI1MdS55oFF7fAFRP17LUkjMWmZeRW2TOPUNfy1FlI/hZ9dyBl3quC7aJ8WT
         c49A==
X-Gm-Message-State: AOAM533TtvrdhTBNVtJUV5klND602FNzHRipt6JPvm82rjKbnY4INhk+
	xP1exRSF+Yolw0iA3DgrGHbeWDwzqx4Bng==
X-Google-Smtp-Source: ABdhPJy4SUyqPXljQDUi7yTUo8gsXAy0h3AzVeNRHXqgyi5569D8/6d33EKAGXm7zOnRPeuIFSJdrQ==
X-Received: by 2002:a17:902:7b91:b029:d4:da66:ef6e with SMTP id w17-20020a1709027b91b02900d4da66ef6emr842961pll.10.1602614205832;
        Tue, 13 Oct 2020 11:36:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3926])
        by smtp.gmail.com with ESMTPSA id u69sm385374pfc.27.2020.10.13.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 11:36:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ti-rtos-firmware: Remove trailing slash from S
Date: Tue, 13 Oct 2020 11:36:42 -0700
Message-Id: <20201013183642.267548-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013183642.267548-1-raj.khem@gmail.com>
References: <20201013183642.267548-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 2dfae1ec..2bbdd018 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -51,7 +51,7 @@ CORESDK_RTOS_FILE_PREFIX ?= ""
 CORESDK_RTOS_FILE_SUFFIX ?= ""
 
 # Common code below
-S = "${WORKDIR}/lib/"
+S = "${WORKDIR}/lib"
 
 PV = "${CORESDK_RTOS_VERSION_DOT}"
 
-- 
2.28.0

