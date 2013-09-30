Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B1CBE01696
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2013 13:37:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 058C852A7F; Mon, 30 Sep 2013 20:37:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130930203737.058C852A7F@arago-project.org>
Date: Mon, 30 Sep 2013 20:37:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-keystone: update from 3.6.6 to 3.8.4
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
X-List-Received-Date: Mon, 30 Sep 2013 20:37:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 9e55646453285929ec054cfdeb005a384ef582a0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9e55646453285929ec054cfdeb005a384ef582a0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep 28 18:05:48 2013 -0400

linux-keystone: update from 3.6.6 to 3.8.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-keystone-3.6.6/defconfig           |  188 --------------------
 .../linux/linux-keystone-3.8.4/defconfig           |    1 +
 recipes-kernel/linux/linux-keystone_3.6.6.bb       |   16 --
 recipes-kernel/linux/linux-keystone_3.8.4.bb       |   27 +++
 4 files changed, 28 insertions(+), 204 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-3.6.6/defconfig b/recipes-kernel/linux/linux-keystone-3.6.6/defconfig
deleted file mode 100644
index d326a41..0000000
--- a/recipes-kernel/linux/linux-keystone-3.6.6/defconfig
+++ /dev/null
@@ -1,188 +0,0 @@
-CONFIG_EXPERIMENTAL=y
-# CONFIG_SWAP is not set
-CONFIG_POSIX_MQUEUE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SYSCTL_SYSCALL=y
-CONFIG_KALLSYMS_ALL=y
-# CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
-CONFIG_EMBEDDED=y
-CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
-CONFIG_KPROBES=y
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_ARCH_KEYSTONE=y
-CONFIG_SMP=y
-CONFIG_ARM_ARCH_TIMER=y
-CONFIG_PREEMPT__LL=y
-CONFIG_AEABI=y
-CONFIG_HIGHMEM=y
-CONFIG_VFP=y
-CONFIG_NEON=y
-# CONFIG_SUSPEND is not set
-CONFIG_PM_RUNTIME=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_UNIX_DIAG=y
-CONFIG_XFRM_USER=y
-CONFIG_XFRM_SUB_POLICY=y
-CONFIG_XFRM_STATISTICS=y
-CONFIG_NET_KEY=y
-CONFIG_NET_KEY_MIGRATE=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_IP_MULTIPLE_TABLES=y
-CONFIG_IP_ROUTE_MULTIPATH=y
-CONFIG_IP_ROUTE_VERBOSE=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_NET_IPIP=y
-CONFIG_NET_IPGRE_DEMUX=y
-CONFIG_NET_IPGRE=y
-CONFIG_IP_MROUTE=y
-CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
-CONFIG_IP_PIMSM_V2=y
-CONFIG_INET_AH=y
-CONFIG_INET_IPCOMP=y
-CONFIG_IPV6=y
-CONFIG_INET6_XFRM_MODE_TRANSPORT=m
-CONFIG_INET6_XFRM_MODE_TUNNEL=m
-CONFIG_INET6_XFRM_MODE_BEET=m
-CONFIG_IPV6_SIT=m
-CONFIG_IPV6_MULTIPLE_TABLES=y
-CONFIG_IPV6_SUBTREES=y
-CONFIG_IPV6_MROUTE=y
-CONFIG_IPV6_PIMSM_V2=y
-CONFIG_NETFILTER=y
-CONFIG_NF_CONNTRACK=y
-CONFIG_NF_CT_NETLINK=y
-CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
-CONFIG_NETFILTER_XT_TARGET_CONNMARK=y
-CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
-CONFIG_NETFILTER_XT_TARGET_MARK=y
-CONFIG_NETFILTER_XT_MATCH_COMMENT=y
-CONFIG_NETFILTER_XT_MATCH_CONNBYTES=y
-CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
-CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
-CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
-CONFIG_NETFILTER_XT_MATCH_CPU=y
-CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
-CONFIG_NETFILTER_XT_MATCH_LENGTH=y
-CONFIG_NETFILTER_XT_MATCH_MAC=y
-CONFIG_NETFILTER_XT_MATCH_MARK=y
-CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
-CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
-CONFIG_NETFILTER_XT_MATCH_STATE=y
-CONFIG_NF_CONNTRACK_IPV4=y
-CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_MATCH_AH=y
-CONFIG_IP_NF_MATCH_ECN=y
-CONFIG_IP_NF_MATCH_TTL=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_TARGET_REJECT=y
-CONFIG_IP_NF_TARGET_ULOG=y
-CONFIG_NF_NAT=y
-CONFIG_IP_NF_TARGET_MASQUERADE=y
-CONFIG_IP_NF_TARGET_NETMAP=y
-CONFIG_IP_NF_TARGET_REDIRECT=y
-CONFIG_IP_NF_MANGLE=y
-CONFIG_IP_NF_TARGET_CLUSTERIP=y
-CONFIG_IP_NF_TARGET_ECN=y
-CONFIG_IP_NF_TARGET_TTL=y
-CONFIG_IP_NF_RAW=y
-CONFIG_IP_NF_ARPTABLES=y
-CONFIG_IP_NF_ARPFILTER=y
-CONFIG_IP_NF_ARP_MANGLE=y
-CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP_SCTP=y
-CONFIG_VLAN_8021Q=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_CMA=y
-CONFIG_MTD=y
-CONFIG_MTD_TESTS=m
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_CHAR=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_PLATRAM=y
-CONFIG_MTD_M25P80=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_DAVINCI=y
-CONFIG_MTD_UBI=y
-CONFIG_PROC_DEVICETREE=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_EEPROM_AT24=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_NETDEVICES=y
-CONFIG_TI_DAVINCI_MDIO=y
-CONFIG_MARVELL_PHY=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_DAVINCI=y
-CONFIG_SPI=y
-CONFIG_SPI_DAVINCI=y
-CONFIG_SPI_SPIDEV=y
-CONFIG_GPIO_SYSFS=y
-# CONFIG_HWMON is not set
-CONFIG_WATCHDOG=y
-CONFIG_DAVINCI_WATCHDOG=y
-CONFIG_USB=y
-CONFIG_USB_DEBUG=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-CONFIG_USB_DWC3=y
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_USB_GADGET=y
-CONFIG_DMADEVICES=y
-CONFIG_UIO=y
-CONFIG_UIO_PDRV=y
-CONFIG_COMMON_CLK_DEBUG=y
-CONFIG_REMOTEPROC_USER=y
-CONFIG_MEMORY=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_NTFS_FS=y
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_WBUF_VERIFY=y
-CONFIG_UBIFS_FS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3_ACL=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=y
-CONFIG_NFSD_V3=y
-CONFIG_NFSD_V3_ACL=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_SHIRQ=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_USER=y
-CONFIG_CRYPTO_USER=y
-CONFIG_CRYPTO_NULL=y
-CONFIG_CRYPTO_AUTHENC=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_CTR=y
-CONFIG_CRYPTO_XCBC=y
-CONFIG_CRYPTO_DES=y
-CONFIG_CRYPTO_ANSI_CPRNG=y
-CONFIG_CRYPTO_USER_API_HASH=y
-CONFIG_CRYPTO_USER_API_SKCIPHER=y
diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
new file mode 100644
index 0000000..04e6b17
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
@@ -0,0 +1 @@
+use-kernel-config=keystone2_defconfig
diff --git a/recipes-kernel/linux/linux-keystone_3.6.6.bb b/recipes-kernel/linux/linux-keystone_3.6.6.bb
deleted file mode 100644
index 4dd5d15..0000000
--- a/recipes-kernel/linux/linux-keystone_3.6.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-COMPATIBLE_MACHINE = "keystone"
-
-require linux.inc
-
-MACHINE_KERNEL_PR_append = "a"
-
-CORTEXA8FIXUP = "no"
-
-# The tree tends to rebase, use literal stable tags
-SRCREV = "DEV.MCSDK-03.06.06.07"
-
-SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git \
-           file://defconfig \
-           "
-
-S = "${WORKDIR}/git"
diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.8.4.bb
new file mode 100644
index 0000000..989fde9
--- /dev/null
+++ b/recipes-kernel/linux/linux-keystone_3.8.4.bb
@@ -0,0 +1,27 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI Keystone devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+
+KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
+
+COMPATIBLE_MACHINE = "keystone"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "sept-2013/master"
+
+# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
+SRCREV = "20a48dc5309c4434650baef2b6072b5f1016f946"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH}\
+           file://defconfig\
+          "


