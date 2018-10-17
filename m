Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 285D6E00BC1; Wed, 17 Oct 2018 04:26:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAD4BE0095C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 04:26:20 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id y8-v6so16167908qka.11
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 04:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HPGPnbn9N4UHlRTwRZ7/QVB6ShAZL4m9Tb5LoDT/mPU=;
	b=oWW0r5gP16gbwBzv7rJC+CuHR6wib56MuwAkld9Sz/bgeZACCGf37AU2AxFBug2Hqy
	dIKk/8/dI6Qkm0cBjPd7f/RMvIBSaOwRTNXpn7oFD74KI+/ELptl3t6dCwfcoe4HEnLU
	/zMDi+jK3z/4BQbTkLRCTtuf6Y3IUs+68qOzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HPGPnbn9N4UHlRTwRZ7/QVB6ShAZL4m9Tb5LoDT/mPU=;
	b=PWwN83Jf4O+GTEzpW7snK/FvPF4rqCQUWS3xzsSjuQbd1HbUSf68iG7njUPIjzSwgH
	1GR7zK7mIMy/erDCT8cz8s/2ZMCEj9kRRkGJkUXvjXvNneaRnEbgRUxdItJYnvH9b2Kf
	PhkONafa73TkNvNTFhR+P12MQpE55lMqgMQU0INCUpSHc7dzMc2tl3ZFSnE1wL7jpOhv
	I0aj2+txtdlqoYM+I8rO8yUye+8aHJFyJruQw45DXFyvf0/JxEoszZNu+VbuaoIWzA4f
	6bco46fxRhSbtML62/Cv6cfKfrxh52qc7ygiGdgUCiHX7n+YxEVv2Dv5fCZgSr22vS6f
	Q8jA==
X-Gm-Message-State: ABuFfojnwaOBpn8jYTSKwaP0xQG6TIGUvvKKPcTtODvj66wFhUjCmsGq
	yQC/WEcx698WJFEd5nl+bsuvyw==
X-Google-Smtp-Source: ACcGV62J0d19XxBPuRUOLBbsVsvNsI/FiItun1Ltq9wBfdtdzJNq9Q25GQJKGhpm/TxdvPoGPOm6vQ==
X-Received: by 2002:a37:3ac8:: with SMTP id
	h191-v6mr23020541qka.43.1539775579668; 
	Wed, 17 Oct 2018 04:26:19 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	h40-v6sm13921856qtb.24.2018.10.17.04.26.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 04:26:18 -0700 (PDT)
Date: Wed, 17 Oct 2018 07:26:15 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017112615.GT1032@bill-the-cat>
References: <CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl> <20181016183828.GK14250@beryl>
	<20181016185925.GO1032@bill-the-cat>
	<9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
	<CAMKF1srteMQK0AC0Dj2hQ5z3ouzD7HsfTS5Yjg=-wcDTj4+z=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srteMQK0AC0Dj2hQ5z3ouzD7HsfTS5Yjg=-wcDTj4+z=A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 17 Oct 2018 11:26:22 -0000
X-Groupsio-MsgNum: 11405
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6nfUOKxk8V1TQsEu"
Content-Disposition: inline

--6nfUOKxk8V1TQsEu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 09:06:27PM -0700, Khem Raj wrote:
> On Tue, Oct 16, 2018 at 7:39 PM <yamada.masahiro@socionext.com> wrote:
>=20
> > Hi.
> >
> > > -----Original Message-----
> > > From: Tom Rini [mailto:trini@konsulko.com]
> > > Sent: Wednesday, October 17, 2018 3:59 AM
> > > To: Denys Dmytriyenko <denys@ti.com>; Yamada, Masahiro/=E5=B1=B1=E7=
=94=B0 =E7=9C=9F=E5=BC=98
> > > <yamada.masahiro@socionext.com>
> > > Cc: Khem Raj <raj.khem@gmail.com>; meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [PATCH] beaglebone.conf: temporarily use gener=
ic
> > > am335x_evm_config for U-boot
> > >
> > > On Tue, Oct 16, 2018 at 02:38:28PM -0400, Denys Dmytriyenko wrote:
> > > > On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriyenko wrote:
> > > > > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > > > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com>
> > wrote:
> > > > > > >
> > > > > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <
> > denys@ti.com>
> > > wrote:
> > > > > > > > >
> > > > > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <
> > denys@ti.com>
> > > wrote:
> > > > > > > > > > >
> > > > > > > > > > > There have been reports recently that
> > am335x_beaglebone_config
> > > generates bad SPL.
> > > > > > > > > > > Until that is debugged and fixed, use generic
> > am335x_evm_config
> > > that covers all
> > > > > > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > it fails to link
> > > > > > > > > >
> > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section
> > `.rodata'
> > > will not
> > > > > > > > > > fit in region `.sram'
> > > > > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflow=
ed
> > > by 5772 bytes
> > > > > > > > > > | make[2]: ***
> > > [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-stag
> > > ing/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> > > > > > > > > > spl/u-boot-spl] Error 1
> > > > > > > > >
> > > > > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from
> > oe-core,
> > > as well as
> > > > > > > > > Linaro gcc7 - no problems.
> > > > > > > >
> > > > > > > > My distro inherits poky policies, and on master it now inhe=
rits
> > > > > > > > hardening policies ( security flags) by defaults
> > > > > > > > do you happen to test poky ?
> > > > > > >
> > > > > > > I think we want to take a look at which of the security flags
> > really
> > > > > > > make sense to use in this context.  Thanks!
> > > > > > >
> > > > > >
> > > > > > there could be more to it, since the distro uses thumb2 ISA by
> > > > > > default, I am not sure
> > > > > > if u-boot overrides that and builds using arm mode ISA always b=
ut
> > > > > > something to consider, I saw several reports about u-boot
> > overflowing
> > > > > > sram sections and most of
> > > > > > the solutions were "oh it works for me" or at the best your
> > toolchain
> > > > > > is different then mine. here is mine use it and move on.
> > > > >
> > > > > Khem,
> > > > >
> > > > > Well, FWIW, Tom and I are very familiar with this issue. As a mat=
ter
> > > of fact,
> > > > > I first encountered it almost 2 years ago and had to prove there's
> > such
> > > an
> > > > > issue, because everyone was saying it works for them, something m=
ust
> > > be wrong
> > > > > with my OE builds... :)
> > > > >
> > > > > While .sram region is very limited, the issue is exacerbated by t=
he
> > > fact that
> > > > > all debug symbols from macros like __FILE__ are ended up in that
> > section
> > > as
> > > > > well. So, the longer your build path, the larger the section beco=
mes.
> > > Once I
> > > > > had instructions to reproduce the failure here internally with a
> > series
> > > of
> > > > > long-named nested directories like aaaaaa and bbbbbb, Nishanth
> > started
> > > this
> > > > > thread on U-boot mailing list:
> > > > > https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> > > > >
> > > > > We've had the corresponding bug open internally all this time, wh=
ile
> > > adding
> > > > > workarounds to limit .sram section size by other means, like
> > disabling
> > > some
> > > > > options to reduce the code size. Your patch is one of those
> > workarounds...
> > > > >
> > > > > But we've been patiently waiting for the following feature to come
> > into
> > > gcc to
> > > > > fix the issue properly:
> > > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> > > > >
> > > > > Since it's now part of gcc8, we should be able to use it. Not sure
> > how
> > > to keep
> > > > > gcc7 backward compatibility though...
> > > >
> > > > BTW, there were few attempts to "fix" it in U-boot as well, such as
> > [1],
> > > but I
> > > > don't believe they got accepted. Tom?
> > > >
> > > > [1] https://patchwork.ozlabs.org/cover/825356/
> > >
> > > I think the end result was waiting on the kernel community to agree o=
n a
> > > path forward for Kbuild and then bring that back.
> >
> >
> >
> > U-Boot now supports -fmacro-prefix-map, so GCC 8 is OK.
> > (see commit 1eb2e71ed)
> >
> > For GCC 7 or older, sorry, I have no idea what to do.
> > My patch set [1] was an ugly hack,
> > and wrong in the first place.
> >
> > What I can suggest is, please use GCC 8.
>=20
>=20
> Yeah I saw that but this patch is not their in 2018.01 release that TI fo=
rk
> is based on regardless I backported this patch to this version it did not
> bring the size below mark
> I think it=E2=80=99s because we are using hardened toolchain and that ena=
lbles
> extra options to enable pie and ssp since these options get added to CC
> they get passed into uboot straight
>=20
> I think we should just disable security flags for u boot in OE and may be
> uboot make system should append fno-pie fno-stack-protector to nullify
> these options

OK, do you want to submit a patch for that or should I do one and just
Suggested-by you?  Thanks!

--=20
Tom

--6nfUOKxk8V1TQsEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxxxWAAoJEIf59jXTHXZSiCEP/jL6oBWHwT5p8xUJTevthu+x
tqHuhhB8t1/2wfl6a1/aQaFh1o25H6mVRNn5Omp+fvvzWMYPM60d2i4vW5MV4MFK
7uGOd+fmJuAI9gSr2tjq3qbEjPjhl0Ad6r/0+5NnfmEtMuCpBxHj/AKFi6swXtz9
4opeiWqKw7M5rdD12ubR4VqjEWDcGpw+GGLdAtH6OPv9FT7McxG9Dqhj1cHFXtAf
O9hlZphQf15zdbR6hPK2CZhC5bs82I26mqn/RntoZl6TV+XnJDN0YSVW1OHuuZ5e
CgBp3dkiw7GiQpBdqAEnc4SAOIHLM0p3YtBY9O4ByolUH50NeigD0QY6esnFNPek
bByHrn6fo2du3BRtkFn++/DV/EKVX+NnLTgvEnGA3IOQvh3tRc0wI4IObYtM6xDk
KdjzrNJaPcsTFP/rbLgQi/oG2D60gaLVpuK/SArip72Ek2aF/7UDRNURlc+zLy8O
woJA42yw19SEUrAOVHvVzJ5yZNNzQOyeY5G33oLObhbvzOH/f1rwg8XNAMEX31JY
mZNbAfg4gRV8GfKj3vnIAIwiutAdlQxNlTI2vGDYa4vC95uYTj7N5GFFkX77KEg4
GIxSZZxds9gjEH0HGTP0ljnFq//AwaImiRurIhcStBbmNg1ozjPXQSfUNbglYx3p
i2GKANqqfNKDUWnmH5K/
=Fhky
-----END PGP SIGNATURE-----

--6nfUOKxk8V1TQsEu--
