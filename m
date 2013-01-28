Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CA00E00724
	for <meta-ti@yoctoproject.org>; Mon, 28 Jan 2013 15:46:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 14FC852A46; Mon, 28 Jan 2013 23:46:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130128234604.14FC852A46@arago-project.org>
Date: Mon, 28 Jan 2013 23:46:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Cliff Brake : beagleboard.conf: add additional sound modules
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
X-List-Received-Date: Mon, 28 Jan 2013 23:46:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 3414f851ac740da23db92ab839716003e8a968a4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3414f851ac740da23db92ab839716003e8a968a4

Author: Cliff Brake <cbrake@bec-systems.com>
Date:   Tue Jan 22 17:40:55 2013 -0500

beagleboard.conf: add additional sound modules

require for audio to function

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/beagleboard.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index b3604a5..8f84c6c 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -48,4 +48,5 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
 
 # For a modularized kernel we want to drag in networking, sound, rtc etc."
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl"
+MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl \
+  kernel-module-snd-soc-omap kernel-module-snd-soc-omap-mcbsp kernel-module-snd-soc-omap3beagle"


