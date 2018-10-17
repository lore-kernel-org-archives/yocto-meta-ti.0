Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30BCCE00AB9; Wed, 17 Oct 2018 08:01:27 -0700 (PDT)
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
	*      [209.85.160.194 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82C10E00A94
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 08:01:24 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id o17-v6so30409855qtr.1
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 08:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RpUnArepLcT63lUoAXC7F2frAEsSCg2IgNKQrLoX6xA=;
	b=smWdZ8VBakz4zOlmBHooDiCL6DSGo5MzhsTTsZc5c5arRv+cm1Q3pNVOhcrAGHfoIw
	rEVUxMP/76vkyLhJ7AV8OLRM24XL+iwBDbXgn54bKDPjzkalu7J40N8dZa7IeWWk5lHg
	G5V7b9tBZ8RviK44bU6IJYQq7Sp1+Irn47NyUSEyOsjUsK9jfGbVhvqUJtwlYWdkH8PI
	x/kHvNuDD1GCFBy9MYJ54niOuVsNn0K7DMQHjiU6UBfOfiG1+0U6fL45qz+vW8iacW7n
	KS8GdKkacEYRj1uY1oviPy2NE3VoUt7cGN+w9Wpy75eKQiryk9K1cNVVTUkIDYEREWDc
	rdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RpUnArepLcT63lUoAXC7F2frAEsSCg2IgNKQrLoX6xA=;
	b=rOlyjCkiw3FzJaenkRr3K/Oded/fbf6WywkMnPcvLhlEHiSJq49EaQCbNKnhYpwy8T
	QAiZiKQ9t1BUIK4au48KMYAu9oSNrAnSNaPXO1Z45sODdHBKu9Oyex02D1f0q+G2jLyC
	a68TUPYBVta7LdTW55dC2Fy/Nf03u4NOyOTDhQYepkNhrNotJSK2g6ArhgMW3OJBA8eC
	kzCPLx/mQjrUBjT7YcAA1EDG1Imp2ol1wa2ZoC6bSgzoIXK/s5MoUeEEOKXUau74cR1z
	wBCUUprT2h8EiDuWw3/p1XFUVBJxwQfSESYDaEoMPum4OwoIUUisaMfukpt9QDDD8mj/
	OS/A==
X-Gm-Message-State: ABuFfoiwiLJfS6z/OVLF95Obscyu2pu0M6vbWGz9XSUCoMa+U0M417IW
	onWBd8Yxd8B+HlHr7UPN6JIYnLv5eO5jVGAV5uA=
X-Google-Smtp-Source: ACcGV6188K9n9c0O/PgzcLUHkgXvcW+kQtMogkNQoofRjN5PdG0XKlewM5212A2F3UyPm+df/z17Cg3LzEXxQpnuzIY=
X-Received: by 2002:a0c:d585:: with SMTP id
	g5-v6mr26468048qvi.50.1539788483598; 
	Wed, 17 Oct 2018 08:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl> <20181016183828.GK14250@beryl>
	<20181016185925.GO1032@bill-the-cat>
	<9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
	<CAMKF1srteMQK0AC0Dj2hQ5z3ouzD7HsfTS5Yjg=-wcDTj4+z=A@mail.gmail.com>
	<20181017112615.GT1032@bill-the-cat>
In-Reply-To: <20181017112615.GT1032@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 08:00:52 -0700
Message-ID: <CAMKF1srPbZ_8XKeKt=aMSrHCPZNAQULb4P8atahBLjm21Zvb9g@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: meta-ti@yoctoproject.org, yamada.masahiro@socionext.com
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
X-List-Received-Date: Wed, 17 Oct 2018 15:01:27 -0000
Content-Type: multipart/alternative; boundary="000000000000981ffd05786df181"

--000000000000981ffd05786df181
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 4:26 AM Tom Rini <trini@konsulko.com> wrote:

> On Tue, Oct 16, 2018 at 09:06:27PM -0700, Khem Raj wrote:
> > On Tue, Oct 16, 2018 at 7:39 PM <yamada.masahiro@socionext.com> wrote:
> >
> > > Hi.
> > >
> > > > -----Original Message-----
> > > > From: Tom Rini [mailto:trini@konsulko.com]
> > > > Sent: Wednesday, October 17, 2018 3:59 AM
> > > > To: Denys Dmytriyenko <denys@ti.com>; Yamada, Masahiro/=E5=B1=B1=E7=
=94=B0 =E7=9C=9F=E5=BC=98
> > > > <yamada.masahiro@socionext.com>
> > > > Cc: Khem Raj <raj.khem@gmail.com>; meta-ti@yoctoproject.org
> > > > Subject: Re: [meta-ti] [PATCH] beaglebone.conf: temporarily use
> generic
> > > > am335x_evm_config for U-boot
> > > >
> > > > On Tue, Oct 16, 2018 at 02:38:28PM -0400, Denys Dmytriyenko wrote:
> > > > > On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriyenko wrote=
:
> > > > > > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > > > > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com>
> > > wrote:
> > > > > > > >
> > > > > > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > > > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <
> > > denys@ti.com>
> > > > wrote:
> > > > > > > > > >
> > > > > > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrot=
e:
> > > > > > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <
> > > denys@ti.com>
> > > > wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > There have been reports recently that
> > > am335x_beaglebone_config
> > > > generates bad SPL.
> > > > > > > > > > > > Until that is debugged and fixed, use generic
> > > am335x_evm_config
> > > > that covers all
> > > > > > > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > it fails to link
> > > > > > > > > > >
> > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section
> > > `.rodata'
> > > > will not
> > > > > > > > > > > fit in region `.sram'
> > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram'
> overflowed
> > > > by 5772 bytes
> > > > > > > > > > > | make[2]: ***
> > > >
> [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-stag
> > > > ing/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > > > > > > spl/u-boot-spl] Error 1
> > > > > > > > > >
> > > > > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8
> from
> > > oe-core,
> > > > as well as
> > > > > > > > > > Linaro gcc7 - no problems.
> > > > > > > > >
> > > > > > > > > My distro inherits poky policies, and on master it now
> inherits
> > > > > > > > > hardening policies ( security flags) by defaults
> > > > > > > > > do you happen to test poky ?
> > > > > > > >
> > > > > > > > I think we want to take a look at which of the security fla=
gs
> > > really
> > > > > > > > make sense to use in this context.  Thanks!
> > > > > > > >
> > > > > > >
> > > > > > > there could be more to it, since the distro uses thumb2 ISA b=
y
> > > > > > > default, I am not sure
> > > > > > > if u-boot overrides that and builds using arm mode ISA always
> but
> > > > > > > something to consider, I saw several reports about u-boot
> > > overflowing
> > > > > > > sram sections and most of
> > > > > > > the solutions were "oh it works for me" or at the best your
> > > toolchain
> > > > > > > is different then mine. here is mine use it and move on.
> > > > > >
> > > > > > Khem,
> > > > > >
> > > > > > Well, FWIW, Tom and I are very familiar with this issue. As a
> matter
> > > > of fact,
> > > > > > I first encountered it almost 2 years ago and had to prove
> there's
> > > such
> > > > an
> > > > > > issue, because everyone was saying it works for them, something
> must
> > > > be wrong
> > > > > > with my OE builds... :)
> > > > > >
> > > > > > While .sram region is very limited, the issue is exacerbated by
> the
> > > > fact that
> > > > > > all debug symbols from macros like __FILE__ are ended up in tha=
t
> > > section
> > > > as
> > > > > > well. So, the longer your build path, the larger the section
> becomes.
> > > > Once I
> > > > > > had instructions to reproduce the failure here internally with =
a
> > > series
> > > > of
> > > > > > long-named nested directories like aaaaaa and bbbbbb, Nishanth
> > > started
> > > > this
> > > > > > thread on U-boot mailing list:
> > > > > > https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> > > > > >
> > > > > > We've had the corresponding bug open internally all this time,
> while
> > > > adding
> > > > > > workarounds to limit .sram section size by other means, like
> > > disabling
> > > > some
> > > > > > options to reduce the code size. Your patch is one of those
> > > workarounds...
> > > > > >
> > > > > > But we've been patiently waiting for the following feature to
> come
> > > into
> > > > gcc to
> > > > > > fix the issue properly:
> > > > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> > > > > >
> > > > > > Since it's now part of gcc8, we should be able to use it. Not
> sure
> > > how
> > > > to keep
> > > > > > gcc7 backward compatibility though...
> > > > >
> > > > > BTW, there were few attempts to "fix" it in U-boot as well, such =
as
> > > [1],
> > > > but I
> > > > > don't believe they got accepted. Tom?
> > > > >
> > > > > [1] https://patchwork.ozlabs.org/cover/825356/
> > > >
> > > > I think the end result was waiting on the kernel community to agree
> on a
> > > > path forward for Kbuild and then bring that back.
> > >
> > >
> > >
> > > U-Boot now supports -fmacro-prefix-map, so GCC 8 is OK.
> > > (see commit 1eb2e71ed)
> > >
> > > For GCC 7 or older, sorry, I have no idea what to do.
> > > My patch set [1] was an ugly hack,
> > > and wrong in the first place.
> > >
> > > What I can suggest is, please use GCC 8.
> >
> >
> > Yeah I saw that but this patch is not their in 2018.01 release that TI
> fork
> > is based on regardless I backported this patch to this version it did n=
ot
> > bring the size below mark
> > I think it=E2=80=99s because we are using hardened toolchain and that e=
nalbles
> > extra options to enable pie and ssp since these options get added to CC
> > they get passed into uboot straight
> >
> > I think we should just disable security flags for u boot in OE and may =
be
> > uboot make system should append fno-pie fno-stack-protector to nullify
> > these options
>
> OK, do you want to submit a patch for that or should I do one and just
> Suggested-by you?  Thanks!


This would not be acceptable change since it changes how we build gcc
itself secondly it does not happen for master uboot

However if this works then we need to understand why it increas e the size



>
> --
> Tom
>

--000000000000981ffd05786df181
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Oct 17, 2018 at 4:26 AM Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com"=
>trini@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Tue, Oct 16, 2018 at 09:06:27PM -0700, Khem Raj wrote:<br>
&gt; On Tue, Oct 16, 2018 at 7:39 PM &lt;<a href=3D"mailto:yamada.masahiro@=
socionext.com" target=3D"_blank">yamada.masahiro@socionext.com</a>&gt; wrot=
e:<br>
&gt; <br>
&gt; &gt; Hi.<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Tom Rini [mailto:<a href=3D"mailto:trini@konsulko.com"=
 target=3D"_blank">trini@konsulko.com</a>]<br>
&gt; &gt; &gt; Sent: Wednesday, October 17, 2018 3:59 AM<br>
&gt; &gt; &gt; To: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" ta=
rget=3D"_blank">denys@ti.com</a>&gt;; Yamada, Masahiro/=E5=B1=B1=E7=94=B0 =
=E7=9C=9F=E5=BC=98<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:yamada.masahiro@socionext.com" target=
=3D"_blank">yamada.masahiro@socionext.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;; <a href=3D"mailto:meta-ti@yoctopro=
ject.org" target=3D"_blank">meta-ti@yoctoproject.org</a><br>
&gt; &gt; &gt; Subject: Re: [meta-ti] [PATCH] beaglebone.conf: temporarily =
use generic<br>
&gt; &gt; &gt; am335x_evm_config for U-boot<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, Oct 16, 2018 at 02:38:28PM -0400, Denys Dmytriyenko =
wrote:<br>
&gt; &gt; &gt; &gt; On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriy=
enko wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Tue, Oct 16, 2018 at 9:42 AM Tom Rini &lt;=
<a href=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.com<=
/a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Sun, Oct 14, 2018 at 10:07:45PM -0700=
, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Sun, Oct 14, 2018 at 12:24 PM De=
nys Dmytriyenko &lt;<br>
&gt; &gt; <a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a=
>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Sat, Oct 13, 2018 at 01:17:=
12AM -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Fri, Oct 12, 2018 at 8=
:00 PM Denys Dmytriyenko &lt;<br>
&gt; &gt; <a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a=
>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; There have been repo=
rts recently that<br>
&gt; &gt; am335x_beaglebone_config<br>
&gt; &gt; &gt; generates bad SPL.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Until that is debugg=
ed and fixed, use generic<br>
&gt; &gt; am335x_evm_config<br>
&gt; &gt; &gt; that covers all<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; AM335x platforms, in=
cluding BeagleBone variants.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; it fails to link<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; | arm-yoe-linux-gnueabi-l=
d.bfd: u-boot-spl section<br>
&gt; &gt; `.rodata&#39;<br>
&gt; &gt; &gt; will not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; fit in region `.sram&#39;=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; | arm-yoe-linux-gnueabi-l=
d.bfd: region `.sram&#39; overflowed<br>
&gt; &gt; &gt; by 5772 bytes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; | make[2]: ***<br>
&gt; &gt; &gt; [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-bo=
ot-ti-stag<br>
&gt; &gt; &gt; ing/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.s=
pl:349:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; spl/u-boot-spl] Error 1<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; FWIW, just built u-boot-ti-sta=
ging with gcc7 and gcc8 from<br>
&gt; &gt; oe-core,<br>
&gt; &gt; &gt; as well as<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Linaro gcc7 - no problems.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; My distro inherits poky policies, a=
nd on master it now inherits<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; hardening policies ( security flags=
) by defaults<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; do you happen to test poky ?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I think we want to take a look at which =
of the security flags<br>
&gt; &gt; really<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; make sense to use in this context.=C2=A0=
 Thanks!<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; there could be more to it, since the distro u=
ses thumb2 ISA by<br>
&gt; &gt; &gt; &gt; &gt; &gt; default, I am not sure<br>
&gt; &gt; &gt; &gt; &gt; &gt; if u-boot overrides that and builds using arm=
 mode ISA always but<br>
&gt; &gt; &gt; &gt; &gt; &gt; something to consider, I saw several reports =
about u-boot<br>
&gt; &gt; overflowing<br>
&gt; &gt; &gt; &gt; &gt; &gt; sram sections and most of<br>
&gt; &gt; &gt; &gt; &gt; &gt; the solutions were &quot;oh it works for me&q=
uot; or at the best your<br>
&gt; &gt; toolchain<br>
&gt; &gt; &gt; &gt; &gt; &gt; is different then mine. here is mine use it a=
nd move on.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Khem,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Well, FWIW, Tom and I are very familiar with this =
issue. As a matter<br>
&gt; &gt; &gt; of fact,<br>
&gt; &gt; &gt; &gt; &gt; I first encountered it almost 2 years ago and had =
to prove there&#39;s<br>
&gt; &gt; such<br>
&gt; &gt; &gt; an<br>
&gt; &gt; &gt; &gt; &gt; issue, because everyone was saying it works for th=
em, something must<br>
&gt; &gt; &gt; be wrong<br>
&gt; &gt; &gt; &gt; &gt; with my OE builds... :)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; While .sram region is very limited, the issue is e=
xacerbated by the<br>
&gt; &gt; &gt; fact that<br>
&gt; &gt; &gt; &gt; &gt; all debug symbols from macros like __FILE__ are en=
ded up in that<br>
&gt; &gt; section<br>
&gt; &gt; &gt; as<br>
&gt; &gt; &gt; &gt; &gt; well. So, the longer your build path, the larger t=
he section becomes.<br>
&gt; &gt; &gt; Once I<br>
&gt; &gt; &gt; &gt; &gt; had instructions to reproduce the failure here int=
ernally with a<br>
&gt; &gt; series<br>
&gt; &gt; &gt; of<br>
&gt; &gt; &gt; &gt; &gt; long-named nested directories like aaaaaa and bbbb=
bb, Nishanth<br>
&gt; &gt; started<br>
&gt; &gt; &gt; this<br>
&gt; &gt; &gt; &gt; &gt; thread on U-boot mailing list:<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.denx.de/pipermail/u-boot/=
2017-March/285031.html" rel=3D"noreferrer" target=3D"_blank">https://lists.=
denx.de/pipermail/u-boot/2017-March/285031.html</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; We&#39;ve had the corresponding bug open internall=
y all this time, while<br>
&gt; &gt; &gt; adding<br>
&gt; &gt; &gt; &gt; &gt; workarounds to limit .sram section size by other m=
eans, like<br>
&gt; &gt; disabling<br>
&gt; &gt; &gt; some<br>
&gt; &gt; &gt; &gt; &gt; options to reduce the code size. Your patch is one=
 of those<br>
&gt; &gt; workarounds...<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; But we&#39;ve been patiently waiting for the follo=
wing feature to come<br>
&gt; &gt; into<br>
&gt; &gt; &gt; gcc to<br>
&gt; &gt; &gt; &gt; &gt; fix the issue properly:<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.c=
gi?id=3D70268" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bug=
zilla/show_bug.cgi?id=3D70268</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Since it&#39;s now part of gcc8, we should be able=
 to use it. Not sure<br>
&gt; &gt; how<br>
&gt; &gt; &gt; to keep<br>
&gt; &gt; &gt; &gt; &gt; gcc7 backward compatibility though...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; BTW, there were few attempts to &quot;fix&quot; it in U=
-boot as well, such as<br>
&gt; &gt; [1],<br>
&gt; &gt; &gt; but I<br>
&gt; &gt; &gt; &gt; don&#39;t believe they got accepted. Tom?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [1] <a href=3D"https://patchwork.ozlabs.org/cover/82535=
6/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/cover=
/825356/</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think the end result was waiting on the kernel community t=
o agree on a<br>
&gt; &gt; &gt; path forward for Kbuild and then bring that back.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; U-Boot now supports -fmacro-prefix-map, so GCC 8 is OK.<br>
&gt; &gt; (see commit 1eb2e71ed)<br>
&gt; &gt;<br>
&gt; &gt; For GCC 7 or older, sorry, I have no idea what to do.<br>
&gt; &gt; My patch set [1] was an ugly hack,<br>
&gt; &gt; and wrong in the first place.<br>
&gt; &gt;<br>
&gt; &gt; What I can suggest is, please use GCC 8.<br>
&gt; <br>
&gt; <br>
&gt; Yeah I saw that but this patch is not their in 2018.01 release that TI=
 fork<br>
&gt; is based on regardless I backported this patch to this version it did =
not<br>
&gt; bring the size below mark<br>
&gt; I think it=E2=80=99s because we are using hardened toolchain and that =
enalbles<br>
&gt; extra options to enable pie and ssp since these options get added to C=
C<br>
&gt; they get passed into uboot straight<br>
&gt; <br>
&gt; I think we should just disable security flags for u boot in OE and may=
 be<br>
&gt; uboot make system should append fno-pie fno-stack-protector to nullify=
<br>
&gt; these options<br>
<br>
OK, do you want to submit a patch for that or should I do one and just<br>
Suggested-by you?=C2=A0 Thanks!</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">This would not be acceptable change since it changes how we =
build gcc itself secondly it does not happen for master uboot=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">However if this works then we n=
eed to understand why it increas e the size</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
-- <br>
Tom<br>
</blockquote></div></div>

--000000000000981ffd05786df181--
