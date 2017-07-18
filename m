Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C75DE00C4D; Tue, 18 Jul 2017 16:04:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44F49E00C6F
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4K0D027008
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419060;
	bh=YwoWSK69AdjMXLklr1W7HG9ELD04eCmbO/YnlJ1NuHU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R3FyAb6FsLynjDCSVdoaoev8m5Ik8bH7QjELQiyTcKFZzg81aBqpQYc7t/4GD2Utj
	2CGDvZ0WtPyXZ9LUX2sKQW4nVshqPfm6+dqOnDU3nnCs8x6M6sBiicd7epDV6qeC7y
	fWqts9izKA2SVDIDCJs/3BYtChX4QTmSm+kUJOEU=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4K8K031684
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:20 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:20 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hd000997;	Tue, 18 Jul 2017 18:04:20 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:17 -0400
Message-ID: <1500419028-3361-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 06/37] fatfs-rtos: Added fatfs recipe for rtos
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:24 -0000
Content-Type: text/plain

Upstreaming TI RTOS driver for FAT file system

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary 

 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb

diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
new file mode 100644
index 0000000..0b8a6df
--- /dev/null
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "TI RTOS driver for FAT filesystem"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://FATFS.h;beginline=1;endline=32;md5=6619832755598d1cc2b01f2e6a1801d6"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FATFS_GIT_URI = "git://git.ti.com/keystone-rtos/fatfs.git"
+FATFS_GIT_PROTOCOL = "git"
+FATFS_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.06A"
+FATFS_SRCREV = "7cb9e45da11cd3c60fe48c38c9dcdaa6e49a8276"
+
+BRANCH ="${FATFS_GIT_BRANCH}"
+SRC_URI = "${FATFS_GIT_URI};protocol=${FATFS_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${FATFS_SRCREV}"
+PV = "01.00.00.06A"
+PR = "r0"
+
+DEPENDS_append = " mmcsd-lld-rtos \
+"
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_FATFS_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "FATFS Library"
-- 
1.9.1


