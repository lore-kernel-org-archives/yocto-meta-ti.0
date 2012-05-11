Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66028E01420
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 80EDD52AA6; Fri, 11 May 2012 01:55:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015500.80EDD52AA6@arago-project.org>
Date: Fri, 11 May 2012 01:55:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: add support for CAN, RS232 and Battery beaglebone capes
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
X-List-Received-Date: Fri, 11 May 2012 01:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8f53db29b99e79f3e0e82bfc75a0a58741c9145b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8f53db29b99e79f3e0e82bfc75a0a58741c9145b

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri May  4 13:29:46 2012 +0200

linux-ti335x-psp 3.2: add support for CAN, RS232 and Battery beaglebone capes

Also change defconfig to prepare for audio support and fix lcd35 pinmux

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../0033-beaglebone-fix-3.5-cape-support.patch     |   73 +++++++++++++++++
 ...-connect-batterycape-GPIO-to-gpio-charger.patch |   84 ++++++++++++++++++++
 ...lebone-add-support-for-CAN-and-RS232-cape.patch |   67 ++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   21 +++---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    5 +-
 5 files changed, 238 insertions(+), 12 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=8f53db29b99e79f3e0e82bfc75a0a58741c9145b

