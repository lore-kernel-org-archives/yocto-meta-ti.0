Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 008E8E00BC4; Tue, 16 Oct 2018 23:55:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0D91E00B9F
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 23:55:51 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id q40-v6so28846192qte.0
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 23:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zUXKaRg5KNnWJKWIoz+xeHpHukts7kBQJdhTJ3lP0wo=;
	b=XbhBxDZddVdUQJzpQsZVJhlUrcOyb+PRm/PnvH/34cLBOhSANjHwEQ2zIzl7eqxoX1
	/nhOT5uv7yKWOS/Q+UAYqrXa9VyqtJE6G95YHnrm46AjQOK6HtJ3Lqso8w30hAm6kSYs
	3tbYdt3EKQtaEh6O5nLf/COE+pS1iPeBka30nuO3t5fDxW7NedLiBHeS1o4nXgMdlyIx
	7CPj5HM+bhV6oPx2Nk6rF/p5goNUDTA6xHqs8dEcbF0Aj/uplIQGmds9U6H9LhEbajMK
	iLTWRY6pPBnf9yVxVqB/WEsa3Fj4eYW3nrm97wYtYgBBSAs6rUveSYIizBSfsCfL32I/
	oJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zUXKaRg5KNnWJKWIoz+xeHpHukts7kBQJdhTJ3lP0wo=;
	b=oax2QfUTsNQJjK5yDpkLSjsMLk2UwC44Pi95vNCkF0Vt2ukFYKrrre1ns2+TnIRmph
	uJ8vM0SFWohwNLm4eWoXUzm/PbYAJBrDKDBYzqGycnbEoZJG6fSa5zTwaQRqJ2AV86a/
	xD0ymkWJWt6esD6X5aawaVfwNh6GuvdgSYQ5hKb9VxG4ncCxvbfyxFT15HE9c+HEC9sH
	EtgxudEsOxIdq4/2AOSWVpjvU9R3oIx03oRPzoCOIrAm44+73CE4AcjtKwhqNsSnn1uK
	Vb0tCd0vTTOQ7q6+fDXfycD3LvHZWPcuITW0HcpLCEXAndxK+jPrygq/CfDS9zG6FQ7r
	Z/tw==
X-Gm-Message-State: ABuFfoidOHTukcJQjI2Pd1xkazkowymxbkWcGeed5jXCXLIHLp9GOcxh
	BTB8xMB1AQwThEedIX7DacqO6ag7n8O8SNJXdF8=
X-Google-Smtp-Source: ACcGV60V+uVRvVM+APfMQo3RjTVLrsfHKE5EykE5DPtRNkBSv9w65IuE2Y82zS9CsPRLGJAK2wPjsSQgIqTw/WB01Q8=
X-Received: by 2002:a0c:98a6:: with SMTP id f35mr9348977qvd.224.1539759350975; 
	Tue, 16 Oct 2018 23:55:50 -0700 (PDT)
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
	<20181017043725.GC4031@beryl>
In-Reply-To: <20181017043725.GC4031@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 23:55:24 -0700
Message-ID: <CAMKF1so2VXdUQVB==xtBR1meGANmb7_35-OtqUn2eQwaGV96kQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
	Tom Rini <trini@konsulko.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 06:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

try setting #GCCPIE =3D "" in local.conf
On Tue, Oct 16, 2018 at 9:37 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
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
> > > > Subject: Re: [meta-ti] [PATCH] beaglebone.conf: temporarily use gen=
eric
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
> > > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overfl=
owed
> > > > by 5772 bytes
> > > > > > > > > > > | make[2]: ***
> > > > [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-s=
tag
> > > > ing/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > > > > > > spl/u-boot-spl] Error 1
> > > > > > > > > >
> > > > > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 f=
rom
> > > oe-core,
> > > > as well as
> > > > > > > > > > Linaro gcc7 - no problems.
> > > > > > > > >
> > > > > > > > > My distro inherits poky policies, and on master it now in=
herits
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
> > > > > > > if u-boot overrides that and builds using arm mode ISA always=
 but
> > > > > > > something to consider, I saw several reports about u-boot
> > > overflowing
> > > > > > > sram sections and most of
> > > > > > > the solutions were "oh it works for me" or at the best your
> > > toolchain
> > > > > > > is different then mine. here is mine use it and move on.
> > > > > >
> > > > > > Khem,
> > > > > >
> > > > > > Well, FWIW, Tom and I are very familiar with this issue. As a m=
atter
> > > > of fact,
> > > > > > I first encountered it almost 2 years ago and had to prove ther=
e's
> > > such
> > > > an
> > > > > > issue, because everyone was saying it works for them, something=
 must
> > > > be wrong
> > > > > > with my OE builds... :)
> > > > > >
> > > > > > While .sram region is very limited, the issue is exacerbated by=
 the
> > > > fact that
> > > > > > all debug symbols from macros like __FILE__ are ended up in tha=
t
> > > section
> > > > as
> > > > > > well. So, the longer your build path, the larger the section be=
comes.
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
> > > > > > We've had the corresponding bug open internally all this time, =
while
> > > > adding
> > > > > > workarounds to limit .sram section size by other means, like
> > > disabling
> > > > some
> > > > > > options to reduce the code size. Your patch is one of those
> > > workarounds...
> > > > > >
> > > > > > But we've been patiently waiting for the following feature to c=
ome
> > > into
> > > > gcc to
> > > > > > fix the issue properly:
> > > > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> > > > > >
> > > > > > Since it's now part of gcc8, we should be able to use it. Not s=
ure
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
> > > > I think the end result was waiting on the kernel community to agree=
 on a
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
> > Yeah I saw that but this patch is not their in 2018.01 release that TI =
fork
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
> FWIW, as I mentioned earlier, just adding no-security flags to the recipe
> didn't really work. I'm open to more suggestions.
>
> --
> Denys

