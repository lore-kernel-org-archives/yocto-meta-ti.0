Return-Path: <denys@ti.com>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EFB8E00721
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 19:30:02 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH00043XCE0PPD0@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 21 Jan 2013 21:30:02 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6A7C920077; Mon,
	21 Jan 2013 22:30:00 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 21 Jan 2013 22:29:59 -0500
Message-id: <1358825399-11222-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.8.1.1
In-reply-to: <1358825399-11222-1-git-send-email-denys@ti.com>
References: <1358825399-11222-1-git-send-email-denys@ti.com>
Subject: [PATCH 2/2] linux-keystone: update to the latest dev release for keystone
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
X-List-Received-Date: Tue, 22 Jan 2013 03:30:02 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc                  |   2 +-
 .../linux/linux-keystone-3.6.6/defconfig           | 967 ++++++++++++++++++---
 recipes-kernel/linux/linux-keystone_3.6.6.bb       |   2 +-
 3 files changed, 832 insertions(+), 139 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index ceac7e2..df9318a 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -5,7 +5,7 @@ require conf/machine/include/tune-cortexa15.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r3"
+MACHINE_KERNEL_PR = "r4"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-keystone-3.6.6/defconfig b/recipes-kernel/linux/linux-keystone-3.6.6/defconfig
index 0596687..342146c 100644
--- a/recipes-kernel/linux/linux-keystone-3.6.6/defconfig
+++ b/recipes-kernel/linux/linux-keystone-3.6.6/defconfig
@@ -5,6 +5,7 @@
 CONFIG_ARM=y
 CONFIG_ARM_RUNTIME_PATCH=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
 CONFIG_HAVE_PROC_CPU=y
 CONFIG_STACKTRACE_SUPPORT=y
 CONFIG_LOCKDEP_SUPPORT=y
@@ -13,7 +14,6 @@ CONFIG_RWSEM_GENERIC_SPINLOCK=y
 CONFIG_GENERIC_HWEIGHT=y
 CONFIG_GENERIC_CALIBRATE_DELAY=y
 CONFIG_ZONE_DMA=y
-CONFIG_TI_KEYSTONE=y
 CONFIG_NEED_DMA_MAP_STATE=y
 CONFIG_VECTORS_BASE=0xffff0000
 CONFIG_ARM_PATCH_PHYS_VIRT=y
@@ -22,6 +22,7 @@ CONFIG_NEED_MACH_MEMORY_H=y
 CONFIG_GENERIC_BUG=y
 CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
 CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
 
 #
 # General setup
@@ -40,9 +41,10 @@ CONFIG_KERNEL_GZIP=y
 # CONFIG_KERNEL_XZ is not set
 # CONFIG_KERNEL_LZO is not set
 CONFIG_DEFAULT_HOSTNAME="(none)"
-CONFIG_SWAP=y
+# CONFIG_SWAP is not set
 # CONFIG_SYSVIPC is not set
-# CONFIG_POSIX_MQUEUE is not set
+CONFIG_POSIX_MQUEUE=y
+CONFIG_POSIX_MQUEUE_SYSCTL=y
 # CONFIG_BSD_PROCESS_ACCT is not set
 # CONFIG_FHANDLE is not set
 # CONFIG_TASKSTATS is not set
@@ -68,49 +70,49 @@ CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
 #
 # Timers subsystem
 #
+CONFIG_TICK_ONESHOT=y
 # CONFIG_NO_HZ is not set
-# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_HIGH_RES_TIMERS=y
 
 #
 # RCU Subsystem
 #
-CONFIG_TREE_RCU=y
-# CONFIG_PREEMPT_RCU is not set
+CONFIG_TREE_PREEMPT_RCU=y
+CONFIG_PREEMPT_RCU=y
 CONFIG_RCU_FANOUT=32
 CONFIG_RCU_FANOUT_LEAF=16
 # CONFIG_RCU_FANOUT_EXACT is not set
 # CONFIG_TREE_RCU_TRACE is not set
-# CONFIG_IKCONFIG is not set
-CONFIG_LOG_BUF_SHIFT=17
+# CONFIG_RCU_BOOST is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CGROUPS is not set
 # CONFIG_CHECKPOINT_RESTORE is not set
-CONFIG_NAMESPACES=y
-CONFIG_UTS_NS=y
-CONFIG_PID_NS=y
-CONFIG_NET_NS=y
+# CONFIG_NAMESPACES is not set
 # CONFIG_SCHED_AUTOGROUP is not set
 # CONFIG_SYSFS_DEPRECATED is not set
 # CONFIG_RELAY is not set
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE=""
 CONFIG_RD_GZIP=y
-CONFIG_RD_BZIP2=y
-CONFIG_RD_LZMA=y
-CONFIG_RD_XZ=y
-CONFIG_RD_LZO=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_SYSCTL=y
 CONFIG_ANON_INODES=y
-# CONFIG_EXPERT is not set
+CONFIG_EXPERT=y
 CONFIG_UID16=y
-# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_SYSCTL_SYSCALL=y
 CONFIG_KALLSYMS=y
-# CONFIG_KALLSYMS_ALL is not set
+CONFIG_KALLSYMS_ALL=y
 CONFIG_HOTPLUG=y
 CONFIG_PRINTK=y
 CONFIG_BUG=y
-CONFIG_ELF_CORE=y
-CONFIG_BASE_FULL=y
+# CONFIG_ELF_CORE is not set
+# CONFIG_BASE_FULL is not set
 CONFIG_FUTEX=y
 CONFIG_EPOLL=y
 CONFIG_SIGNALFD=y
@@ -118,22 +120,28 @@ CONFIG_TIMERFD=y
 CONFIG_EVENTFD=y
 CONFIG_SHMEM=y
 CONFIG_AIO=y
-# CONFIG_EMBEDDED is not set
+CONFIG_EMBEDDED=y
 CONFIG_HAVE_PERF_EVENTS=y
 CONFIG_PERF_USE_VMALLOC=y
 
 #
 # Kernel Performance Events And Counters
 #
-# CONFIG_PERF_EVENTS is not set
+CONFIG_PERF_EVENTS=y
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_SLUB_DEBUG=y
 CONFIG_COMPAT_BRK=y
 # CONFIG_SLAB is not set
 CONFIG_SLUB=y
-# CONFIG_PROFILING is not set
+# CONFIG_SLOB is not set
+CONFIG_PROFILING=y
+CONFIG_TRACEPOINTS=y
+CONFIG_OPROFILE=y
 CONFIG_HAVE_OPROFILE=y
+CONFIG_KPROBES=y
 # CONFIG_JUMP_LABEL is not set
+CONFIG_KRETPROBES=y
 CONFIG_HAVE_KPROBES=y
 CONFIG_HAVE_KRETPROBES=y
 CONFIG_HAVE_ARCH_TRACEHOOK=y
@@ -144,6 +152,7 @@ CONFIG_GENERIC_SMP_IDLE_THREAD=y
 CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
 CONFIG_HAVE_CLK=y
 CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_HW_BREAKPOINT=y
 CONFIG_HAVE_ARCH_JUMP_LABEL=y
 CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
 
@@ -154,8 +163,14 @@ CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
 CONFIG_HAVE_GENERIC_DMA_COHERENT=y
 CONFIG_SLABINFO=y
 CONFIG_RT_MUTEXES=y
-CONFIG_BASE_SMALL=0
-# CONFIG_MODULES is not set
+CONFIG_BASE_SMALL=1
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_STOP_MACHINE=y
 CONFIG_BLOCK=y
 CONFIG_LBDAF=y
 CONFIG_BLK_DEV_BSG=y
@@ -184,26 +199,27 @@ CONFIG_DEFAULT_IOSCHED="cfq"
 # CONFIG_INLINE_SPIN_LOCK_BH is not set
 # CONFIG_INLINE_SPIN_LOCK_IRQ is not set
 # CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_UNINLINE_SPIN_UNLOCK=y
 # CONFIG_INLINE_SPIN_UNLOCK_BH is not set
-CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
 # CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
 # CONFIG_INLINE_READ_TRYLOCK is not set
 # CONFIG_INLINE_READ_LOCK is not set
 # CONFIG_INLINE_READ_LOCK_BH is not set
 # CONFIG_INLINE_READ_LOCK_IRQ is not set
 # CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
-CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK is not set
 # CONFIG_INLINE_READ_UNLOCK_BH is not set
-CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
 # CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
 # CONFIG_INLINE_WRITE_TRYLOCK is not set
 # CONFIG_INLINE_WRITE_LOCK is not set
 # CONFIG_INLINE_WRITE_LOCK_BH is not set
 # CONFIG_INLINE_WRITE_LOCK_IRQ is not set
 # CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
-CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK is not set
 # CONFIG_INLINE_WRITE_UNLOCK_BH is not set
-CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
 # CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
 CONFIG_MUTEX_SPIN_ON_OWNER=y
 # CONFIG_FREEZER is not set
@@ -268,6 +284,13 @@ CONFIG_ARCH_KEYSTONE=y
 # CONFIG_PLAT_SPEAR is not set
 # CONFIG_ARCH_VT8500 is not set
 # CONFIG_ARCH_ZYNQ is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+CONFIG_TI_KEYSTONE=y
+
+#
+# TI KeyStone Implementations
+#
 
 #
 # Processor Type
@@ -344,11 +367,13 @@ CONFIG_NR_CPUS=4
 # CONFIG_HOTPLUG_CPU is not set
 CONFIG_LOCAL_TIMERS=y
 CONFIG_ARCH_NR_GPIO=0
-CONFIG_PREEMPT_NONE=y
+CONFIG_PREEMPT=y
+# CONFIG_PREEMPT_NONE is not set
 # CONFIG_PREEMPT_VOLUNTARY is not set
-# CONFIG_PREEMPT__LL is not set
+CONFIG_PREEMPT__LL=y
 # CONFIG_PREEMPT_RTB is not set
 # CONFIG_PREEMPT_RT_FULL is not set
+CONFIG_PREEMPT_COUNT=y
 CONFIG_HZ=100
 # CONFIG_THUMB2_KERNEL is not set
 CONFIG_AEABI=y
@@ -358,14 +383,17 @@ CONFIG_OABI_COMPAT=y
 CONFIG_HAVE_ARCH_PFN_VALID=y
 CONFIG_HIGHMEM=y
 # CONFIG_HIGHPTE is not set
+CONFIG_HW_PERF_EVENTS=y
 CONFIG_SELECT_MEMORY_MODEL=y
 CONFIG_FLATMEM_MANUAL=y
 CONFIG_FLATMEM=y
 CONFIG_FLAT_NODE_MEM_MAP=y
 CONFIG_HAVE_MEMBLOCK=y
+CONFIG_MEMORY_ISOLATION=y
 CONFIG_PAGEFLAGS_EXTENDED=y
 CONFIG_SPLIT_PTLOCK_CPUS=4
 # CONFIG_COMPACTION is not set
+CONFIG_MIGRATION=y
 CONFIG_PHYS_ADDR_T_64BIT=y
 CONFIG_ZONE_DMA_FLAG=1
 CONFIG_BOUNCE=y
@@ -374,7 +402,6 @@ CONFIG_VIRT_TO_BUS=y
 CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
 CONFIG_CROSS_MEMORY_ATTACH=y
 # CONFIG_CLEANCACHE is not set
-# CONFIG_FRONTSWAP is not set
 CONFIG_FORCE_MAX_ZONEORDER=11
 CONFIG_ALIGNMENT_TRAP=y
 # CONFIG_UACCESS_WITH_MEMCPY is not set
@@ -417,7 +444,6 @@ CONFIG_NEON=y
 #
 CONFIG_BINFMT_ELF=y
 CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
-CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
 CONFIG_HAVE_AOUT=y
 # CONFIG_BINFMT_AOUT is not set
 # CONFIG_BINFMT_MISC is not set
@@ -426,7 +452,11 @@ CONFIG_HAVE_AOUT=y
 # Power management options
 #
 # CONFIG_SUSPEND is not set
-# CONFIG_PM_RUNTIME is not set
+CONFIG_PM_RUNTIME=y
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+# CONFIG_APM_EMULATION is not set
+CONFIG_PM_CLK=y
 CONFIG_ARCH_SUSPEND_POSSIBLE=y
 # CONFIG_ARM_CPU_SUSPEND is not set
 CONFIG_NET=y
@@ -439,7 +469,7 @@ CONFIG_UNIX=y
 CONFIG_UNIX_DIAG=y
 CONFIG_XFRM=y
 CONFIG_XFRM_ALGO=y
-# CONFIG_XFRM_USER is not set
+CONFIG_XFRM_USER=y
 CONFIG_XFRM_SUB_POLICY=y
 CONFIG_XFRM_MIGRATE=y
 CONFIG_XFRM_STATISTICS=y
@@ -494,21 +524,186 @@ CONFIG_IPV6=y
 # CONFIG_IPV6_MIP6 is not set
 # CONFIG_INET6_XFRM_TUNNEL is not set
 # CONFIG_INET6_TUNNEL is not set
-CONFIG_INET6_XFRM_MODE_TRANSPORT=y
-CONFIG_INET6_XFRM_MODE_TUNNEL=y
-CONFIG_INET6_XFRM_MODE_BEET=y
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
 # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
-CONFIG_IPV6_SIT=y
+CONFIG_IPV6_SIT=m
 # CONFIG_IPV6_SIT_6RD is not set
 CONFIG_IPV6_NDISC_NODETYPE=y
 # CONFIG_IPV6_TUNNEL is not set
-# CONFIG_IPV6_MULTIPLE_TABLES is not set
-# CONFIG_IPV6_MROUTE is not set
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_IPV6_SUBTREES=y
+CONFIG_IPV6_MROUTE=y
+# CONFIG_IPV6_MROUTE_MULTIPLE_TABLES is not set
+CONFIG_IPV6_PIMSM_V2=y
 # CONFIG_NETWORK_SECMARK is not set
 # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
-# CONFIG_NETFILTER is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+CONFIG_NETFILTER_NETLINK=y
+# CONFIG_NETFILTER_NETLINK_ACCT is not set
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_CONNTRACK_MARK=y
+CONFIG_NF_CONNTRACK_PROCFS=y
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CONNTRACK_TIMEOUT is not set
+# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+CONFIG_NF_CT_PROTO_SCTP=y
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+# CONFIG_NF_CONNTRACK_FTP is not set
+# CONFIG_NF_CONNTRACK_H323 is not set
+# CONFIG_NF_CONNTRACK_IRC is not set
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_SNMP is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+# CONFIG_NF_CONNTRACK_SIP is not set
+# CONFIG_NF_CONNTRACK_TFTP is not set
+CONFIG_NF_CT_NETLINK=y
+# CONFIG_NF_CT_NETLINK_TIMEOUT is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=y
+
+#
+# Xtables combined modules
+#
+CONFIG_NETFILTER_XT_MARK=y
+CONFIG_NETFILTER_XT_CONNMARK=y
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=y
+# CONFIG_NETFILTER_XT_TARGET_CT is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_HL=y
+# CONFIG_NETFILTER_XT_TARGET_HMARK is not set
+CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
+# CONFIG_NETFILTER_XT_TARGET_LOG is not set
+CONFIG_NETFILTER_XT_TARGET_MARK=y
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+CONFIG_NETFILTER_XT_MATCH_COMMENT=y
+CONFIG_NETFILTER_XT_MATCH_CONNBYTES=y
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
+CONFIG_NETFILTER_XT_MATCH_CPU=y
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+CONFIG_NETFILTER_XT_MATCH_ECN=y
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+CONFIG_NETFILTER_XT_MATCH_HL=y
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
+CONFIG_NETFILTER_XT_MATCH_LENGTH=y
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+CONFIG_NETFILTER_XT_MATCH_MAC=y
+CONFIG_NETFILTER_XT_MATCH_MARK=y
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
+# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
+# CONFIG_NETFILTER_XT_MATCH_OSF is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+CONFIG_NETFILTER_XT_MATCH_SCTP=y
+CONFIG_NETFILTER_XT_MATCH_STATE=y
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_SET is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=y
+CONFIG_NF_CONNTRACK_IPV4=y
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_MATCH_AH=y
+CONFIG_IP_NF_MATCH_ECN=y
+# CONFIG_IP_NF_MATCH_RPFILTER is not set
+CONFIG_IP_NF_MATCH_TTL=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_IP_NF_TARGET_REJECT=y
+CONFIG_IP_NF_TARGET_ULOG=y
+CONFIG_NF_NAT=y
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
+CONFIG_IP_NF_TARGET_NETMAP=y
+CONFIG_IP_NF_TARGET_REDIRECT=y
+CONFIG_NF_NAT_PROTO_SCTP=y
+# CONFIG_NF_NAT_FTP is not set
+# CONFIG_NF_NAT_IRC is not set
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+# CONFIG_NF_NAT_H323 is not set
+# CONFIG_NF_NAT_SIP is not set
+CONFIG_IP_NF_MANGLE=y
+CONFIG_IP_NF_TARGET_CLUSTERIP=y
+CONFIG_IP_NF_TARGET_ECN=y
+CONFIG_IP_NF_TARGET_TTL=y
+CONFIG_IP_NF_RAW=y
+CONFIG_IP_NF_ARPTABLES=y
+CONFIG_IP_NF_ARPFILTER=y
+CONFIG_IP_NF_ARP_MANGLE=y
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_NF_CONNTRACK_IPV6 is not set
+CONFIG_IP6_NF_IPTABLES=m
+# CONFIG_IP6_NF_MATCH_AH is not set
+# CONFIG_IP6_NF_MATCH_EUI64 is not set
+# CONFIG_IP6_NF_MATCH_FRAG is not set
+# CONFIG_IP6_NF_MATCH_OPTS is not set
+# CONFIG_IP6_NF_MATCH_HL is not set
+# CONFIG_IP6_NF_MATCH_IPV6HEADER is not set
+# CONFIG_IP6_NF_MATCH_MH is not set
+# CONFIG_IP6_NF_MATCH_RPFILTER is not set
+# CONFIG_IP6_NF_MATCH_RT is not set
+# CONFIG_IP6_NF_FILTER is not set
+# CONFIG_IP6_NF_MANGLE is not set
+# CONFIG_IP6_NF_RAW is not set
 # CONFIG_IP_DCCP is not set
 CONFIG_IP_SCTP=y
+# CONFIG_NET_SCTPPROBE is not set
 # CONFIG_SCTP_DBG_MSG is not set
 # CONFIG_SCTP_DBG_OBJCNT is not set
 # CONFIG_SCTP_HMAC_NONE is not set
@@ -539,11 +734,14 @@ CONFIG_RPS=y
 CONFIG_RFS_ACCEL=y
 CONFIG_XPS=y
 CONFIG_BQL=y
+# CONFIG_BPF_JIT is not set
 
 #
 # Network testing
 #
 # CONFIG_NET_PKTGEN is not set
+# CONFIG_NET_TCPPROBE is not set
+# CONFIG_NET_DROP_MONITOR is not set
 # CONFIG_HAMRADIO is not set
 # CONFIG_CAN is not set
 # CONFIG_IRDA is not set
@@ -584,9 +782,22 @@ CONFIG_EXTRA_FIRMWARE=""
 # CONFIG_SYS_HYPERVISOR is not set
 # CONFIG_GENERIC_CPU_DEVICES is not set
 # CONFIG_DMA_SHARED_BUFFER is not set
-# CONFIG_CMA is not set
+CONFIG_CMA=y
+# CONFIG_CMA_DEBUG is not set
+
+#
+# Default contiguous memory area size:
+#
+CONFIG_CMA_SIZE_MBYTES=16
+CONFIG_CMA_SIZE_SEL_MBYTES=y
+# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
+# CONFIG_CMA_SIZE_SEL_MIN is not set
+# CONFIG_CMA_SIZE_SEL_MAX is not set
+CONFIG_CMA_ALIGNMENT=8
+CONFIG_CMA_AREAS=7
 # CONFIG_CONNECTOR is not set
 CONFIG_MTD=y
+CONFIG_MTD_TESTS=m
 # CONFIG_MTD_REDBOOT_PARTS is not set
 CONFIG_MTD_CMDLINE_PARTS=y
 # CONFIG_MTD_AFS_PARTS is not set
@@ -606,7 +817,6 @@ CONFIG_MTD_BLOCK=y
 # CONFIG_SSFDC is not set
 # CONFIG_SM_FTL is not set
 # CONFIG_MTD_OOPS is not set
-# CONFIG_MTD_SWAP is not set
 
 #
 # RAM/ROM/Flash chip drivers
@@ -659,11 +869,13 @@ CONFIG_MTD_NAND=y
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
 CONFIG_MTD_NAND_IDS=y
 # CONFIG_MTD_NAND_DISKONCHIP is not set
 # CONFIG_MTD_NAND_DOCG4 is not set
 # CONFIG_MTD_NAND_NANDSIM is not set
 # CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
 CONFIG_MTD_NAND_DAVINCI=y
 # CONFIG_MTD_ONENAND is not set
 
@@ -671,38 +883,43 @@ CONFIG_MTD_NAND_DAVINCI=y
 # LPDDR flash memory drivers
 #
 # CONFIG_MTD_LPDDR is not set
-# CONFIG_MTD_UBI is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_RESERVE=2
+# CONFIG_MTD_UBI_GLUEBI is not set
 CONFIG_DTC=y
 CONFIG_OF=y
 
 #
 # Device Tree and Open Firmware support
 #
-# CONFIG_PROC_DEVICETREE is not set
+CONFIG_PROC_DEVICETREE=y
 # CONFIG_OF_SELFTEST is not set
 CONFIG_OF_FLATTREE=y
 CONFIG_OF_EARLY_FLATTREE=y
 CONFIG_OF_ADDRESS=y
 CONFIG_OF_IRQ=y
 CONFIG_OF_DEVICE=y
+CONFIG_OF_I2C=y
 CONFIG_OF_NET=y
 CONFIG_OF_MDIO=y
 CONFIG_OF_MTD=y
 # CONFIG_PARPORT is not set
 CONFIG_BLK_DEV=y
 # CONFIG_BLK_DEV_COW_COMMON is not set
-# CONFIG_BLK_DEV_LOOP is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
 
 #
 # DRBD disabled because PROC_FS, INET or CONNECTOR not selected
 #
 # CONFIG_BLK_DEV_NBD is not set
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_COUNT=16
-CONFIG_BLK_DEV_RAM_SIZE=4096
-# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
 # CONFIG_VIRTIO_BLK is not set
 # CONFIG_BLK_DEV_RBD is not set
 
@@ -712,38 +929,92 @@ CONFIG_BLK_DEV_RAM_SIZE=4096
 # CONFIG_SENSORS_LIS3LV02D is not set
 # CONFIG_AD525X_DPOT is not set
 # CONFIG_ATMEL_PWM is not set
+CONFIG_HWLAT_DETECTOR=m
+# CONFIG_ICS932S401 is not set
 # CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_APDS9802ALS is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_ISL29020 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_BH1780 is not set
+# CONFIG_SENSORS_BH1770 is not set
+# CONFIG_SENSORS_APDS990X is not set
+# CONFIG_HMC6352 is not set
+# CONFIG_DS1682 is not set
 # CONFIG_TI_DAC7512 is not set
+# CONFIG_BMP085_I2C is not set
 # CONFIG_BMP085_SPI is not set
-CONFIG_KEYSTONE_IPC_IRQ=y
+# CONFIG_USB_SWITCH_FSA9480 is not set
 # CONFIG_C2PORT is not set
 
 #
 # EEPROM support
 #
+CONFIG_EEPROM_AT24=y
 # CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EEPROM_MAX6875 is not set
 # CONFIG_EEPROM_93CX6 is not set
 # CONFIG_EEPROM_93XX46 is not set
 
 #
 # Texas Instruments shared transport line discipline
 #
+# CONFIG_TI_ST is not set
 # CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
 
 #
 # Altera FPGA firmware download module
 #
+# CONFIG_ALTERA_STAPL is not set
 
 #
 # SCSI device support
 #
 CONFIG_SCSI_MOD=y
 # CONFIG_RAID_ATTRS is not set
-# CONFIG_SCSI is not set
-# CONFIG_SCSI_DMA is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
 # CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+CONFIG_CHR_DEV_SG=y
+# CONFIG_CHR_DEV_SCH is not set
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_VIRTIO is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
 # CONFIG_ATA is not set
 # CONFIG_MD is not set
+# CONFIG_TARGET_CORE is not set
 CONFIG_NETDEVICES=y
 CONFIG_NET_CORE=y
 # CONFIG_BONDING is not set
@@ -827,10 +1098,22 @@ CONFIG_MARVELL_PHY=y
 # CONFIG_MICREL_PHY is not set
 # CONFIG_FIXED_PHY is not set
 # CONFIG_MDIO_BITBANG is not set
+# CONFIG_MDIO_BUS_MUX_GPIO is not set
 # CONFIG_MICREL_KS8995MA is not set
 # CONFIG_PPP is not set
 # CONFIG_SLIP is not set
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+# CONFIG_USB_USBNET is not set
+# CONFIG_USB_IPHETH is not set
 CONFIG_WLAN=y
+# CONFIG_USB_ZD1201 is not set
 # CONFIG_HOSTAP is not set
 # CONFIG_WL_TI is not set
 
@@ -864,8 +1147,20 @@ CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
 # Input Device Drivers
 #
 CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+# CONFIG_KEYBOARD_ADP5589 is not set
 CONFIG_KEYBOARD_ATKBD=y
+# CONFIG_KEYBOARD_QT1070 is not set
+# CONFIG_KEYBOARD_QT2160 is not set
 # CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_TCA8418 is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8333 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
 # CONFIG_KEYBOARD_NEWTON is not set
 # CONFIG_KEYBOARD_OPENCORES is not set
 # CONFIG_KEYBOARD_SAMSUNG is not set
@@ -886,6 +1181,8 @@ CONFIG_MOUSE_PS2_TRACKPOINT=y
 # CONFIG_MOUSE_APPLETOUCH is not set
 # CONFIG_MOUSE_BCM5974 is not set
 # CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_MOUSE_SYNAPTICS_I2C is not set
 # CONFIG_MOUSE_SYNAPTICS_USB is not set
 # CONFIG_INPUT_JOYSTICK is not set
 # CONFIG_INPUT_TABLET is not set
@@ -942,19 +1239,54 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_SERIAL_TIMBERDALE is not set
 # CONFIG_SERIAL_ALTERA_JTAGUART is not set
 # CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
 # CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
 # CONFIG_HVC_DCC is not set
 # CONFIG_VIRTIO_CONSOLE is not set
 # CONFIG_IPMI_HANDLER is not set
-CONFIG_HW_RANDOM=y
-# CONFIG_HW_RANDOM_TIMERIOMEM is not set
-# CONFIG_HW_RANDOM_ATMEL is not set
-# CONFIG_HW_RANDOM_VIRTIO is not set
-# CONFIG_HW_RANDOM_EXYNOS is not set
+# CONFIG_HW_RANDOM is not set
 # CONFIG_R3964 is not set
 # CONFIG_RAW_DRIVER is not set
 # CONFIG_TCG_TPM is not set
-# CONFIG_I2C is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=y
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+CONFIG_I2C_DAVINCI=y
+# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_PXA_PCI is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_DIOLAN_U2C is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_STUB is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
 CONFIG_SPI=y
 # CONFIG_SPI_DEBUG is not set
 CONFIG_SPI_MASTER=y
@@ -965,7 +1297,10 @@ CONFIG_SPI_MASTER=y
 # CONFIG_SPI_ALTERA is not set
 CONFIG_SPI_BITBANG=y
 CONFIG_SPI_DAVINCI=y
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_OC_TINY is not set
 # CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_XCOMM is not set
 # CONFIG_SPI_XILINX is not set
 # CONFIG_SPI_DESIGNWARE is not set
 
@@ -993,37 +1328,70 @@ CONFIG_SPI_SPIDEV=y
 # Enable Device Drivers -> PPS to see the PTP clock options.
 #
 CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
-CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
-# CONFIG_GPIOLIB is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+CONFIG_OF_GPIO=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_KEYSTONE=y
+CONFIG_GPIO_KEYSTONE_IPC=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_EM is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+# CONFIG_GPIO_ADP5588 is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_GPIO_MC33880 is not set
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
 # CONFIG_W1 is not set
 # CONFIG_POWER_SUPPLY is not set
 # CONFIG_POWER_AVS is not set
-CONFIG_HWMON=y
-# CONFIG_HWMON_VID is not set
-# CONFIG_HWMON_DEBUG_CHIP is not set
-
-#
-# Native drivers
-#
-# CONFIG_SENSORS_AD7314 is not set
-# CONFIG_SENSORS_ADCXX is not set
-# CONFIG_SENSORS_F71805F is not set
-# CONFIG_SENSORS_F71882FG is not set
-# CONFIG_SENSORS_IT87 is not set
-# CONFIG_SENSORS_LM70 is not set
-# CONFIG_SENSORS_MAX1111 is not set
-# CONFIG_SENSORS_NTC_THERMISTOR is not set
-# CONFIG_SENSORS_PC87360 is not set
-# CONFIG_SENSORS_PC87427 is not set
-# CONFIG_SENSORS_SMSC47M1 is not set
-# CONFIG_SENSORS_SMSC47B397 is not set
-# CONFIG_SENSORS_SCH56XX_COMMON is not set
-# CONFIG_SENSORS_ADS7871 is not set
-# CONFIG_SENSORS_VT1211 is not set
-# CONFIG_SENSORS_W83627HF is not set
-# CONFIG_SENSORS_W83627EHF is not set
+# CONFIG_HWMON is not set
 # CONFIG_THERMAL is not set
-# CONFIG_WATCHDOG is not set
+CONFIG_WATCHDOG=y
+# CONFIG_WATCHDOG_CORE is not set
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+# CONFIG_DW_WATCHDOG is not set
+# CONFIG_MPCORE_WATCHDOG is not set
+CONFIG_DAVINCI_WATCHDOG=y
+# CONFIG_MAX63XX_WATCHDOG is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
 CONFIG_SSB_POSSIBLE=y
 
 #
@@ -1041,19 +1409,57 @@ CONFIG_BCMA_POSSIBLE=y
 # Multifunction device drivers
 #
 # CONFIG_MFD_CORE is not set
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_88PM800 is not set
+# CONFIG_MFD_88PM805 is not set
 # CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
 # CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_MFD_LM3533 is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS65217 is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_TWL6040_CORE is not set
 # CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
 # CONFIG_MFD_TMIO is not set
 # CONFIG_MFD_T7L66XB is not set
 # CONFIG_MFD_TC6387XB is not set
 # CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
 # CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_DA9052_I2C is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX77686 is not set
+# CONFIG_MFD_MAX77693 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_SEC_CORE is not set
+# CONFIG_MFD_ARIZONA_I2C is not set
 # CONFIG_MFD_ARIZONA_SPI is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
 # CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
 # CONFIG_MFD_MC13XXX_SPI is not set
+# CONFIG_MFD_MC13XXX_I2C is not set
 # CONFIG_ABX500_CORE is not set
 # CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_TPS65090 is not set
+# CONFIG_MFD_AAT2870_CORE is not set
+# CONFIG_MFD_RC5T583 is not set
+# CONFIG_MFD_PALMAS is not set
 # CONFIG_REGULATOR is not set
 # CONFIG_MEDIA_SUPPORT is not set
 
@@ -1084,21 +1490,206 @@ CONFIG_HID_GENERIC=y
 #
 # Special HID drivers
 #
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_ACRUX is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_AUREAL is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EMS_FF is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_HOLTEK is not set
+# CONFIG_HID_KEYTOUCH is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_UCLOGIC is not set
+# CONFIG_HID_WALTOP is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LCPOWER is not set
+# CONFIG_HID_LENOVO_TPKBD is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_MULTITOUCH is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_ORTEK is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_PICOLCD is not set
+# CONFIG_HID_PRIMAX is not set
+# CONFIG_HID_ROCCAT is not set
+# CONFIG_HID_SAITEK is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_SPEEDLINK is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TIVO is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_ZEROPLUS is not set
+# CONFIG_HID_ZYDACRON is not set
+
+#
+# USB HID support
+#
+CONFIG_USB_HID=y
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
 # CONFIG_USB_ARCH_HAS_OHCI is not set
 # CONFIG_USB_ARCH_HAS_EHCI is not set
-# CONFIG_USB_ARCH_HAS_XHCI is not set
+CONFIG_USB_ARCH_HAS_XHCI=y
 CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=y
 CONFIG_USB_ARCH_HAS_HCD=y
-# CONFIG_USB is not set
+CONFIG_USB=y
+CONFIG_USB_DEBUG=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_SUSPEND is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+CONFIG_USB_DWC3=y
+# CONFIG_USB_DWC3_DEBUG is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+# CONFIG_USB_XHCI_HCD_DEBUGGING is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_CHIPIDEA is not set
+# CONFIG_USB_RENESAS_USBHS is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
 
 #
 # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
 #
-# CONFIG_USB_GADGET is not set
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_REALTEK is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_STORAGE_ENE_UB6250 is not set
+# CONFIG_USB_UAS is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_YUREX is not set
+
+#
+# USB Physical Layer drivers
+#
+# CONFIG_USB_ISP1301 is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+# CONFIG_USB_GADGET_DEBUG_FS is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+
+#
+# USB Peripheral Controller
+#
+# CONFIG_USB_R8A66597 is not set
+# CONFIG_USB_MV_UDC is not set
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+# CONFIG_USB_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+CONFIG_USB_GADGET_SUPERSPEED=y
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_ETH is not set
+# CONFIG_USB_G_NCM is not set
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FUNCTIONFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+# CONFIG_USB_MASS_STORAGE is not set
+# CONFIG_USB_G_SERIAL is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+# CONFIG_USB_G_ACM_MS is not set
+# CONFIG_USB_G_MULTI is not set
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
 
 #
 # OTG and related infrastructure
 #
+CONFIG_USB_OTG_UTILS=y
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_USB_ULPI is not set
+# CONFIG_NOP_USB_XCEIV is not set
 # CONFIG_MMC is not set
 # CONFIG_MEMSTICK is not set
 # CONFIG_NEW_LEDS is not set
@@ -1125,7 +1716,9 @@ CONFIG_DMA_ENGINE=y
 # CONFIG_ASYNC_TX_DMA is not set
 # CONFIG_DMATEST is not set
 # CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
+CONFIG_UIO=y
+CONFIG_UIO_PDRV=y
+# CONFIG_UIO_PDRV_GENIRQ is not set
 CONFIG_VIRTIO=y
 CONFIG_VIRTIO_RING=y
 
@@ -1134,6 +1727,8 @@ CONFIG_VIRTIO_RING=y
 #
 # CONFIG_VIRTIO_BALLOON is not set
 # CONFIG_VIRTIO_MMIO is not set
+# CONFIG_VIRTIO_KEYSTONE is not set
+# CONFIG_VIRTIO_UDMA is not set
 
 #
 # Microsoft Hyper-V guest support
@@ -1174,10 +1769,14 @@ CONFIG_OF_IOMMU=y
 #
 # Remoteproc drivers (EXPERIMENTAL)
 #
+CONFIG_REMOTEPROC=y
+# CONFIG_STE_MODEM_RPROC is not set
+CONFIG_REMOTEPROC_USER=y
 
 #
 # Rpmsg drivers (EXPERIMENTAL)
 #
+CONFIG_RPMSG=y
 # CONFIG_VIRT_DRIVERS is not set
 # CONFIG_PM_DEVFREQ is not set
 # CONFIG_EXTCON is not set
@@ -1199,7 +1798,8 @@ CONFIG_DCACHE_WORD_ACCESS=y
 # CONFIG_GFS2_FS is not set
 # CONFIG_BTRFS_FS is not set
 # CONFIG_NILFS2_FS is not set
-# CONFIG_FS_POSIX_ACL is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_EXPORTFS=y
 CONFIG_FILE_LOCKING=y
 CONFIG_FSNOTIFY=y
 CONFIG_DNOTIFY=y
@@ -1224,9 +1824,14 @@ CONFIG_INOTIFY_USER=y
 #
 # DOS/FAT/NT Filesystems
 #
-# CONFIG_MSDOS_FS is not set
-# CONFIG_VFAT_FS is not set
-# CONFIG_NTFS_FS is not set
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+CONFIG_NTFS_FS=y
+# CONFIG_NTFS_DEBUG is not set
+# CONFIG_NTFS_RW is not set
 
 #
 # Pseudo filesystems
@@ -1235,7 +1840,9 @@ CONFIG_PROC_FS=y
 CONFIG_PROC_SYSCTL=y
 CONFIG_PROC_PAGE_MONITOR=y
 CONFIG_SYSFS=y
-# CONFIG_TMPFS is not set
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_TMPFS_XATTR is not set
 # CONFIG_HUGETLB_PAGE is not set
 # CONFIG_CONFIGFS_FS is not set
 CONFIG_MISC_FILESYSTEMS=y
@@ -1246,9 +1853,23 @@ CONFIG_MISC_FILESYSTEMS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-# CONFIG_JFFS2_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+CONFIG_JFFS2_FS_WBUF_VERIFY=y
+# CONFIG_JFFS2_SUMMARY is not set
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+CONFIG_UBIFS_FS=y
+# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
 # CONFIG_LOGFS is not set
-# CONFIG_CRAMFS is not set
+CONFIG_CRAMFS=y
 # CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
@@ -1261,14 +1882,80 @@ CONFIG_MISC_FILESYSTEMS=y
 # CONFIG_SYSV_FS is not set
 # CONFIG_UFS_FS is not set
 CONFIG_NETWORK_FILESYSTEMS=y
-# CONFIG_NFS_FS is not set
-# CONFIG_NFSD is not set
+CONFIG_NFS_FS=y
+CONFIG_NFS_V2=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V3_ACL=y
+# CONFIG_NFS_V4 is not set
+# CONFIG_NFS_SWAP is not set
+CONFIG_ROOT_NFS=y
+CONFIG_NFSD=y
+CONFIG_NFSD_V2_ACL=y
+CONFIG_NFSD_V3=y
+CONFIG_NFSD_V3_ACL=y
+# CONFIG_NFSD_V4 is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_ACL_SUPPORT=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+# CONFIG_SUNRPC_DEBUG is not set
 # CONFIG_CEPH_FS is not set
 # CONFIG_CIFS is not set
 # CONFIG_NCP_FS is not set
 # CONFIG_CODA_FS is not set
 # CONFIG_AFS_FS is not set
-# CONFIG_NLS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_MAC_ROMAN is not set
+# CONFIG_NLS_MAC_CELTIC is not set
+# CONFIG_NLS_MAC_CENTEURO is not set
+# CONFIG_NLS_MAC_CROATIAN is not set
+# CONFIG_NLS_MAC_CYRILLIC is not set
+# CONFIG_NLS_MAC_GAELIC is not set
+# CONFIG_NLS_MAC_GREEK is not set
+# CONFIG_NLS_MAC_ICELAND is not set
+# CONFIG_NLS_MAC_INUIT is not set
+# CONFIG_NLS_MAC_ROMANIAN is not set
+# CONFIG_NLS_MAC_TURKISH is not set
+# CONFIG_NLS_UTF8 is not set
 
 #
 # Kernel hacking
@@ -1286,7 +1973,7 @@ CONFIG_DEBUG_FS=y
 # CONFIG_HEADERS_CHECK is not set
 # CONFIG_DEBUG_SECTION_MISMATCH is not set
 CONFIG_DEBUG_KERNEL=y
-# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DEBUG_SHIRQ=y
 # CONFIG_LOCKUP_DETECTOR is not set
 # CONFIG_HARDLOCKUP_DETECTOR is not set
 # CONFIG_PANIC_ON_OOPS is not set
@@ -1299,6 +1986,7 @@ CONFIG_SCHED_DEBUG=y
 # CONFIG_SLUB_DEBUG_ON is not set
 # CONFIG_SLUB_STATS is not set
 # CONFIG_DEBUG_KMEMLEAK is not set
+CONFIG_DEBUG_PREEMPT=y
 # CONFIG_DEBUG_RT_MUTEXES is not set
 # CONFIG_RT_MUTEX_TESTER is not set
 # CONFIG_DEBUG_SPINLOCK is not set
@@ -1309,6 +1997,7 @@ CONFIG_SCHED_DEBUG=y
 # CONFIG_LOCK_STAT is not set
 # CONFIG_DEBUG_ATOMIC_SLEEP is not set
 # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+CONFIG_STACKTRACE=y
 # CONFIG_DEBUG_STACK_USAGE is not set
 # CONFIG_DEBUG_KOBJECT is not set
 # CONFIG_DEBUG_HIGHMEM is not set
@@ -1317,7 +2006,7 @@ CONFIG_DEBUG_INFO=y
 # CONFIG_DEBUG_INFO_REDUCED is not set
 # CONFIG_DEBUG_VM is not set
 # CONFIG_DEBUG_WRITECOUNT is not set
-CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_DEBUG_MEMORY_INIT is not set
 # CONFIG_DEBUG_LIST is not set
 # CONFIG_TEST_LIST_SORT is not set
 # CONFIG_DEBUG_SG is not set
@@ -1326,8 +2015,10 @@ CONFIG_DEBUG_MEMORY_INIT=y
 # CONFIG_BOOT_PRINTK_DELAY is not set
 # CONFIG_RCU_TORTURE_TEST is not set
 CONFIG_RCU_CPU_STALL_TIMEOUT=60
+CONFIG_RCU_CPU_STALL_VERBOSE=y
 # CONFIG_RCU_CPU_STALL_INFO is not set
 # CONFIG_RCU_TRACE is not set
+# CONFIG_KPROBES_SANITY_TEST is not set
 # CONFIG_BACKTRACE_SELF_TEST is not set
 # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
 # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
@@ -1336,23 +2027,34 @@ CONFIG_RCU_CPU_STALL_TIMEOUT=60
 # CONFIG_NOTIFIER_ERROR_INJECTION is not set
 # CONFIG_FAULT_INJECTION is not set
 # CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_NOP_TRACER=y
 CONFIG_HAVE_FUNCTION_TRACER=y
 CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
 CONFIG_HAVE_DYNAMIC_FTRACE=y
 CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
 CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_EVENT_TRACING=y
+CONFIG_EVENT_POWER_TRACING_DEPRECATED=y
+CONFIG_CONTEXT_SWITCH_TRACER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING=y
 CONFIG_TRACING_SUPPORT=y
 CONFIG_FTRACE=y
 # CONFIG_FUNCTION_TRACER is not set
 # CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_PREEMPT_TRACER is not set
 # CONFIG_SCHED_TRACER is not set
+# CONFIG_MISSED_TIMER_OFFSETS_HIST is not set
 # CONFIG_ENABLE_DEFAULT_TRACERS is not set
 CONFIG_BRANCH_PROFILE_NONE=y
 # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
 # CONFIG_PROFILE_ALL_BRANCHES is not set
 # CONFIG_STACK_TRACER is not set
 # CONFIG_BLK_DEV_IO_TRACE is not set
-# CONFIG_PROBE_EVENTS is not set
+CONFIG_KPROBE_EVENT=y
+CONFIG_PROBE_EVENTS=y
+# CONFIG_RING_BUFFER_BENCHMARK is not set
 # CONFIG_DYNAMIC_DEBUG is not set
 # CONFIG_DMA_API_DEBUG is not set
 # CONFIG_ATOMIC64_SELFTEST is not set
@@ -1363,11 +2065,8 @@ CONFIG_HAVE_ARCH_KGDB=y
 # CONFIG_STRICT_DEVMEM is not set
 CONFIG_ARM_UNWIND=y
 CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
-CONFIG_DEBUG_LL_UART_NONE=y
-# CONFIG_DEBUG_ICEDCC is not set
-# CONFIG_DEBUG_SEMIHOSTING is not set
-CONFIG_EARLY_PRINTK=y
+# CONFIG_DEBUG_LL is not set
+# CONFIG_ARM_KPROBES_TEST is not set
 # CONFIG_PID_IN_CONTEXTIDR is not set
 
 #
@@ -1386,7 +2085,9 @@ CONFIG_CRYPTO=y
 #
 CONFIG_CRYPTO_ALGAPI=y
 CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD=y
 CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
 CONFIG_CRYPTO_BLKCIPHER2=y
 CONFIG_CRYPTO_HASH=y
 CONFIG_CRYPTO_HASH2=y
@@ -1395,27 +2096,28 @@ CONFIG_CRYPTO_RNG2=y
 CONFIG_CRYPTO_PCOMP2=y
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_MANAGER2=y
-# CONFIG_CRYPTO_USER is not set
+CONFIG_CRYPTO_USER=y
 CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
 # CONFIG_CRYPTO_GF128MUL is not set
-# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_NULL=y
 # CONFIG_CRYPTO_PCRYPT is not set
 CONFIG_CRYPTO_WORKQUEUE=y
 # CONFIG_CRYPTO_CRYPTD is not set
-# CONFIG_CRYPTO_AUTHENC is not set
+CONFIG_CRYPTO_AUTHENC=y
+# CONFIG_CRYPTO_TEST is not set
 
 #
 # Authenticated Encryption with Associated Data
 #
 # CONFIG_CRYPTO_CCM is not set
 # CONFIG_CRYPTO_GCM is not set
-# CONFIG_CRYPTO_SEQIV is not set
+CONFIG_CRYPTO_SEQIV=y
 
 #
 # Block modes
 #
-# CONFIG_CRYPTO_CBC is not set
-# CONFIG_CRYPTO_CTR is not set
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_CTR=y
 # CONFIG_CRYPTO_CTS is not set
 # CONFIG_CRYPTO_ECB is not set
 # CONFIG_CRYPTO_LRW is not set
@@ -1426,7 +2128,7 @@ CONFIG_CRYPTO_WORKQUEUE=y
 # Hash modes
 #
 CONFIG_CRYPTO_HMAC=y
-# CONFIG_CRYPTO_XCBC is not set
+CONFIG_CRYPTO_XCBC=y
 # CONFIG_CRYPTO_VMAC is not set
 
 #
@@ -1457,7 +2159,7 @@ CONFIG_CRYPTO_AES=y
 # CONFIG_CRYPTO_CAMELLIA is not set
 # CONFIG_CRYPTO_CAST5 is not set
 # CONFIG_CRYPTO_CAST6 is not set
-# CONFIG_CRYPTO_DES is not set
+CONFIG_CRYPTO_DES=y
 # CONFIG_CRYPTO_FCRYPT is not set
 # CONFIG_CRYPTO_KHAZAD is not set
 # CONFIG_CRYPTO_SALSA20 is not set
@@ -1471,17 +2173,18 @@ CONFIG_CRYPTO_AES=y
 #
 CONFIG_CRYPTO_DEFLATE=y
 # CONFIG_CRYPTO_ZLIB is not set
-# CONFIG_CRYPTO_LZO is not set
+CONFIG_CRYPTO_LZO=y
 
 #
 # Random Number Generation
 #
 CONFIG_CRYPTO_ANSI_CPRNG=y
-# CONFIG_CRYPTO_USER_API_HASH is not set
-# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+CONFIG_CRYPTO_USER_API=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_USER_API_SKCIPHER=y
 CONFIG_CRYPTO_HW=y
 CONFIG_CRYPTO_DEV_KEYSTONE=y
-# CONFIG_BINARY_PRINTF is not set
+CONFIG_BINARY_PRINTF=y
 
 #
 # Library routines
@@ -1492,7 +2195,7 @@ CONFIG_GENERIC_STRNLEN_USER=y
 CONFIG_GENERIC_PCI_IOMAP=y
 CONFIG_GENERIC_IO=y
 # CONFIG_CRC_CCITT is not set
-# CONFIG_CRC16 is not set
+CONFIG_CRC16=y
 # CONFIG_CRC_T10DIF is not set
 # CONFIG_CRC_ITU_T is not set
 CONFIG_CRC32=y
@@ -1506,21 +2209,11 @@ CONFIG_LIBCRC32C=y
 # CONFIG_CRC8 is not set
 CONFIG_ZLIB_INFLATE=y
 CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
 CONFIG_LZO_DECOMPRESS=y
-CONFIG_XZ_DEC=y
-CONFIG_XZ_DEC_X86=y
-CONFIG_XZ_DEC_POWERPC=y
-CONFIG_XZ_DEC_IA64=y
-CONFIG_XZ_DEC_ARM=y
-CONFIG_XZ_DEC_ARMTHUMB=y
-CONFIG_XZ_DEC_SPARC=y
-CONFIG_XZ_DEC_BCJ=y
-# CONFIG_XZ_DEC_TEST is not set
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
 CONFIG_DECOMPRESS_GZIP=y
-CONFIG_DECOMPRESS_BZIP2=y
-CONFIG_DECOMPRESS_LZMA=y
-CONFIG_DECOMPRESS_XZ=y
-CONFIG_DECOMPRESS_LZO=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
 CONFIG_HAS_DMA=y
diff --git a/recipes-kernel/linux/linux-keystone_3.6.6.bb b/recipes-kernel/linux/linux-keystone_3.6.6.bb
index ae945f6..2aa83e6 100644
--- a/recipes-kernel/linux/linux-keystone_3.6.6.bb
+++ b/recipes-kernel/linux/linux-keystone_3.6.6.bb
@@ -7,7 +7,7 @@ MACHINE_KERNEL_PR_append = "a"
 CORTEXA8FIXUP = "no"
 
 # The tree tends to rebase, use literal stable tags
-SRCREV = "DEV.MCSDK-03.00.00.05"
+SRCREV = "DEV.MCSDK-03.00.00.06"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git \
            file://defconfig \
-- 
1.8.1.1


