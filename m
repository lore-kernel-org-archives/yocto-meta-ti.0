Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1E77E00E15; Thu, 29 Aug 2019 01:41:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 925F8E00E22
	for <meta-ti@yoctoproject.org>; Thu, 29 Aug 2019 01:41:35 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7T8fYjr109131
	for <meta-ti@yoctoproject.org>; Thu, 29 Aug 2019 03:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567068094;
	bh=eBscsvpJfaXcSWwWlAkwPhCL1WZu3TyBxx0OhCEcOek=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=fnweRbUP+v/2sM0brcHvdKtlKKovmmuUkmy4UTrDffVWxaf6v3pzgLUCY0wWzzCXo
	s6Cvbm2ptZEXY43HMqs5ohQjzhuuAS3YPiQCYgyNlDMttclZzBzHXjWIKjsiGDyvPy
	FzFswD0j47VChZ+U3nAgnDyZ+k4lcsy+x76UxfGw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7T8fYWl089696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 29 Aug 2019 03:41:34 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 29 Aug 2019 03:41:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 29 Aug 2019 03:41:34 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7T8fVBe118765;
	Thu, 29 Aug 2019 03:41:32 -0500
To: Jacob Stiffler <j-stiffler@ti.com>, <meta-ti@yoctoproject.org>
References: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
	<1566324672-29395-2-git-send-email-j-stiffler@ti.com>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <89a82035-f8a0-07d6-92d3-69e3733fbf33@ti.com>
Date: Thu, 29 Aug 2019 14:11:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1566324672-29395-2-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: lokeshvutla@ti.com
Subject: Re: [master/thud][PATCH v2 2/3] jailhouse: provide tools package
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
X-List-Received-Date: Thu, 29 Aug 2019 08:41:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/08/19 11:41 PM, Jacob Stiffler wrote:
> Create a package containing the jailhouse tools which are used to work
> with the cells and inmates. This recipe provides a good example for
> using the jailhouse-cell-linux tool.
> 
> The tools require the pyjailhouse python modules, so package them as
> well.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>


Tested-by: Nikhil Devshatwar <nikhil.nd@ti.com>

I had to specifically install the pyjailhouse IPK for pyjailhouse.
You can add this in the meta-arago packagegroup recipe

Nikhil D

> ---
>   recipes-kernel/jailhouse/jailhouse_git.bb | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index d637d51..5d572d0 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -29,7 +29,7 @@ RDEPENDS_${PN} += "\
>   S = "${WORKDIR}/git"
>   
>   require jailhouse-arch.inc
> -inherit module pythonnative bash-completion deploy
> +inherit module pythonnative bash-completion deploy setuptools
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_MACHINE = "(ti-soc)"
> @@ -78,12 +78,21 @@ USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
>   TOOLS_SRC_DIR = "${S}/tools"
>   TOOLS_OBJ_DIR = "${S}/tools"
>   
> +EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR}"
> +
> +
>   do_compile() {
> -	oe_runmake V=1 ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR}
> +	oe_runmake V=1
>   }
>   
>   do_install() {
> -	oe_runmake ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR} DESTDIR=${D} install
> +	# Install pyjailhouse python modules needed by the tools
> +	distutils_do_install
> +
> +	# We want to install the python tools, but we do not want to use pip...
> +	# At least with v0.10, we can work around this with
> +	# 'PIP=":" PYTHON_PIP_USEABLE=yes'
> +	oe_runmake PIP=: PYTHON_PIP_USEABLE=yes DESTDIR=${D} install
>   
>   	install -d ${D}${CELL_DIR}
>   	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/
> @@ -115,8 +124,15 @@ do_install() {
>   	fi
>   }
>   
> -PACKAGE_BEFORE_PN = "kernel-module-jailhouse"
> +PACKAGE_BEFORE_PN = "kernel-module-jailhouse pyjailhouse ${PN}-tools"
>   FILES_${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /boot"
> +FILES_pyjailhouse = "${PYTHON_SITEPACKAGES_DIR}"
> +FILES_${PN}-tools = "${libexecdir}/${BPN}/${BPN}-*"
> +
> +RDEPENDS_${PN}-tools = "pyjailhouse python-mmap python-math python-argparse python-datetime python-curses python-compression"
> +RDEPENDS_pyjailhouse = "python-core python-ctypes python-fcntl python-shell"
> +
> +RRECCOMMENDS_${PN} = "${PN}-tools"
>   
>   INSANE_SKIP_${PN} = "ldflags"
>   
> 


