Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.7515.1604022366460090262
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 18:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NKuJXYlT;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id k9so2156311pgt.9
        for <meta-ti@lists.yoctoproject.org>; Thu, 29 Oct 2020 18:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JcGDcShbbDQhklygpUuz7ajAlJI1WgDuqQlw6/GX65M=;
        b=NKuJXYlT15fCBzSBCwTd9aZ/Sci1mswb5Q+35XujEsnaJV/MOjYdkYYWYGkW8qSMWJ
         /CFGrcS94golwGJWLTeVRNmCMPnSpDsaBsrP5abUPpgcPVQw+8DWsPxfi/SeRVxQFU1d
         l8cJcBYAH7XwJ9e+RrmT9fnxWeTglNCxjFtw9FIx4JstF96fPPi0bGvfs5ThthqvPVGF
         4J9w1TDOg+I7NnQbF7L7KU2sxIXjahEaWMD3ps47QPBkKtper9d0rVaN/QiVuAnEXxfQ
         wfEAI0gCHsE1Jb987DNbplreikjDdKaNHcfZEg68HrWBxHnPjLW0gyMvIFv96+6gi+ye
         hsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JcGDcShbbDQhklygpUuz7ajAlJI1WgDuqQlw6/GX65M=;
        b=FPWigTGbLDEmsvBPsjeh3AmFq8QyHHS6i/Ae7U6RdHC/DUx298VqJg0rVoMgzYuXH2
         +U5M495/Sudt8O5o/evwVKfKGrQrKDI0uZsC5ANAI+7fXOlQJytfiCptr909KGglkgal
         1XGRwJMR864nBTsSlTF/eiw54PklAk/xICmT7U93+H6tsufLJpwRacogYIca9kJbO/IK
         LTmCa7fRRogjFN2VGtHjkycLU30s5U4NVxRO6C+n/IDL2NLRcgQLsvpb3yVg0iH/yqcf
         BcIp+ecxhlL/7ZWy5wiowfXhCvIVQ9c8jj0M3GP978GX+C07PYHcFUc+bsSQFs/FIvZ2
         SWQQ==
X-Gm-Message-State: AOAM530KNk1t58s2bi80Xj3GS05KTZNcFU0mZYn8r8BWyT2s9wEjGcju
	QbO2ZjrmtEQcqyKX4F3UhbbtOhjWp575ag==
X-Google-Smtp-Source: ABdhPJw9HnPd89Vy4YKFrQBrLcKFUGO721viytiK61TulRHnv/jocFJmqUrJtZz4u8E5RMsF8zLPxg==
X-Received: by 2002:a62:1603:0:b029:160:98fc:ad23 with SMTP id 3-20020a6216030000b029016098fcad23mr7300831pfw.47.1604022365770;
        Thu, 29 Oct 2020 18:46:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id m11sm4196993pfa.69.2020.10.29.18.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:46:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
Date: Thu, 29 Oct 2020 18:46:01 -0700
Message-Id: <20201030014601.395106-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201030014601.395106-1-raj.khem@gmail.com>
References: <20201030014601.395106-1-raj.khem@gmail.com>
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

