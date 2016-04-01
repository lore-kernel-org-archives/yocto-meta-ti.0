Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0686DE00911; Fri,  1 Apr 2016 11:40:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  1.3 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91C4BE00AD7
	for <meta-ti@yoctoproject.org>; Fri,  1 Apr 2016 11:40:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A5929529E6; Fri,  1 Apr 2016 18:40:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160401184034.A5929529E6@arago-project.org>
Date: Fri,  1 Apr 2016 18:40:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : udev: rename bbappend to apply to eudev
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
X-List-Received-Date: Fri, 01 Apr 2016 18:40:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8f59f940364edfcc0b7137d61aefaaa42dc74739
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8f59f940364edfcc0b7137d61aefaaa42dc74739

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 31 11:51:35 2016 -0400

udev: rename bbappend to apply to eudev

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-core/udev/{udev => eudev}/omap-tty.rules   |    0
 .../udev/{udev_%.bbappend => eudev_%.bbappend}     |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-core/udev/udev/omap-tty.rules b/recipes-core/udev/eudev/omap-tty.rules
similarity index 100%
rename from recipes-core/udev/udev/omap-tty.rules
rename to recipes-core/udev/eudev/omap-tty.rules
diff --git a/recipes-core/udev/udev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
similarity index 100%
rename from recipes-core/udev/udev_%.bbappend
rename to recipes-core/udev/eudev_%.bbappend


