Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7D0FE00CB9; Tue,  1 Oct 2019 13:09:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7218FE00CB9
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 13:09:05 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91K94RZ091527
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 15:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569960545;
	bh=fBPIkc5dIs8ZWOFj8JK0ljbpth1k0/NVFFt0yw1vsr0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pe9U0NKjunWy6dF2qtk28uRcC5Ax7fNX7kHi271sNqvd3NAsz5MAhp08f+fZD7oAb
	xvNaw+Y65ZKnfHHHMJqgUyN3veKJAy25BqIZA9WoqU2cNozcxQ8GIGgYWgNLB6PJ7M
	W+kx+B+EQuTf+dMpFEyyYfTgtwI/hOXYjPcSnLbE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91K94cq060262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 15:09:04 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 15:08:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 15:09:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91K939R045987;
	Tue, 1 Oct 2019 15:09:03 -0500
Date: Tue, 1 Oct 2019 16:09:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20191001200903.GE18229@beryl>
References: <1569924717-56665-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1569924717-56665-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master PATCH v3] recipes-bsp: ivshmem-uio: Add new recipe for ivshmem-uio driver
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
X-List-Received-Date: Tue, 01 Oct 2019 20:09:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Since v2 was already merged, you can't just replace it with v3. But Khem has 
already provided a patch to fix it on top of v2. Thanks.


On Tue, Oct 01, 2019 at 03:41:57PM +0530, Nikhil Devshatwar wrote:
> This is external kernel module which enables userspace io over the
> Jailhouse ivhsmem (inter VM shared memory)
> This driver is useful to test the inter VM communication.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> Changes from v2:
> * Define recipe to be compatible only for ti-soc
> 
> Changes from v1:
> * Split the ivshmem recipe separately
> * Add summary and remove PACKAGE_ARCH define
> 
>  recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> 
> diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> new file mode 100644
> index 0000000..d77c28e
> --- /dev/null
> +++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =  "Kernel driver for IVSHMEM based UIO driver"
> +DESCRIPTION = "Kernel module which registers a UIO (userspace io) device for inter VM shared memory"
> +HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
> +
> +inherit module
> +
> +RDEPENDS_${PN} = "jailhouse"
> +COMPATIBLE_MACHINE = "(ti-soc)"
> +
> +PROTOCOL = "git"
> +BRANCH = "jailhouse"
> +SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
> +SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
> +
> +do_compile_prepend() {
> +    cd ${S}/kernel_module/uio
> +}
> +
> +do_install() {
> +    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +}
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

