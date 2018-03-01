Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37707E00ED0; Wed, 28 Feb 2018 16:09:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DE38E00EBA
	for <meta-ti@yoctoproject.org>; Wed, 28 Feb 2018 16:09:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 69A0F20B7D;
	Thu,  1 Mar 2018 00:09:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id E768cx1z4XXR; Thu,  1 Mar 2018 00:09:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0659720B70;
	Thu,  1 Mar 2018 00:09:52 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4285E1632DD;
	Wed, 28 Feb 2018 19:09:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Feb 2018 19:09:47 -0500
Message-Id: <1519862990-49259-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519862990-49259-1-git-send-email-denis@denix.org>
References: <1519862990-49259-1-git-send-email-denis@denix.org>
Subject: [rocko/master][PATCH 3/5] gdbc6x: update compatibility
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
X-List-Received-Date: Thu, 01 Mar 2018 00:09:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-devtools/gdbc6x/gdbc6x_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6x/gdbc6x_git.bb
index a146a5c..be6f506 100644
--- a/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f
 
 DEPENDS = "ncurses bison-native texinfo flex-native gettext"
 
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+
 PR = "${INC_PR}.1"
 
 SRC_URI_append = " \
-- 
2.7.4


