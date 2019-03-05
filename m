Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F1B0E00C8F; Tue,  5 Mar 2019 12:44:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D944CE00C1E
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2019 12:44:28 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2595640BFB;
	Tue,  5 Mar 2019 20:44:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id wpMP1u99J0F0; Tue,  5 Mar 2019 20:44:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EDBF40BFA;
	Tue,  5 Mar 2019 20:44:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C3D2E16BDE7;
	Tue,  5 Mar 2019 15:44:26 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue,  5 Mar 2019 15:44:26 -0500
Message-Id: <1551818666-5330-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] README: indicate dependency on thud branch of oe-core
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
X-List-Received-Date: Tue, 05 Mar 2019 20:44:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 39dde59..3df51b8 100644
--- a/README
+++ b/README
@@ -8,7 +8,7 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: thud
 
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
-- 
2.7.4


