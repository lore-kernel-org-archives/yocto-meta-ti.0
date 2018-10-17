Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B69FBE00ABE; Wed, 17 Oct 2018 12:27:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0611E00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:27:46 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id b4-v6so31439080qtc.7
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Oq/13XqNLoTejGMiS/Xs6CN/ednSsuUpU4UONNj/nfI=;
	b=vBVDyJb2uFq7Rgv4z1fBW6NmnZQ5y1loQwbhvTQNy+8vkxLmX2OgJtBA5lrqBKcYyu
	//1adIFvmFDSPKbeOc1C5uqdzxWgoAXydw4BM1M9ENopVvfj/QrsQBwjOUyuxbYHCTml
	nQP3g/u6gv/A+o/WHGypx9mDtCAR01DtuoqG1D6xtzrmbwJGX+NVUORbOpwu9/QbTqeW
	l7hD3RBznyPdZ2uiTCVQVcjXih6YQe37/KDPXPxxi8E+qfj8uK0zAMXxexe0+g692gnD
	MV1/dL1G64g8Cq6Hx2R/k5dbX0jlpZuReAs5ev3/YveZLNgc1qME3GE4JxrYAf5PX0+i
	d5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Oq/13XqNLoTejGMiS/Xs6CN/ednSsuUpU4UONNj/nfI=;
	b=roEiMbDXqcRkjnrroj9/Pwb9CE9iygWUn/LwNef9tggzp5SeylXpe3yAdvhI+nSxhO
	K1gdboBHzDyMxD+oyjpuTfnr6cvvXERYmuFU17Enp6jV1tSS64ZN0TitQZJXQjquhF7X
	9K9oBhZFNaYoLxovZg0QjgQHCt450iROJWK2R51nUe+VEXsTFb4OvLCf3yGNHITZxMb2
	ZGBEEax/ISZEuKwoWFItZUcJZn6+KiszX48H4xLpGVSlfKkw9NmOrDZArHUEpltXr3pi
	jdt3RwKo78cWsyLCQlPq6vZgSeiukZQh+PudSBXsOsEuDN4m6swnx/f/QWuRp9pJbQVe
	go6Q==
X-Gm-Message-State: ABuFfohGIDmtHTrrIEdAxJ38kWjW+JArzFTy5IGJ62GnkW/jqDznzbcx
	KHF1bIQaPrr+mllnPAEIfvpsDcsEz3ZuEEIpG2U=
X-Google-Smtp-Source: ACcGV63KF0DAYd0qNJPMcPLMbSMtJfzlI3cbUKrwvA/Y43q0rLSKnb/m/E56EB6583JpvweFOJER3EI9Bi0xWdGw0yo=
X-Received: by 2002:ac8:4790:: with SMTP id
	k16-v6mr26668691qtq.253.1539804465933; 
	Wed, 17 Oct 2018 12:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl> <20181016183828.GK14250@beryl>
	<20181016185925.GO1032@bill-the-cat>
	<9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
	<CAMKF1srteMQK0AC0Dj2hQ5z3ouzD7HsfTS5Yjg=-wcDTj4+z=A@mail.gmail.com>
	<20181017112615.GT1032@bill-the-cat>
	<CAMKF1srPbZ_8XKeKt=aMSrHCPZNAQULb4P8atahBLjm21Zvb9g@mail.gmail.com>
	<20181017192501.GG4031@beryl>
In-Reply-To: <20181017192501.GG4031@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 12:27:19 -0700
Message-ID: <CAMKF1sqMCEGkNyOK_WgN6KfKs+_30tq-_868SrkSmxAjbRhGAA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org, Tom Rini <trini@konsulko.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 19:27:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 12:25 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Wed, Oct 17, 2018 at 08:00:52AM -0700, Khem Raj wrote:
> > On Wed, Oct 17, 2018 at 4:26 AM Tom Rini <trini@konsulko.com> wrote:
> >
> > > On Tue, Oct 16, 2018 at 09:06:27PM -0700, Khem Raj wrote:
> > > > On Tue, Oct 16, 2018 at 7:39 PM <yamada.masahiro@socionext.com> wro=
te:
> > > >
> > > > > Hi.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Tom Rini [mailto:trini@konsulko.com]
> > > > > > Sent: Wednesday, October 17, 2018 3:59 AM
> > > > > > To: Denys Dmytriyenko <denys@ti.com>; Yamada, Masahiro/=E5=B1=
=B1=E7=94=B0 =E7=9C=9F=E5=BC=98
> > > > > > <yamada.masahiro@socionext.com>
> > > > > > Cc: Khem Raj <raj.khem@gmail.com>; meta-ti@yoctoproject.org
> > > > > > Subject: Re: [meta-ti] [PATCH] beaglebone.conf: temporarily use
> > > generic
> > > > > > am335x_evm_config for U-boot
> > > > > >
> > > > > > On Tue, Oct 16, 2018 at 02:38:28PM -0400, Denys Dmytriyenko wro=
te:
> > > > > > > On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriyenko w=
rote:
> > > > > > > > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > > > > > > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.=
com>
> > > > > wrote:
> > > > > > > > > >
> > > > > > > > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrot=
e:
> > > > > > > > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <
> > > > > denys@ti.com>
> > > > > > wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj =
wrote:
> > > > > > > > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko=
 <
> > > > > denys@ti.com>
> > > > > > wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > There have been reports recently that
> > > > > am335x_beaglebone_config
> > > > > > generates bad SPL.
> > > > > > > > > > > > > > Until that is debugged and fixed, use generic
> > > > > am335x_evm_config
> > > > > > that covers all
> > > > > > > > > > > > > > AM335x platforms, including BeagleBone variants=
.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > it fails to link
> > > > > > > > > > > > >
> > > > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl sectio=
n
> > > > > `.rodata'
> > > > > > will not
> > > > > > > > > > > > > fit in region `.sram'
> > > > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram'
> > > overflowed
> > > > > > by 5772 bytes
> > > > > > > > > > > > > | make[2]: ***
> > > > > >
> > > [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-sta=
g
> > > > > > ing/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:=
349:
> > > > > > > > > > > > > spl/u-boot-spl] Error 1
> > > > > > > > > > > >
> > > > > > > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gc=
c8
> > > from
> > > > > oe-core,
> > > > > > as well as
> > > > > > > > > > > > Linaro gcc7 - no problems.
> > > > > > > > > > >
> > > > > > > > > > > My distro inherits poky policies, and on master it no=
w
> > > inherits
> > > > > > > > > > > hardening policies ( security flags) by defaults
> > > > > > > > > > > do you happen to test poky ?
> > > > > > > > > >
> > > > > > > > > > I think we want to take a look at which of the security=
 flags
> > > > > really
> > > > > > > > > > make sense to use in this context.  Thanks!
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > there could be more to it, since the distro uses thumb2 I=
SA by
> > > > > > > > > default, I am not sure
> > > > > > > > > if u-boot overrides that and builds using arm mode ISA al=
ways
> > > but
> > > > > > > > > something to consider, I saw several reports about u-boot
> > > > > overflowing
> > > > > > > > > sram sections and most of
> > > > > > > > > the solutions were "oh it works for me" or at the best yo=
ur
> > > > > toolchain
> > > > > > > > > is different then mine. here is mine use it and move on.
> > > > > > > >
> > > > > > > > Khem,
> > > > > > > >
> > > > > > > > Well, FWIW, Tom and I are very familiar with this issue. As=
 a
> > > matter
> > > > > > of fact,
> > > > > > > > I first encountered it almost 2 years ago and had to prove
> > > there's
> > > > > such
> > > > > > an
> > > > > > > > issue, because everyone was saying it works for them, somet=
hing
> > > must
> > > > > > be wrong
> > > > > > > > with my OE builds... :)
> > > > > > > >
> > > > > > > > While .sram region is very limited, the issue is exacerbate=
d by
> > > the
> > > > > > fact that
> > > > > > > > all debug symbols from macros like __FILE__ are ended up in=
 that
> > > > > section
> > > > > > as
> > > > > > > > well. So, the longer your build path, the larger the sectio=
n
> > > becomes.
> > > > > > Once I
> > > > > > > > had instructions to reproduce the failure here internally w=
ith a
> > > > > series
> > > > > > of
> > > > > > > > long-named nested directories like aaaaaa and bbbbbb, Nisha=
nth
> > > > > started
> > > > > > this
> > > > > > > > thread on U-boot mailing list:
> > > > > > > > https://lists.denx.de/pipermail/u-boot/2017-March/285031.ht=
ml
> > > > > > > >
> > > > > > > > We've had the corresponding bug open internally all this ti=
me,
> > > while
> > > > > > adding
> > > > > > > > workarounds to limit .sram section size by other means, lik=
e
> > > > > disabling
> > > > > > some
> > > > > > > > options to reduce the code size. Your patch is one of those
> > > > > workarounds...
> > > > > > > >
> > > > > > > > But we've been patiently waiting for the following feature =
to
> > > come
> > > > > into
> > > > > > gcc to
> > > > > > > > fix the issue properly:
> > > > > > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> > > > > > > >
> > > > > > > > Since it's now part of gcc8, we should be able to use it. N=
ot
> > > sure
> > > > > how
> > > > > > to keep
> > > > > > > > gcc7 backward compatibility though...
> > > > > > >
> > > > > > > BTW, there were few attempts to "fix" it in U-boot as well, s=
uch as
> > > > > [1],
> > > > > > but I
> > > > > > > don't believe they got accepted. Tom?
> > > > > > >
> > > > > > > [1] https://patchwork.ozlabs.org/cover/825356/
> > > > > >
> > > > > > I think the end result was waiting on the kernel community to a=
gree
> > > on a
> > > > > > path forward for Kbuild and then bring that back.
> > > > >
> > > > >
> > > > >
> > > > > U-Boot now supports -fmacro-prefix-map, so GCC 8 is OK.
> > > > > (see commit 1eb2e71ed)
> > > > >
> > > > > For GCC 7 or older, sorry, I have no idea what to do.
> > > > > My patch set [1] was an ugly hack,
> > > > > and wrong in theEven if this change is not acceptable upstream, I=
 would prefer it locally in
meta-ti recipe, instead of disabling more features to free up 5-6KB in
SPL. first place.
> > > > >
> > > > > What I can suggest is, please use GCC 8.
> > > >
> > > >
> > > > Yeah I saw that but this patch is not their in 2018.01 release that=
 TI
> > > fork
> > > > is based on regardless I backported this patch to this version it d=
id not
> > > > bring the size below mark
> > > > I think it=E2=80=99s because we are using hardened toolchain and th=
at enalbles
> > > > extra options to enable pie and ssp since these options get added t=
o CC
> > > > they get passed into uboot straight
> > > >
> > > > I think we should just disable security flags for u boot in OE and =
may be
> > > > uboot make system should append fno-pie fno-stack-protector to null=
ify
> > > > these options
> > >
> > > OK, do you want to submit a patch for that or should I do one and jus=
t
> > > Suggested-by you?  Thanks!
> >
> >
> > This would not be acceptable change since it changes how we build gcc
> > itself secondly it does not happen for master uboot
> >
> > However if this works then we need to understand why it increas e the s=
ize
>
> Even if this change is not acceptable upstream, I would prefer it locally=
 in
> meta-ti recipe, instead of disabling more features to free up 5-6KB in SP=
L.

this is a distro level change. meta-ti is not appropriate place to decide t=
hat

>
> --
> Denys

