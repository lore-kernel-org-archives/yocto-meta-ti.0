Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84419E00C09; Thu,  6 Dec 2018 12:02:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE644E00C74
	for <meta-ti@yoctoproject.org>; Thu,  6 Dec 2018 12:01:59 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A991409A0;
	Thu,  6 Dec 2018 20:01:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gOUCXzy6VnAl; Thu,  6 Dec 2018 20:01:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CDD6E408B3;
	Thu,  6 Dec 2018 20:01:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3471E166CEA;
	Thu,  6 Dec 2018 15:01:57 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu,  6 Dec 2018 15:01:56 -0500
Message-Id: <1544126516-54697-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] libp11: depend on openssl10
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
X-List-Received-Date: Thu, 06 Dec 2018 20:02:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/libp11/libp11_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/libp11/libp11_git.bb b/recipes-ti/libp11/libp11_git.bb
index cacdf58..9b1ea3e 100644
--- a/recipes-ti/libp11/libp11_git.bb
+++ b/recipes-ti/libp11/libp11_git.bb
@@ -5,13 +5,13 @@ SECTION = "libs"
 
 inherit autotools pkgconfig
 
-DEPENDS = "openssl libtool"
+DEPENDS = "openssl10 libtool"
 RDEPENDS_${PN} = "ti-softhsmv2"
 
 COMPATIBLE_MACHINE = "keystone"
 
 SRC_URI = "git://git.ti.com/keystone-linux/libp11.git;protocol=git;branch=${BRANCH}"
-BRANCH="master"
+BRANCH = "master"
 # Following commit corresponds to DEV.LIBP11-01.03.00.00
 SRCREV = "43c4f63a8d803fde2bcd8e4f8969e5fe9edf0e33"
 PV = "1.3.0.0"
-- 
2.7.4


