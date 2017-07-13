Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0205AE00944; Thu, 13 Jul 2017 07:51:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 059E4E00726
	for <meta-ti@yoctoproject.org>; Thu, 13 Jul 2017 07:51:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6DEp7Jl001507
	for <meta-ti@yoctoproject.org>; Thu, 13 Jul 2017 09:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499957467;
	bh=r7vEectA9lci3R4DJcs982t7RFFuXsuveZAUysykP18=;
	h=From:To:CC:Subject:Date;
	b=DGJa3ohaTipXgEoNoBHuduBQ/oiK/xi+dUBbnEzIhUdqTzToBV27l8bbvXAqxeJpH
	uoeVQ3XaPb9U2lisyx9bihXUtkHUtk6jfBDgXzJ4nSNZLo5jSNe5BZBISo8SuTS5Ww
	FASvekRycJR7eS6a67xfr0ahbtLvbiAoQ9rZ/ock=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6DEp7tX028544
	for <meta-ti@yoctoproject.org>; Thu, 13 Jul 2017 09:51:07 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Jul 2017 09:51:07 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6DEp7ek019653;	Thu, 13 Jul 2017 09:51:07 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 13 Jul 2017 10:50:59 -0400
Message-ID: <1499957459-47026-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3] bcp-lld-rtos: Added RTOS recipe for bcp-lld
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
X-List-Received-Date: Thu, 13 Jul 2017 14:51:17 -0000
Content-Type: text/plain

Upstreaming the RTOS recipe for Bit Coprocessor LLD drvier

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v3 - Added description & details in to commit
v2 - Combined bcp.inc in to the bcp-lld-rtos_git.bb recipe

 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb

diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
new file mode 100644
index 0000000..6ee95f9
--- /dev/null
+++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "TI Bit Coprocessor (BCP) low level driver "
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://bcp.h;beginline=1;endline=40;md5=4f6e6128dd075a89548c0287a39b8896"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|c667x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BCP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/bcp-lld.git"
+BCP_LLD_GIT_PROTOCOL = "git"
+BCP_LLD_GIT_BRANCH = "master"
+BCP_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
+
+# Below commit ID corresponds to "DEV.BCP_LLD.02.01.00.06"
+BCP_LLD_SRCREV = "44e2ffcb6fd236c41f7ea8f9a1684833f5361daa"
+
+BRANCH = "${BCP_LLD_GIT_BRANCH}"
+SRC_URI = "${BCP_LLD_GIT_URI};destsuffix=${BCP_LLD_GIT_DESTSUFFIX};protocol=${BCP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${BCP_LLD_SRCREV}"
+PV = "02.01.00.06"
+PR = "r0"
+
+S = "${WORKDIR}/${BCP_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " qmss-lld-rtos \
+                   cppi-lld-rtos \
+"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "BCP LLD"
+
-- 
1.9.1


