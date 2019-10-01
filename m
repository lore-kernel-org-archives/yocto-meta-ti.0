Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F8BFE00CBC; Tue,  1 Oct 2019 15:16:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85852E00BB5
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 15:16:04 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91MG31v099099;
	Tue, 1 Oct 2019 17:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569968163;
	bh=gX+yKdMdzvbz2qLfOvASE4fTCVHSBttB6OnGrFVQ5CA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eok5IFHkPWmULdzlkF0z16UviGyEgUn7GkUuFNGf+IPUgrMY4ev/HjSzSGM/OXQ6L
	Lxb4J1yTu/85zRS3rp7wIBRU0crRSJOFtwAPzYGmwASTuE1IXbp8Cd5XXehxNjb4VF
	OMt2mtUcukBX00ZF4kxeHQul91JquUiE21Znbfl8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91MG2Fd049603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2019 17:16:03 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 17:15:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 17:16:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91MG2Bs103124;
	Tue, 1 Oct 2019 17:16:03 -0500
Date: Tue, 1 Oct 2019 18:16:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191001221602.GF18229@beryl>
References: <1569575804-36910-1-git-send-email-nikhil.nd@ti.com>
	<CAMKF1soPvCo8VKJu10P1fvjA_iJjeskJ59wyyNBTCt8LxvRxTQ@mail.gmail.com>
	<20191001200747.GD18229@beryl>
	<CAMKF1sqxULQgUz0dy_utWs5_s96Fp4+d9hYbcS+W9J-MHk6z7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqxULQgUz0dy_utWs5_s96Fp4+d9hYbcS+W9J-MHk6z7A@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 Oct 2019 22:16:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 01, 2019 at 02:57:41PM -0700, Khem Raj wrote:
> On Tue, Oct 1, 2019 at 1:07 PM Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Mon, Sep 30, 2019 at 11:41:43PM -0700, Khem Raj wrote:
> > > On Fri, Sep 27, 2019 at 2:17 AM Nikhil Devshatwar <nikhil.nd@ti.com>
> > wrote:
> > > >
> > > > This is external kernel module which enables userspace io over the
> > > > Jailhouse ivhsmem (inter VM shared memory)
> > > > This driver is useful to test the inter VM communication.
> > > >
> > > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > > ---
> > > > Changes from v1:
> > > > * Split the ivshmem recipe separately
> > > > * Add summary and remove PACKAGE_ARCH define
> > > >
> > > >  recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 27
> > +++++++++++++++++++++++
> > > >  1 file changed, 27 insertions(+)
> > > >  create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > > >
> > > > diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > > > new file mode 100644
> > > > index 0000000..33fb946
> > > > --- /dev/null
> > > > +++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > > > @@ -0,0 +1,27 @@
> > > > +DESCRIPTION =  "Kernel driver for IVSHMEM based UIO driver"
> > > > +SUMMARY = "Kernel module which registers a UIO (userspace io) device
> > for inter VM shared memory"
> > > > +HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code
> > "
> > > > +LICENSE = "GPLv2"
> > > > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
> > > > +
> > > > +inherit module
> > > > +
> > > > +RDEPENDS_${PN} = "jailhouse"
> > > > +
> > >
> > > jailhouse is marked as ti-soc specific, so please mark this recipe
> > > ti-soc specific as well. It will help meta-ti to live in a multi-BSP
> > > distros
> > >
> > >
> > http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1164/consoleFull
> > >
> > > if you could test meta-ti patches with one non-ti machine like qemux86
> > > or some such it will help catch this kind of errors
> >
> > That would only fail when building "world", but thanks for the report.
> 
> MACHINE=qemux86 bitbake <recipe> would do it
> This would really help the distros

Well, I do know how to break it specifically... :) BTW, building it directly 
like that with COMPATIBLE_MACHINE set would also fail with "Nothing PROVIDES" 
error.

My point was that people add recipes and expect them to only be included in an 
image for their machine. In their view they cannot understand how it would get 
into an x86 build on its own, unless someone consciously adds it to their 
image. Hence my comment about building "world". And in that case it would be 
safely skipped by COMPATIBLE_MACHINE and won't result in an error.


> > > > +PROTOCOL = "git"
> > > > +BRANCH = "jailhouse"
> > > > +SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
> > > > +SRC_URI = "git://
> > github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}
> > <http://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=$%7BPROTOCOL%7D;branch=$%7BBRANCH%7D>
> > "
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
> > > > +
> > > > +do_compile_prepend() {
> > > > +    cd ${S}/kernel_module/uio
> > > > +}
> > > > +
> > > > +do_install() {
> > > > +    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> > > > +    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko
> > ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> > > > +}
> > > > --
> > > > 1.9.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> >

