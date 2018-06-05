Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C290AE01267; Tue,  5 Jun 2018 07:45:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F2B7E00D21
	for <meta-ti@yoctoproject.org>; Tue,  5 Jun 2018 07:45:43 -0700 (PDT)
Received: by mail-it0-f68.google.com with SMTP id n7-v6so3728716itn.1
	for <meta-ti@yoctoproject.org>; Tue, 05 Jun 2018 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1/cvqngw4S1Zg9GkWvayQQsFVBtVadSsjW5TEJFcyd4=;
	b=oxqDYzmDxi+faSxMuRYUjbjWDo/fDwt2GaCFixubRIjrDdJqp5dx/bJG0kdwEfPNQX
	p69L1Pm5+arFtXWacrTpWjaAerMf2TRjl9BThRk7ZDvETrir7/yGJnP3AmxHjC3C3W+B
	pRwZUUsd3tDCfj9Dtfki/txElnP9L91h7N5u7l0mzYsvhQURrDHT/8zBzDhm2kgVdqE3
	BFD99IoI9uD22nohKAncIusLm18AlUJF+2PqmdDiZ+kJPqjRBDoUYWrbUJBrgIxWjn7+
	dLc8bYo8etlE2wPWsX3VCf0gBz56RLMtjaPCIzaUuTELmSum4IVizRj7H2SfvXNgCr/V
	C6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1/cvqngw4S1Zg9GkWvayQQsFVBtVadSsjW5TEJFcyd4=;
	b=lbgp5fwagqTTU5sonxQuwm4FJnDDXq5J+UJKwJdn1P/f5f5vwapaDyVpGD8Q3yDfy3
	zgG+mhrNzVoMJG3b44jzYyjl6rybVebkQK2XxNmqcsGO+9cpYL8dKlI++SnMBBD0oB1x
	f/oUYC9PiHFzPrUDy4CXIEe0eJU3VSMy7FN13WnpAWdNMjH3+BjzIm44X2X4/PiwJxd7
	9bqORpqwo/vQALe+oReRi4RrYIB4L19DzB6pbkcLjr3kNVMVARUCgqL0tiS2TS9ERJiJ
	RM3LMtxtplWmHT5qbzWYjcjoYOyBEPaa57uUapjiAmv1cVTZgbqd4DXYENyKmZctTLag
	vdhQ==
X-Gm-Message-State: ALKqPwfB09Y6Z/nh9RUu0jRsUhL1SottBsT4r6az2RlJctCEnc7ZE0l1
	+bOEYRPhTEZhE8b4wtBVwXBfXbC3
X-Google-Smtp-Source: ADUXVKJFhhHyTSdrroBcMECiHfLUyR3Tc+Czobq4EAmBP5C/06F8g3MwAxW/LH0r7b7vHYJWJRRt9A==
X-Received: by 2002:a24:d105:: with SMTP id
	w5-v6mr17593752itg.64.1528209942478; 
	Tue, 05 Jun 2018 07:45:42 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	z138-v6sm7536059ioz.64.2018.06.05.07.45.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Jun 2018 07:45:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  5 Jun 2018 09:45:12 -0500
Message-Id: <20180605144512.28829-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: timothy.mertz@garmin.com
Subject: [morty/rocko/master][PATCH] ti-xdctools-common: Add XDC tools to -dev package
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
X-List-Received-Date: Tue, 05 Jun 2018 14:45:43 -0000

b42044aaf removed the XDC tools from the main package, but this broke
the ability to include the XDC tools in an SDK. Add the tools back to
the -dev package. Also fix up INSANE_SKIP.

Change-Id: I902cc1a841e40c1a3bdc5286d03f999276119052
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 recipes-ti/devtools/ti-xdctools-common.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
index d2d0df45..a3949cad 100644
--- a/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -13,12 +13,14 @@ do_install() {
     cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
 }
 
+FILES_${PN}-dev = "${XDC_INSTALL_DIR_RECIPE}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INSANE_SKIP_${PN} = "installed-vs-shipped"
+INSANE_SKIP_${PN}-dev = "libdir dev-elf arch file-rdeps"
 
 # Prevent internal libs from getting picked up
 PRIVATE_LIBS = " \
-- 
2.17.0


