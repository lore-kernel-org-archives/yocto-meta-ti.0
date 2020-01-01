Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.11012.1577840134713589792
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 31 Dec 2019 16:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VAn5orCf;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id n9so12419627pff.13
        for <meta-ti@lists.yoctoproject.org>; Tue, 31 Dec 2019 16:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GURU3ilBxsrbdAGBw2SFdjsdOCika2rqPy5qg99lIc=;
        b=VAn5orCfeq12wl4NGHUIVyYPGfSCgU9K4K9cUsD0KFREWHEA+7gmVG5HfhiO2WcMoL
         H82YdAbvmroO2x7sS0xj1HrKQQs2hD294TEbDDurQR/Igz49gW2iL0aywxTfkrea2j2c
         IRTnOzTbmCM9zldYMFFpuIbJ8+JX0AFXLD3dsKo4WcynLyOlkiUf+EPC26FaXHu8yAZC
         D+RuQ74aCxj7A79NsXaflLGSSRbT5nJ4ocegBtuSaDX8UBY+AXKiHYmqlIPcfpbNKOdm
         imI2fQ6bKjZs1ZrJYz75hWB/W38d5w/r9wxJfmfoIglamekQCPix6mvJbFMGBnPoI2nI
         1Skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GURU3ilBxsrbdAGBw2SFdjsdOCika2rqPy5qg99lIc=;
        b=PfSjG+zLgcW5WcF7sqvzdiR94yKNUyDLnnv+vwWpm6GFZd7zdsyznWYAs9FqghE+wE
         oC1angHfT5u85B2wUI/TH62KZakSzSeFd95ONV+D513CLlVdCIRUvNDUDn+0Lk4lPDno
         y34cLYQ+6J/+O8GQETn7XoJtzv20qfzYtMnIFnObVg5dqGoQLx1c8y6GiN7SE/s04YU+
         u0dUfy/ZNh+jyD7NMUogWWuHh4oeMwaVc0vtEWeJZkjaZDiOoi2+n437nxhhkr8h5KMh
         kuiyF2OZoNCM9f5MBkAq7RzfAXYaJRci5jIFYkjxmctkC45R/fhqNx4ELWcReO5GnHSK
         pofw==
X-Gm-Message-State: APjAAAWMcEVkHo0rJUqWIkc3LCs5lGCfNEU81s5lZQoieUvmLfz3YLyI
	sdOjCaJXUjbOnTrAbQCndIpTdT6vGfs=
X-Google-Smtp-Source: APXvYqwLmcWPF4moyNhWgdiSDho3Jh32eQGghuO3vsknU+yHIwgKXweeLjaFCNENvAANC42Nwl6cpg==
X-Received: by 2002:a63:5b59:: with SMTP id l25mr82799088pgm.382.1577840133720;
        Tue, 31 Dec 2019 16:55:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
        by smtp.gmail.com with ESMTPSA id e9sm55292781pgn.49.2019.12.31.16.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 16:55:32 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] rwmem: Update to latest to Include <stdexcept> fix
Date: Tue, 31 Dec 2019 16:55:29 -0800
Message-Id: <20200101005529.1328441-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
rwmem/opts.cpp:87:15: error: 'invalid_argument' is not a member of 'std'
throw std::invalid_argument(string("Unrecognized option ") + argv[optind - 1]);
           ^~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Just bump srcrev to include the fix which is now upstream

 recipes-bsp/rwmem/rwmem_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
index 0545b0cc..43e75ce0 100644
--- a/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -6,7 +6,7 @@ DEPENDS += "python3"
 
 PV .= "+git${SRCPV}"
 
-SRCREV_rwmem = "cc296c5366a35a4c4271cfa3cc9831f6f34bfd9d"
+SRCREV_rwmem = "3ec3e421211b58e766651c2e3a3a21acf14a1906"
 SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
 SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
 
-- 
2.24.1

