Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 3B980E007B6
	for <meta-ti@yoctoproject.org>; Mon,  2 Dec 2013 06:33:13 -0800 (PST)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Mon, 2 Dec 2013
	15:33:07 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id ED49F28508B;
	Mon,  2 Dec 2013 15:33:07 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 2 Dec 2013 15:33:06 +0100
Message-ID: <1385994786-41789-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] Do not use fixed MAC address in dts file
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
X-List-Received-Date: Mon, 02 Dec 2013 14:33:16 -0000
Content-Type: text/plain

Do not use fixed MAC address in dts file to avoid duplicate MAC
address in the same LAN segment


Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../avoid_duplicate_mac_addr.patch                 |   30 ++++++++++++++++++++
 recipes-kernel/linux/linux-keystone_3.8.4.bb       |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-keystone-3.8.4/avoid_duplicate_mac_addr.patch

diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/avoid_duplicate_mac_addr.patch b/recipes-kernel/linux/linux-keystone-3.8.4/avoid_duplicate_mac_addr.patch
new file mode 100644
index 0000000..d29b76c
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone-3.8.4/avoid_duplicate_mac_addr.patch
@@ -0,0 +1,30 @@
+diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
+index 50e7fe6..ae46287 100644
+--- a/arch/arm/boot/dts/k2hk-evm.dts
++++ b/arch/arm/boot/dts/k2hk-evm.dts
+@@ -2462,7 +2462,7 @@
+ 					rx-channel = "netrx1";
+ 					rx-queue-depth = <128 128 0 0>;
+ 					rx-buffer-size = <1500 4096 0 0>;
+					efuse-mac = <0>;
+-					local-mac-address = [02 18 31 7e 3e 6f];
++					/*local-mac-address = [02 18 31 7e 3e 6f]; */
+ 				};
+ 			};
+ 
+@@ -2721,13 +2721,13 @@
+ 					rx-channel = "xgerx0";
+ 					rx-queue-depth = <128 0 0 0>;
+ 					rx-buffer-size = <1500 0 0 0>;
+-					local-mac-address = [02 18 31 7e 3e 5e]; /*+++FIXME*/
++					/* local-mac-address = [02 18 31 7e 3e 5e]; */
+ 				};
+ 				interface-1 {
+ 					rx-channel = "xgerx1";
+ 					rx-queue-depth = <128 128 0 0>;
+ 					rx-buffer-size = <1500 4096 0 0>;
+-					local-mac-address = [02 18 31 7e 3e 5f]; /*+++FIXME*/
++					/* local-mac-address = [02 18 31 7e 3e 5f]; */
+ 				};
+ 			};
+ 
diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.8.4.bb
index 709ef8f..17c3b1b 100644
--- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
+++ b/recipes-kernel/linux/linux-keystone_3.8.4.bb
@@ -26,4 +26,5 @@ PR = "${MACHINE_KERNEL_PR}"
 SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
            file://libtraceevent-Remove-hard-coded-include-to-usr-local-include-in-Makefile.patch\
+           file://avoid_duplicate_mac_addr.patch\
           "
-- 
1.7.10.4


