Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87903E00E0D; Fri, 30 Aug 2019 09:29:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42FEFE00BFF
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 09:29:09 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGT96p030531
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567182549;
	bh=ytYLTTXB6az7hzRo8nn9r7/w1iblsVY/eeMEoerle5A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MRCB0hd1EgzVSautPCKLTBYVBHkWh5I7k09xmLAiQjUkLvdsjJSd+3B+4X1/fZ/ZC
	Gb+rd/ViC+hCDsfdcx+F4uNu3hZaZQrXohVZ+I0IYgOP4PNEafOsDiiIg2Sr6dsAWM
	CcTSQUHguwQn1wwdHjIgOIA0oyeW0SKW+7//GvEQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGT94K088000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:29:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:29:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:29:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGT9S9118611;
	Fri, 30 Aug 2019 11:29:09 -0500
Date: Fri, 30 Aug 2019 12:29:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190830162908.GG3307@beryl>
References: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
	<1566324672-29395-3-git-send-email-j-stiffler@ti.com>
	<20190830161350.GD3307@beryl>
	<dc35dc13-5327-6367-a6dd-8c260dbc9e54@ti.com>
MIME-Version: 1.0
In-Reply-To: <dc35dc13-5327-6367-a6dd-8c260dbc9e54@ti.com>
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
X-List-Received-Date: Fri, 30 Aug 2019 16:29:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 30, 2019 at 12:23:43PM -0400, Jacob Stiffler wrote:
> 
> On 8/30/2019 12:13 PM, Denys Dmytriyenko wrote:
> >On Tue, Aug 20, 2019 at 02:11:12PM -0400, Jacob Stiffler wrote:
> >>* Configure the linux-demo to use a ramfs for the linux inmate.
> >>* Using JH_RAMFS_IMAGE, this can be set in some global conf.
> >>
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  recipes-kernel/jailhouse/jailhouse_git.bb | 21 +++++++++++++++++----
> >>  1 file changed, 17 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> >>index 5d572d0..ba6772f 100644
> >>--- a/recipes-kernel/jailhouse/jailhouse_git.bb
> >>+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> >>@@ -58,8 +58,10 @@ JH_SYSCONFIG_CELL ?= ""
> >>  JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
> >>  JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
> >>+JH_RAMFS_IMAGE ?= "core-image-minimal"
> >Ok, after thinking about it a bit, I will agree to JH_RAMFS_IMAGE variable,
> >but I don't want to loose the default INITRAMFS_IMAGE usage. So, how about
> >changing the default here to something like this:
> >
> >JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
> >
> >That way either of the variables can be set my machine config or local.conf
> >and the default use is also preserved. Thoughts?
> 
> 
> I like that idea better as well.
> 
> 
> >
> >>  JH_CMDLINE ?= ""
> >>-JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
> >>+JH_CMDLINE_k3 ?= "console=ttyS1,115200n8"
> >>  do_configure() {
> >>  	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
> >>@@ -101,6 +103,16 @@ do_install() {
> >>  	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
> >>  	install -d ${D}/boot
> >>+	if [ -n "${JH_RAMFS_IMAGE}" ]
> >>+	then
> >>+		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
> >>+		then
> >>+			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
> >>+		else
> >>+			bbwarn "Could find find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
> >Typo in the message. Also, should it be an error instead of a warning?
> 
> 
> I did not want this recipe to force the requirement for an ramfs. But
> thinking about it now, making it an error is better in case the linux-demo
> is desired. If it is not, then JH_RAMFS_IMAGE can be unset in some conf.

Thanks. Can you do a v4 of all 3 patches quickly to address the comments in 
1/3 and 3/3, so I can merge them in for rc4? Thanks again.


> >>+			bbwarn "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
> >>+		fi
> >>+	fi
> >>  	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
> >>  		cd ${TOOLS_SRC_DIR}
> >>@@ -110,6 +122,7 @@ do_install() {
> >>  		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
> >>  			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
> >>  			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
> >>+			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
> >>  			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
> >>  			${DEPLOY_DIR_IMAGE}/Image \
> >>  			| tr -cd '\11\12\15\40-\176' \
> >>@@ -143,9 +156,9 @@ CELLS = ""
> >>  python __anonymous () {
> >>      d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> >>-    initrd = d.getVar('INITRAMFS_IMAGE', True)
> >>-    if initrd:
> >>-        d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> >>+    ramfs = d.getVar('JH_RAMFS_IMAGE', True)
> >>+    if ramfs:
> >>+        d.appendVarFlag('do_install', 'depends', ' ${JH_RAMFS_IMAGE}:do_image_complete')
> >>      # Setup DEPENDS and RDEPENDS to included cells
> >>      cells = d.getVar('CELLS', True) or ""
> >>-- 
> >>2.7.4
> >>
> >>-- 
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti

