Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA5A8E006C7
	for <meta-ti@yoctoproject.org>; Sat,  5 May 2012 02:56:02 -0700 (PDT)
Received: by wibhm4 with SMTP id hm4so1558151wib.11
	for <meta-ti@yoctoproject.org>; Sat, 05 May 2012 02:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=MvFEhxFeqNVganTgk7m/uTLodTUQxFJwi9HvpMg193U=;
	b=FxxWzG3LsOaTGvgNKdGnsN0EgXTWKYdtLX+NMIIY9/uyZ0JV/N/Iq/opEAsR2vSmbf
	5wIXANf7QJSIZfN7FG8nV3yY5WnUvXtSLeTD1SwT56NZcUho+DgBpNEhWrmxR11crCBm
	6Dg537cQUDBeIpgiAQ6KsM2VX545zTSvTAd0+m96tvbHFOAURbYBb6BnepBNELa8hcqy
	EVH2Tkhns9boe4EXW2x6Ty9VPPilH4ZVtrb2QqvZanCfmql5QhshKBFXBpF9MMONQuQw
	DkKhvIg0s7q9I1jcW8k1swZu8x18yxX6bRwWNgchS/u1fWWH9qTbeZH1z48p2ni60N4Y
	rETA==
Received: by 10.180.77.233 with SMTP id v9mr19945916wiw.22.1336211761507;
	Sat, 05 May 2012 02:56:01 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm4322928wib.2.2012.05.05.02.55.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 May 2012 02:56:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sat,  5 May 2012 11:55:13 +0200
Message-Id: <1336211713-2588-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkW8QBUZALGR8oo4Y6t986L0cYL+3fYLro6FZsKsddzLJoyYB4mWbAEYkMHww3OGB4/YIP9
Cc: denys@ti.com
Subject: [PATCH] ti33x.inc: add missing MACHINE_KERNEL_PR bump for the 3.2.14 -> 3.2.16 upgrade
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 05 May 2012 09:56:03 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Denys, since the 3.2.16 update patch isn't in yet do you want me to squash this into that and resend as v2?

 conf/machine/include/ti33x.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index c5926a8..e04da03 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r10"
+MACHINE_KERNEL_PR = "r11"
 
 KERNEL_IMAGETYPE = "uImage"
 
-- 
1.7.10


