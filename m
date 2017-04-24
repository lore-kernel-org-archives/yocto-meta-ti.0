Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2596E00AB6; Mon, 24 Apr 2017 15:57:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A50F7E00867
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 15:57:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9CF7020B85;
	Mon, 24 Apr 2017 22:57:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id wqGgmS59rIF8; Mon, 24 Apr 2017 22:57:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7AE732006A;
	Mon, 24 Apr 2017 22:56:59 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F086916247B;
	Mon, 24 Apr 2017 18:56:58 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 24 Apr 2017 18:56:57 -0400
Message-Id: <1493074617-24680-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] linux: use cmem and k2hk-uio dtsi for all k2hk platforms
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
X-List-Received-Date: Mon, 24 Apr 2017 22:57:06 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/files/{k2hk-evm => k2hk}/cmem.dtsi     | 0
 recipes-kernel/linux/files/{k2hk-evm => k2hk}/k2hk-uio.dtsi | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-kernel/linux/files/{k2hk-evm => k2hk}/cmem.dtsi (100%)
 rename recipes-kernel/linux/files/{k2hk-evm => k2hk}/k2hk-uio.dtsi (100%)

diff --git a/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi b/recipes-kernel/linux/files/k2hk/cmem.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
rename to recipes-kernel/linux/files/k2hk/cmem.dtsi
diff --git a/recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi b/recipes-kernel/linux/files/k2hk/k2hk-uio.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi
rename to recipes-kernel/linux/files/k2hk/k2hk-uio.dtsi
-- 
2.7.4


