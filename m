Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0774E00AAB; Sun, 29 Sep 2019 08:43:48 -0700 (PDT)
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
	*      [209.85.210.173 listed in list.dnswl.org]
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88329E00998
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 08:43:48 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id x127so4084483pfb.7
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s3yNbidrIvBTfAxg3M3idGX4WwlPrzmqbF/CXCmZZMg=;
	b=dvfMbJxUfKnksDFW7tVc19eydvUZZ7kj/kOMQJswXFCmo05ncA4LyfH52OrZ1pLzRW
	fLuK+OVQ34dHMrAAUWKu2FDGRG4Mu8J0VrCgNHds/hqM8G3Mg3GDQavle1ML3la4sWL+
	IFd3aj5CZWe0YYzL9AOkM3QlsQDYOkaeaYyHUoNUuI1a+GfSNgz1mXhA3e6vMkPMqh7h
	T4p4j8+2XlRSdgwyoSM53Q34yl3f7hd6trIZz6HEm0dAbABdOoJzSGkD6VXDcZUJ/9pG
	Mf0c2XIbH1x7KRW/SvgoSSTrPWoO3vOhEGT+SCCvC0HPr05z9xWjYCRvivnvVNkv/6TV
	fR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s3yNbidrIvBTfAxg3M3idGX4WwlPrzmqbF/CXCmZZMg=;
	b=sZyRLBZpJTSmccagFiOR4uguAeBMpl73WRB1NI8yXVhQSHCJTFfacGWAdR8/pQsO06
	rCIoRtJTz41dKvnXfC78tsyeyPiWnFWep+uP2W3eWVrw/YSd5QESCN80QwoTd0uv7+lJ
	kf0vf1yE1NPX5hAM7h0kw4GcWVpA4KAHzWjoVN9599FvDdiCIKrIo31eg74UD1gQTNV8
	r+XTgcwRsCF3Ne7+VDxay4jMAXthDU36uiEMZ7aqBsQjZxB9cK0Mua73eskkr8YW9Zv6
	NmK+YY/v1utirDX+b3OyQw6CBcsrlt31Hm/81/ca9qnp97dA0ogdMtB5AMP2LmzkBjj/
	ECyQ==
X-Gm-Message-State: APjAAAUULH4lLxYNlhnYAg+zmPLaT2fjzrOTFtLSB+1q+b/BD2KCWa9G
	vi2ViiIao94bCzMe9L8wY1JabSWmAnQ=
X-Google-Smtp-Source: APXvYqyxwAxcUXm1u9RQ0tviUajYm1z/iDj824kLOzgNjjcLO5bEaIhfU3mWtI3k2hF0IAutDx6wkQ==
X-Received: by 2002:a63:7f59:: with SMTP id p25mr20136598pgn.11.1569771827518; 
	Sun, 29 Sep 2019 08:43:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	x20sm11059284pfp.120.2019.09.29.08.43.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 08:43:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Sep 2019 08:43:35 -0700
Message-Id: <20190929154335.2646732-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929154335.2646732-1-raj.khem@gmail.com>
References: <20190929154335.2646732-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] beaglebone-getting-started: Mention CC-BY-SA-3.0 and correct GPL version
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
X-List-Received-Date: Sun, 29 Sep 2019 15:43:49 -0000
Content-Transfer-Encoding: 8bit

This is as per
https://github.com/jadonk/beaglebone-getting-started/blob/master/LICENSE.txt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
index 6c61a4e9..c86e3518 100644
--- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
+++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
@@ -4,7 +4,7 @@ PR = "r21"
 
 inherit allarch
 
-LICENSE = "GPLv2+ & MIT & PD & others"
+LICENSE = "CC-BY-SA-3.0 & GPLv3+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
 SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
-- 
2.23.0


