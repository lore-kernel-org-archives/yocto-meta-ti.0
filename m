Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41A0BE0171D
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 15:19:37 -0700 (PDT)
Received: by mail-ea0-f179.google.com with SMTP id b10so3752809eae.24
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 15:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AoRXifeJI5FSzFQiRMn0IokX4cTIrV4/dmZtYn5jIL0=;
	b=JSpxAb2/23PlTDp0xerayYg7YCgjDaY+Mg2+kAB3ePAa534K0fFQ/hVk5t6yddhSRl
	i2bLwth7rt32bfzq9KLn8TKZ+FUbKowdg7DPDISsB9FS+YUFNk2502+ooCncIl8rv69Q
	bXkxzYrLb85WnaUBxwLAjIxCHZhHtCAenom2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=AoRXifeJI5FSzFQiRMn0IokX4cTIrV4/dmZtYn5jIL0=;
	b=KbPmRjNduLVLWne1J0z7wW5ypWb392ZeLgwbHDXJT2IzdTyjxQDTMbdboOsZ+1nLU2
	8CdERSHOlIF+fyMGzsrHUd/MZMdqLiBXtEGeZLb+/4ijF5fvRUUwBtHSaU5g5bvIm9JD
	His/kyYmHRQRbKe6P2AQS7yluBWpw61GQWucv+XsceIkYdH6L/Dt7SNVoWzyQpSea9Hz
	VJPbqr/Q+zvmK6Fi1QbFa3dXNcpzbmXouvHFIZPeOWb1LTg2yk6G3V7rnyms5tvG5vlQ
	PEoW78Reg3qPTzDuubPcC7m+GohtTxbYWtQdsXLvNZ5zZrOjDxJv1KTdlBZ/7Fz8ryhD
	dEIQ==
X-Gm-Message-State: ALoCoQmpu88bQU/Y2ioVdFt2XyLrRTS1fwujmwwmLSl9s84neJ78V8gyCYnlOfmURh68CXmjnfSc
MIME-Version: 1.0
X-Received: by 10.15.50.68 with SMTP id k44mr4912988eew.54.1382393976135; Mon,
	21 Oct 2013 15:19:36 -0700 (PDT)
Received: by 10.223.147.133 with HTTP; Mon, 21 Oct 2013 15:19:35 -0700 (PDT)
In-Reply-To: <20131021211522.GA26549@denix.org>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
	<20131017214528.GC30989@edge>
	<CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
	<20131019023954.GK2127@edge>
	<CA+gsK-q8W-wAP-rBhy7RgHUddsbdE_SaNOgyfFQ+zj2ksSidKw@mail.gmail.com>
	<CA+gsK-owJQGEhzv9tgmiF+fORTErYVbQUhcoQ3BVLA+p3a+9Qw@mail.gmail.com>
	<CA+gsK-qaWVUGPe7fW62V+tH0F3GVZHHXGD_+LHQX7hiE7VcZRg@mail.gmail.com>
	<20131021211522.GA26549@denix.org>
Date: Mon, 21 Oct 2013 23:19:35 +0100
Message-ID: <CA+gsK-q6=AXpMNQOJYK47W_JJvhbi=YT7sdUOrjYVxC0aMDqBA@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Mon, 21 Oct 2013 22:19:38 -0000
X-Groupsio-MsgNum: 3558
Content-Type: multipart/mixed; boundary=001a11c38fc2e3497104e947adfa

--001a11c38fc2e3497104e947adfa
Content-Type: multipart/alternative; boundary=001a11c38fc2e3496c04e947adf8

--001a11c38fc2e3496c04e947adf8
Content-Type: text/plain; charset=ISO-8859-1

Thanks, Denys.

Interesting point about gcc. It's version 4.8.1 which is the default for
poky master. Which is what I used all along.

Thanks for sending your binaries. They fail too with the exact same
problem. See attached log. I found [1] on gmane which exactly describes the
problem I am seeing.

If that is the case then I was wondering why my earlier builds with
3.12-rc3 actually worked. And I tried them again and they are now failing
too. Of course I don't know anything about the specifics of the gpio and
the timers on the chip but it looks like a weird hardware initialization
condition. And I don't know if the proposed patch in [1] was ever
incorporated in your kernel tree.

I don't think it's the hardware (or at least not alone) because the SD that
ships with it with the 3.2 kernel works just fine.

Cheers,
Rudi


[1]  http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044


On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Rudi,
>
> As we discussed earlier today, let my send you my binaries for the kernel
> and
> u-boot to try on your board. I just wanted to ask you about the toolchain
> that
> you used to build yours. In our builds we use Linaro gcc-4.7 hardfp
> toolchain
> and I vaguely remember hearing about some problems with the recent gcc-4.8
> toolchain from oe-core... I'm wondering if you are having the same issue.
>
> --
> Denys
>
>
> On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:
> > Since the 3.12-rc5 kernel does not work I decided to give the 3.8 kernel
> a
> > try. The issue with this one is that the linux-ti-staging_3.8.bb recipe
> > explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot
> environment
> > has now moved on to using zImage which consequently means u-boot will not
> > find the kernel file.
> >
> > I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into the
> > linux-ti-staging_3.8.bb recipe but whoever did it did not think about
> > u-boot. Does zImage not work with 3.8? I did not try it but it should
> > normally have no effect. Since there is no dependency of the u-boot
> recipes
> > on the kernel image types changes to the kernel image type for newer
> > versions of the kernel then automatically means that it must be changed
> for
> > the previous versions too.
> >
> > I mocked around with the u-boot environment and booted the 3.8 uImage
> > kernel. To my surprise the 3.8 kernel from the TI staging repository
> fails
> > with the exact same problem and stops booting with a kernel not syncing
> > message during the init calls. Apparently a patch must have been applied
> to
> > the kernel repo that breaks it. It has nothing possibly to do with the
> > build system.
> >
> > I would appreciate any hints to get this kernel built and boot on the
> board.
> >
> > Thanks,
> > Rudi
> >
> >
> > On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
> > <rstreif@linuxfoundation.org>wrote:
> >
> > > Denys,
> > >
> > > I recompiled the 3.12-rc5 kernel again but it still stalls during
> > > initialization. I attached the boot log. I don't know much about the
> > > platform details but maybe that's an issue you know about.
> > >
> > > Thanks,
> > > Rudi
> > >
> > >
> > >
> > >>
> > >> [1]
> > >> Build Configuration:
> > >> BB_VERSION        = "1.21.0"
> > >> BUILD_SYS         = "x86_64-linux"
> > >> NATIVELSBSTRING   = "Fedora-18"
> > >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> > >> MACHINE           = "am335x-evm"
> > >> DISTRO            = "poky"
> > >> DISTRO_VERSION    = "1.5+snapshot-20131019"
> > >> TUNE_FEATURES     = "armv7a vfp neon"
> > >> TARGET_FPU        = "vfp-neon"
> > >> meta-yocto        = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > >> meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
> > >> meta-oe           = "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> > >> meta              = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> > >>
> > >>
> > >
> > >
> > >
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
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
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

--001a11c38fc2e3496c04e947adf8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Denys.<div><br></div><div>Interesting point about =
gcc. It&#39;s version 4.8.1 which is the default for poky master. Which is =
what I used all along.</div><div><br></div><div>Thanks for sending your bin=
aries. They fail too with the exact same problem. See attached log. I found=
 [1] on gmane which exactly describes the problem I am seeing.</div>
<div><br></div><div>If that is the case then I was wondering why my earlier=
 builds with 3.12-rc3 actually worked. And I tried them again and they are =
now failing too. Of course I don&#39;t know anything about the specifics of=
 the gpio and the timers on the chip but it looks like a weird hardware ini=
tialization condition. And I don&#39;t know if the proposed patch in [1] wa=
s ever incorporated in your kernel tree.=A0</div>
<div><br></div><div>I don&#39;t think it&#39;s the hardware (or at least no=
t alone) because the SD that ships with it with the 3.2 kernel works just f=
ine.</div><div><br></div><div>Cheers,</div><div>Rudi</div><div><br></div>
<div><br></div><div>[1] =A0<a href=3D"http://permalink.gmane.org/gmane.linu=
x.ports.arm.omap/96044">http://permalink.gmane.org/gmane.linux.ports.arm.om=
ap/96044</a></div></div><div class=3D"gmail_extra"><br><br><div class=3D"gm=
ail_quote">
On Mon, Oct 21, 2013 at 10:15 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
Rudi,<br>
<br>
As we discussed earlier today, let my send you my binaries for the kernel a=
nd<br>
u-boot to try on your board. I just wanted to ask you about the toolchain t=
hat<br>
you used to build yours. In our builds we use Linaro gcc-4.7 hardfp toolcha=
in<br>
and I vaguely remember hearing about some problems with the recent gcc-4.8<=
br>
toolchain from oe-core... I&#39;m wondering if you are having the same issu=
e.<br>
<br>
--<br>
Denys<br>
<div><div class=3D"h5"><br>
<br>
On Mon, Oct 21, 2013 at 10:42:35AM -0700, Rudolf Streif wrote:<br>
&gt; Since the 3.12-rc5 kernel does not work I decided to give the 3.8 kern=
el a<br>
&gt; try. The issue with this one is that the <a href=3D"http://linux-ti-st=
aging_3.8.bb" target=3D"_blank">linux-ti-staging_3.8.bb</a> recipe<br>
&gt; explicitly sets KERNEL_IMAGETYPE=3D&quot;uImage&quot;. However, the u-=
boot environment<br>
&gt; has now moved on to using zImage which consequently means u-boot will =
not<br>
&gt; find the kernel file.<br>
&gt;<br>
&gt; I do not know why KERNEL_IMAGETYPE =3D &quot;uImage&quot; was hacked i=
nto the<br>
&gt; <a href=3D"http://linux-ti-staging_3.8.bb" target=3D"_blank">linux-ti-=
staging_3.8.bb</a> recipe but whoever did it did not think about<br>
&gt; u-boot. Does zImage not work with 3.8? I did not try it but it should<=
br>
&gt; normally have no effect. Since there is no dependency of the u-boot re=
cipes<br>
&gt; on the kernel image types changes to the kernel image type for newer<b=
r>
&gt; versions of the kernel then automatically means that it must be change=
d for<br>
&gt; the previous versions too.<br>
&gt;<br>
&gt; I mocked around with the u-boot environment and booted the 3.8 uImage<=
br>
&gt; kernel. To my surprise the 3.8 kernel from the TI staging repository f=
ails<br>
&gt; with the exact same problem and stops booting with a kernel not syncin=
g<br>
&gt; message during the init calls. Apparently a patch must have been appli=
ed to<br>
&gt; the kernel repo that breaks it. It has nothing possibly to do with the=
<br>
&gt; build system.<br>
&gt;<br>
&gt; I would appreciate any hints to get this kernel built and boot on the =
board.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Rudi<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif<br>
&gt; &lt;<a href=3D"mailto:rstreif@linuxfoundation.org">rstreif@linuxfounda=
tion.org</a>&gt;wrote:<br>
&gt;<br>
&gt; &gt; Denys,<br>
&gt; &gt;<br>
&gt; &gt; I recompiled the 3.12-rc5 kernel again but it still stalls during=
<br>
&gt; &gt; initialization. I attached the boot log. I don&#39;t know much ab=
out the<br>
&gt; &gt; platform details but maybe that&#39;s an issue you know about.<br=
>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Rudi<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [1]<br>
&gt; &gt;&gt; Build Configuration:<br>
&gt; &gt;&gt; BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.21.0&quot;<br>
&gt; &gt;&gt; BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&quot;<br>
&gt; &gt;&gt; NATIVELSBSTRING =A0 =3D &quot;Fedora-18&quot;<br>
&gt; &gt;&gt; TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;arm-poky-linux-gnueabi&qu=
ot;<br>
&gt; &gt;&gt; MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;am335x-evm&quot;<br>
&gt; &gt;&gt; DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;<br>
&gt; &gt;&gt; DISTRO_VERSION =A0 =A0=3D &quot;1.5+snapshot-20131019&quot;<b=
r>
&gt; &gt;&gt; TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neon&quot;<br>
&gt; &gt;&gt; TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&quot;<br>
&gt; &gt;&gt; meta-yocto =A0 =A0 =A0 =A0=3D &quot;master:9a1dce10bdc9254bb3=
8e0e54199f23ae55e209a4&quot;<br>
&gt; &gt;&gt; meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:c11504664990f007=
c3903d349e7cc135a904f8e2&quot;<br>
&gt; &gt;&gt; meta-oe =A0 =A0 =A0 =A0 =A0 =3D &quot;master:f8903f53db717294=
d63a8d79b5ef7ca34b3c189e&quot;<br>
&gt; &gt;&gt; meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;master:9a1dce10bdc9=
254bb38e0e54199f23ae55e209a4&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; --<br>
</div></div>&gt; *Rudolf J. Streif*<br>
<div class=3D"im HOEnZb">&gt; Director of Embedded Solutions<br>
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
</div><div class=3D"HOEnZb"><div class=3D"h5">&gt; ________________________=
_______________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
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

--001a11c38fc2e3496c04e947adf8--

--001a11c38fc2e3497104e947adfa
Content-Type: application/octet-stream; name="boot-am335x-evmsk.log"
Content-Disposition: attachment; filename="boot-am335x-evmsk.log"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hn29nr5g0

IApTdGFydGluZyBrZXJuZWwgLi4uCgpbICAgIDAuMDAwMDAwXSBCb290aW5nIExpbnV4IG9uIHBo
eXNpY2FsIENQVSAweDAKWyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiAzLjEyLjAtcmM1LWdl
Yjc2NWEzIChqZW5raW5zQHB1Z2V0KSAoZ2NjIHZlcnNpb24gNC43LjMgMjAxMzAyMjYgKHByZXJl
bGVhc2UpIChjcm9zc3Rvb2wtTkcgbGluYXJvLTEuMTMuMS00LjctMjAxMy4wMy0yMDEzMDMxMyAt
IExpbmFybyBHQ0MgMjAxMy4wMykgKSAjMSBTTVAgRnJpIE9jdCAxOCAxMjo1MjoxOCBFCkRUIDIw
MTMKWyAgICAwLjAwMDAwMF0gQ1BVOiBBUk12NyBQcm9jZXNzb3IgWzQxM2ZjMDgyXSByZXZpc2lv
biAyIChBUk12NyksIGNyPTEwYzUzYzdkClsgICAgMC4wMDAwMDBdIENQVTogUElQVCAvIFZJUFQg
bm9uYWxpYXNpbmcgZGF0YSBjYWNoZSwgVklQVCBhbGlhc2luZyBpbnN0cnVjdGlvbiBjYWNoZQpb
ICAgIDAuMDAwMDAwXSBNYWNoaW5lOiBHZW5lcmljIEFNMzNYWCAoRmxhdHRlbmVkIERldmljZSBU
cmVlKSwgbW9kZWw6IFRJIEFNMzM1eCBFVk0tU0sKWyAgICAwLjAwMDAwMF0gY21hOiBDTUE6IHJl
c2VydmVkIDE2IE1pQiBhdCA4ZTgwMDAwMApbICAgIDAuMDAwMDAwXSBNZW1vcnkgcG9saWN5OiBF
Q0MgZGlzYWJsZWQsIERhdGEgY2FjaGUgd3JpdGViYWNrClsgICAgMC4wMDAwMDBdIENQVTogQWxs
IENQVShzKSBzdGFydGVkIGluIFNWQyBtb2RlLgpbICAgIDAuMDAwMDAwXSBBTTMzNVggRVMxLjAg
KHNneCBuZW9uICkKWyAgICAwLjAwMDAwMF0gUEVSQ1BVOiBFbWJlZGRlZCA5IHBhZ2VzL2NwdSBA
YzExOWQwMDAgczE0NjU2IHI4MTkyIGQxNDAxNiB1MzY4NjQKWyAgICAwLjAwMDAwMF0gQnVpbHQg
MSB6b25lbGlzdHMgaW4gWm9uZSBvcmRlciwgbW9iaWxpdHkgZ3JvdXBpbmcgb24uICBUb3RhbCBw
YWdlczogNjQ1MTIKWyAgICAwLjAwMDAwMF0gS2VybmVsIGNvbW1hbmQgbGluZTogY29uc29sZT10
dHlPMCwxMTUyMDBuOCByb290PS9kZXYvbW1jYmxrMHAyIHJvIHJvb3Rmc3R5cGU9ZXh0NCByb290
d2FpdApbICAgIDAuMDAwMDAwXSBQSUQgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMDI0IChvcmRlcjog
MCwgNDA5NiBieXRlcykKWyAgICAwLjAwMDAwMF0gRGVudHJ5IGNhY2hlIGhhc2ggdGFibGUgZW50
cmllczogMzI3NjggKG9yZGVyOiA1LCAxMzEwNzIgYnl0ZXMpClsgICAgMC4wMDAwMDBdIElub2Rl
LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMTYzODQgKG9yZGVyOiA0LCA2NTUzNiBieXRlcykK
WyAgICAwLjAwMDAwMF0gTWVtb3J5OiAyMjY1MTZLLzI2MDA5NksgYXZhaWxhYmxlICg1ODE4SyBr
ZXJuZWwgY29kZSwgNjc5SyByd2RhdGEsIDIyNjhLIHJvZGF0YSwgNDIySyBpbml0LCA1NTI4SyBi
c3MsIDMzNTgwSyByZXNlcnZlZCwgMEsgaGlnaG1lbSkKWyAgICAwLjAwMDAwMF0gVmlydHVhbCBr
ZXJuZWwgbWVtb3J5IGxheW91dDoKWyAgICAwLjAwMDAwMF0gICAgIHZlY3RvciAgOiAweGZmZmYw
MDAwIC0gMHhmZmZmMTAwMCAgICggICA0IGtCKQpbICAgIDAuMDAwMDAwXSAgICAgZml4bWFwICA6
IDB4ZmZmMDAwMDAgLSAweGZmZmUwMDAwICAgKCA4OTYga0IpClsgICAgMC4wMDAwMDBdICAgICB2
bWFsbG9jIDogMHhkMDgwMDAwMCAtIDB4ZmYwMDAwMDAgICAoIDc0NCBNQikKWyAgICAwLjAwMDAw
MF0gICAgIGxvd21lbSAgOiAweGMwMDAwMDAwIC0gMHhkMDAwMDAwMCAgICggMjU2IE1CKQpbICAg
IDAuMDAwMDAwXSAgICAgcGttYXAgICA6IDB4YmZlMDAwMDAgLSAweGMwMDAwMDAwICAgKCAgIDIg
TUIpClsgICAgMC4wMDAwMDBdICAgICBtb2R1bGVzIDogMHhiZjAwMDAwMCAtIDB4YmZlMDAwMDAg
ICAoICAxNCBNQikKWyAgICAwLjAwMDAwMF0gICAgICAgLnRleHQgOiAweGMwMDA4MDAwIC0gMHhj
MDdlZGJiYyAgICg4MDg3IGtCKQpbICAgIDAuMDAwMDAwXSAgICAgICAuaW5pdCA6IDB4YzA3ZWUw
MDAgLSAweGMwODU3OTQwICAgKCA0MjMga0IpClsgICAgMC4wMDAwMDBdICAgICAgIC5kYXRhIDog
MHhjMDg1ODAwMCAtIDB4YzA5MDFlMjAgICAoIDY4MCBrQikKWyAgICAwLjAwMDAwMF0gICAgICAg
IC5ic3MgOiAweGMwOTAxZTIwIC0gMHhjMGU2ODBiMCAgICg1NTI5IGtCKQpbICAgIDAuMDAwMDAw
XSBIaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuMDAwMDAwXSAgUkNVIHJl
c3RyaWN0aW5nIENQVXMgZnJvbSBOUl9DUFVTPTIgdG8gbnJfY3B1X2lkcz0xLgpbICAgIDAuMDAw
MDAwXSBOUl9JUlFTOjE2IG5yX2lycXM6MTYgMTYKWyAgICAwLjAwMDAwMF0gSVJROiBGb3VuZCBh
biBJTlRDIGF0IDB4ZmEyMDAwMDAgKHJldmlzaW9uIDUuMCkgd2l0aCAxMjggaW50ZXJydXB0cwpb
ICAgIDAuMDAwMDAwXSBUb3RhbCBvZiAxMjggaW50ZXJydXB0cyBvbiAxIGFjdGl2ZSBjb250cm9s
bGVyClsgICAgMC4wMDAwMDBdIE9NQVAgY2xvY2tldmVudCBzb3VyY2U6IHRpbWVyMiBhdCAyNDAw
MDAwMCBIegpbICAgIDAuMDAwMDAwXSBzY2hlZF9jbG9jazogMzIgYml0cyBhdCAyNE1IeiwgcmVz
b2x1dGlvbiA0MW5zLCB3cmFwcyBldmVyeSAxNzg5NTZtcwpbICAgIDAuMDAwMDAwXSBPTUFQIGNs
b2Nrc291cmNlOiB0aW1lcjEgYXQgMjQwMDAwMDAgSHoKWyAgICAwLjAwMDAwMF0gQ29uc29sZTog
Y29sb3VyIGR1bW15IGRldmljZSA4MHgzMApbICAgIDAuMDAwMDAwXSBMb2NrIGRlcGVuZGVuY3kg
dmFsaWRhdG9yOiBDb3B5cmlnaHQgKGMpIDIwMDYgUmVkIEhhdCwgSW5jLiwgSW5nbyBNb2xuYXIK
WyAgICAwLjAwMDAwMF0gLi4uIE1BWF9MT0NLREVQX1NVQkNMQVNTRVM6ICA4ClsgICAgMC4wMDAw
MDBdIC4uLiBNQVhfTE9DS19ERVBUSDogICAgICAgICAgNDgKWyAgICAwLjAwMDAwMF0gLi4uIE1B
WF9MT0NLREVQX0tFWVM6ICAgICAgICA4MTkxClsgICAgMC4wMDAwMDBdIC4uLiBDTEFTU0hBU0hf
U0laRTogICAgICAgICAgNDA5NgpbICAgIDAuMDAwMDAwXSAuLi4gTUFYX0xPQ0tERVBfRU5UUklF
UzogICAgIDE2Mzg0ClsgICAgMC4wMDAwMDBdIC4uLiBNQVhfTE9DS0RFUF9DSEFJTlM6ICAgICAg
MzI3NjgKWyAgICAwLjAwMDAwMF0gLi4uIENIQUlOSEFTSF9TSVpFOiAgICAgICAgICAxNjM4NApb
ICAgIDAuMDAwMDAwXSAgbWVtb3J5IHVzZWQgYnkgbG9jayBkZXBlbmRlbmN5IGluZm86IDM2OTUg
a0IKWyAgICAwLjAwMDAwMF0gIHBlciB0YXNrLXN0cnVjdCBtZW1vcnkgZm9vdHByaW50OiAxMTUy
IGJ5dGVzClsgICAgMC4wMDEyMDldIENhbGlicmF0aW5nIGRlbGF5IGxvb3AuLi4gNDc2Ljc3IEJv
Z29NSVBTIChscGo9MjM4Mzg3MikKWyAgICAwLjEwOTQzOF0gcGlkX21heDogZGVmYXVsdDogMzI3
NjggbWluaW11bTogMzAxClsgICAgMC4xMDk5NDddIFNlY3VyaXR5IEZyYW1ld29yayBpbml0aWFs
aXplZApbICAgIDAuMTEwMTA1XSBNb3VudC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDUxMgpb
ICAgIDAuMTM4NTgwXSBDUFU6IFRlc3Rpbmcgd3JpdGUgYnVmZmVyIGNvaGVyZW5jeTogb2sKWyAg
ICAwLjE0MDI5MF0gQ1BVMDogdGhyZWFkIC0xLCBjcHUgMCwgc29ja2V0IC0xLCBtcGlkciAwClsg
ICAgMC4xNDAzNzVdIFNldHRpbmcgdXAgc3RhdGljIGlkZW50aXR5IG1hcCBmb3IgMHhjMDU4M2Y0
MCAtIDB4YzA1ODNmYjAKWyAgICAwLjE0MzgyM10gQnJvdWdodCB1cCAxIENQVXMKWyAgICAwLjE0
Mzg0N10gU01QOiBUb3RhbCBvZiAxIHByb2Nlc3NvcnMgYWN0aXZhdGVkLgpbICAgIDAuMTQzODYw
XSBDUFU6IEFsbCBDUFUocykgc3RhcnRlZCBpbiBTVkMgbW9kZS4KWyAgICAwLjE0NzA5NV0gZGV2
dG1wZnM6IGluaXRpYWxpemVkClsgICAgMC4xNTgzMjJdIFZGUCBzdXBwb3J0IHYwLjM6IGltcGxl
bWVudG9yIDQxIGFyY2hpdGVjdHVyZSAzIHBhcnQgMzAgdmFyaWFudCBjIHJldiAzClsgICAgMC4y
MzgwNjFdIG9tYXBfaHdtb2Q6IGRlYnVnc3M6IF93YWl0X3RhcmdldF9kaXNhYmxlIGZhaWxlZApb
ICAgIDAuMjQ0MTE3XSBwaW5jdHJsIGNvcmU6IGluaXRpYWxpemVkIHBpbmN0cmwgc3Vic3lzdGVt
ClsgICAgMC4yNDg5NTFdIHJlZ3VsYXRvci1kdW1teTogbm8gcGFyYW1ldGVycwpbICAgIDAuMjUz
MDc0XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE2ClsgICAgMC4yNjAwODddIERN
QTogcHJlYWxsb2NhdGVkIDI1NiBLaUIgcG9vbCBmb3IgYXRvbWljIGNvaGVyZW50IGFsbG9jYXRp
b25zClsgICAgMC4yNzcwNjZdIHBsYXRmb3JtIG1wdS4xOiBGSVhNRTogY2xvY2stbmFtZSAnZmNr
JyBET0VTIE5PVCBleGlzdCBpbiBkdCEKWyAgICAwLjI4MDcxMl0gcGxhdGZvcm0gNDkwMDAwMDAu
ZWRtYTogRklYTUU6IGNsb2NrLW5hbWUgJ2ZjaycgRE9FUyBOT1QgZXhpc3QgaW4gZHQhClsgICAg
MC4yODYxMTNdIE9NQVAgR1BJTyBoYXJkd2FyZSB2ZXJzaW9uIDAuMQpbICAgIDAuMjk5MzgwXSBw
bGF0Zm9ybSA0ODA2MDAwMC5tbWM6IEZJWE1FOiBjbG9jay1uYW1lICdmY2snIERPRVMgTk9UIGV4
aXN0IGluIGR0IQpbICAgIDAuMzE2NjAxXSBwbGF0Zm9ybSA0ODAzYzAwMC5tY2FzcDogRklYTUU6
IGNsb2NrLW5hbWUgJ2ZjaycgRE9FUyBOT1QgZXhpc3QgaW4gZHQhClsgICAgMC4zMjE0NzhdIERT
UyBub3Qgc3VwcG9ydGVkIG9uIHRoaXMgU29DClsgICAgMC4zMjE1MDddIE5vIEFUQUdzPwpbICAg
IDAuMzIxNTIyXSBody1icmVha3BvaW50OiBkZWJ1ZyBhcmNoaXRlY3R1cmUgMHg0IHVuc3VwcG9y
dGVkLgpbICAgIDAuNDA1MjkzXSBiaW86IGNyZWF0ZSBzbGFiIDxiaW8tMD4gYXQgMApbICAgIDAu
NDUyNzgzXSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6IFRJIEVETUEgRE1BIGVu
Z2luZSBkcml2ZXIKWyAgICAwLjQ1NTI2Nl0gdmJhdDogNTAwMCBtViAKWyAgICAwLjQ1NjYyMV0g
bGlzM19yZWc6IG5vIHBhcmFtZXRlcnMKWyAgICAwLjQ2NjUzNF0gU0NTSSBzdWJzeXN0ZW0gaW5p
dGlhbGl6ZWQKWyAgICAwLjQ3MTU1MV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNl
IGRyaXZlciB1c2JmcwpbICAgIDAuNDcyMDkyXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRl
cmZhY2UgZHJpdmVyIGh1YgpbICAgIDAuNDcyOTIxXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBk
ZXZpY2UgZHJpdmVyIHVzYgpbICAgIDAuNDc1NzQyXSBvbWFwX2kyYyA0NGUwYjAwMC5pMmM6IGNv
dWxkIG5vdCBmaW5kIHBjdGxkZXYgZm9yIG5vZGUgL3Bpbm11eEA0NGUxMDgwMC9waW5tdXhfaTJj
MF9waW5zLCBkZWZlcnJpbmcgcHJvYmUKWyAgICAwLjQ3NTc5OF0gcGxhdGZvcm0gNDRlMGIwMDAu
aTJjOiBEcml2ZXIgb21hcF9pMmMgcmVxdWVzdHMgcHJvYmUgZGVmZXJyYWwKWyAgICAwLjQ4NTUz
NF0gU3dpdGNoZWQgdG8gY2xvY2tzb3VyY2UgdGltZXIxClsgICAgMC42NTE1OTZdIE5FVDogUmVn
aXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMgpbICAgIDAuNjUzNzYyXSBUQ1AgZXN0YWJsaXNoZWQg
aGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChvcmRlcjogMiwgMTYzODQgYnl0ZXMpClsgICAgMC42
NTM5ODBdIFRDUCBiaW5kIGhhc2ggdGFibGUgZW50cmllczogMjA0OCAob3JkZXI6IDQsIDczNzI4
IGJ5dGVzKQpbICAgIDAuNjU0OTMyXSBUQ1A6IEhhc2ggdGFibGVzIGNvbmZpZ3VyZWQgKGVzdGFi
bGlzaGVkIDIwNDggYmluZCAyMDQ4KQpbICAgIDAuNjU1MTY3XSBUQ1A6IHJlbm8gcmVnaXN0ZXJl
ZApbICAgIDAuNjU1MjAzXSBVRFAgaGFzaCB0YWJsZSBlbnRyaWVzOiAyNTYgKG9yZGVyOiAyLCAy
MDQ4MCBieXRlcykKWyAgICAwLjY1NTY4Ml0gVURQLUxpdGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAy
NTYgKG9yZGVyOiAyLCAyMDQ4MCBieXRlcykKWyAgICAwLjY1NzE1OV0gTkVUOiBSZWdpc3RlcmVk
IHByb3RvY29sIGZhbWlseSAxClsgICAgMC42NTg5MjhdIFJQQzogUmVnaXN0ZXJlZCBuYW1lZCBV
TklYIHNvY2tldCB0cmFuc3BvcnQgbW9kdWxlLgpbICAgIDAuNjU4OTU0XSBSUEM6IFJlZ2lzdGVy
ZWQgdWRwIHRyYW5zcG9ydCBtb2R1bGUuClsgICAgMC42NTg5NjddIFJQQzogUmVnaXN0ZXJlZCB0
Y3AgdHJhbnNwb3J0IG1vZHVsZS4KWyAgICAwLjY1ODk4MF0gUlBDOiBSZWdpc3RlcmVkIHRjcCBO
RlN2NC4xIGJhY2tjaGFubmVsIHRyYW5zcG9ydCBtb2R1bGUuClsgICAgMC42NjE2MzNdIE5ldFdp
bmRlciBGbG9hdGluZyBQb2ludCBFbXVsYXRvciBWMC45NyAoZG91YmxlIHByZWNpc2lvbikKWyAg
ICAwLjY2Mjk5OV0gUE06IExvYWRpbmcgYW0zMzV4LXBtLWZpcm13YXJlLmJpbgpbICAgIDAuODY3
NTA2XSBWRlM6IERpc2sgcXVvdGFzIGRxdW90XzYuNS4yClsgICAgMC44Njc3OTddIERxdW90LWNh
Y2hlIGhhc2ggdGFibGUgZW50cmllczogMTAyNCAob3JkZXIgMCwgNDA5NiBieXRlcykKWyAgICAw
Ljg3MDYzNF0gTkZTOiBSZWdpc3RlcmluZyB0aGUgaWRfcmVzb2x2ZXIga2V5IHR5cGUKWyAgICAw
Ljg3MTExN10gS2V5IHR5cGUgaWRfcmVzb2x2ZXIgcmVnaXN0ZXJlZApbICAgIDAuODcxMTM4XSBL
ZXkgdHlwZSBpZF9sZWdhY3kgcmVnaXN0ZXJlZApbICAgIDAuODcxMjc4XSBqZmZzMjogdmVyc2lv
biAyLjIuIChOQU5EKSAoU1VNTUFSWSkgIO+/vcKpIDIwMDEtMjAwNiBSZWQgSGF0LCBJbmMuClsg
ICAgMC44NzE4MzBdIG1zZ21uaSBoYXMgYmVlbiBzZXQgdG8gNDc0ClsgICAgMC44NzgzODZdIGlv
IHNjaGVkdWxlciBub29wIHJlZ2lzdGVyZWQKWyAgICAwLjg3ODQxNV0gaW8gc2NoZWR1bGVyIGRl
YWRsaW5lIHJlZ2lzdGVyZWQKWyAgICAwLjg3ODQ5Nl0gaW8gc2NoZWR1bGVyIGNmcSByZWdpc3Rl
cmVkIChkZWZhdWx0KQpbICAgIDAuODgyNzg3XSBwaW5jdHJsLXNpbmdsZSA0NGUxMDgwMC5waW5t
dXg6IDE0MiBwaW5zIGF0IHBhIGY5ZTEwODAwIHNpemUgNTY4ClsgICAgMC45MDk0NTJdIENvbnNv
bGU6IHN3aXRjaGluZyB0byBjb2xvdXIgZnJhbWUgYnVmZmVyIGRldmljZSA2MHgzNApbICAgIDAu
OTE4MTE2XSBTZXJpYWw6IDgyNTAvMTY1NTAgZHJpdmVyLCA0IHBvcnRzLCBJUlEgc2hhcmluZyBl
bmFibGVkClsgICAgMC45Mjc0NjVdIDQ0ZTA5MDAwLnNlcmlhbDogdHR5TzAgYXQgTU1JTyAweDQ0
ZTA5MDAwIChpcnEgPSA4OCwgYmFzZV9iYXVkID0gMzAwMDAwMCkgaXMgYSBPTUFQIFVBUlQwClsg
ICAgMS41ODQyMDRdIGNvbnNvbGUgW3R0eU8wXSBlbmFibGVkClsgICAgMS41OTQzMzldIG9tYXBf
cm5nIDQ4MzEwMDAwLnJuZzogT01BUCBSYW5kb20gTnVtYmVyIEdlbmVyYXRvciB2ZXIuIDIwClsg
ICAgMS42MzY4MDVdIGJyZDogbW9kdWxlIGxvYWRlZApbICAgIDEuNjYxMDA0XSBsb29wOiBtb2R1
bGUgbG9hZGVkClsgICAgMS42NzQwMDBdIG10ZG9vcHM6IG10ZCBkZXZpY2UgKG10ZGRldj1uYW1l
L251bWJlcikgbXVzdCBiZSBzdXBwbGllZApbICAgIDEuNjkzMzc3XSB1c2Jjb3JlOiByZWdpc3Rl
cmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGFzaXgKWyAgICAxLjcwMDEyMF0gdXNiY29yZTogcmVn
aXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBheDg4MTc5XzE3OGEKWyAgICAxLjcwNzYxMV0g
dXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBjZGNfZXRoZXIKWyAgICAx
LjcxNDMwM10gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciByODE1eApb
ICAgIDEuNzIxMTAxXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHNt
c2M5NXh4ClsgICAgMS43MjgwMDZdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBk
cml2ZXIgbmV0MTA4MApbICAgIDEuNzM0NDU0XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRl
cmZhY2UgZHJpdmVyIGNkY19zdWJzZXQKWyAgICAxLjc0MTMzOF0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB6YXVydXMKWyAgICAxLjc0Nzk0Ml0gdXNiY29yZTogcmVn
aXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBjZGNfbmNtClsgICAgMS43NTc5NzNdIGVoY2lf
aGNkOiBVU0IgMi4wICdFbmhhbmNlZCcgSG9zdCBDb250cm9sbGVyIChFSENJKSBEcml2ZXIKWyAg
ICAxLjc2NTAwOV0gZWhjaS1vbWFwOiBPTUFQLUVIQ0kgSG9zdCBDb250cm9sbGVyIGRyaXZlcgpb
ICAgIDEuNzcyNzg3XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGNk
Y193ZG0KWyAgICAxLjc3OTc4Nl0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRy
aXZlciB1c2Itc3RvcmFnZQpbICAgIDEuNzg2OTc4XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBp
bnRlcmZhY2UgZHJpdmVyIHVzYnRlc3QKWyAgICAxLjc5NzYxOF0gbW91c2VkZXY6IFBTLzIgbW91
c2UgZGV2aWNlIGNvbW1vbiBmb3IgYWxsIG1pY2UKWyAgICAxLjgxMDY4Nl0gb21hcF9ydGMgNDRl
M2UwMDAucnRjOiBydGMgY29yZTogcmVnaXN0ZXJlZCA0NGUzZTAwMC5ydGMgYXMgcnRjMApbICAg
IDEuODE4NDU5XSA0NGUzZTAwMC5ydGM6IGFscmVhZHkgcnVubmluZwpbICAgIDEuODI0NTMxXSBp
MmMgL2RldiBlbnRyaWVzIGRyaXZlcgpbICAgIDEuODI5MDgwXSBEcml2ZXIgZm9yIDEtd2lyZSBE
YWxsYXMgbmV0d29yayBwcm90b2NvbC4KWyAgICAxLjg0MDczOV0gb21hcF93ZHQ6IE9NQVAgV2F0
Y2hkb2cgVGltZXIgUmV2IDB4MDE6IGluaXRpYWwgdGltZW91dCA2MCBzZWMKWyAgICAxLjg1MzMz
N10gZWRtYS1kbWEtZW5naW5lIGVkbWEtZG1hLWVuZ2luZS4wOiBhbGxvY2F0ZWQgY2hhbm5lbCBm
b3IgMDoyNQpbICAgIDEuODYwODEyXSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6
IGFsbG9jYXRlZCBjaGFubmVsIGZvciAwOjI0ClsgICAgMS44NjgxODNdIG9tYXBfaHNtbWMgNDgw
NjAwMDAubW1jOiB2bW1jIHJlZ3VsYXRvciBtaXNzaW5nClsgICAgMS44NzQ0NDVdIGVkbWEtZG1h
LWVuZ2luZSBlZG1hLWRtYS1lbmdpbmUuMDogZnJlZWluZyBjaGFubmVsIGZvciAyNApbICAgIDEu
ODgxMzA1XSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6IGZyZWVpbmcgY2hhbm5l
bCBmb3IgMjUKWyAgICAxLjg4ODI1NF0gcGxhdGZvcm0gNDgwNjAwMDAubW1jOiBEcml2ZXIgb21h
cF9oc21tYyByZXF1ZXN0cyBwcm9iZSBkZWZlcnJhbApbICAgIDEuOTAzMDgzXSBsZWR0cmlnLWNw
dTogcmVnaXN0ZXJlZCB0byBpbmRpY2F0ZSBhY3Rpdml0eSBvbiBDUFVzClsgICAgMS45MTAzMTBd
IGVkbWEtZG1hLWVuZ2luZSBlZG1hLWRtYS1lbmdpbmUuMDogYWxsb2NhdGVkIGNoYW5uZWwgZm9y
IDA6MzYKWyAgICAxLjkxNzY1M10gb21hcC1zaGFtIDUzMTAwMDAwLnNoYW06IGh3IGFjY2VsIG9u
IE9NQVAgcmV2IDQuMwpbICAgIDEuOTI4NTU0XSBvbWFwLWFlcyA1MzUwMDAwMC5hZXM6IE9NQVAg
QUVTIGh3IGFjY2VsIHJldjogMy4yClsgICAgMS45MzQ2NzBdIGVkbWEtZG1hLWVuZ2luZSBlZG1h
LWRtYS1lbmdpbmUuMDogYWxsb2NhdGVkIGNoYW5uZWwgZm9yIDA6NQpbICAgIDEuOTQxOTkxXSBl
ZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6IGFsbG9jYXRlZCBjaGFubmVsIGZvciAw
OjYKWyAgICAxLjk1Mzc4OF0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZl
ciB1c2JoaWQKWyAgICAxLjk1OTg4OF0gdXNiaGlkOiBVU0IgSElEIGNvcmUgZHJpdmVyClsgICAg
MS45NzAxMjJdIG9wcm9maWxlOiBubyBwZXJmb3JtYW5jZSBjb3VudGVycwpbICAgIDEuOTc3OTU1
XSBvcHJvZmlsZTogdXNpbmcgdGltZXIgaW50ZXJydXB0LgpbICAgIDEuOTgzMjc2XSBUQ1A6IGN1
YmljIHJlZ2lzdGVyZWQKWyAgICAxLjk4Njk5MV0gSW5pdGlhbGl6aW5nIFhGUk0gbmV0bGluayBz
b2NrZXQKWyAgICAxLjk5MTc1MF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxNwpb
ICAgIDEuOTk2NjIyXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE1ClsgICAgMi4w
MDE3NjRdIEtleSB0eXBlIGRuc19yZXNvbHZlciByZWdpc3RlcmVkClsgICAgMi4wMDc3NjJdIGNw
dSBjcHUwOiBjcHUwIHJlZ3VsYXRvciBub3QgcmVhZHksIHJldHJ5ClsgICAgMi4wMTMxMjhdIHBs
YXRmb3JtIGNwdWZyZXEtY3B1MC4wOiBEcml2ZXIgY3B1ZnJlcS1jcHUwIHJlcXVlc3RzIHByb2Jl
IGRlZmVycmFsClsgICAgMi4wMjE0MjRdIFRodW1iRUUgQ1BVIGV4dGVuc2lvbiBzdXBwb3J0ZWQu
ClsgICAgMi4wNDAyNjZdIHRwczY1OTEwIDAtMDAyZDogTm8gaW50ZXJydXB0IHN1cHBvcnQsIG5v
IGNvcmUgSVJRClsgICAgMi4wNTUyODZdIHZydGM6IDE4MDAgbVYgClsgICAgMi4wNTkyNDRdIHZy
dGM6IHN1cHBsaWVkIGJ5IHZiYXQKWyAgICAyLjA2Njg1MV0gdmlvOiBhdCAxNTAwIG1WIApbICAg
IDIuMDcwMDk4XSB2aW86IHN1cHBsaWVkIGJ5IHZiYXQKWyAgICAyLjA3NzA0OV0gdmRkX21wdTog
OTEyIDwtLT4gMTMxMiBtViBhdCAxMTM3IG1WIApbICAgIDIuMDgyMjA2XSB2ZGRfbXB1OiBzdXBw
bGllZCBieSB2YmF0ClsgICAgMi4wODk0NzhdIHZkZF9jb3JlOiA5MTIgPC0tPiAxMTUwIG1WIGF0
IDExMzcgbVYgClsgICAgMi4wOTQ3MDBdIHZkZF9jb3JlOiBzdXBwbGllZCBieSB2YmF0ClsgICAg
Mi4xMDE0OTZdIHZkZDM6IDUwMDAgbVYgClsgICAgMi4xMDcyOTZdIHZkaWcxOiBhdCAxODAwIG1W
IApbICAgIDIuMTEwNzA5XSB2ZGlnMTogc3VwcGxpZWQgYnkgdmJhdApbICAgIDIuMTE3Njc2XSB2
ZGlnMjogYXQgMTgwMCBtViAKWyAgICAyLjEyMTA2M10gdmRpZzI6IHN1cHBsaWVkIGJ5IHZiYXQK
WyAgICAyLjEyNzkyNF0gdnBsbDogYXQgMTgwMCBtViAKWyAgICAyLjEzMTIyMF0gdnBsbDogc3Vw
cGxpZWQgYnkgdmJhdApbICAgIDIuMTM3OTk5XSB2ZGFjOiBhdCAxODAwIG1WIApbICAgIDIuMTQx
Mjk4XSB2ZGFjOiBzdXBwbGllZCBieSB2YmF0ClsgICAgMi4xNDgwNDddIHZhdXgxOiBhdCAxODAw
IG1WIApbICAgIDIuMTUxNDQ5XSB2YXV4MTogc3VwcGxpZWQgYnkgdmJhdApbICAgIDIuMTU4Mjk3
XSB2YXV4MjogYXQgMzMwMCBtViAKWyAgICAyLjE2MTY4OF0gdmF1eDI6IHN1cHBsaWVkIGJ5IHZi
YXQKWyAgICAyLjE2ODQ4NV0gdmF1eDMzOiBhdCAzMzAwIG1WIApbICAgIDIuMTcxOTU5XSB2YXV4
MzM6IHN1cHBsaWVkIGJ5IHZiYXQKWyAgICAyLjE3ODgxMl0gdm1tYzogMTgwMCA8LS0+IDMzMDAg
bVYgYXQgMzMwMCBtViAKWyAgICAyLjE4Mzc1MV0gdm1tYzogc3VwcGxpZWQgYnkgdmJhdApbICAg
IDIuMTkzMjA2XSBvbWFwX2kyYyA0NGUwYjAwMC5pMmM6IGJ1cyAwIHJldjAuMTEgYXQgNDAwIGtI
egpbICAgIDIuMjAwNzU5XSBlZG1hLWRtYS1lbmdpbmUgZWRtYS1kbWEtZW5naW5lLjA6IGFsbG9j
YXRlZCBjaGFubmVsIGZvciAwOjI1ClsgICAgMi4yMDgwOTVdIGVkbWEtZG1hLWVuZ2luZSBlZG1h
LWRtYS1lbmdpbmUuMDogYWxsb2NhdGVkIGNoYW5uZWwgZm9yIDA6MjQKWyAgICAyLjIxNjY1NV0g
b21hcF9oc21tYyA0ODA2MDAwMC5tbWM6IHBpbnMgYXJlIG5vdCBjb25maWd1cmVkIGZyb20gdGhl
IGRyaXZlcgpbICAgIDIuMzM1NTEzXSBkYXZpbmNpX21kaW8gNGExMDEwMDAubWRpbzogZGF2aW5j
aSBtZGlvIHJldmlzaW9uIDEuNgpbICAgIDIuMzQxOTQyXSBkYXZpbmNpX21kaW8gNGExMDEwMDAu
bWRpbzogZGV0ZWN0ZWQgcGh5IG1hc2sgZmZmZmZmZmMKWyAgICAyLjM1Mzg5Ml0gbGlicGh5OiA0
YTEwMTAwMC5tZGlvOiBwcm9iZWQKWyAgICAyLjM1ODI3N10gZGF2aW5jaV9tZGlvIDRhMTAxMDAw
Lm1kaW86IHBoeVswXTogZGV2aWNlIDRhMTAxMDAwLm1kaW86MDAsIGRyaXZlciBBdGhlcm9zIDgw
MzEgZXRoZXJuZXQKWyAgICAyLjM2ODQzMF0gZGF2aW5jaV9tZGlvIDRhMTAxMDAwLm1kaW86IHBo
eVsxXTogZGV2aWNlIDRhMTAxMDAwLm1kaW86MDEsIGRyaXZlciBBdGhlcm9zIDgwMzEgZXRoZXJu
ZXQKWyAgICAyLjM3ODYxNF0gRGV0ZWN0ZWQgTUFDSUQgPSBkNDo5NDphMTo4OToyYjphNgpbICAg
IDIuMzg5OTQ3XSBVbmhhbmRsZWQgZmF1bHQ6IGV4dGVybmFsIGFib3J0IG9uIG5vbi1saW5lZmV0
Y2ggKDB4MTAyOCkgYXQgMHhmYTFhYzE1MApbICAgIDIuMzk4MDE0XSBJbnRlcm5hbCBlcnJvcjog
OiAxMDI4IFsjMV0gU01QIEFSTQpbICAgIDIuNDAyNzc3XSBNb2R1bGVzIGxpbmtlZCBpbjoKWyAg
ICAyLjQwNjAwNV0gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgMy4x
Mi4wLXJjNS1nZWI3NjVhMyAjMQpbICAgIDIuNDEzNDEyXSB0YXNrOiBjZTA4MTQ0MCB0aTogY2Uw
ODIwMDAgdGFzay50aTogY2UwODIwMDAKWyAgICAyLjQxOTEwMl0gUEMgaXMgYXQgZ3Bpb19kZWJv
dW5jZSsweDc4LzB4MTJjClsgICAgMi40MjM2OTBdIExSIGlzIGF0IF9yYXdfc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSsweDQwLzB4NDQKWyAgICAyLjQyOTQ1NV0gcGMgOiBbPGMwMmYwMjI0Pl0gICAg
bHIgOiBbPGMwNTdlOGJjPl0gICAgcHNyOiA2MDAwMDE5MwpbICAgIDIuNDI5NDU1XSBzcCA6IGNl
MDgzZTAwICBpcCA6IDYwMDAwMTkzICBmcCA6IDAwMDAwMDI4ClsgICAgMi40NDE1MTNdIHIxMDog
MDAwMDAwMDIgIHI5IDogY2UzM2FjMDAgIHI4IDogMjAwMDAxMTMKWyAgICAyLjQ0NzAwMF0gcjcg
OiAwMDAwMDBhMCAgcjYgOiAwMDAwMDAwNCAgcjUgOiBjZTE1MGM2OCAgcjQgOiBjZTE1MGM4OApb
ICAgIDIuNDUzODU5XSByMyA6IGZhMWFjMTUwICByMiA6IGZhMWFjMDAwICByMSA6IGNlMDgzZGQ4
ICByMCA6IDAwMDAwMDAwClsgICAgMi40NjA3MThdIEZsYWdzOiBuWkN2ICBJUlFzIG9mZiAgRklR
cyBvbiAgTW9kZSBTVkNfMzIgIElTQSBBUk0gIFNlZ21lbnQga2VybmVsClsgICAgMi40Njg0ODZd
IENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogODAwMDQwMTkgIERBQzogMDAwMDAwMTcKWyAgICAy
LjQ3NDUyM10gUHJvY2VzcyBzd2FwcGVyLzAgKHBpZDogMSwgc3RhY2sgbGltaXQgPSAweGNlMDgy
MjQ4KQpbICAgIDIuNDgwODMzXSBTdGFjazogKDB4Y2UwODNlMDAgdG8gMHhjZTA4NDAwMCkKWyAg
ICAyLjQ4NTQxOV0gM2UwMDogYzAyZjAxYWMgY2UxNTBjODggMDAwMDAwMDYgMDAwMDAwMDAgYTAw
MDAxMTMgMDAwMDEzODggY2UzM2Q4MDAgYzAyZWRkNzAKWyAgICAyLjQ5NDAxM10gM2UyMDogY2Uz
NTUwZTggY2UzM2FjNDQgYzBmODdmYjAgY2UzNTUwMDAgMDAwMDAwMDEgYzA0NGViYjggY2UzNTUw
NTAgMDAwMDAwMDAKWyAgICAyLjUwMjYwNl0gM2U0MDogMDAwMDAwMDAgMDAwMDAwMDMgYzA0NGYw
ZjQgMDAwMDAwMDAgY2UxM2U0MTAgY2UxM2U0MDAgY2UxM2ZkYjAgMDAwMDAwMDAKWyAgICAyLjUx
MTIwMV0gM2U2MDogY2UxM2U0MTAgYzBlNTUzMzQgY2UxM2U0MTAgMDAwMDAwMDAgYzA5MDFlNDAg
YzA4ZTY4MjggY2UwODIwMDAgMDAwMDAwYmQKWyAgICAyLjUxOTc5NF0gM2U4MDogMDAwMDAwMDAg
YzAzNDhlN2MgYzAzNDhlNjQgYzAzNDdjZjggY2UxM2U0MTAgYzA4ZTY4MjggY2UxM2U0NDQgYzA5
MDFlNDAKWyAgICAyLjUyODM4N10gM2VhMDogMDAwMDAwMDAgYzAzNDdlYTggMDAwMDAwMDAgYzA4
ZTY4MjggYzAzNDdlMTQgYzAzNDYyYmMgY2UwMmEyYTggY2UxMTU3MTAKWyAgICAyLjUzNjk4MV0g
M2VjMDogYzA4ZTY4MjggY2UzMzljYzAgYzA4ZDNmNTAgYzAzNDczYTggYzA3MGUwZDAgYzA4ZTY4
MjggYzA4ZTY4MjggMDAwMDAwMDcKWyAgICAyLjU0NTU3NV0gM2VlMDogYzA4MzgxNjggYzA5MDFl
NDAgYzA4MjlkOTAgYzAzNDg0ZDAgMDAwMDAwMDAgYzA4NTJlYjQgMDAwMDAwMDcgYzAwMDg4MzgK
WyAgICAyLjU1NDE2OF0gM2YwMDogMDAwMDAwMDQgYzA4YjU5YTAgYzA4YjU5YTAgNjAwMDAxMTMg
YzAyY2I0MDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKWyAgICAyLjU2Mjc2MV0gM2YyMDog
MDAwMDAwMDAgYzA1N2UzY2MgMDAwMDAwMDIgY2UwODIwMDAgYzExOWEyZmUgYzA1Y2I1YTggMDAw
MDAwYmQgYzAwNjJjZTgKWyAgICAyLjU3MTM1NV0gM2Y0MDogYzA3YmE0OTAgMDAwMDAwMDcgYzEx
OWEzMDYgMDAwMDAwMDcgNjAwMDAxMTMgYzA4NTJlYjQgMDAwMDAwMDcgYzA4MzgxNjgKWyAgICAy
LjU3OTk0OF0gM2Y2MDogYzA5MDFlNDAgYzA3ZWU0NTggYzA4MzgxNzAgMDAwMDAwYmQgMDAwMDAw
MDAgYzA3ZWViYmMgMDAwMDAwMDcgMDAwMDAwMDcKWyAgICAyLjU4ODU0MV0gM2Y4MDogYzA3ZWU0
NTggMDAwMDAwMDAgMDAwMDAwMDAgYzA1NzQwODQgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAKWyAgICAyLjU5NzEzNV0gM2ZhMDogMDAwMDAwMDAgYzA1NzQwOGMgMDAwMDAwMDAg
YzAwMTNlNjggMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKWyAgICAyLjYwNTcy
OV0gM2ZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAw
MDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKWyAgICAyLjYxNDMyMl0gM2ZlMDogMDAwMDAwMDAgMDAw
MDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMTMgMDAwMDAwMDAgMzdlNzc3M2YgZmNmYmJm
ZWEKWyAgICAyLjYyMjkyNl0gWzxjMDJmMDIyND5dIChncGlvX2RlYm91bmNlKzB4NzgvMHgxMmMp
IGZyb20gWzxjMDJlZGQ3MD5dIChncGlvX3NldF9kZWJvdW5jZSsweDk0LzB4MTIwKQpbICAgIDIu
NjMyNTM1XSBbPGMwMmVkZDcwPl0gKGdwaW9fc2V0X2RlYm91bmNlKzB4OTQvMHgxMjApIGZyb20g
WzxjMDQ0ZWJiOD5dIChncGlvX2tleXNfcHJvYmUrMHgzODQvMHg3MzQpClsgICAgMi42NDI0MTRd
IFs8YzA0NGViYjg+XSAoZ3Bpb19rZXlzX3Byb2JlKzB4Mzg0LzB4NzM0KSBmcm9tIFs8YzAzNDhl
N2M+XSAocGxhdGZvcm1fZHJ2X3Byb2JlKzB4MTgvMHgxYykKWyAgICAyLjY1MjI5OV0gWzxjMDM0
OGU3Yz5dIChwbGF0Zm9ybV9kcnZfcHJvYmUrMHgxOC8weDFjKSBmcm9tIFs8YzAzNDdjZjg+XSAo
ZHJpdmVyX3Byb2JlX2RldmljZSsweDEwOC8weDIyNCkKWyAgICAyLjY2MjUzOV0gWzxjMDM0N2Nm
OD5dIChkcml2ZXJfcHJvYmVfZGV2aWNlKzB4MTA4LzB4MjI0KSBmcm9tIFs8YzAzNDdlYTg+XSAo
X19kcml2ZXJfYXR0YWNoKzB4OTQvMHg5OCkKWyAgICAyLjY3MjUwM10gWzxjMDM0N2VhOD5dIChf
X2RyaXZlcl9hdHRhY2grMHg5NC8weDk4KSBmcm9tIFs8YzAzNDYyYmM+XSAoYnVzX2Zvcl9lYWNo
X2RldisweDU0LzB4ODgpClsgICAgMi42ODIwMTBdIFs8YzAzNDYyYmM+XSAoYnVzX2Zvcl9lYWNo
X2RldisweDU0LzB4ODgpIGZyb20gWzxjMDM0NzNhOD5dIChidXNfYWRkX2RyaXZlcisweGQ4LzB4
MjZjKQpbICAgIDIuNjkxNTE4XSBbPGMwMzQ3M2E4Pl0gKGJ1c19hZGRfZHJpdmVyKzB4ZDgvMHgy
NmMpIGZyb20gWzxjMDM0ODRkMD5dIChkcml2ZXJfcmVnaXN0ZXIrMHg3OC8weGY0KQpbICAgIDIu
NzAwOTQwXSBbPGMwMzQ4NGQwPl0gKGRyaXZlcl9yZWdpc3RlcisweDc4LzB4ZjQpIGZyb20gWzxj
MDAwODgzOD5dIChkb19vbmVfaW5pdGNhbGwrMHhlNC8weDE0OCkKWyAgICAyLjcxMDQ1Ml0gWzxj
MDAwODgzOD5dIChkb19vbmVfaW5pdGNhbGwrMHhlNC8weDE0OCkgZnJvbSBbPGMwN2VlYmJjPl0g
KGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4ZmMvMHgxY2MpClsgICAgMi43MjA1MTFdIFs8YzA3ZWVi
YmM+XSAoa2VybmVsX2luaXRfZnJlZWFibGUrMHhmYy8weDFjYykgZnJvbSBbPGMwNTc0MDhjPl0g
KGtlcm5lbF9pbml0KzB4OC8weGU0KQpbICAgIDIuNzMwMDMxXSBbPGMwNTc0MDhjPl0gKGtlcm5l
bF9pbml0KzB4OC8weGU0KSBmcm9tIFs8YzAwMTNlNjg+XSAocmV0X2Zyb21fZm9yaysweDE0LzB4
MmMpClsgICAgMi43Mzg4MDhdIENvZGU6IGU1OTQzMDljIGU1MTQyMDcwIGUxZDMzMWJlIGUwODIz
MDAzIChlNTkzMjAwMCkgClsgICAgMi43NDUyMjZdIC0tLVsgZW5kIHRyYWNlIGEwYzcyODg3ZjUy
MGMzYTYgXS0tLQpbICAgIDIuNzUwMzg4XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0
ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwYgpbICAgIDIuNzUwMzg4XSAK

--001a11c38fc2e3497104e947adfa--
