Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2318E007FE; Wed, 28 Oct 2015 13:06:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84EC6E00748
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2015 13:06:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1918B52A71; Wed, 28 Oct 2015 20:06:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151028200626.1918B52A71@arago-project.org>
Date: Wed, 28 Oct 2015 20:06:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : pa-lld: Add missing init script
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
X-List-Received-Date: Wed, 28 Oct 2015 20:06:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: a1e9cca6b0da6167c94e2476354e49563614e629
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a1e9cca6b0da6167c94e2476354e49563614e629

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Oct 28 00:18:09 2015 +0000

pa-lld: Add missing init script

- The init script is used to create symbolic link to the right
  device library

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pa-lld/files/init_pa.sh |   47 +++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/pa-lld/files/init_pa.sh b/recipes-bsp/pa-lld/files/init_pa.sh
new file mode 100755
index 0000000..8f80e35
--- /dev/null
+++ b/recipes-bsp/pa-lld/files/init_pa.sh
@@ -0,0 +1,47 @@
+#*
+#* Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+#*
+#*
+#*  Redistribution and use in source and binary forms, with or without
+#*  modification, are permitted provided that the following conditions
+#*  are met:
+#*
+#*    Redistributions of source code must retain the above copyright
+#*    notice, this list of conditions and the following disclaimer.
+#*
+#*    Redistributions in binary form must reproduce the above copyright
+#*    notice, this list of conditions and the following disclaimer in the
+#*    documentation and/or other materials provided with the
+#*    distribution.
+#*
+#*    Neither the name of Texas Instruments Incorporated nor the names of
+#*    its contributors may be used to endorse or promote products derived
+#*    from this software without specific prior written permission.
+#*
+
+#! /bin/sh
+compatible=$(cat /proc/device-tree/compatible)
+
+cd /usr/lib
+case "$compatible" in
+	*k2hk*)
+		device=k2hk
+		ln -sf libpa.so.1.0.0 libpa_device.so.1
+	;;
+	*k2l*)
+		device=k2l
+		ln -sf libpa2.so.1.0.0 libpa_device.so.1
+	;;
+	*k2e*)
+	device=k2e
+		ln -sf libpa2.so.1.0.0 libpa_device.so.1
+	;;
+	*)
+		device=unknown
+	;;
+esac
+
+if [ $device != unknown ]; then
+	ln -sf libpa_device.so.1 libpa_device.so
+	echo PA library link established for device : $device
+fi


