Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF3AAE00B92; Fri, 12 Oct 2018 12:50:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61009E00B6C
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 12:50:11 -0700 (PDT)
Received: by mail-pg1-f196.google.com with SMTP id n31-v6so6304861pgm.7
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RD8IdSgbOk/AAIBSZ0wzlR52nINohhErQvxJ8ofYLa0=;
	b=uWyW3LlGVqk3bnRMItNkfYVayHJogptsW4tzH9OHdmZsPvR2Dd0S9imUcD6QX45Znp
	+OehlAPWIW2YgHA6GY8XRf9xWZUJShDrSOFKX9jAnf6W/t2DxfF3c3ohBk/kV0OTcUh1
	s2JZno1e5eLaRhLk92c8b8P6PDGk4cdoloV02WxP+CaU/hmUGA7ZZgQ6Fn3DkSOPf6P0
	SIQ6vaUFp1CjDJ7wXAzmnmOMVvB0oMRKf9DWBxaoQzREYhlIQ2WN7ACdMJm8ED9lK0OQ
	daxLOQJDOSLcfozpLXYdVl4aLmPugpVtbxatnFx04Hc1NpUzB9QSp/3jpbkue8Uk6Zar
	VBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RD8IdSgbOk/AAIBSZ0wzlR52nINohhErQvxJ8ofYLa0=;
	b=TDFU6FFSxFGjo8lxpih0TU/JSE0rB64vN+drKmQTZMMd+nO38SzF9meF7WbDmmiIPe
	kmFOjQVoKD8N3HzlUEUmXb8NtK9FMJH7Pjk0MRjyl8IR6XtwdRNFX5iE0C6QLUGhNAB3
	NZhNSk6/sl+1g13HvoJLmvIGYVnXtFtyPpREz8i7lraQCkBWu3GELBtvSmW/pFeg0YYr
	A/flxfZAdd2wiuYJQOm6tJVrN/3kFLBIoAxZIyVB537+TdpAj7FrDCidlowbPSe35W2l
	xxNwEZrDuh+gu+k2/ws1Df+mWNDK9F/9iZke1RHrT0cWth9gD1Q5x72axCM+q9qZDPeH
	Yu4g==
X-Gm-Message-State: ABuFfohouOjJLjMTh60xge4iNKizqddyflOoMW+6VXfE9WMbu8eQKbtX
	iyFu5Xvpu3RtqysySSysBkr2TUe1
X-Google-Smtp-Source: ACcGV605hitxH05PWA3e/a1T75RDFZVg8iQp7A+acYuhx0NL8LfIIPm4nxuncIal0kF4zGmnCTXjfQ==
X-Received: by 2002:a63:2251:: with SMTP id
	t17-v6mr6619579pgm.275.1539373810449; 
	Fri, 12 Oct 2018 12:50:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	c79-v6sm3466717pfc.92.2018.10.12.12.50.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 12:50:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2018 12:50:00 -0700
Message-Id: <20181012195000.4545-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] beaglebone-getting-started: Use cp options to not alter file mode
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2018 19:50:11 -0000
Content-Transfer-Encoding: 8bit

Fixes do_package_qa warnings
<FILE> is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
index 603a01a7..6c61a4e9 100644
--- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
+++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 
 do_install() {
 	install -d ${D}${datadir}/${PN}
-	cp -a ${S}/* ${D}${datadir}/${PN}
+	cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/${PN}
 }
 
 FILES_${PN} += "${datadir}/${PN}"
-- 
2.19.1


