Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 976F0E006C3
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 15:26:45 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3558952ABC; Tue, 12 Feb 2013 23:26:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130212232645.3558952ABC@arago-project.org>
Date: Tue, 12 Feb 2013 23:26:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-omapl138-psp: Add latest linux-omapl138 patches
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
X-List-Received-Date: Tue, 12 Feb 2013 23:26:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 01b57041a177bafc9ffc849d492d36e39fc2b56d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=01b57041a177bafc9ffc849d492d36e39fc2b56d

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Feb 11 19:04:38 2013 -0600

linux-omapl138-psp: Add latest linux-omapl138 patches

* Add latest patches to linux-omapl138 that were added since this recipe was
  added to meta-ti.
* Update to latest am180x-evm defconfig
* Mimic the following commits from arago:

  linux-davinci: update to add mmc patches

    * Optimizations to reduce overhead on weak platforms

  linux: disable DMA for MUSB

    * For the am3517, am180x, and am335x devices the CPPI 4.1 DMA
      should NOT be used for the MUSB controller.  Using this DMA
      can cause the controller to lockup.
    * Updated the defconfigs to set the use of PIO mode
    * Added a patch to updated the PIO mode description to make it
      easier to determine when it can be used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/davinci.inc                   |    2 +-
 ...date-PIO-mode-help-information-in-Kconfig.patch |   44 ++++
 ...mmc-davinci-Eliminate-spurious-interrupts.patch |   64 ++++++
 ...mmc-davinci-Poll-for-small-size-transfers.patch |   96 +++++++++
 .../linux-omapl138-psp-2.6.37/am180x-evm/defconfig |  224 +++++++++++++++-----
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb  |    7 +-
 6 files changed, 385 insertions(+), 52 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=01b57041a177bafc9ffc849d492d36e39fc2b56d

