Return-Path: <matthias@kaehlcke.net>
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
	[217.70.183.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B8A9E0059E
	for <meta-ti@yoctoproject.org>; Wed, 30 Nov 2011 13:14:03 -0800 (PST)
X-Originating-IP: 217.70.178.139
Received: from mfilter10-d.gandi.net (mfilter10-d.gandi.net [217.70.178.139])
	by relay4-d.mail.gandi.net (Postfix) with ESMTP id D53F5172095
	for <meta-ti@yoctoproject.org>; Wed, 30 Nov 2011 22:14:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter10-d.gandi.net
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by mfilter10-d.gandi.net (mfilter10-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id HUSuR9F87u9E for <meta-ti@yoctoproject.org>;
	Wed, 30 Nov 2011 22:14:00 +0100 (CET)
X-Originating-IP: 83.160.107.163
Received: from d4rwin.no-ip.org (a83-160-107-163.adsl.xs4all.nl
	[83.160.107.163]) (Authenticated sender: matthias@kaehlcke.net)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 255F717209D
	for <meta-ti@yoctoproject.org>; Wed, 30 Nov 2011 22:13:59 +0100 (CET)
Received: by d4rwin.no-ip.org (Postfix, from userid 1000)
	id CDA8813FA87; Wed, 30 Nov 2011 22:12:29 +0100 (CET)
Date: Wed, 30 Nov 2011 22:12:29 +0100
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: meta-ti@yoctoproject.org
Message-ID: <20111130211229.GC30533@darwin>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] beaglebone.conf: Eliminate settings already specified in ti33x.inc
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 21:14:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove preferred kernel and image dependency on u-boot. Both are specified in
ti33x.inc, which is included

Signed-off-by: Matthias Kaehlcke <matthias@kaehlcke.net>
---
 conf/machine/beaglebone.conf |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 3803edf..9a551d7 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -11,9 +11,6 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 require conf/machine/include/ti33x.inc
-EXTRA_IMAGEDEPENDS = "u-boot"
-
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 
 IMAGE_FSTYPES += "tar.bz2 "
 
-- 
1.7.7.3


