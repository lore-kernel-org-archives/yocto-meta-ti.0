Return-Path: <denys@ti.com>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32DC0E01385
	for <meta-ti@yoctoproject.org>; Thu,  1 Nov 2012 18:01:09 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCU00IEG5H5YHZ1@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 01 Nov 2012 20:00:41 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E801520011; Thu,
	01 Nov 2012 21:00:40 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 01 Nov 2012 21:00:37 -0400
Message-id: <1351818039-5698-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCH 0/2] Add basic support for Keystone SoC and corresponding machine
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
X-List-Received-Date: Fri, 02 Nov 2012 01:01:09 -0000

This patchset adds basic support for the Keystone SoC family and a corresponding
Evaluation Module, as detailed at http://www.ti.com/product/tms320tci6636

Denys Dmytriyenko (2):
  conf/machine: add keystone SOC and keystone-evm machine
  linux-keystone: add kernel for keystone SOC

 conf/machine/include/keystone.inc                  |   14 +
 conf/machine/keystone-evm.conf                     |   23 +
 .../linux/linux-keystone-3.5+3.6-rc6/defconfig     | 1012 ++++++++++++++++++++
 recipes-kernel/linux/linux-keystone_3.6.bb         |   17 +
 4 files changed, 1066 insertions(+)
 create mode 100644 conf/machine/include/keystone.inc
 create mode 100644 conf/machine/keystone-evm.conf
 create mode 100644 recipes-kernel/linux/linux-keystone-3.5+3.6-rc6/defconfig
 create mode 100644 recipes-kernel/linux/linux-keystone_3.6.bb

-- 
1.7.12.4


