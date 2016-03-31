Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BD22E00B9E; Thu, 31 Mar 2016 08:54:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.15 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9844E00928
	for <meta-ti@yoctoproject.org>; Thu, 31 Mar 2016 08:54:23 -0700 (PDT)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4W007AIUTZLG00@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 31 Mar 2016 10:54:00 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=CQLry15eTn9JlqAkxAoA:9
Received: by 100.15.86.14 with SMTP id 15ab817e; Thu, 31 Mar 2016 15:53:59 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 235A2161F51;	Thu,
	31 Mar 2016 11:53:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 31 Mar 2016 11:53:57 -0400
Message-id: <1459439638-23211-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] udev: rename bbappend to apply to eudev
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
X-List-Received-Date: Thu, 31 Mar 2016 15:54:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-core/udev/{udev => eudev}/omap-tty.rules        | 0
 recipes-core/udev/{udev_%.bbappend => eudev_%.bbappend} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/udev/{udev => eudev}/omap-tty.rules (100%)
 rename recipes-core/udev/{udev_%.bbappend => eudev_%.bbappend} (100%)

diff --git a/recipes-core/udev/udev/omap-tty.rules b/recipes-core/udev/eudev/omap-tty.rules
similarity index 100%
rename from recipes-core/udev/udev/omap-tty.rules
rename to recipes-core/udev/eudev/omap-tty.rules
diff --git a/recipes-core/udev/udev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
similarity index 100%
rename from recipes-core/udev/udev_%.bbappend
rename to recipes-core/udev/eudev_%.bbappend
-- 
2.2.0


