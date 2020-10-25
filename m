Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.23660.1603609179970675483
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 24 Oct 2020 23:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cCBZZ7W6;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id 1so3148387ple.2
        for <meta-ti@lists.yoctoproject.org>; Sat, 24 Oct 2020 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JcGDcShbbDQhklygpUuz7ajAlJI1WgDuqQlw6/GX65M=;
        b=cCBZZ7W6LlQ5PVSP7LjPqmWHcbycLjABmUAdma1pFi0ZYdkHvsJiM4LBGzJ9vHlnqY
         7Hwi5vwNA4YuS2GfhJqcLrdSx8KYdl0+Dgui8EH3zc0SPwP1OWSRKK72cdW5ZgYjubER
         vihgy4Q/nHKsw+D3MCl6hQ1S9Ohx3a2VySbGClCuL8Uf2lwQhdG28Lai90+P4SSYM6MG
         o8ZbmQfOraIwXHjZb0dw5RTygEROstxrB+qMBRc1LsXMT+7Xw0DE1wqs0Wmy2Q6wwnHr
         mmv+aHfIYG4x3yZNOgieLnpgVsaexPiYjs1Q7QAH2FBtwQ4AIMvSOj9V9QAE934KLKjK
         S4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JcGDcShbbDQhklygpUuz7ajAlJI1WgDuqQlw6/GX65M=;
        b=Z95+njvCuYsQ7LCfHPVNfWNAFdtQSBlGHgw3L040LD2QwH2eUuFgqIj3JZ8yVLG9Xz
         VtEhH4c71Jxa5KO3DLp8vA6orjbJaaLKPAfG7m1/lyJJqDAhbizLH/onCB6+ItaN8Ws/
         Wdw5YqRvXukWHXnC71XNv/07eeZzaufD5fZbeNDmqpu+/uGiWz2KsHZXBWQyCxgDATc7
         xwXEVAZbNaxSzxBNr6PNIn5XcjKhuxuejIRG/tFq1ntSBChhXkQ5t0rbpXZtbIP2IQzP
         KsXB2Sny3Uq+6H+OgPHx0VLzsKkSE+AXgXLhUrMdprGIIgtDxFB3t3trfgGgcBUB1MDi
         /NOQ==
X-Gm-Message-State: AOAM531DVnx+XqvGDEb1+BQpNTafy/lSxAUIL4kx4HrBugAeO2L9kXVR
	74Xsx9jtB90OwyvlXbm8OiEGN31oGQmWVQ==
X-Google-Smtp-Source: ABdhPJyeKgdJPvkrQRLvhno4zAFTPfBDQ0B270ECogrZbgOKwijd7e6U3achqbGa+Oj6pXf/olBUVw==
X-Received: by 2002:a17:90a:2b8a:: with SMTP id u10mr12862533pjd.13.1603609178990;
        Sat, 24 Oct 2020 23:59:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3958])
        by smtp.gmail.com with ESMTPSA id x1sm8916837pjj.25.2020.10.24.23.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 23:59:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
Date: Sat, 24 Oct 2020 23:59:34 -0700
Message-Id: <20201025065934.3308920-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201025065934.3308920-1-raj.khem@gmail.com>
References: <20201025065934.3308920-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/ipc/ti-rpmsg-char.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
index b41e68eb..d08031cb 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -13,3 +13,6 @@ SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
 PV = "0.1.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
-- 
2.29.1

