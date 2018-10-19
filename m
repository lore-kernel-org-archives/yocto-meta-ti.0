Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81A8AE00BC2; Thu, 18 Oct 2018 19:02:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EE12E00994
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2018 19:02:44 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6D6EA20BB9;
	Fri, 19 Oct 2018 02:02:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id D0oK7lqEZVPb; Fri, 19 Oct 2018 02:02:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 46DDF20BB2;
	Fri, 19 Oct 2018 02:02:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 999C316457D;
	Thu, 18 Oct 2018 22:02:42 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 18 Oct 2018 22:02:41 -0400
Message-Id: <1539914561-18683-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-unpack.inc: also set COMPATIBLE_HOST for nativesdk
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
X-List-Received-Date: Fri, 19 Oct 2018 02:02:45 -0000

Some recipes that include ti-unpack.inc also need to build nativesdk packages.
Fixes errors like this:

| ERROR: Nothing RPROVIDES 'nativesdk-ti-cgt-pru' (but .../nativesdk-packagegroup-arago-sdk-host.bb RDEPENDS on or otherwise requires it)
| nativesdk-ti-cgt-pru was skipped: incompatible with host x86_64-arago-linux (not in COMPATIBLE_HOST)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/includes/ti-unpack.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index 9da11ed..dbc4949 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -83,3 +83,4 @@ python ti_bin_do_unpack() {
 COMPATIBLE_HOST ?= "null"
 COMPATIBLE_HOST_ti-soc = "(.*)"
 COMPATIBLE_HOST_class-native = "(.*)"
+COMPATIBLE_HOST_class-nativesdk = "(.*)"
-- 
2.7.4


