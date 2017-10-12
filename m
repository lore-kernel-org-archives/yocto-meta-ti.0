Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97281E008A4; Thu, 12 Oct 2017 09:27:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFD5CE006CA
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 09:26:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9CGQmLM014112
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 11:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507825608;
	bh=agNpBhjyg8fR+Ffflne5pMajFO5yMNcLCdaqO2KAxnA=;
	h=From:To:CC:Subject:Date;
	b=VzS5boSVetOGhV/No9s8cVjQ8jpee0Lu3XXfru1JFOW/4WR1IpCp5yqg6z4rwzZGv
	Iv/TrOEo/BMhsz/pXGG5l1vPx6oaVzH27T2g9Esaj0AKG+PeSePOh2k4FZ/zyR6qUE
	+2jujnyGH8nbrVpLdTc0B64iEECiEQXOACLEp+Nk=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CGQhm4023243
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 11:26:43 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 12 Oct 2017 11:26:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 12 Oct 2017 11:26:43 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CGQhtR014707;
	Thu, 12 Oct 2017 11:26:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 12 Oct 2017 12:19:05 -0400
Message-ID: <1507825145-1602-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] linux: ti-uio: remove KERNEL_DEVICETREE appends
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
X-List-Received-Date: Thu, 12 Oct 2017 16:27:00 -0000
Content-Type: text/plain

* KERNEL_DEVICETREE is now specified in the machine configuration and
  these appends have already been added there.
  - This removes the duplcitaion of these device trees in this list and
    thus resolves the "duplicate node name" failure during the fitImage
    creation.
* Extend am57xx-evm dts injection to dra7xx family
  - Now that KERNEL_DEVICETREE is specified in the machine
    configuration, am57xx-hs-evm inherits this list from am57xx-evm.
  - Extending these injectionsto the entire family allows these device
    trees to be availble for am57xx-hs-evm as well.
  - For dra7xx-evm and dra7xx-hs-evm, these device trees will not be
    built as they are not included in their KERNEL_DEVICETREE list.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/ti-uio.inc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index 13cf53e..3104f4e 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -3,8 +3,8 @@ SRC_URI_append_k2hk = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e = " file://k2e-uio.dtsi"
 SRC_URI_append_k2g = " file://keystone-k2g-pru-uio.dtsi"
-SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi \
-                              file://am571x-pru-uio.dtsi \
+SRC_URI_append_dra7xx = " file://am572x-pru-uio.dtsi \
+                          file://am571x-pru-uio.dtsi \
 "
 SRC_URI_append_ti33x = " file://am335x-pru-uio.dtsi"
 SRC_URI_append_ti43x = " file://am437x-pru-uio.dtsi"
@@ -15,11 +15,6 @@ DTSI_LIST_append_k2hk = " k2hk-uio.dtsi"
 DTSI_LIST_append_k2l-evm = " k2l-uio.dtsi"
 DTSI_LIST_append_k2e = " k2e-uio.dtsi"
 
-KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb", "", d)}"
-KERNEL_DEVICETREE_append_ti33x = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am335x-icev2-pru-excl-uio.dtb", "", d)}"
-KERNEL_DEVICETREE_append_ti43x = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am437x-idk-pru-excl-uio.dtb", "", d)}"
-KERNEL_DEVICETREE_append_k2g = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " keystone-k2g-ice-pru-excl-uio.dtb", "", d)}"
-
 do_setup_uio() {
     if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
     then
@@ -35,7 +30,7 @@ do_setup_uio() {
     fi
 }
 
-do_setup_uio_append_am57xx-evm() {
+do_setup_uio_append_dra7xx() {
 
     if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
     then
-- 
2.7.4


