Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2D5CE00C46; Fri, 30 Aug 2019 08:57:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0273FE00956
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 08:57:15 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UFvFPp023176
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 10:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567180635;
	bh=9l0h70oM5e2F8A9T7LLeSADSA2iDFIzr78y/Wlv00P4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Lhwvgn51cer/r02HeJKka1QKafmQaZIdcZ0aePHMXxCe5rCkFo/E0B2+wivQF91UU
	gXQDYuypGPPpxw75ZPEFO7aW4aAv0jnI9nIdVaQr3Xn+k6wOZO+Mu9Pxz3nKeZksYj
	MCXgdB3uBmwYF3EHbLiXN9pxsddTohamvDd9uwbo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UFvFku008563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 10:57:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 10:57:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 10:57:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UFvEbq055563;
	Fri, 30 Aug 2019 10:57:14 -0500
Date: Fri, 30 Aug 2019 11:57:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190830155714.GA3307@beryl>
References: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, lokeshvutla@ti.com
Subject: Re: [master/thud][PATCH v2 1/3] jailhouse: update to ti2019.03-rc2
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
X-List-Received-Date: Fri, 30 Aug 2019 15:57:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This won't apply, as v1 was already merged prior to v2:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=thud&id=ee2665f793d3280b67e82bc4fba4b538a9647912

Moreover, can you update to ti2019.03-rc4 tag - there were several commits 
since rc2:
http://git.ti.com/gitweb/?p=jailhouse/ti-jailhouse.git;a=shortlog;h=refs/heads/ti-jailhouse-0.10

Thanks.

Denys


On Tue, Aug 20, 2019 at 02:11:10PM -0400, Jacob Stiffler wrote:
> * extend to am65xx family
> * and correct am65xx cell and inmate filenames.
> * remove earlycon bootargs for am65xx
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes:
> * Remove earlycon args for all k3
> 
>  recipes-kernel/jailhouse/jailhouse_git.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 5e2c71b..d637d51 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>  "
>  
>  PV = "0.10+git${SRCPV}"
> -SRCREV = "e71fd2dc7e8494a44cc3c762a24824532a412807"
> +SRCREV = "96329f098e655cd42d7d0dbb3cd2cc7c3492d633"
>  BRANCH = "ti-jailhouse-0.10"
>  
>  SRC_URI = " \
> @@ -47,19 +47,19 @@ JH_CELL_FILES ?= "*.cell"
>  JH_CELL_FILES_k3 ?= "k3-*.cell"
>  
>  JH_INMATE_DTB ?= ""
> -JH_INMATE_DTB_am65xx-evm ?= "inmate-k3-am654.dtb"
> +JH_INMATE_DTB_am65xx ?= "inmate-k3-am654-idk.dtb"
>  JH_INMATE_DTB_j7-evm ?= "inmate-k3-j721e-evm.dtb"
>  
>  JH_LINUX_DEMO_CELL ?= ""
> -JH_LINUX_DEMO_CELL_am65xx-evm ?= "k3-am654-linux-demo.cell"
> +JH_LINUX_DEMO_CELL_am65xx ?= "k3-am654-idk-linux-demo.cell"
>  JH_LINUX_DEMO_CELL_j7-evm ?= "k3-j721e-evm-linux-demo.cell"
>  
>  JH_SYSCONFIG_CELL ?= ""
> -JH_SYSCONFIG_CELL_am65xx-evm ?= "k3-am654.cell"
> +JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
>  JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
>  
>  JH_CMDLINE ?= ""
> -JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait earlycon=ns16550a,mmio32,0x2810000"
> +JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
>  
>  do_configure() {
>  	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; 
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

