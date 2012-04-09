Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83FB7E01374
	for <meta-ti@yoctoproject.org>; Mon,  9 Apr 2012 09:06:58 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so2184979wib.11
	for <meta-ti@yoctoproject.org>; Mon, 09 Apr 2012 09:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=474iYcR2X0GhbwIEkn5owvGpjWUUwUxdBU6MJPdgpN4=;
	b=H8SEOVdQcsUH0ovPkItJNoV0lcFCFLd2sZLAQ17h2QRd43L2T2805ebzXpU+yJPEt9
	fXaoeC9rD4GsP9OCf8OnTvpTu3NInczjB0slTEh62Zzkmu3XsVa2kMyYhP/xuypuR7hE
	nLfj1kXlHWujH6evMwrlZut20tq6iIieRQ15wbd8dbH3fZA++PjffKVvjVNKUPT2+dvR
	Lqi41yuFaRZ4n2aI8/Kpz9HcrOYEyudc2yKkZgwtTLk21bCqT8clrRXDziO9TJCCHjj3
	JZQMi8OEebtgjttIDTlNAAX2IE4Xsf6VkXaKGTmyW5B4Iel02AAFyr2WKe8/8+XIBgGr
	Xp0Q==
Received: by 10.216.144.138 with SMTP id n10mr4302375wej.56.1333987617665;
	Mon, 09 Apr 2012 09:06:57 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm50571324wiy.3.2012.04.09.09.06.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 09:06:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon,  9 Apr 2012 18:06:44 +0200
Message-Id: <1333987604-1614-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333987604-1614-1-git-send-email-koen@dominion.thruhere.net>
References: <1333987604-1614-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkJAQvGyONDq+uXnEioZXaBlxIfC2KPS7YpbOA2xI+kslehFb+Q7MAnUb3Z3mmYljOvHgrl
Cc: denys@ti.com
Subject: [PATCH 5/5] cloud9-image: add rsync
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
X-List-Received-Date: Mon, 09 Apr 2012 16:06:58 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index b8ef3d8..c29d1cb 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -30,6 +30,7 @@ IMAGE_INSTALL += " \
 	tslib-tests tslib-calibrate \
 	iproute2 canutils \
 	connman-tests \
+	rsync \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"
-- 
1.7.2.5


