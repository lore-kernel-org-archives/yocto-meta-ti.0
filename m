Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D19E0E00950; Tue, 16 Oct 2018 11:52:15 -0700 (PDT)
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
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 930F7E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:52:14 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id e10-v6so27009006qtq.12
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ss2OLi3D5CDdk3gCPFR6UfeS8IKqLRxJ4iahkkjPR/8=;
	b=f+fNAhNtODfdGqCQjpkF/FV0BppG3BMDslVOi7jJGNWPBPhY43+cD6WRmnltnan4jM
	LDg0gqO5hWkIMPOivG38h/TraMy4OWNXGhZAFFtiogLAI7LEpZV6NJa+7D6qMfMhUgTe
	p0lnOzBasVFEVIk8Wnjoy66RJSLC/Ms4oci80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ss2OLi3D5CDdk3gCPFR6UfeS8IKqLRxJ4iahkkjPR/8=;
	b=BvflOzKfwSICQh91NZilF4W6O5Pc8glpkxBqo7QFjlohMd/ELDsXvWRd+DXCnlh2bZ
	sGWr0CzJrt1SvsCEqKl+pMoCWYHxPtUW4htsf5Sm4HrZwhKxphshKv+QlIDH2PrAZenr
	ImBhRkaxGpoukxjA0MIxr6K3LA+KP25UPy6c19dniPGYyh1fhDuz1HKk6ioX7Wtb0ASQ
	/62xSmL7gvYIIaKl4Kh9qTofC33XUTXlNQ0G1YBdqLFYbOAzyrgLI4YpZqGly9SPrG8P
	21pkLH0NPDZnp3e8t1eZ26C/uohefxLno1Mk/un0VRRWgljSVi7crWrIz0n6WQKZ5t5t
	d5sA==
X-Gm-Message-State: ABuFfogyGQ9oM0QPEhPAxdtSWvdaZmc535cjKrGxVVqtgL72zmmD8NJH
	ceCSQKQJ3Ud2VTlFLNLIFya36w==
X-Google-Smtp-Source: ACcGV60m19vBNiwj0nMZY19C+ceqDXMw52tddXrJ8gPu8Je9tloO5txRn7Izmxyk99ehUVfc7rGyHg==
X-Received: by 2002:a0c:f0d0:: with SMTP id d16mr22512059qvl.207.1539715933774;
	Tue, 16 Oct 2018 11:52:13 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	r57-v6sm10838328qtc.36.2018.10.16.11.52.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 11:52:12 -0700 (PDT)
Date: Tue, 16 Oct 2018 14:52:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181016185210.GM1032@bill-the-cat>
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
	<20181016164210.GI1032@bill-the-cat>
	<CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Oct 2018 18:52:15 -0000
X-Groupsio-MsgNum: 11383
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iUV/lbBrmPtUT9dM"
Content-Disposition: inline

--iUV/lbBrmPtUT9dM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 11:11:36AM -0700, Khem Raj wrote:
> On Tue, Oct 16, 2018 at 9:42 AM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> > > On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wro=
te:
> > > >
> > > > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> =
wrote:
> > > > > >
> > > > > > There have been reports recently that am335x_beaglebone_config =
generates bad SPL.
> > > > > > Until that is debugged and fixed, use generic am335x_evm_config=
 that covers all
> > > > > > AM335x platforms, including BeagleBone variants.
> > > > > >
> > > > >
> > > > > it fails to link
> > > > >
> > > > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will=
 not
> > > > > fit in region `.sram'
> > > > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772=
 bytes
> > > > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gn=
ueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makef=
ile.spl:349:
> > > > > spl/u-boot-spl] Error 1
> > > >
> > > > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core,=
 as well as
> > > > Linaro gcc7 - no problems.
> > >
> > > My distro inherits poky policies, and on master it now inherits
> > > hardening policies ( security flags) by defaults
> > > do you happen to test poky ?
> >
> > I think we want to take a look at which of the security flags really
> > make sense to use in this context.  Thanks!
>=20
> there could be more to it, since the distro uses thumb2 ISA by
> default, I am not sure
> if u-boot overrides that and builds using arm mode ISA always but
> something to consider, I saw several reports about u-boot overflowing
> sram sections and most of
> the solutions were "oh it works for me" or at the best your toolchain
> is different then mine. here is mine use it and move on.

Yes, we enforce an ISA in U-Boot, depending on how things are configured
and have been doing thumb2 for a long time on these targets.  But, if we
have some issues here, I'd really like to root cause them.  I'm honestly
surprised the security flags are even being passed, but I guess they end
up put into TOOLCHAIN_OPTIONS not CFLAGS directly?  And what/when/how do
we reliably get an overflow?  Thanks!

--=20
Tom

--iUV/lbBrmPtUT9dM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxjNaAAoJEIf59jXTHXZSrKoP/1QZBjmCJo6Z0lOyCZu0FXC0
87tgpeJUIKgSbl+zUxlHJAmVFXPvOjWPD/O3S92nSYHB8GfryD7YloFJkQe3zNL2
JOapfzmcN3bQe3H8clCi5e52yCRg7/CPFavzddEJu8ffNbxxcxQE2n6T/OpIE3RK
XSta9EZyPDQC5LHCyxdNg4tkgCWSbfCw58CPly1lnIE27grmKR0WeL6CZSuZ24G0
6LMWWNrfIaYTEgx6QsqNsdsMxu9qAi3UwDuqzlQOtDsxy/82a5cx8Ot4U5+bJgvn
YJIRh/VTT4IsWbaZQZbH/avq6eM2BuwIrnfoN3VntXEEIWntY9UWhBRcOH0TFPAh
JX5nSyS3/Hj/UaDdZivNExavMnLjCd1DSUQji474ucRay02pVou8QArmaE+RQnC9
hDr4SZHDYEzpJdbJ4dcVk5Wve1s5h2G4Hmt2s7zhAhcG7n7Rx0mAVaq5lZbNqayH
Uu611uiQzB1afJvOig9XMXhbhM51V7o2QYjxgjd9QBxF8XqhBslz1oBXML35p+KZ
UKmN6VinPj9o8NQGRj6JKsyBPPCZD9/XS3A0yVBD/jGqUoNvww6V6eiKecw1omYV
wpnSBizJz1ZVKZiXFeIVtXtIBsZjM8Xj+wjjTPW+QSJf/DBmHu7gQY2Qt2x/+wFI
fSm5IzjGFsVzpsCon1ET
=xPHh
-----END PGP SIGNATURE-----

--iUV/lbBrmPtUT9dM--
