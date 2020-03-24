Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.1194.1585085374159280217
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2020 14:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BEF7p+GP;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id b9so7939185pls.12
        for <meta-ti@lists.yoctoproject.org>; Tue, 24 Mar 2020 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S8WPcxzsBbauppuUfL2Hh/Zk6/8L3agivkKxvHbD2GY=;
        b=BEF7p+GPIV9RqWeAaIdeJ67YGniLpX3GUAF+EtboKaIXN2o0y2HTXAX1JTLWUO+utz
         DnnP3N0LiIU9QgbcQsUXj/iutjptY8Bk/iSdAPzlPfWHT7AiUczYrGh0VJqk74oKHUjp
         +bnUm3IjQcL8o6TVJ3eKj0ZFwmQ+f7fsNjRyThgvP6UZSNgBcAKpxNxdRmV0XlIcUrLO
         9kA2bDTEycInyFuk1+0iDEVPCXamHZDcfct2E1O/pWpwNcrSFi6LAYIUq0iYGhgWkTCj
         TteYqhAfU3Nnrgy6cVvb26IIkd/TjY6boHFbvoCXTyTP0S/5pHJ9chRPl+NKo1XZbseI
         PdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S8WPcxzsBbauppuUfL2Hh/Zk6/8L3agivkKxvHbD2GY=;
        b=H3JumNXSviC7IZ/X/9vF1exnB1SCT94t6gENK4x6CgkvAd4Cd+pdzJH1LBjf3YbbK2
         UqdEPOS2BPbiqXwGfuk2u4datyqbCyhFPHlzMlMP3egNRRp+L+Swzdkzgtbkvhbgn7In
         yYrdfBBqJ9apWLBrnYLK3AjO5va+Nlm4MIpGfJQfi/pRP0s2CSZ9mRHXfzgeWjNAAWtK
         umpZKuThS+2UhRESh6TnKrTACpCeo4J96lBrAv84D4lqMCTELReUTIJtkWUS0UrLzkL9
         ++PVoJQd21B4sLNWKTTrIb9UMdK+VV7FLg1tWq+PkmRj2vN1MAHhJiOM1bezxOI18Hjh
         l3aw==
X-Gm-Message-State: ANhLgQ1ajl/ejBWNeW/ingnRBYBh6meJECYjk6jlRSTLzXKBea2skHJ6
	ddrrsIbFFgOE8RH/ZjweLDNkrqEo5Yg=
X-Google-Smtp-Source: ADFU+vvO+245jOhXhWdKEEXeKtGBva8LrcqTigXapi6fb+D8gzul7vjBBl4fmzjpPwWB8/U7ukiRNw==
X-Received: by 2002:a17:90a:368f:: with SMTP id t15mr7952408pjb.23.1585085372832;
        Tue, 24 Mar 2020 14:29:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6809])
        by smtp.gmail.com with ESMTPSA id s13sm12963836pfm.195.2020.03.24.14.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:29:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] README: Update mailing list address
Date: Tue, 24 Mar 2020 14:29:45 -0700
Message-Id: <20200324212945.55256-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While here format it a little bit to make
mailing list address stand out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/README b/README
index 778a9756..65496af4 100644
--- a/README
+++ b/README
@@ -18,8 +18,12 @@ distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or Arago.
 Please follow the recommended setup procedures of your OE distribution.
 
 
-Send pull requests, patches, comments or questions to meta-ti@yoctoproject.org
+Send pull requests, patches, comments or questions to 
+
+meta-ti@lists.yoctoproject.org
+
 Please note - meta-ti mailing list requires subscription for posting:
+
 https://lists.yoctoproject.org/g/meta-ti
 
 Maintainers: Denys Dmytriyenko <denys@ti.com>
-- 
2.26.0

