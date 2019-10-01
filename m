Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26F3BE00CBC; Tue,  1 Oct 2019 14:57:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A44EE00BA1
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 14:57:53 -0700 (PDT)
Received: by mail-qt1-f195.google.com with SMTP id u22so23641185qtq.13
	for <meta-ti@yoctoproject.org>; Tue, 01 Oct 2019 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2mIDBTIq2W+L3rZRcIo0cRGekk+GeV1zwdpPft4UJQM=;
	b=B/Vra+gOAQ7Sg3Zg7uuUsTo4YZLp8oDeg2a9PnCDwXHpL9vEw+3E/MIBWIm6BcdS2E
	Nh7HJnqYSRdR5zffhABCq6vuPWILvPPyj8c7B5eEmbA23ysjpApbINM5Y2sOejs/v9HX
	MFQf+w4h65FoaXmIKgEICYlNWsl1yrFg2SnbfPQqtWbkM3djcy7ylGXX9QJfZC8i8SIh
	rTJGSEnEY9GsCnehGwLgols9MWzXJkT2FBuvf0htSGf8orbXCIXcylq6y3vVZkjLwx6T
	WJTV39p3u+pbn8h64hwQgNkwpuvvwkchIut/7leKD3o7DRvXGE6iLjg+7mV8EIG05GH0
	crJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2mIDBTIq2W+L3rZRcIo0cRGekk+GeV1zwdpPft4UJQM=;
	b=cwdv1vk2rItloa5e9iFUQG9V6MkXYvWkjtr1Mw8nalZErL+wSe9K9y8xBDodaELGaq
	PJQjVdfZSLs06/b5rRYiqNurY3KdAVDegSVCYT3RPYfRyzBJLoKbjWSdKXGl2ffUXzgL
	5qEKYuwP4OaNOfT8f/b6RA+y1cVP3waUiwnJ7CS58dupBxG4ZPv6K9Db6Jejqjxy3Af7
	mzk1uPPKsrgal7M+D71wGrrK8wwPrr/V2WIT3kBLaFfFBbp0mGue6AtmcUHF9ePr87bD
	iNmVR9gCSGR0xyH8H891fJUjRVR7EqvxmUcbgunJevm+CLOxJvM0Xk9vpaB1NIloPGQ3
	sErw==
X-Gm-Message-State: APjAAAVZ9GuoMapmHxQU5IFEk+s9F06QSKaBJjxjVDjmTURAH293ZyYQ
	5Z8fbi6VudiiVJDbbBPOXvU4KKZ6gp28f/GpIecCRDFI
X-Google-Smtp-Source: APXvYqyFYCBGUv5N8vQxXjeZn49X128WmtZS1DAi4ftqfJHgtsrKAsHFGJcSP01pOnH+PCV6v2C0lLdXPHfbdiP8imI=
X-Received: by 2002:aed:3576:: with SMTP id b51mr626763qte.378.1569967072493; 
	Tue, 01 Oct 2019 14:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <1569575804-36910-1-git-send-email-nikhil.nd@ti.com>
	<CAMKF1soPvCo8VKJu10P1fvjA_iJjeskJ59wyyNBTCt8LxvRxTQ@mail.gmail.com>
	<20191001200747.GD18229@beryl>
In-Reply-To: <20191001200747.GD18229@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Oct 2019 14:57:41 -0700
Message-ID: <CAMKF1sqxULQgUz0dy_utWs5_s96Fp4+d9hYbcS+W9J-MHk6z7A@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Tue, 01 Oct 2019 21:57:56 -0000
Content-Type: multipart/alternative; boundary="000000000000aa451d0593e07171"

--000000000000aa451d0593e07171
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 1, 2019 at 1:07 PM Denys Dmytriyenko <denys@ti.com> wrote:

> On Mon, Sep 30, 2019 at 11:41:43PM -0700, Khem Raj wrote:
> > On Fri, Sep 27, 2019 at 2:17 AM Nikhil Devshatwar <nikhil.nd@ti.com>
> wrote:
> > >
> > > This is external kernel module which enables userspace io over the
> > > Jailhouse ivhsmem (inter VM shared memory)
> > > This driver is useful to test the inter VM communication.
> > >
> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > ---
> > > Changes from v1:
> > > * Split the ivshmem recipe separately
> > > * Add summary and remove PACKAGE_ARCH define
> > >
> > >  recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 27
> +++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >  create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > >
> > > diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > > new file mode 100644
> > > index 0000000..33fb946
> > > --- /dev/null
> > > +++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> > > @@ -0,0 +1,27 @@
> > > +DESCRIPTION =  "Kernel driver for IVSHMEM based UIO driver"
> > > +SUMMARY = "Kernel module which registers a UIO (userspace io) device
> for inter VM shared memory"
> > > +HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code
> "
> > > +LICENSE = "GPLv2"
> > > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
> > > +
> > > +inherit module
> > > +
> > > +RDEPENDS_${PN} = "jailhouse"
> > > +
> >
> > jailhouse is marked as ti-soc specific, so please mark this recipe
> > ti-soc specific as well. It will help meta-ti to live in a multi-BSP
> > distros
> >
> >
> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1164/consoleFull
> >
> > if you could test meta-ti patches with one non-ti machine like qemux86
> > or some such it will help catch this kind of errors
>
> That would only fail when building "world", but thanks for the report.


MACHINE=qemux86 bitbake <recipe> would do it
This would really help the distros

>
>
>
> > > +PROTOCOL = "git"
> > > +BRANCH = "jailhouse"
> > > +SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
> > > +SRC_URI = "git://
> github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}
> <http://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=$%7BPROTOCOL%7D;branch=$%7BBRANCH%7D>
> "
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
> > > +
> > > +do_compile_prepend() {
> > > +    cd ${S}/kernel_module/uio
> > > +}
> > > +
> > > +do_install() {
> > > +    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> > > +    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko
> ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> > > +}
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--000000000000aa451d0593e07171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 1, 2019 at 1:07 PM Denys Dmytriyenko &lt;<a hre=
f=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Mon, Sep 30, 2019 at 11:41:43PM -0700, Khem Raj wrote=
:<br>
&gt; On Fri, Sep 27, 2019 at 2:17 AM Nikhil Devshatwar &lt;<a href=3D"mailt=
o:nikhil.nd@ti.com" target=3D"_blank">nikhil.nd@ti.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; This is external kernel module which enables userspace io over th=
e<br>
&gt; &gt; Jailhouse ivhsmem (inter VM shared memory)<br>
&gt; &gt; This driver is useful to test the inter VM communication.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Nikhil Devshatwar &lt;<a href=3D"mailto:nikhil.nd@=
ti.com" target=3D"_blank">nikhil.nd@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Changes from v1:<br>
&gt; &gt; * Split the ivshmem recipe separately<br>
&gt; &gt; * Add summary and remove PACKAGE_ARCH define<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 recipes-bsp/ivshmem-uio/<a href=3D"http://ivshmem-uio-drive=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">ivshmem-uio-driver_git.bb</a=
> | 27 +++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 27 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 recipes-bsp/ivshmem-uio/<a href=3D"http:=
//ivshmem-uio-driver_git.bb" rel=3D"noreferrer" target=3D"_blank">ivshmem-u=
io-driver_git.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-bsp/ivshmem-uio/<a href=3D"http://ivshmem-ui=
o-driver_git.bb" rel=3D"noreferrer" target=3D"_blank">ivshmem-uio-driver_gi=
t.bb</a> b/recipes-bsp/ivshmem-uio/<a href=3D"http://ivshmem-uio-driver_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ivshmem-uio-driver_git.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..33fb946<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/recipes-bsp/ivshmem-uio/<a href=3D"http://ivshmem-uio-drive=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">ivshmem-uio-driver_git.bb</a=
><br>
&gt; &gt; @@ -0,0 +1,27 @@<br>
&gt; &gt; +DESCRIPTION =3D=C2=A0 &quot;Kernel driver for IVSHMEM based UIO =
driver&quot;<br>
&gt; &gt; +SUMMARY =3D &quot;Kernel module which registers a UIO (userspace=
 io) device for inter VM shared memory&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/henning-schild-=
work/ivshmem-guest-code" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/henning-schild-work/ivshmem-guest-code</a>&quot;<br>
&gt; &gt; +LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0546a27aad86c83b=
75ad4ee6133e9d5e&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit module<br>
&gt; &gt; +<br>
&gt; &gt; +RDEPENDS_${PN} =3D &quot;jailhouse&quot;<br>
&gt; &gt; +<br>
&gt; <br>
&gt; jailhouse is marked as ti-soc specific, so please mark this recipe<br>
&gt; ti-soc specific as well. It will help meta-ti to live in a multi-BSP<b=
r>
&gt; distros<br>
&gt; <br>
&gt; <a href=3D"http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-6=
4/1164/consoleFull" rel=3D"noreferrer" target=3D"_blank">http://jenkins.nas=
-admin.org/view/OE/job/oe_world_qemux86-64/1164/consoleFull</a><br>
&gt; <br>
&gt; if you could test meta-ti patches with one non-ti machine like qemux86=
<br>
&gt; or some such it will help catch this kind of errors<br>
<br>
That would only fail when building &quot;world&quot;, but thanks for the re=
port.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">MACHINE=3Dq=
emux86 bitbake &lt;recipe&gt; would do it</div><div dir=3D"auto">This would=
 really help the distros=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
<br>
&gt; &gt; +PROTOCOL =3D &quot;git&quot;<br>
&gt; &gt; +BRANCH =3D &quot;jailhouse&quot;<br>
&gt; &gt; +SRCREV =3D &quot;f3ad79881bebb6c6068966ee3d265d8034c20492&quot;<=
br>
&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/henning-sch=
ild-work/ivshmem-guest-code.git;protocol=3D$%7BPROTOCOL%7D;branch=3D$%7BBRA=
NCH%7D" rel=3D"noreferrer" target=3D"_blank">github.com/henning-schild-work=
/ivshmem-guest-code.git;protocol=3D${PROTOCOL};branch=3D${BRANCH}</a>&quot;=
<br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +EXTRA_OEMAKE +=3D &#39;KDIR=3D&quot;${STAGING_KERNEL_DIR}&quot;&=
#39;<br>
&gt; &gt; +<br>
&gt; &gt; +do_compile_prepend() {<br>
&gt; &gt; +=C2=A0 =C2=A0 cd ${S}/kernel_module/uio<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +do_install() {<br>
&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}/${base_libdir}/modules/${KERNEL_VE=
RSION}/extra<br>
&gt; &gt; +=C2=A0 =C2=A0 install -m 644 ${S}/kernel_module/uio/uio_ivshmem.=
ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra<br>
&gt; &gt; +}<br>
&gt; &gt; --<br>
&gt; &gt; 1.9.1<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-ti mailing list<br>
&gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">met=
a-ti@yoctoproject.org</a><br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-ti</a><br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
</blockquote></div></div>

--000000000000aa451d0593e07171--
