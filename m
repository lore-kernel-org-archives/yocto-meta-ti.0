Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1EDBBE00D75; Tue,  1 Oct 2019 13:07:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37130E00D68
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 13:07:49 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91K7m9T068490;
	Tue, 1 Oct 2019 15:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569960468;
	bh=aiazxauQvC8WNK3TuzfTPJEV5GE5s1oSfdSRk+A0WPA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aUEPYuql7fvnL4UOMk58iJD19xFwGn+TiC+v75CswyUR63AOH6+R560vteqpiT5Lt
	mcOjAmDcyUIEMKfDhXZBzINfqY7bB+1QBfr9znQGDBAcKVGFO6oygqFOsXeyPodhCG
	eq+xYRcR/H5pIRJyVlKeRTYgzi4r1ZZN37p08eZ0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91K7mQS058382;
	Tue, 1 Oct 2019 15:07:48 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 15:07:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 15:07:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91K7lq6107694;
	Tue, 1 Oct 2019 15:07:47 -0500
Date: Tue, 1 Oct 2019 16:07:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191001200747.GD18229@beryl>
References: <1569575804-36910-1-git-send-email-nikhil.nd@ti.com>
	<CAMKF1soPvCo8VKJu10P1fvjA_iJjeskJ59wyyNBTCt8LxvRxTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soPvCo8VKJu10P1fvjA_iJjeskJ59wyyNBTCt8LxvRxTQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master PATCH v2] recipes-bsp: ivshmem-uio: Add new recipe for ivshmem-uio driver
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
X-List-Received-Date: Tue, 01 Oct 2019 20:07:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 30, 2019 at 11:41:43PM -0700, Khem Raj wrote:
> On Fri, Sep 27, 2019 at 2:17 AM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
> >
> > This is external kernel module which enables userspace io over the
> > Jailhouse ivhsmem (inter VM shared memory)
> > This driver is useful to test the inter VM communication.
> >
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> > Changes from v1:
> > * Split the ivshmem recipe separately
> > * Add summary and remove PACKAGE_ARCH define
> >
> >  recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 27 +++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >  create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> >
> > diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > new file mode 100644
> > index 0000000..33fb946
> > --- /dev/null
> > +++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > @@ -0,0 +1,27 @@
> > +DESCRIPTION =  "Kernel driver for IVSHMEM based UIO driver"
> > +SUMMARY = "Kernel module which registers a UIO (userspace io) device for inter VM shared memory"
> > +HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
> > +
> > +inherit module
> > +
> > +RDEPENDS_${PN} = "jailhouse"
> > +
> 
> jailhouse is marked as ti-soc specific, so please mark this recipe
> ti-soc specific as well. It will help meta-ti to live in a multi-BSP
> distros
> 
> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1164/consoleFull
> 
> if you could test meta-ti patches with one non-ti machine like qemux86
> or some such it will help catch this kind of errors

That would only fail when building "world", but thanks for the report.


> > +PROTOCOL = "git"
> > +BRANCH = "jailhouse"
> > +SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
> > +SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
> > +
> > +do_compile_prepend() {
> > +    cd ${S}/kernel_module/uio
> > +}
> > +
> > +do_install() {
> > +    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> > +    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> > +}
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

