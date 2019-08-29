Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C441E00DEF; Thu, 29 Aug 2019 01:51:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 853BAE00C78
	for <meta-ti@yoctoproject.org>; Thu, 29 Aug 2019 01:51:56 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7T8pt2K008445
	for <meta-ti@yoctoproject.org>; Thu, 29 Aug 2019 03:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567068715;
	bh=ziMy8OEiGIcsmrDOe4TYC9Bd7dxabZuqostBrcPTV08=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=HGBF1WPLmu7wIHPg1zva188jLdh+MdjlovNxGkxreLSmypugmRu7k6kYwDj2OGnaM
	uAJ2uhLZHW5tg1J7Kc1rK730VP5FKSFIBXE1dDiwFknKSQoAAR/t0/92F4E7c4xh6K
	J82kB2XAdpVUR9mKucRvA3JU84mFDmbRg/bjdKbU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7T8ptvc001702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 29 Aug 2019 03:51:55 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 29 Aug 2019 03:51:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 29 Aug 2019 03:51:55 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7T8pqUM093791;
	Thu, 29 Aug 2019 03:51:53 -0500
To: Jacob Stiffler <j-stiffler@ti.com>, <meta-ti@yoctoproject.org>
References: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
	<1566324672-29395-3-git-send-email-j-stiffler@ti.com>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <2bb8f813-ad8e-028d-f9c6-e26c1d685458@ti.com>
Date: Thu, 29 Aug 2019 14:21:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1566324672-29395-3-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: lokeshvutla@ti.com
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
X-List-Received-Date: Thu, 29 Aug 2019 08:51:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/08/19 11:41 PM, Jacob Stiffler wrote:
> * Configure the linux-demo to use a ramfs for the linux inmate.
> * Using JH_RAMFS_IMAGE, this can be set in some global conf.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Tested-by: Nikhil Devshatwar <nikhil.nd@ti.com>

I manually built the core-image-minimal in cpio format with a bbappend of my own.
How is this supposed to be built automatically?

Can you add a depends variable so that the build kicks automatically?

Nikhil D

> ---
>   recipes-kernel/jailhouse/jailhouse_git.bb | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 5d572d0..ba6772f 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -58,8 +58,10 @@ JH_SYSCONFIG_CELL ?= ""
>   JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
>   JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
>   
> +JH_RAMFS_IMAGE ?= "core-image-minimal"
> +
>   JH_CMDLINE ?= ""
> -JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
> +JH_CMDLINE_k3 ?= "console=ttyS1,115200n8"
>   
>   do_configure() {
>   	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
> @@ -101,6 +103,16 @@ do_install() {
>   	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
>   
>   	install -d ${D}/boot
> +	if [ -n "${JH_RAMFS_IMAGE}" ]
> +	then
> +		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
> +		then
> +			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
> +		else
> +			bbwarn "Could find find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
> +			bbwarn "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
> +		fi
> +	fi
>   
>   	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
>   		cd ${TOOLS_SRC_DIR}
> @@ -110,6 +122,7 @@ do_install() {
>   		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
>   			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
>   			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
> +			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
>   			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
>   			${DEPLOY_DIR_IMAGE}/Image \
>   			| tr -cd '\11\12\15\40-\176' \
> @@ -143,9 +156,9 @@ CELLS = ""
>   
>   python __anonymous () {
>       d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> -    initrd = d.getVar('INITRAMFS_IMAGE', True)
> -    if initrd:
> -        d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +    ramfs = d.getVar('JH_RAMFS_IMAGE', True)
> +    if ramfs:
> +        d.appendVarFlag('do_install', 'depends', ' ${JH_RAMFS_IMAGE}:do_image_complete')
>   
>       # Setup DEPENDS and RDEPENDS to included cells
>       cells = d.getVar('CELLS', True) or ""
> 


