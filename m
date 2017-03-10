Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9957CE00A1E; Fri, 10 Mar 2017 13:09:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26556E009B9
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 13:08:58 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A0ED20BBF;
	Fri, 10 Mar 2017 21:08:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GLj5U4o6xBtz; Fri, 10 Mar 2017 21:08:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E9BEB20B7A;
	Fri, 10 Mar 2017 21:08:56 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6EB3516239D;
	Fri, 10 Mar 2017 16:08:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Mar 2017 16:08:38 -0500
Message-Id: <1489180123-138253-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/5] Add WiLink8 WiFi and Bluetooth firmware and tools
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
X-List-Received-Date: Fri, 10 Mar 2017 21:09:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Moved and cleaned up from meta-arago-extras

Denys Dmytriyenko (5):
  wl18xx-fw: add version 8.7.1 (R8.7_SP1)
  bt-fw: add version 8.7.1 (R8.7_SP1)
  wlconf: add version 8.7.1 (R8.7_SP1)
  wl18xx-target-scripts: add version 8.7.1 (R8.7_SP1)
  wl18xx-calibrator: add version 8.7.1 (R8.7_SP1)

 recipes-bsp/bt-fw/bt-fw_git.bb                     | 24 +++++++++++++
 ...01-Add-Makefile-to-install-firmware-files.patch | 29 ++++++++++++++++
 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb           | 26 +++++++++++++++
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.1.bb   | 24 +++++++++++++
 .../wl18xx-target-scripts_8.7.1.bb                 | 22 ++++++++++++
 recipes-connectivity/wlconf/wlconf_8.7.1.bb        | 39 ++++++++++++++++++++++
 6 files changed, 164 insertions(+)
 create mode 100644 recipes-bsp/bt-fw/bt-fw_git.bb
 create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
 create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb
 create mode 100644 recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.1.bb
 create mode 100644 recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb
 create mode 100644 recipes-connectivity/wlconf/wlconf_8.7.1.bb

-- 
2.7.4


