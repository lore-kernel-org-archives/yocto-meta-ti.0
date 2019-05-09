Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2581BE00D73; Thu,  9 May 2019 11:25:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.215.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1623E00D6B
	for <meta-ti@yoctoproject.org>; Thu,  9 May 2019 11:25:34 -0700 (PDT)
Received: by mail-pg1-f195.google.com with SMTP id j26so1628127pgl.5
	for <meta-ti@yoctoproject.org>; Thu, 09 May 2019 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fmeqgoniR8ImfItHnsyHe7QEawNnS92EzLVFQ0ch92Y=;
	b=m9unO/YPagxBz5uG6oB/U0Ogr8OcoEzLvNmo8b656jPcoRh7T45lftW/J35CS63AT0
	bQXhAznChHVZCQHMcSWm6R5ffCBnyiAizvr0Ay6Z3iYBMGpw5FHBWMs8XQZWbJssMV6W
	MxsKVF05zu4UcEMLjfnOjoAMecvpOgG9reIllB9L/fLZnNBQnDwXIUOgmKGA2w2MAn2s
	WEeD1KLefq6F4LzWXcL3dfAuS7U9jymgnFabgyykXY8HRuUzLa8zPvRppCt/4clJOUdk
	RwBXp6HZByIDIQrDlz5av7XQLXjPp+pmyAmuthLyEWkiwLve+CtrxtnYdv5aenQ65I9a
	AxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fmeqgoniR8ImfItHnsyHe7QEawNnS92EzLVFQ0ch92Y=;
	b=V9JVuaKP9uFwERRMZI57F1cPiA1dJcoPEcUXwLrk4DNYqHm+qO8BcUh0MejzY9FkuJ
	mQIVD3KvgDRLoUbrN3YybeYrJbSZKdAlZ35xZqXxTViDxBh+tW7OKil6wjx6Q9RPgI+z
	TxXRSMgaYfYXANnXgK+XUFxuV1XKTwDaVLOMlgTFaQxs20wSuTPEecbsctdSniTOdESy
	GRk0r4CrAqobjWxBlHtzpjifE3TrG870+khmejOXRRo1ro2No5++aGk2CJ88dLh6Iglu
	ptl9YpmPqgIelg10krlpKkedGJcU+ZFg9FTSHPakhR9Wi1NH5j7va3Lmbm+yawazumoN
	jq1g==
X-Gm-Message-State: APjAAAVQE/ElRBMLNhKaJs7PgIqw4yO941fw+pnNk6GHghv9nWJ7D5AB
	NX7ujf5Xbp8XdemDhU43RNP2wiz5mIU=
X-Google-Smtp-Source: APXvYqwG2QLbBRNDiJoxP0p04O9aMN2DAdnSdxLhQ4LRRP154hW2NubQ/rQx8/MfEthIvoD6B/0eDQ==
X-Received: by 2002:a62:5ec4:: with SMTP id s187mr7416933pfb.185.1557426333643;
	Thu, 09 May 2019 11:25:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id
	g10sm7057767pfg.153.2019.05.09.11.25.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 11:25:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu,  9 May 2019 11:25:22 -0700
Message-Id: <20190509182522.29756-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] beaglebone-capes: Update checksums for LICENSE
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
X-List-Received-Date: Thu, 09 May 2019 18:25:35 -0000
Content-Transfer-Encoding: 8bit

OE-Core has reworded the license file see
https://git.openembedded.org/openembedded-core/commit/?id=f8c9c511b5f1b7dbd45b77f345cb6c048ae6763e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/beagleboard/beaglebone-capes.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index e74033a1..30b985b5 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Userspace setup for beaglebone capes"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=b97a012949927931feb7793eee5ed924 "
 
 PR = "r4"
 
-- 
2.21.0


