Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F030E00C19; Thu, 27 Sep 2018 08:25:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67731E00C1B
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 08:23:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFNUhg045065
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538061810;
	bh=94C718E9y0zh5Ts9BiuEjvakKAnaxNpMzqLK0VzS5zs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QEniY4URVc9LfnMUZAifJmubnIufPbXpayh5Od/ftqX3CodUZV6MEWQ7uN/HDYPtF
	1jEaPss8/Y+ky59CCbmDjAsYMTOtmznr0msmhNJsgNqZHK8IXc0Re0DtoOvY4Zc1gD
	XYxxwwr9V5mbbUno6Abo0pM+MSjIUTlWOh3GuFU4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNT8Y018805
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:23:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:23:29 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNIJd014983
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:29 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 11:22:43 -0400
Message-ID: <1538061764-54977-30-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 29/30] ti-ns: Adding support for TI network services
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
X-List-Received-Date: Thu, 27 Sep 2018 15:25:59 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/includes/ti-paths.inc  |  2 ++
 recipes-ti/ns/ti-ns.inc           | 21 +++++++++++++++++++++
 recipes-ti/ns/ti-ns_2.40.01.02.bb | 14 ++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 recipes-ti/ns/ti-ns.inc
 create mode 100644 recipes-ti/ns/ti-ns_2.40.01.02.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index a401264..ccb4994 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -34,6 +34,7 @@ export LINK_INSTALL_DIR_RECIPE       = "${installdir}/ti-dsplink-tree"
 export LINUXUTILS_INSTALL_DIR_RECIPE = "${installdir}/ti-linuxutils-tree"
 export LPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-local-power-manager-tree"
 export NDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-ndk-tree"
+export NS_INSTALL_DIR_RECIPE              = "${installdir}/ti-ns-tree"
 export OMX_INSTALL_DIR_RECIPE        = "${installdir}/ti-omx-tree"
 export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export RTFS_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtfs-tree"
@@ -86,6 +87,7 @@ export LINK_INSTALL_DIR       = "${STAGING_DIR_TARGET}${LINK_INSTALL_DIR_RECIPE}
 export LINUXUTILS_INSTALL_DIR = "${STAGING_DIR_TARGET}${LINUXUTILS_INSTALL_DIR_RECIPE}"
 export LPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${LPM_INSTALL_DIR_RECIPE}"
 export NDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${NDK_INSTALL_DIR_RECIPE}"
+export NS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${NS_INSTALL_DIR_RECIPE}"
 export OMX_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMX_INSTALL_DIR_RECIPE}"
 export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSBIOS_INSTALL_DIR_RECIPE}"
 export SYSLINK_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSLINK_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/ns/ti-ns.inc b/recipes-ti/ns/ti-ns.inc
new file mode 100644
index 0000000..2a50c56
--- /dev/null
+++ b/recipes-ti/ns/ti-ns.inc
@@ -0,0 +1,21 @@
+SUMMARY = "TI Network Services"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ns/index.html"
+SECTION = "devel"
+LICENSE = "BSD"
+
+require recipes-ti/includes/ti-paths.inc
+
+S = "${WORKDIR}/ns_${PV}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ns/${PV}/exports/ns_${PV}.zip;name=nszip"
+
+do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+    install -d ${D}${NS_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS} ${S}/* ${D}${NS_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${NS_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch ldflags staticdev file-rdeps"
diff --git a/recipes-ti/ns/ti-ns_2.40.01.02.bb b/recipes-ti/ns/ti-ns_2.40.01.02.bb
new file mode 100644
index 0000000..6de0020
--- /dev/null
+++ b/recipes-ti/ns/ti-ns_2.40.01.02.bb
@@ -0,0 +1,14 @@
+require ti-ns.inc
+
+PV = "2_40_01_02"
+PR = "r0"
+SRC_URI = "http://software-dl.ti.com/targetcontent/ns/${PV}/exports/ns_${PV}.zip;name=nszip"
+
+LIC_FILES_CHKSUM = "file://manifest_ns_${PV}.html;md5=29e319bb254ad52bdaebf8f6387c2f85"
+
+SRC_URI[nszip.md5sum] = "03146829fc7cf1e7b2acbeb6c1f772e9"
+SRC_URI[nszip.sha256sum] = "e41f254d9db341ad3efea7f6f59df46802769eba3e2f03b6d2a53d186de18687"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_SYSROOT_STRIP = "1"
-- 
1.9.1


