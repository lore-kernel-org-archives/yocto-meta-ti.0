Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.14376.1637352454248714900
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 12:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XhY50cWM;
 spf=pass (domain: konsulko.com, ip: 209.85.222.178, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f178.google.com with SMTP id i9so11381663qki.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 12:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PjG/RaKU7FPkeHUCSsVNpfp4qZMB4Mc2ihkjekgLKS4=;
        b=XhY50cWMGaOAvFsp98GhEbnyZAazfXMfHSnHkoxudX40hHpNPfoETdYNQAGQvxmPdq
         4EAsEQuS59H44zRSaLrdqGqvvWOr82xh8CM6rwEaRLDj/r+tAodXew2Zp32zZ+DCNJxL
         Fb/nOUZHl1Qmq9Gazfx/CXB+CxeAG0dmD9tZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PjG/RaKU7FPkeHUCSsVNpfp4qZMB4Mc2ihkjekgLKS4=;
        b=5u1Q+nthQEwl6jKy7arDeuT7izjF9TB1HoxFKUo+U5ePNgjpoYlTsYK1WA5xSD9B+J
         QAhrtyKd/slbuPR4JhRC1YKcykUt7dLv9iDT0Uxr/x4FukDYyH2Mg8VvZn2WQv0ZjoZI
         uCZ7qTPGKKwcPna5PgJey31IMAbeQ1utc5gXr1G+C0OloYZDHhIKNzleMKn99iADTPM5
         4V8HoxArRSKlpCjI+YyD9JKHgC1+MKyPOBuEd3zy05EcJkpXfeYyPMV+UHhQBQZtWojX
         jEWPyS5AuA9WHyySrREeTjGKCQlZGLbQaemvGbOtB2+MFpLDWLcqK+KeM0WU2GleAoaT
         w6hg==
X-Gm-Message-State: AOAM530VsO8m5+r+9wzM1tkKAh1rJJjSWQym8SIrvbVrR//Ub0BCsGbD
	tUk1Nt4ioJgNzHi2APLcBjD4bA==
X-Google-Smtp-Source: ABdhPJwA9kX5MlLJkLlinDLe84msQiNU0fm9nSzGzUgSMZYQM2pduvvuodnlCMwq7iZbDM6b501cUw==
X-Received: by 2002:a37:a9c9:: with SMTP id s192mr31575129qke.311.1637352453064;
        Fri, 19 Nov 2021 12:07:33 -0800 (PST)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-298c-b356-0e05-d708.res6.spectrum.com. [2603:6081:7b01:cbda:298c:b356:e05:d708])
        by smtp.gmail.com with ESMTPSA id a15sm449764qtb.5.2021.11.19.12.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 12:07:32 -0800 (PST)
Date: Fri, 19 Nov 2021 15:07:30 -0500
From: "Tom Rini" <trini@konsulko.com>
To: "Siraswar, Yogesh" <yogeshs@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] wic: revert grub-efi patch
Message-ID: <20211119200730.GJ24579@bill-the-cat>
References: <20211119022952.6588-1-yogeshs@ti.com>
 <20211119024657.GK18191@denix.org>
 <20211119163446.GH24579@bill-the-cat>
 <c1d39f6a-118d-2d85-33d6-53f892d0a353@ti.com>
MIME-Version: 1.0
In-Reply-To: <c1d39f6a-118d-2d85-33d6-53f892d0a353@ti.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-Groupsio-MsgNum: 14207
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="paUsNmnSj6sSerQY"
Content-Disposition: inline

--paUsNmnSj6sSerQY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 12:42:52PM -0600, Siraswar, Yogesh wrote:
>=20
>=20
> On 11/19/2021 10:34 AM, Tom Rini wrote:
> > On Thu, Nov 18, 2021 at 09:46:57PM -0500, Denys Dmytriyenko wrote:
> > > +Tom
> > >=20
> > > On Fri, Nov 19, 2021 at 02:29:52AM +0000, Yogesh Siraswar via lists.y=
octoproject.org wrote:
> > > > Revert "conf/machine: k3: Enable grub-efi by default in wic images"
> > > >=20
> > > > This reverts commit d0b09833b44fa23cce86fd99dd8ca6631c61c476.
> > >=20
> > > It is customary to provide a reason for revert.
>=20
> This is causing boot issue with WIC images. Didn't get much time debug

Well, you need to go and do that.  WIC images were working here when I
posted the changes, for EFI.  I believe supporting anything that's not
"run distro_bootcmd" is also not intended to be supported?

--=20
Tom

--paUsNmnSj6sSerQY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGYA/8ACgkQFHw5/5Y0
tyyKYAwAmYplZqyodJNT14oo8SUuuI7Dw2EyqlaTrrs2RG2d8ep3oEJoGFlgDKku
ZhNLBOTK3601Dk2244tSaQKyLILEjWV2uEzQwRBp4mgE+mmvWB3t2wUeG5K9V7Hl
6F7ndVkC9A2ZY/JwQWGIxjCoj/pQpqYYQZuTrjrYFfkXW/fXfae6fvpngUmXi1wX
8MGWFVJ5BUS11/5MPH1FGytdwq2jx8xdyAzE9px6Q+ninDvdL5D3tFPJlJbOHDlh
DJfFWJdk8O8ejuJUswA/u260g6bN7Opi5qPqpD++Drk5DkEiC6gpLy9U+UoTC6WS
8OilJneq/RPSOQ0O70QnjnOfWcrXRzCAmpYIPqzRaMuVMORGZjFW8tmItT335ejC
YAfmt0woyTkhb4M8mqGIUldFfrB/6DmrZ2P57Grd+BS1DK/cLhdSzH3I06lUci4j
XT6QvTRerf0u8Ach+k5XuRsnbElJKn/aMipEFEOELDJzFucp/SZH/oo+SFhLRLPI
I1Zz3yus
=gPcX
-----END PGP SIGNATURE-----

--paUsNmnSj6sSerQY--
