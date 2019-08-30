Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BEF3E00E0E; Fri, 30 Aug 2019 09:23:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 053DCE00AE6
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 09:23:52 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGNqSP075598
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567182232;
	bh=T/w9m+tqERpU4A/Qr4aACUI4nfhN3PH9zukcvXSGRMs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fuI4n9Y/0z1lYxHHhfcHmr45mHaecGbP7et02x9g/8X9oa7loUDXQ7YuBb3Wfh8Tz
	we0l+gwaHlyLM7tt6pGFs3q5W89rnltzJCS0tU8HSmV7bttY/f5X5/HraIYmOPjnAN
	zLZ4X7bHveoGX6yXdnxAiawS2I/KPLRM3zQ+Tte0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGNq7D080758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:23:52 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:23:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:23:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGNpMM078128;
	Fri, 30 Aug 2019 11:23:51 -0500
Date: Fri, 30 Aug 2019 12:23:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <20190830162351.GF3307@beryl>
References: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
	<1566324672-29395-3-git-send-email-j-stiffler@ti.com>
	<2bb8f813-ad8e-028d-f9c6-e26c1d685458@ti.com>
MIME-Version: 1.0
In-Reply-To: <2bb8f813-ad8e-028d-f9c6-e26c1d685458@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, lokeshvutla@ti.com
Subject: Re: [master/thud][PATCH v2 3/3] jailhouse: use ramfs for linux-demo
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
X-List-Received-Date: Fri, 30 Aug 2019 16:23:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 29, 2019 at 02:21:51PM +0530, Nikhil Devshatwar wrote:
> On 20/08/19 11:41 PM, Jacob Stiffler wrote:
> >* Configure the linux-demo to use a ramfs for the linux inmate.
> >* Using JH_RAMFS_IMAGE, this can be set in some global conf.
> >
> >Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> 
> Tested-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> I manually built the core-image-minimal in cpio format with a bbappend of my own.
> How is this supposed to be built automatically?
> 
> Can you add a depends variable so that the build kicks automatically?

There's a proper DEPENDS being added in the anonymous function below, so 
should work automatically.

Denys


> Nikhil D
> 
> >---
> >  recipes-kernel/jailhouse/jailhouse_git.bb | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> >diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> >index 5d572d0..ba6772f 100644
> >--- a/recipes-kernel/jailhouse/jailhouse_git.bb
> >+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> >@@ -58,8 +58,10 @@ JH_SYSCONFIG_CELL ?= ""
> >  JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
> >  JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
> >+JH_RAMFS_IMAGE ?= "core-image-minimal"
> >+
> >  JH_CMDLINE ?= ""
> >-JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
> >+JH_CMDLINE_k3 ?= "console=ttyS1,115200n8"
> >  do_configure() {
> >  	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
> >@@ -101,6 +103,16 @@ do_install() {
> >  	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
> >  	install -d ${D}/boot
> >+	if [ -n "${JH_RAMFS_IMAGE}" ]
> >+	then
> >+		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
> >+		then
> >+			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
> >+		else
> >+			bbwarn "Could find find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
> >+			bbwarn "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
> >+		fi
> >+	fi
> >  	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
> >  		cd ${TOOLS_SRC_DIR}
> >@@ -110,6 +122,7 @@ do_install() {
> >  		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
> >  			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
> >  			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
> >+			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
> >  			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
> >  			${DEPLOY_DIR_IMAGE}/Image \
> >  			| tr -cd '\11\12\15\40-\176' \
> >@@ -143,9 +156,9 @@ CELLS = ""
> >  python __anonymous () {
> >      d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> >-    initrd = d.getVar('INITRAMFS_IMAGE', True)
> >-    if initrd:
> >-        d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> >+    ramfs = d.getVar('JH_RAMFS_IMAGE', True)
> >+    if ramfs:
> >+        d.appendVarFlag('do_install', 'depends', ' ${JH_RAMFS_IMAGE}:do_image_complete')
> >      # Setup DEPENDS and RDEPENDS to included cells
> >      cells = d.getVar('CELLS', True) or ""
> >
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

