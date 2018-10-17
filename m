Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36C90E00BC4; Tue, 16 Oct 2018 21:06:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4008CE00B9F
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 21:06:40 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id o17-v6so28557211qtr.1
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 21:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4Gu9c4yYsnGM69EOjhQn9W9VbFnwcDNBPdcT1vEya50=;
	b=i0bGvjWNmHCyTTh4P20uWk1XiQyeMw5U9KwJhfMqj5HQsyZkwGlM9QW4YE4vyPx4uf
	VBeoynHus+jj9fRdq12tcqn0GtV7XQOqp59cdc/1wTakw3uMVs8n464yJZqCz9LiUr8u
	C1Tp2nfTwXRZsb3giGG+M9MTzdcih9lqD6Iju099/86jQZpqHdgkb1TKKsSPS5+OMQXc
	5hSfmCLjNyhrENZ5Kr7+v3Bt09w1eToNwWvWm39+epa1w9rge3+mQgWQSiX6UTUDMNpd
	t3uN1tfpAzWexKmURdWW7uy4p4JB8VeqzjCDvvfZeYU+TZuGUZB7YuPmX5ho11qb2beQ
	9bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4Gu9c4yYsnGM69EOjhQn9W9VbFnwcDNBPdcT1vEya50=;
	b=FGhHsP/NNATSBx555iEIYuOPpKhOpDrC6i66YbCejOVbNqI1FX9arOZqkkcQ1aGyrf
	3oA3Mt9uRMJXvC66quTwk1A39Dn5XDd12q7CgiSUrhuryHsVz7BGy8GYm19joVsc8t5d
	f0WP/nw5WzRU78u9+9naXODMqptgB7gHpqzcTJlvdyXN8zVXVdVrpB7ghxJKg8BsXR93
	Ep/zYYXRZ8DBQud2IhKW0PtbpvxYvHeYa/M3YyULKRsYLtSHW1GGUUS79JSO8aQxvCZF
	HFCCaGXQOpEWctLfTOJaLmt56882qTnX0HuFyB1cKTN9zb0blKJflIz0q0bjArXZhdqL
	L+cQ==
X-Gm-Message-State: ABuFfoj1tJemS0RkMQg/TcAkiH34vdgpMTSwqIr8pMtxykO30kG4Y7rw
	wIrVHUtft1XNDcNKVr/YW07UknJrl8Vs4GJto/Y=
X-Google-Smtp-Source: ACcGV625taUTRUS9CsxgKy46L5biI0OnJRw0DSbA/oVWWOvLZwMWvSvy4YtiUsOEee4f66wVDDPtAx6QzeTnZSwZyjg=
X-Received: by 2002:a0c:98a6:: with SMTP id f35mr8973002qvd.224.1539749199280; 
	Tue, 16 Oct 2018 21:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl> <20181016183828.GK14250@beryl>
	<20181016185925.GO1032@bill-the-cat>
	<9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
In-Reply-To: <9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 21:06:27 -0700
Message-ID: <CAMKF1srteMQK0AC0Dj2hQ5z3ouzD7HsfTS5Yjg=-wcDTj4+z=A@mail.gmail.com>
To: yamada.masahiro@socionext.com
Cc: meta-ti@yoctoproject.org, trini@konsulko.com
Subject: Re: [PATCH] beaglebone.conf: temporarily use generic am335x_evm_config for U-boot
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
X-List-Received-Date: Wed, 17 Oct 2018 04:06:42 -0000
Content-Type: multipart/alternative; boundary="00000000000010fdcd057864cced"

--00000000000010fdcd057864cced
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 7:39 PM <yamada.masahiro@socionext.com> wrote:

> Hi.
>
> > -----Original Message-----
> > From: Tom Rini [mailto:trini@konsulko.com]
> > Sent: Wednesday, October 17, 2018 3:59 AM
> > To: Denys Dmytriyenko <denys@ti.com>; Yamada, Masahiro/=E5=B1=B1=E7=94=
=B0 =E7=9C=9F=E5=BC=98
> > <yamada.masahiro@socionext.com>
> > Cc: Khem Raj <raj.khem@gmail.com>; meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] beaglebone.conf: temporarily use generic
> > am335x_evm_config for U-boot
> >
> > On Tue, Oct 16, 2018 at 02:38:28PM -0400, Denys Dmytriyenko wrote:
> > > On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriyenko wrote:
> > > > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com>
> wrote:
> > > > > >
> > > > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <
> denys@ti.com>
> > wrote:
> > > > > > > >
> > > > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <
> denys@ti.com>
> > wrote:
> > > > > > > > > >
> > > > > > > > > > There have been reports recently that
> am335x_beaglebone_config
> > generates bad SPL.
> > > > > > > > > > Until that is debugged and fixed, use generic
> am335x_evm_config
> > that covers all
> > > > > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > it fails to link
> > > > > > > > >
> > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section
> `.rodata'
> > will not
> > > > > > > > > fit in region `.sram'
> > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed
> > by 5772 bytes
> > > > > > > > > | make[2]: ***
> > [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-stag
> > ing/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > > > > spl/u-boot-spl] Error 1
> > > > > > > >
> > > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from
> oe-core,
> > as well as
> > > > > > > > Linaro gcc7 - no problems.
> > > > > > >
> > > > > > > My distro inherits poky policies, and on master it now inheri=
ts
> > > > > > > hardening policies ( security flags) by defaults
> > > > > > > do you happen to test poky ?
> > > > > >
> > > > > > I think we want to take a look at which of the security flags
> really
> > > > > > make sense to use in this context.  Thanks!
> > > > > >
> > > > >
> > > > > there could be more to it, since the distro uses thumb2 ISA by
> > > > > default, I am not sure
> > > > > if u-boot overrides that and builds using arm mode ISA always but
> > > > > something to consider, I saw several reports about u-boot
> overflowing
> > > > > sram sections and most of
> > > > > the solutions were "oh it works for me" or at the best your
> toolchain
> > > > > is different then mine. here is mine use it and move on.
> > > >
> > > > Khem,
> > > >
> > > > Well, FWIW, Tom and I are very familiar with this issue. As a matte=
r
> > of fact,
> > > > I first encountered it almost 2 years ago and had to prove there's
> such
> > an
> > > > issue, because everyone was saying it works for them, something mus=
t
> > be wrong
> > > > with my OE builds... :)
> > > >
> > > > While .sram region is very limited, the issue is exacerbated by the
> > fact that
> > > > all debug symbols from macros like __FILE__ are ended up in that
> section
> > as
> > > > well. So, the longer your build path, the larger the section become=
s.
> > Once I
> > > > had instructions to reproduce the failure here internally with a
> series
> > of
> > > > long-named nested directories like aaaaaa and bbbbbb, Nishanth
> started
> > this
> > > > thread on U-boot mailing list:
> > > > https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> > > >
> > > > We've had the corresponding bug open internally all this time, whil=
e
> > adding
> > > > workarounds to limit .sram section size by other means, like
> disabling
> > some
> > > > options to reduce the code size. Your patch is one of those
> workarounds...
> > > >
> > > > But we've been patiently waiting for the following feature to come
> into
> > gcc to
> > > > fix the issue properly:
> > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> > > >
> > > > Since it's now part of gcc8, we should be able to use it. Not sure
> how
> > to keep
> > > > gcc7 backward compatibility though...
> > >
> > > BTW, there were few attempts to "fix" it in U-boot as well, such as
> [1],
> > but I
> > > don't believe they got accepted. Tom?
> > >
> > > [1] https://patchwork.ozlabs.org/cover/825356/
> >
> > I think the end result was waiting on the kernel community to agree on =
a
> > path forward for Kbuild and then bring that back.
>
>
>
> U-Boot now supports -fmacro-prefix-map, so GCC 8 is OK.
> (see commit 1eb2e71ed)
>
> For GCC 7 or older, sorry, I have no idea what to do.
> My patch set [1] was an ugly hack,
> and wrong in the first place.
>
> What I can suggest is, please use GCC 8.


Yeah I saw that but this patch is not their in 2018.01 release that TI fork
is based on regardless I backported this patch to this version it did not
bring the size below mark
I think it=E2=80=99s because we are using hardened toolchain and that enalb=
les
extra options to enable pie and ssp since these options get added to CC
they get passed into uboot straight

I think we should just disable security flags for u boot in OE and may be
uboot make system should append fno-pie fno-stack-protector to nullify
these options

>
>
> Thanks.
>
>

--00000000000010fdcd057864cced
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue,=
 Oct 16, 2018 at 7:39 PM &lt;<a href=3D"mailto:yamada.masahiro@socionext.co=
m">yamada.masahiro@socionext.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Tom Rini [mailto:<a href=3D"mailto:trini@konsulko.com" target=3D=
"_blank">trini@konsulko.com</a>]<br>
&gt; Sent: Wednesday, October 17, 2018 3:59 AM<br>
&gt; To: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_b=
lank">denys@ti.com</a>&gt;; Yamada, Masahiro/=E5=B1=B1=E7=94=B0 =E7=9C=9F=
=E5=BC=98<br>
&gt; &lt;<a href=3D"mailto:yamada.masahiro@socionext.com" target=3D"_blank"=
>yamada.masahiro@socionext.com</a>&gt;<br>
&gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;; <a href=3D"mailto:meta-ti@yoctoproject.org" =
target=3D"_blank">meta-ti@yoctoproject.org</a><br>
&gt; Subject: Re: [meta-ti] [PATCH] beaglebone.conf: temporarily use generi=
c<br>
&gt; am335x_evm_config for U-boot<br>
&gt; <br>
&gt; On Tue, Oct 16, 2018 at 02:38:28PM -0400, Denys Dmytriyenko wrote:<br>
&gt; &gt; On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriyenko wrote=
:<br>
&gt; &gt; &gt; On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:<br=
>
&gt; &gt; &gt; &gt; On Tue, Oct 16, 2018 at 9:42 AM Tom Rini &lt;<a href=3D=
"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wr=
ote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytri=
yenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a=
>&gt;<br>
&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Sat, Oct 13, 2018 at 01:17:12AM -0700=
, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Fri, Oct 12, 2018 at 8:00 PM Den=
ys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@=
ti.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; There have been reports recent=
ly that am335x_beaglebone_config<br>
&gt; generates bad SPL.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Until that is debugged and fix=
ed, use generic am335x_evm_config<br>
&gt; that covers all<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; AM335x platforms, including Be=
agleBone variants.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; it fails to link<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; | arm-yoe-linux-gnueabi-ld.bfd: u-b=
oot-spl section `.rodata&#39;<br>
&gt; will not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; fit in region `.sram&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; | arm-yoe-linux-gnueabi-ld.bfd: reg=
ion `.sram&#39; overflowed<br>
&gt; by 5772 bytes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; | make[2]: ***<br>
&gt; [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-stag=
<br>
&gt; ing/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; spl/u-boot-spl] Error 1<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; FWIW, just built u-boot-ti-staging with =
gcc7 and gcc8 from oe-core,<br>
&gt; as well as<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Linaro gcc7 - no problems.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; My distro inherits poky policies, and on mast=
er it now inherits<br>
&gt; &gt; &gt; &gt; &gt; &gt; hardening policies ( security flags) by defau=
lts<br>
&gt; &gt; &gt; &gt; &gt; &gt; do you happen to test poky ?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I think we want to take a look at which of the sec=
urity flags really<br>
&gt; &gt; &gt; &gt; &gt; make sense to use in this context.=C2=A0 Thanks!<b=
r>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; there could be more to it, since the distro uses thumb2=
 ISA by<br>
&gt; &gt; &gt; &gt; default, I am not sure<br>
&gt; &gt; &gt; &gt; if u-boot overrides that and builds using arm mode ISA =
always but<br>
&gt; &gt; &gt; &gt; something to consider, I saw several reports about u-bo=
ot overflowing<br>
&gt; &gt; &gt; &gt; sram sections and most of<br>
&gt; &gt; &gt; &gt; the solutions were &quot;oh it works for me&quot; or at=
 the best your toolchain<br>
&gt; &gt; &gt; &gt; is different then mine. here is mine use it and move on=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Khem,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Well, FWIW, Tom and I are very familiar with this issue. As =
a matter<br>
&gt; of fact,<br>
&gt; &gt; &gt; I first encountered it almost 2 years ago and had to prove t=
here&#39;s such<br>
&gt; an<br>
&gt; &gt; &gt; issue, because everyone was saying it works for them, someth=
ing must<br>
&gt; be wrong<br>
&gt; &gt; &gt; with my OE builds... :)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; While .sram region is very limited, the issue is exacerbated=
 by the<br>
&gt; fact that<br>
&gt; &gt; &gt; all debug symbols from macros like __FILE__ are ended up in =
that section<br>
&gt; as<br>
&gt; &gt; &gt; well. So, the longer your build path, the larger the section=
 becomes.<br>
&gt; Once I<br>
&gt; &gt; &gt; had instructions to reproduce the failure here internally wi=
th a series<br>
&gt; of<br>
&gt; &gt; &gt; long-named nested directories like aaaaaa and bbbbbb, Nishan=
th started<br>
&gt; this<br>
&gt; &gt; &gt; thread on U-boot mailing list:<br>
&gt; &gt; &gt; <a href=3D"https://lists.denx.de/pipermail/u-boot/2017-March=
/285031.html" rel=3D"noreferrer" target=3D"_blank">https://lists.denx.de/pi=
permail/u-boot/2017-March/285031.html</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We&#39;ve had the corresponding bug open internally all this=
 time, while<br>
&gt; adding<br>
&gt; &gt; &gt; workarounds to limit .sram section size by other means, like=
 disabling<br>
&gt; some<br>
&gt; &gt; &gt; options to reduce the code size. Your patch is one of those =
workarounds...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; But we&#39;ve been patiently waiting for the following featu=
re to come into<br>
&gt; gcc to<br>
&gt; &gt; &gt; fix the issue properly:<br>
&gt; &gt; &gt; <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70=
268" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show=
_bug.cgi?id=3D70268</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Since it&#39;s now part of gcc8, we should be able to use it=
. Not sure how<br>
&gt; to keep<br>
&gt; &gt; &gt; gcc7 backward compatibility though...<br>
&gt; &gt;<br>
&gt; &gt; BTW, there were few attempts to &quot;fix&quot; it in U-boot as w=
ell, such as [1],<br>
&gt; but I<br>
&gt; &gt; don&#39;t believe they got accepted. Tom?<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://patchwork.ozlabs.org/cover/825356/" rel=3D=
"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/cover/825356/</=
a><br>
&gt; <br>
&gt; I think the end result was waiting on the kernel community to agree on=
 a<br>
&gt; path forward for Kbuild and then bring that back.<br>
<br>
<br>
<br>
U-Boot now supports -fmacro-prefix-map, so GCC 8 is OK.<br>
(see commit 1eb2e71ed)<br>
<br>
For GCC 7 or older, sorry, I have no idea what to do.<br>
My patch set [1] was an ugly hack,<br>
and wrong in the first place.<br>
<br>
What I can suggest is, please use GCC 8.</blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Yeah I saw that but this patch is not their in 2018=
.01 release that TI fork is based on regardless I backported this patch to =
this version it did not bring the size below mark</div><div dir=3D"auto">I =
think it=E2=80=99s because we are using hardened toolchain and that enalble=
s extra options to enable pie and ssp since these options get added to CC t=
hey get passed into uboot straight=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">I think we should just disable security flags for u boot i=
n OE and may be uboot make system should append fno-pie fno-stack-protector=
 to nullify these options</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Thanks.<br>
<br>
</blockquote></div></div>

--00000000000010fdcd057864cced--
