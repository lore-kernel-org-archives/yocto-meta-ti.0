Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B229E0027C
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 14:53:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 21D1152A1B; Mon, 25 Feb 2013 22:53:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130225225303.21D1152A1B@arago-project.org>
Date: Mon, 25 Feb 2013 22:53:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux: Add kernel version 3.3.7 for beagleboard
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
X-List-Received-Date: Mon, 25 Feb 2013 22:53:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 233882aa2be587eb61c385b60fa477a6cbf2a7c0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=233882aa2be587eb61c385b60fa477a6cbf2a7c0

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Sun Feb 17 16:00:32 2013 -0600

linux: Add kernel version 3.3.7 for beagleboard

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...M-OMAP-Cleanup-Beagleboard-DVI-reset-gpio.patch |  184 +
 ...ART-Fix-incorrect-population-of-default-u.patch |  169 +
 .../linux/linux-3.3.7/beagleboard/defconfig        | 3780 ++++++++++++++++++++
 recipes-kernel/linux/linux_3.3.7.bb                |   41 +
 4 files changed, 4174 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=233882aa2be587eb61c385b60fa477a6cbf2a7c0

