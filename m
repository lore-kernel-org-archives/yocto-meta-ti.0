Return-Path: <russell@personaltelco.net>
Received: from mail.tdb.com (mail.tdb.com [216.99.214.4])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D42F3E01374
	for <meta-ti@yoctoproject.org>; Mon,  9 Apr 2012 01:42:23 -0700 (PDT)
Received: (qmail 14594 invoked from network); 9 Apr 2012 01:42:23 -0700
Received: from unknown (HELO coulee.tdb.com) (216.99.214.7)
	by mail.tdb.com with SMTP; 9 Apr 2012 01:42:23 -0700
Received: (qmail 8947 invoked by uid 1001); 9 Apr 2012 08:42:22 -0000
To: Denys Dmytriyenko <denis@denix.org>
References: <86pqbmm4oe.fsf@coulee.tdb.com> <20120405191501.GB5144@denix.org>
	<86bon5nc3h.fsf@coulee.tdb.com> <86zkapljsw.fsf@coulee.tdb.com>
	<20120409014021.GD10246@denix.org>
From: Russell Senior <russell@personaltelco.net>
Date: Mon, 09 Apr 2012 01:42:22 -0700
In-Reply-To: <20120409014021.GD10246@denix.org> (Denys Dmytriyenko's message
	of "Sun\, 08 Apr 2012 21\:40\:21 -0400")
Message-ID: <868vi5gutt.fsf_-_@coulee.tdb.com>
User-Agent: Gnus/5.101 (Gnus v5.10.10) Emacs/21.4 (gnu/linux)
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org, angstrom-distro-devel@linuxtogo.org
Subject: [PATCH] apply recommended kernel config for beaglebone
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
X-List-Received-Date: Mon, 09 Apr 2012 08:42:24 -0000
Content-Type: text/plain; charset=us-ascii


Apply recommended kernel config per:

  http://dominion.thruhere.net/koen/cms/recommended-kernel-config-options-for-a-modern-angstrom-system


Signed-off-by: Russell Senior <russell@personaltelco.net>
---
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 782f52d..6cb725b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -82,7 +82,8 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=17
 CONFIG_CGROUPS=y
-# CONFIG_CGROUP_DEBUG is not set
+CONFIG_CGROUP_DEBUG=y
+CONFIG_CGROUP_NS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CPUSETS=y
@@ -3150,8 +3151,8 @@ CONFIG_QUOTA_TREE=m
 CONFIG_QFMT_V2=m
 CONFIG_QUOTACTL=y
 CONFIG_AUTOFS4_FS=y
-CONFIG_FUSE_FS=m
-CONFIG_CUSE=m
+CONFIG_FUSE_FS=y
+CONFIG_CUSE=y
 CONFIG_GENERIC_ACL=y

 #
--
1.7.9.5



-- 
Russell Senior, President
russell@personaltelco.net

