Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 318ACE00998; Sun, 29 Sep 2019 16:53:17 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.214.194 listed in list.dnswl.org]
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4C4CE008C8
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 16:53:14 -0700 (PDT)
Received: by mail-pl1-f194.google.com with SMTP id d22so3160541pll.7
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qVu00fzeSNQYyp4JKAIaRJ2YTnT8dDpagcbBZl6McrQ=;
	b=Rx+QvbNviyYWzKyMnN/Jn4PFAqxP1sHGpMsFSHkhfbDkHzxYrPoa5gwB+IThiOSR/1
	p2vHEDsa6A0cII84afwpOcS9mN5q++LCnu1KP30HDZMiJSSMKFNyrGdBjHerx0Rm6pML
	YmJ7v65E7vu7Z7BGQyT3TgrCJNKaic1ZJmMUjICt1iRv/+C8eV5mBMafG4y7g2u1SBgz
	KIEPicm90mz5nwizwQ8r06cuXPPE2/mC4FCsjGWjJ2GZkJ1JlvXGl7cFPR/H2vFSNmei
	Pfbnf4iqEcK9nJlS1AwHNj8Qpr47p0fe06y7OcxqdRr44gMASxm3+KDpsGpwf/1om5NT
	HiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qVu00fzeSNQYyp4JKAIaRJ2YTnT8dDpagcbBZl6McrQ=;
	b=a4hImoVPnMsidUENwdZYBH+GIXwUR8VEkZGbphrSRZbcVuqE6UsKM1zadziUSLVi/B
	sF0A+d5roZCJav93ngHgZnIOPwitq2Pf6YPBoALtDEU5GXtCjYFmhNHcyvbsDWLo6JEX
	0BSWYswdoDLVNjTUSD+FLDty3YjXkGMtaIkYz4T2BDE2umiClHZRthLHiXZXUYdcRPkA
	wNR9NRL+/NGcup8iYseZeVnqdODh3I07g0TgkgQfYqu3YVIsZuzYb1enooBEaev2uXxE
	ENKq9OTUpX8p22U7ElLVvIKmNJ12QyAPqZfJvYrLwJN3bKR4A9scUpFzMEfNcmxUbBUI
	yDfg==
X-Gm-Message-State: APjAAAXsNKUpsEs18fht1s6eCKYaDz4ZWiR1OkK72VwJcAzJS4zOm9K7
	tlsldQfaOVEvxfX2Cy8hjwnWJH45LXE=
X-Google-Smtp-Source: APXvYqwPPRWKZtxpH1yINOjJK201Lzla9sDIkWWfvDEArlQpfJvc2gwZwxrkSvq5+L0PRJ6QBdLsKg==
X-Received: by 2002:a17:902:ac86:: with SMTP id
	h6mr17570741plr.18.1569801193608; 
	Sun, 29 Sep 2019 16:53:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	127sm10073031pfy.56.2019.09.29.16.53.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 16:53:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Sep 2019 16:53:02 -0700
Message-Id: <20190929235302.2686850-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] signgp.bb: Use SPDX short identifier for new BSD i.e. BSD-3-Clause
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
X-List-Received-Date: Sun, 29 Sep 2019 23:53:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/x-load/signgp.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/x-load/signgp.bb b/recipes-bsp/x-load/signgp.bb
index 9c3499f6..479e6f81 100644
--- a/recipes-bsp/x-load/signgp.bb
+++ b/recipes-bsp/x-load/signgp.bb
@@ -1,4 +1,4 @@
-LICENSE = "NewBSD"
+LICENSE = "BSD-3-Clause"
 DESCRIPTION = "Tool to sign omap3 x-loader images"
 LIC_FILES_CHKSUM = "file://signGP.c;md5=960f484fea13941ca88821366f9dade0"
 
-- 
2.23.0


