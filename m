Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.7946.1645496590175539812
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mu2uSUKF;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id 4so5735410pll.6
        for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 18:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ET0btLzWX0bnSCaHgCVd7EgrnLRYakJv7OrwZEwSGwA=;
        b=mu2uSUKFhWJoT9Jl976/ZD8vY4K1/H3aLH/dmv/sjIbQPjsyrf873XiRErF38Tn2pT
         AhzHK+ltSrSt+Pg6FPaA3jnrS6UFNNtQ6i0EVufcGOj1nNpuJ1MAK2iiqltZjM8qMfpU
         Hv2jyeGW6ouo/IPMA87tYhKIFN2vlPRAT/xKTrLnFNAkUJJTqgNRIkw77buDElsbYaya
         YAdhk7lanVohru0xdmTexOEkm6rw0a6VFAO5TtPjtj6kF8ubTqdZYjBULSY831UmDbzU
         VuWFDzXLKwMhI6/TaBDBWtNQ6/y2COxthFjDo2bfvZ1t9mS5awI2JHDNxFQt9sDIbLJI
         FNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ET0btLzWX0bnSCaHgCVd7EgrnLRYakJv7OrwZEwSGwA=;
        b=bhvEZGVGb37G9YX20foAkFyze+9juuJ3T5pAh5MApUFi6u2hAj3Mdtk6K4rzIfEkYP
         vd9of5oZsjM8dFgHqyjHn/l+xk4CLZMYff5EAdNKdXf/X8jS2CnUVJPwnnHC7TQfH1FU
         RQGibwFAVJhhJBUe3yGXkdUOPdHf+U5NbWODzKegevLl2R/5LNPtB6HwzBdXo7fzgjuQ
         6ELEMsiMeYQdSQHvuRONUuBu110C8Mcm5v1Is33sRB+RIKtAxTvAApyFiv6Fi+xCLWZO
         kWGjul0eFeaxBawq/9gQkpBEQDKIAG9AlYqFfyGhJ1BrkFSMGkmugWOsUH+ji/47oQu2
         IkMw==
X-Gm-Message-State: AOAM533/Ie4myK3XmCaGA/5G9XS7zsg5qnTqQkuYoR6jY7D2CrJ7P5EQ
	egOlq31ijNYIY9B2TLPbpJzLofNftLhpDgP1
X-Google-Smtp-Source: ABdhPJxnqQQCl1x3al69IzAbIzDhKjyMFK0k/Woe7LA2UP/2NvZrQgJ2IMebYL4ObhbAmBp5/pRYfg==
X-Received: by 2002:a17:90a:4891:b0:1b9:81c:8774 with SMTP id b17-20020a17090a489100b001b9081c8774mr1838863pjh.8.1645496589494;
        Mon, 21 Feb 2022 18:23:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id e20sm12953206pfv.42.2022.02.21.18.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 18:23:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layers: Bump to use kirkstone
Date: Mon, 21 Feb 2022 18:23:06 -0800
Message-Id: <20220222022306.1390127-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

its not going to be backward ABI compatible with honister due to variable renaming.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index f399ff03..c3b39c59 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
-LAYERSERIES_COMPAT_meta-ti = "honister"
+LAYERSERIES_COMPAT_meta-ti = "kirkstone"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.35.1

