Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F00A7E01085; Fri,  2 Mar 2018 18:45:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A10D3E00E00
	for <meta-ti@yoctoproject.org>; Fri,  2 Mar 2018 18:45:57 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E2C602098D;
	Sat,  3 Mar 2018 02:45:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WoNCmg24e0uC; Sat,  3 Mar 2018 02:45:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C92120B6F;
	Sat,  3 Mar 2018 02:45:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1BAFC1632F2;
	Fri,  2 Mar 2018 21:45:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri,  2 Mar 2018 21:45:52 -0500
Message-Id: <1520045153-26802-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520045153-26802-1-git-send-email-denis@denix.org>
References: <1520045153-26802-1-git-send-email-denis@denix.org>
Subject: [rocko/master][PATCH 3/4] traceframework-rtos: uia is not a valid package to depend on
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
X-List-Received-Date: Sat, 03 Mar 2018 02:46:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/traceframework/traceframework-rtos_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/recipes-bsp/traceframework/traceframework-rtos_git.bb
index c4b76d1..369b04b 100644
--- a/recipes-bsp/traceframework/traceframework-rtos_git.bb
+++ b/recipes-bsp/traceframework/traceframework-rtos_git.bb
@@ -4,9 +4,6 @@ require traceframework.inc
 
 PR = "${INC_PR}.2"
 
-DEPENDS_append = " uia \
-"
-
 XDCPATH_append = ";${UIA_INSTALL_DIR}/packages"
 
 # HTML doc link params
-- 
2.7.4


