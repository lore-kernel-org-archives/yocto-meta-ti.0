Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDA72E0172B
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 00:57:53 -0700 (PDT)
Received: by mail-ea0-f175.google.com with SMTP id m14so3954224eaj.6
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 00:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HqStGdz5dfkJ+x2AoxXNc0mfC0Sf0Nbjb85YfOf9g3E=;
	b=H1/Ke4/pP5duN9J98bgwk8iXCjYa1DAfgYH8iPnsTtt4yy/BqM+WoXGOtyZRgtg/KH
	h0P+unNH5jCKQ3h5tMbzdL2n4cw39fI6Zm+Ek5LabPHIzqVjGlhuPfheZX5w7KyPPz7V
	5kbA5FFlDU402UZGqOMnoqFTtcA+8mzXd4yzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HqStGdz5dfkJ+x2AoxXNc0mfC0Sf0Nbjb85YfOf9g3E=;
	b=maoX3kqxcUs07japw7rg4dPMfQu1sLa/dCn0DQpyquGEfr0+MCMoDTsAXd8Bb6W8P8
	RiwCcjyao/zcEkziNRMH9xUZpUTsTViHNLtmp+xfFwk84IwXtTMTD3jfwMW6NOaX6sy4
	mLA12T5P7FwpRi7xrIfMs/iOd0riZfq/IjZU+izolq0fmp8JiE0L7L3xDJjQm9PqbwPa
	hiAZTkxAeg8NYjGXgOXaiLpe65r0X+eRfqnQqXeyZRqcLy0kLOT71EMp2h5T7gJ/PNjS
	NmAOD/qn7rmmA95mn5yay08/qSuw4ySLNEubRX67COfQZ/8bxhDOtEbscdHNKUUvhzTx
	KF/w==
X-Gm-Message-State: ALoCoQlZjuVNoUrI4gL9NjZQCkUBnKD55e0+WqtVoABDqx2FDf3VfzoWPcwCw0xd0eFrh1FtRX19
MIME-Version: 1.0
X-Received: by 10.15.94.201 with SMTP id bb49mr27535154eeb.23.1382428671793;
	Tue, 22 Oct 2013 00:57:51 -0700 (PDT)
Received: by 10.223.147.133 with HTTP; Tue, 22 Oct 2013 00:57:51 -0700 (PDT)
In-Reply-To: <20131021231859.GA7779@edge>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
	<20131017214528.GC30989@edge>
	<CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
	<20131019023954.GK2127@edge>
	<CA+gsK-q8W-wAP-rBhy7RgHUddsbdE_SaNOgyfFQ+zj2ksSidKw@mail.gmail.com>
	<CA+gsK-owJQGEhzv9tgmiF+fORTErYVbQUhcoQ3BVLA+p3a+9Qw@mail.gmail.com>
	<CA+gsK-qaWVUGPe7fW62V+tH0F3GVZHHXGD_+LHQX7hiE7VcZRg@mail.gmail.com>
	<20131021211522.GA26549@denix.org>
	<CA+gsK-q6=AXpMNQOJYK47W_JJvhbi=YT7sdUOrjYVxC0aMDqBA@mail.gmail.com>
	<20131021231859.GA7779@edge>
Date: Tue, 22 Oct 2013 08:57:51 +0100
Message-ID: <CA+gsK-rx6conDzh=Zxk5zu7=KT=it=wZE8ZBGPaxUwhoKGuyOg@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335x EVM and core-image-sato
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
X-List-Received-Date: Tue, 22 Oct 2013 07:57:54 -0000
Content-Type: multipart/alternative; boundary=089e01681f42e8e82404e94fc1e7

--089e01681f42e8e82404e94fc1e7
Content-Type: text/plain; charset=ISO-8859-1

Where do I find the PG version of the board? The barcode sticker on the
board says rev 1.2.


On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> Now I'm just wondering what PG version of the board you've got, if it
> fails in
> the same way with our 3.8 kernel and a known good set of 3.12 images...
>
>
> On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:
> > Thanks, Denys.
> >
> > Interesting point about gcc. It's version 4.8.1 which is the default for
> > poky master. Which is what I used all along.
> >
> > Thanks for sending your binaries. They fail too with the exact same
> > problem. See attached log. I found [1] on gmane which exactly describes
> the
> > problem I am seeing.
> >
> > If that is the case then I was wondering why my earlier builds with
> > 3.12-rc3 actually worked. And I tried them again and they are now failing
> > too. Of course I don't know anything about the specifics of the gpio and
> > the timers on the chip but it looks like a weird hardware initialization
> > condition. And I don't know if the proposed patch in [1] was ever
> > incorporated in your kernel tree.
> >
> > I don't think it's the hardware (or at least not alone) because the SD
> that
> > ships with it with the 3.2 kernel works just fine.
> >
> > Cheers,
> > Rudi
> >
> >
> > [1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044
> >
> >
> > On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> >
> > > Rudi,
> > >
> > > As we discussed earlier today, let my send you my binaries for the
> kernel
> > > and
> > > u-boot to try on your board. I just wanted to ask you about the
> toolchain
> > > that
> > > you used to build yours. In our builds we use Linaro gcc-4.7 hardfp
> > > toolchain
> > > and I vaguely remember hearing about some problems with the recent
> gcc-4.8
> > > toolchain from oe-core... I'm wondering if you are having the same
> issue.
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > > > Since the 3.12-rc5 kernel does not work I decided to give the 3.8
> kernel
> > > a
> > > > try. The issue with this one is that the linux-ti-staging_3.8.bbrecipe
> > > > explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot
> > > environment
> > > > has now moved on to using zImage which consequently means u-boot
> will not
> > > > find the kernel file.
> > > >
> > > > I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into the
> > > > linux-ti-staging_3.8.bb recipe but whoever did it did not think
> about
> > > > u-boot. Does zImage not work with 3.8? I did not try it but it should
> > > > normally have no effect. Since there is no dependency of the u-boot
> > > recipes
> > > > on the kernel image types changes to the kernel image type for newer
> > > > versions of the kernel then automatically means that it must be
> changed
> > > for
> > > > the previous versions too.
> > > >
> > > > I mocked around with the u-boot environment and booted the 3.8 uImage
> > > > kernel. To my surprise the 3.8 kernel from the TI staging repository
> > > fails
> > > > with the exact same problem and stops booting with a kernel not
> syncing
> > > > message during the init calls. Apparently a patch must have been
> applied
> > > to
> > > > the kernel repo that breaks it. It has nothing possibly to do with
> the
> > > > build system.
> > > >
> > > > I would appreciate any hints to get this kernel built and boot on the
> > > board.
> > > >
> > > > Thanks,
> > > > Rudi
> > > >
> > > >
> > > > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > > > <rstreif@linuxfoundation.org>wrote:
> > > >
> > > > > Denys,
> > > > >
> > > > > I recompiled the 3.12-rc5 kernel again but it still stalls during
> > > > > initialization. I attached the boot log. I don't know much about
> the
> > > > > platform details but maybe that's an issue you know about.
> > > > >
> > > > > Thanks,
> > > > > Rudi
> > > > >
> > > > >
> > > > >
> > > > >>
> > > > >> [1]
> > > > >> Build Configuration:
> > > > >> BB_VERSION        = "1.21.0"
> > > > >> BUILD_SYS         = "x86_64-linux"
> > > > >> NATIVELSBSTRING   = "Fedora-18"
> > > > >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> > > > >> MACHINE           = "am335x-evm"
> > > > >> DISTRO            = "poky"
> > > > >> DISTRO_VERSION    = "1.5+snapshot-20131019"
> > > > >> TUNE_FEATURES     = "armv7a vfp neon"
> > > > >> TARGET_FPU        = "vfp-neon"
> > > > >> meta-yocto        =
> "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > >> meta-ti           =
> "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > > > >> meta-oe           =
> "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > > > >> meta              =
> "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > > > >>
> > > > >>
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > --
> > > > *Rudolf J. Streif*
> > > > Director of Embedded Solutions
> > > > The Linux Foundation
> > > >
> > > > rudolf.streif@linux.com
> > > > Phone: +1.619.537.6646
> > > > Skype: rudolfstreif
> > > > PGP: RSA 2048/2048 D6E7D28B
> > > >
> > > > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > > > Linux Foundation Training Schedule: training.linuxfoundation.org
> > >
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >
> > >
> >
> >
> > --
> > --
> > *Rudolf J. Streif*
> > Director of Embedded Solutions
> > The Linux Foundation
> >
> > rudolf.streif@linux.com
> > Phone: +1.619.537.6646
> > Skype: rudolfstreif
> > PGP: RSA 2048/2048 D6E7D28B
> >
> > Linux Foundation Events Schedule:  events.linuxfoundation.org
> > Linux Foundation Training Schedule: training.linuxfoundation.org
>
>
>


-- 
-- 
*Rudolf J. Streif*
Director of Embedded Solutions
The Linux Foundation

rudolf.streif@linux.com
Phone: +1.619.537.6646
Skype: rudolfstreif
PGP: RSA 2048/2048 D6E7D28B

Linux Foundation Events Schedule:  events.linuxfoundation.org
Linux Foundation Training Schedule: training.linuxfoundation.org

--089e01681f42e8e82404e94fc1e7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Where do I find the PG version of the board? The barcode s=
ticker on the board says rev 1.2.</div><div class=3D"gmail_extra"><br><br><=
div class=3D"gmail_quote">On Tue, Oct 22, 2013 at 12:19 AM, Denys Dmytriyen=
ko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">=
denys@ti.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Now I&#39;m just wondering what PG version o=
f the board you&#39;ve got, if it fails in<br>
the same way with our 3.8 kernel and a known good set of 3.12 images...<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Mon, Oct 21, 2013 at 11:19:35PM +0100, Rudolf Streif wrote:<br>
&gt; Thanks, Denys.<br>
&gt;<br>
&gt; Interesting point about gcc. It&#39;s version 4.8.1 which is the defau=
lt for<br>
&gt; poky master. Which is what I used all along.<br>
&gt;<br>
&gt; Thanks for sending your binaries. They fail too with the exact same<br=
>
&gt; problem. See attached log. I found [1] on gmane which exactly describe=
s the<br>
&gt; problem I am seeing.<br>
&gt;<br>
&gt; If that is the case then I was wondering why my earlier builds with<br=
>
&gt; 3.12-rc3 actually worked. And I tried them again and they are now fail=
ing<br>
&gt; too. Of course I don&#39;t know anything about the specifics of the gp=
io and<br>
&gt; the timers on the chip but it looks like a weird hardware initializati=
on<br>
&gt; condition. And I don&#39;t know if the proposed patch in [1] was ever<=
br>
&gt; incorporated in your kernel tree.<br>
&gt;<br>
&gt; I don&#39;t think it&#39;s the hardware (or at least not alone) becaus=
e the SD that<br>
&gt; ships with it with the 3.2 kernel works just fine.<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Rudi<br>
&gt;<br>
&gt;<br>
&gt; [1] =A0<a href=3D"http://permalink.gmane.org/gmane.linux.ports.arm.oma=
p/96044" target=3D"_blank">http://permalink.gmane.org/gmane.linux.ports.arm=
.omap/96044</a><br>
&gt;<br>
&gt;<br>
&gt; On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko &lt;<a href=3D"mai=
lto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Rudi,<br>
&gt; &gt;<br>
&gt; &gt; As we discussed earlier today, let my send you my binaries for th=
e kernel<br>
&gt; &gt; and<br>
&gt; &gt; u-boot to try on your board. I just wanted to ask you about the t=
oolchain<br>
&gt; &gt; that<br>
&gt; &gt; you used to build yours. In our builds we use Linaro gcc-4.7 hard=
fp<br>
&gt; &gt; toolchain<br>
&gt; &gt; and I vaguely remember hearing about some problems with the recen=
t gcc-4.8<br>
&gt; &gt; toolchain from oe-core... I&#39;m wondering if you are having the=
 same issue.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:<br=
>
&gt; &gt; &gt; Since the 3.12-rc5 kernel does not work I decided to give th=
e 3.8 kernel<br>
&gt; &gt; a<br>
&gt; &gt; &gt; try. The issue with this one is that the <a href=3D"http://l=
inux-ti-staging_3.8.bb" target=3D"_blank">linux-ti-staging_3.8.bb</a> recip=
e<br>
&gt; &gt; &gt; explicitly sets KERNEL_IMAGETYPE=3D&quot;uImage&quot;. Howev=
er, the u-boot<br>
&gt; &gt; environment<br>
&gt; &gt; &gt; has now moved on to using zImage which consequently means u-=
boot will not<br>
&gt; &gt; &gt; find the kernel file.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I do not know why KERNEL_IMAGETYPE =3D &quot;uImage&quot; wa=
s hacked into the<br>
&gt; &gt; &gt; <a href=3D"http://linux-ti-staging_3.8.bb" target=3D"_blank"=
>linux-ti-staging_3.8.bb</a> recipe but whoever did it did not think about<=
br>
&gt; &gt; &gt; u-boot. Does zImage not work with 3.8? I did not try it but =
it should<br>
&gt; &gt; &gt; normally have no effect. Since there is no dependency of the=
 u-boot<br>
&gt; &gt; recipes<br>
&gt; &gt; &gt; on the kernel image types changes to the kernel image type f=
or newer<br>
&gt; &gt; &gt; versions of the kernel then automatically means that it must=
 be changed<br>
&gt; &gt; for<br>
&gt; &gt; &gt; the previous versions too.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I mocked around with the u-boot environment and booted the 3=
.8 uImage<br>
&gt; &gt; &gt; kernel. To my surprise the 3.8 kernel from the TI staging re=
pository<br>
&gt; &gt; fails<br>
&gt; &gt; &gt; with the exact same problem and stops booting with a kernel =
not syncing<br>
&gt; &gt; &gt; message during the init calls. Apparently a patch must have =
been applied<br>
&gt; &gt; to<br>
&gt; &gt; &gt; the kernel repo that breaks it. It has nothing possibly to d=
o with the<br>
&gt; &gt; &gt; build system.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I would appreciate any hints to get this kernel built and bo=
ot on the<br>
&gt; &gt; board.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:rstreif@linuxfoundation.org">rstreif@l=
inuxfoundation.org</a>&gt;wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Denys,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I recompiled the 3.12-rc5 kernel again but it still sta=
lls during<br>
&gt; &gt; &gt; &gt; initialization. I attached the boot log. I don&#39;t kn=
ow much about the<br>
&gt; &gt; &gt; &gt; platform details but maybe that&#39;s an issue you know=
 about.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; Rudi<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; [1]<br>
&gt; &gt; &gt; &gt;&gt; Build Configuration:<br>
&gt; &gt; &gt; &gt;&gt; BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.21.0&quot;<br=
>
&gt; &gt; &gt; &gt;&gt; BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&qu=
ot;<br>
&gt; &gt; &gt; &gt;&gt; NATIVELSBSTRING =A0 =3D &quot;Fedora-18&quot;<br>
&gt; &gt; &gt; &gt;&gt; TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;arm-poky-linux-=
gnueabi&quot;<br>
&gt; &gt; &gt; &gt;&gt; MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;am335x-evm&qu=
ot;<br>
&gt; &gt; &gt; &gt;&gt; DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;<=
br>
&gt; &gt; &gt; &gt;&gt; DISTRO_VERSION =A0 =A0=3D &quot;1.5+snapshot-201310=
19&quot;<br>
&gt; &gt; &gt; &gt;&gt; TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neon&quo=
t;<br>
&gt; &gt; &gt; &gt;&gt; TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&quot;<=
br>
&gt; &gt; &gt; &gt;&gt; meta-yocto =A0 =A0 =A0 =A0=3D &quot;master:9a1dce10=
bdc9254bb38e0e54199f23ae55e209a4&quot;<br>
&gt; &gt; &gt; &gt;&gt; meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:c11504=
664990f007c3903d349e7cc135a904f8e2&quot;<br>
&gt; &gt; &gt; &gt;&gt; meta-oe =A0 =A0 =A0 =A0 =A0 =3D &quot;master:f8903f=
53db717294d63a8d79b5ef7ca34b3c189e&quot;<br>
&gt; &gt; &gt; &gt;&gt; meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;master:9a=
1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; *Rudolf J. Streif*<br>
&gt; &gt; &gt; Director of Embedded Solutions<br>
&gt; &gt; &gt; The Linux Foundation<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"mailto:rudolf.streif@linux.com">rudolf.streif@lin=
ux.com</a><br>
&gt; &gt; &gt; Phone: <a href=3D"tel:%2B1.619.537.6646" value=3D"+161953766=
46">+1.619.537.6646</a><br>
&gt; &gt; &gt; Skype: rudolfstreif<br>
&gt; &gt; &gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Linux Foundation Events Schedule: =A0<a href=3D"http://event=
s.linuxfoundation.org" target=3D"_blank">events.linuxfoundation.org</a><br>
&gt; &gt; &gt; Linux Foundation Training Schedule: <a href=3D"http://traini=
ng.linuxfoundation.org" target=3D"_blank">training.linuxfoundation.org</a><=
br>
&gt; &gt;<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctopro=
ject.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" =
target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; --<br>
&gt; *Rudolf J. Streif*<br>
&gt; Director of Embedded Solutions<br>
&gt; The Linux Foundation<br>
&gt;<br>
&gt; <a href=3D"mailto:rudolf.streif@linux.com">rudolf.streif@linux.com</a>=
<br>
&gt; Phone: <a href=3D"tel:%2B1.619.537.6646" value=3D"+16195376646">+1.619=
.537.6646</a><br>
&gt; Skype: rudolfstreif<br>
&gt; PGP: RSA 2048/2048 D6E7D28B<br>
&gt;<br>
&gt; Linux Foundation Events Schedule: =A0<a href=3D"http://events.linuxfou=
ndation.org" target=3D"_blank">events.linuxfoundation.org</a><br>
&gt; Linux Foundation Training Schedule: <a href=3D"http://training.linuxfo=
undation.org" target=3D"_blank">training.linuxfoundation.org</a><br>
<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div dir=3D"ltr">--=A0<br><font face=3D"arial, helvetica, sans-serif"><b>Ru=
dolf J. Streif</b></font><div><font face=3D"arial, helvetica, sans-serif">D=
irector of Embedded Solutions</font></div>
<div><font face=3D"arial, helvetica, sans-serif">The Linux Foundation</font=
></div><div><font face=3D"arial, helvetica, sans-serif"><br></font></div><d=
iv><a href=3D"mailto:rudolf.streif@linux.com" target=3D"_blank"><font face=
=3D"arial, helvetica, sans-serif">rudolf.streif@linux.com</font></a></div>
<div><font face=3D"arial, helvetica, sans-serif">Phone: +1.619.</font><span=
 style=3D"color:rgb(0,0,0);font-family:Arial,sans-serif;line-height:18.1875=
px">537.6646</span></div><div><font face=3D"arial, helvetica, sans-serif">S=
kype: rudolfstreif</font></div>
<div><font face=3D"arial, helvetica, sans-serif">PGP: RSA 2048/2048 D6E7D28=
B</font></div><div><font face=3D"garamond, serif"><br></font></div><div><fo=
nt face=3D"garamond, serif"><span style=3D"border-collapse:collapse;color:r=
gb(102,102,102);font-family:arial,sans-serif;font-size:13px"><span style=3D=
"border-collapse:collapse">Linux Foundation Events Schedule: =A0<a href=3D"=
http://events.linuxfoundation.org/" style=3D"color:rgb(64,100,128)" target=
=3D"_blank">events.linuxfoundation.org</a><br>
Linux Foundation Training Schedule:=A0<a href=3D"http://training.linuxfound=
ation.org/" style=3D"color:rgb(64,100,128)" target=3D"_blank">training.linu=
xfoundation.org</a></span><br></span></font></div><div><font face=3D"garamo=
nd, serif"><span style=3D"border-collapse:collapse;color:rgb(102,102,102);f=
ont-family:arial,sans-serif;font-size:13px"><br>
</span></font></div></div>
</div>

--089e01681f42e8e82404e94fc1e7--
