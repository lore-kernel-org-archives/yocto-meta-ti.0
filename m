Return-Path: <denys@ti.com>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBA06E013D2
	for <meta-ti@yoctoproject.org>; Wed, 24 Oct 2012 20:45:25 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCF00ETZJRJ7340@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 24 Oct 2012 22:45:19 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 05F6E200BA; Wed,
	24 Oct 2012 23:45:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 24 Oct 2012 23:45:07 -0400
Message-id: <1351136709-1560-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCH 0/2] Add more tunes for new ARM processors Cortex-A15 and Cortex-A7
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
X-List-Received-Date: Thu, 25 Oct 2012 03:45:26 -0000

[Temporarily add these patches to meta-ti]

The patchset adds 2 more standard tune files for the new ARM MPCore (multicore)
processors Cortex-A15 and Cortex-A7, as per:

http://www.arm.com/products/processors/cortex-a/cortex-a15.php
http://www.arm.com/products/processors/cortex-a/cortex-a7.php

This patchset was previously submitted to oe-core, but was not accepted (yet)
for the following reasons:

1. Richard is currently busy with the 1.3 release and wants to take some time
   off right after that.
2. Martin submitted a slight rework for the tune framework few days earlier,
   which is also not accepted yet, and that change will break old-style tune
   files.

Here's the corresponding discussion:

http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/28850

Denys Dmytriyenko (2):
  tune-cortexa15: add tunes for ARM Cortex-A15
  tune-cortexa7: add tunes for ARM Cortex-A7

 meta/conf/machine/include/tune-cortexa15.inc | 24 ++++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa7.inc  | 24 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa15.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa7.inc

-- 
1.7.12.4


