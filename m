Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86E16E0030F
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 12:11:24 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QKBMQH029243
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 14:11:23 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKBLrs014605
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 01:41:21 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 01:41:21 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKBIlH019414;
	Fri, 27 Jan 2012 01:41:20 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Jan 2012 14:11:11 -0600
Message-ID: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/5] *** SUBJECT HERE ***
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
X-List-Received-Date: Thu, 26 Jan 2012 20:11:24 -0000
Content-Type: text/plain

This patch set replaces the previous patches that were submitted.
The patches were re-ordered because the dependency between applications
such as arm-benchmarks and the matrix-gui-xxxx packages was reworked
such that we want to patch in the benchmarks first.

This was done to bring consistency to how matrix applications were
added.

Chase Maupin (5):
  arm-benchmarks: port of am-benchmarks from arago
  am-sysinfo: port to latest version from arago
  matrix-gui-browser: port from arago overlay
  refresh-screen: add package from arago
  matrix-gui: update to latest version

 recipes-bsp/ti/am-sysinfo_svn.bb                   |   23 -----
 recipes-ti/am-sysinfo/am-sysinfo_svn.bb            |   29 ++++++
 recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb    |   24 +++++
 recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb       |   18 ----
 recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb       |   22 ++++
 recipes-ti/matrix/matrix-gui-apps-git.inc          |   10 ++
 recipes-ti/matrix/matrix-gui-apps-images_2.0.bb    |   20 ++++
 .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |   17 +++
 recipes-ti/matrix/matrix-gui-browser_2.0.bb        |   24 +++++
 .../matrix/matrix-gui-camera-loopback_2.0.bb       |   18 ++++
 ...-gui-clocks_1.1.bb => matrix-gui-clocks_2.0.bb} |   18 ++--
 recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb    |   17 ---
 recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb   |   19 ----
 recipes-ti/matrix/matrix-gui-crypto-demos_2.0.bb   |   17 +++
 .../matrix/matrix-gui-display-control_1.0.bb       |   21 ----
 .../matrix/matrix-gui-display-control_2.0.bb       |   18 ++++
 .../matrix/matrix-gui-multimedia-demos_2.0.bb      |   17 +++
 recipes-ti/matrix/matrix-gui-oprofile-demos_2.0.bb |   17 +++
 recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb       |   21 ----
 recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb       |   17 +++
 recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb      |   17 +++
 recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb      |   20 ----
 recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb      |   17 +++
 recipes-ti/matrix/matrix-gui-settings-demos_2.0.bb |   17 +++
 recipes-ti/matrix/matrix-gui-submenus_1.0.bb       |  105 --------------------
 recipes-ti/matrix/matrix-gui-submenus_2.0.bb       |   50 +++++++++
 recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb      |   17 +++
 recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb     |   17 +++
 recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb     |   19 ----
 recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb     |   17 +++
 recipes-ti/matrix/matrix-gui/init                  |   57 ++++++++---
 recipes-ti/matrix/matrix-gui_2.0.bb                |   39 ++++++-
 recipes-ti/matrix/refresh-screen_2.0.bb            |   25 +++++
 33 files changed, 508 insertions(+), 296 deletions(-)
 delete mode 100644 recipes-bsp/ti/am-sysinfo_svn.bb
 create mode 100644 recipes-ti/am-sysinfo/am-sysinfo_svn.bb
 create mode 100644 recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-apps-git.inc
 create mode 100644 recipes-ti/matrix/matrix-gui-apps-images_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-browser_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-camera-loopback_2.0.bb
 rename recipes-ti/matrix/{matrix-gui-clocks_1.1.bb => matrix-gui-clocks_2.0.bb} (66%)
 delete mode 100644 recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-crypto-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-display-control_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-display-control_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-multimedia-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-oprofile-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-settings-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-submenus_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-submenus_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/refresh-screen_2.0.bb


