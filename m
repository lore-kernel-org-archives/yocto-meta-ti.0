Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.36.1580339881306696546
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 15:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wsbqz1qK;
 spf=softfail (domain: linaro.org, ip: 140.211.169.56, mailfrom: peter.griffin@linaro.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0075AE01661; Wed, 29 Jan 2020 15:18:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.128.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B824AE0142A
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 15:17:59 -0800 (PST)
Received: by mail-wm1-f68.google.com with SMTP id m10so5117297wmc.0
        for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 15:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=L/30kQMyV6Yi7r/FJDUx0M7/D1CDp+OG1fnguCoz8Sw=;
        b=wsbqz1qKhrZmPbuHRzQ7X5xHwzQICXTZsa4gvWX+54cAuY6aZQMylQcPIQ23x9zJGs
         +prf8mrDlQVydmgrbOFqN6UeuCGxgOkPnNeFmovwnteqgRdDCfhfEooY9y+bXuY2PmcL
         4VAfRp6eqjAGtMFY0htJFbXQDiIF/FNybE+epIhKQm7AtA22bIgfO9MQin9UWqZiAp3/
         QyyQYwWQhyrPsc94sBMqqTlFhqW2Xcbk6fIdSoctwFzEMLNjPstrhAnKgmnLVvbS33Eb
         bW5+rGt/Nl1cNqWzktsnEsvuq8pijsFC+LsHRh+ut7W3FzNzfglnyyfEH2rPt4r+eFrG
         5sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L/30kQMyV6Yi7r/FJDUx0M7/D1CDp+OG1fnguCoz8Sw=;
        b=MzxjoPJGf6CyYb2JQ848CJgfuJy75JbcDEnzqJ4BP83+9v74UkCETr/dKz7ujZays4
         zGFwzbtX8KD7LgmINLHGIzWQV1uZ3IhScq0JY/q9c54IztS+EA/DtUkN3Qh18r4SepNJ
         hst7RecowV/l4QcxDH1XAz6RTkhBqy9vm8HZ2/PwCnfnIg4xVFDZNJiwL33KqzIrNzEt
         YMlpP1aHmise906tqRGP8BDJEJZvU+GwJiCHTy5VeBfUU+QdLWlRYfUMzB09AuDR6ZxN
         r0qDDmAizzxw3Yv/o2bQr4PTTsjwzlIPHrNlK/hjYUfjL/AtmDZEn0ziukCvE0E0U7G0
         gqxg==
X-Gm-Message-State: APjAAAVaNoU/+TUUbIZDd8dmBrSvTQm6mSEU1dSSrxLZwE5p7YreJRqR
	NzCMCWOhUWvXMrlbtNUSzNxQfxLc8AM=
X-Google-Smtp-Source: APXvYqxl/9n07iifDbEcZG8G7W7mGLGrSEGZqtJWDBRPYSJsB+xmJrzXLoKVpwDIwH7cmviwZCn8Ug==
X-Received: by 2002:a1c:3b87:: with SMTP id i129mr1532034wma.142.1580339878531;
        Wed, 29 Jan 2020 15:17:58 -0800 (PST)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id t10sm3834411wmi.40.2020.01.29.15.17.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 Jan 2020 15:17:57 -0800 (PST)
From: "Peter Griffin" <peter.griffin@linaro.org>
To: meta-ti@yoctoproject.org,
	denys@ti.com
Cc: andrey.konovalov@linaro.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] jailhouse_git: update to inherit python3 classes
Date: Wed, 29 Jan 2020 23:15:55 +0000
Message-Id: <1580339755-23335-1-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4

This avoids the parsing errors, now that python2
has been removed.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 4186dc3..89833e6 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -29,7 +29,7 @@ RDEPENDS_${PN} += "\
 S = "${WORKDIR}/git"
 
 require jailhouse-arch.inc
-inherit module pythonnative bash-completion deploy setuptools
+inherit module python3native bash-completion deploy setuptools3
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "(ti-soc)"
-- 
2.7.4

