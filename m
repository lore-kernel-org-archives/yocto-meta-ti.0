Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04C81E00AA5; Wed, 29 Jul 2015 20:15:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
	TVD_SPACE_RATIO,TVD_SPACE_RATIO_MINFP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  2.7 TVD_SPACE_RATIO_MINFP TVD_SPACE_RATIO_MINFP
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A108EE00A7E
	for <meta-ti@yoctoproject.org>; Wed, 29 Jul 2015 20:15:45 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSA00D3S6E77CA0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 29 Jul 2015 22:15:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=5izoO2iAFgRDzoIGgfAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6042A161B13;	Wed,
	29 Jul 2015 23:15:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 29 Jul 2015 23:15:40 -0400
Message-id: <1438226142-4379-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [fido/master][PATCH 1/3] am33x-cm3: move into cm3-pm-firmware folder
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
X-List-Received-Date: Thu, 30 Jul 2015 03:15:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/{am33x-cm3 => cm3-pm-firmware}/am33x-cm3_git.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-bsp/{am33x-cm3 => cm3-pm-firmware}/am33x-cm3_git.bb (100%)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
similarity index 100%
rename from recipes-bsp/am33x-cm3/am33x-cm3_git.bb
rename to recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
-- 
2.2.0


