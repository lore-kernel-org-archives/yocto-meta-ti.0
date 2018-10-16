Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A99E6E0095C; Tue, 16 Oct 2018 11:59:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42978E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:59:29 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id o17-v6so27100352qtr.1
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wKysoisyIndDzS8Ub2lzLHJdnv6xb4OBulMy61D55GU=;
	b=MtDxPsOOnkfb0gjVRLDNAUuHYv3a/Pqze3zIWjOVqmA3bV9hcb+Q/fjZXJlc765O7E
	+uV9GuuhD4FKTX5BYWdV+lGylxnPj75uBkS8buelMbZOq+FetO1yM0pRWD6X5egjYSYi
	c3mas/fJvepz1LA2Rf7/3dY69ogwzgelrLLlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wKysoisyIndDzS8Ub2lzLHJdnv6xb4OBulMy61D55GU=;
	b=edls7mqQLYOeBGBpZyWEvKBTRLv/671NNr/WNkJ7LZamYthhPq2gXkmGF7T/prKO8N
	iSDeQu9x1RnYL/k6Id1FrolK4qCo/XP6xXXIBpImFTNzGmurkl/01IOuT25pHImk9PiK
	wiznkQdfOZcHXcMw0RLKIx7ybFQ8V0ku/3ZtQi3sqZ9rwjUVsi1/oABhLmftkuB3XkD1
	74ioEhkEGrBsS935NeRJ7aRLPb+Si7m2P8aqZHQHNH4nml9M9dGtNTAWQ+mUWJy1n3vd
	3DGBOF64XA3deop2+Yf2npHU0kIYnRH6932c5pApbn4tBFo30jdpMeni8kQnHenFQ6qf
	nSAQ==
X-Gm-Message-State: ABuFfohs3V8PPItzQLj6kvnla6smlaXRr4qEgQStOXkkDdNP4NNHfuWe
	iQDHeP0JtZQ3WqXSHJb84/GnMQ==
X-Google-Smtp-Source: ACcGV636gTzNbLzb6xdBxyQF9fYjA99HejKeM4/E/3C3WEcpr5qlWBpk4YUd2rrCDYSGiK8iR4MsdA==
X-Received: by 2002:a0c:8ab5:: with SMTP id 50mr22422645qvv.159.1539716368557; 
	Tue, 16 Oct 2018 11:59:28 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	h66-v6sm8022382qkc.53.2018.10.16.11.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 11:59:27 -0700 (PDT)
Date: Tue, 16 Oct 2018 14:59:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Denys Dmytriyenko <denys@ti.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Message-ID: <20181016185925.GO1032@bill-the-cat>
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl> <20181016183828.GK14250@beryl>
MIME-Version: 1.0
In-Reply-To: <20181016183828.GK14250@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Tue, 16 Oct 2018 18:59:31 -0000
X-Groupsio-MsgNum: 11385
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ck22u5fw4m2k6hx2"
Content-Disposition: inline

--Ck22u5fw4m2k6hx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 02:38:28PM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 16, 2018 at 02:29:00PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> > > On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com>=
 wrote:
> > > > > >
> > > > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.c=
om> wrote:
> > > > > > > >
> > > > > > > > There have been reports recently that am335x_beaglebone_con=
fig generates bad SPL.
> > > > > > > > Until that is debugged and fixed, use generic am335x_evm_co=
nfig that covers all
> > > > > > > > AM335x platforms, including BeagleBone variants.
> > > > > > > >
> > > > > > >
> > > > > > > it fails to link
> > > > > > >
> > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' =
will not
> > > > > > > fit in region `.sram'
> > > > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by =
5772 bytes
> > > > > > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linu=
x-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/M=
akefile.spl:349:
> > > > > > > spl/u-boot-spl] Error 1
> > > > > >
> > > > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-c=
ore, as well as
> > > > > > Linaro gcc7 - no problems.
> > > > >
> > > > > My distro inherits poky policies, and on master it now inherits
> > > > > hardening policies ( security flags) by defaults
> > > > > do you happen to test poky ?
> > > >
> > > > I think we want to take a look at which of the security flags really
> > > > make sense to use in this context.  Thanks!
> > > >
> > >=20
> > > there could be more to it, since the distro uses thumb2 ISA by
> > > default, I am not sure
> > > if u-boot overrides that and builds using arm mode ISA always but
> > > something to consider, I saw several reports about u-boot overflowing
> > > sram sections and most of
> > > the solutions were "oh it works for me" or at the best your toolchain
> > > is different then mine. here is mine use it and move on.
> >=20
> > Khem,
> >=20
> > Well, FWIW, Tom and I are very familiar with this issue. As a matter of=
 fact,=20
> > I first encountered it almost 2 years ago and had to prove there's such=
 an=20
> > issue, because everyone was saying it works for them, something must be=
 wrong=20
> > with my OE builds... :)
> >=20
> > While .sram region is very limited, the issue is exacerbated by the fac=
t that=20
> > all debug symbols from macros like __FILE__ are ended up in that sectio=
n as=20
> > well. So, the longer your build path, the larger the section becomes. O=
nce I=20
> > had instructions to reproduce the failure here internally with a series=
 of=20
> > long-named nested directories like aaaaaa and bbbbbb, Nishanth started =
this=20
> > thread on U-boot mailing list:
> > https://lists.denx.de/pipermail/u-boot/2017-March/285031.html
> >=20
> > We've had the corresponding bug open internally all this time, while ad=
ding=20
> > workarounds to limit .sram section size by other means, like disabling =
some=20
> > options to reduce the code size. Your patch is one of those workarounds=
=2E..
> >=20
> > But we've been patiently waiting for the following feature to come into=
 gcc to=20
> > fix the issue properly:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> >=20
> > Since it's now part of gcc8, we should be able to use it. Not sure how =
to keep=20
> > gcc7 backward compatibility though...
>=20
> BTW, there were few attempts to "fix" it in U-boot as well, such as [1], =
but I=20
> don't believe they got accepted. Tom?
>=20
> [1] https://patchwork.ozlabs.org/cover/825356/

I think the end result was waiting on the kernel community to agree on a
path forward for Kbuild and then bring that back.

--=20
Tom

--Ck22u5fw4m2k6hx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxjUMAAoJEIf59jXTHXZS3sMP/Rc2LGpLPd0pTe6Ofa9oXxLo
XKKfijbR3s7TZ8B9wbBUZMtLNKnWsXBcvLrEUCrQnrE1CSUUsVEDjeR9iBa9kJPY
FP4FD43eC962Mne+2Ds1vwhEyPtOD/ir3Wzw00kMg0kS7l//KnkTVW+mFRhOF/lF
ToubZgN3SXJapyWWzg+M3l3tpmJVxawUWDvXptmhA3QR5UiFw7XB+wFYuCS6xTvi
Zwy0NyFvpf2SnJO8FYdKxND6nmIu/+SR8OaS0ZJWk9nQxC0yEe4uLu42jbwD4yfF
LsZXE0wVxKMEAR+Zqx7n74IsF3LGWH3EuEz5tWE62aaVkZ3zGcou0thlVxKMiiE7
6qK1+zGrhXjvjg81Ygs3Nd6hG+qQGu+Yo4h7y+Rx4XT56jeT7tkr+zgWZDbBe+l+
vDPVssbNvxUgtQJ1RwdWrGUK3+XvEGBxHdrprZgMAuYIktgsN4SgywGwEOjdU8Ku
CC20G4mrfrrzPD+SxLpln6c+l5EtpXAn18qgx19FJ0RUJVu0ckzYCeHjSaHoG56c
ocnmRc05rUa5hSixCSpWd8eUUgmfKTYTLEC7SkxHW5uSLyYPzj5ZxiW0Fgkvl5CG
Q7c4y7P/LfEMXRv9vGwF4x5p338kanpAhC4MBE+lR7rCv3uJwkyDr3nP9gMSPnTh
B7GuxNFM3aEDny4iWJwX
=HAsb
-----END PGP SIGNATURE-----

--Ck22u5fw4m2k6hx2--
