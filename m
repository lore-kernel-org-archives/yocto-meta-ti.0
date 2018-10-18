Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1257DE00994; Thu, 18 Oct 2018 07:09:07 -0700 (PDT)
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
	*      [209.85.160.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7AAEE00971
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2018 07:09:05 -0700 (PDT)
Received: by mail-qt1-f195.google.com with SMTP id l9-v6so34323345qtf.5
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2018 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7DXOnhHyhXqIZXkgaIphUZ7QfZukdDwHRb183fFiPsM=;
	b=GnXtWNB28T/tBLnF/OuC9WnpUGmumE1//FhJLddAjiXIaGcn9rsxo+CjdOIDjm+EBV
	eSyvfbajv49KP4bOcSkK0UdGbZ8DoUQHvmp0iWP1T3zH0PRp0miHh70oj6hl5f91mos7
	EM6kBa8XIvfQQkLB50sehpsjOH/BjMWCqWbMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7DXOnhHyhXqIZXkgaIphUZ7QfZukdDwHRb183fFiPsM=;
	b=Tw1pHC76vO/RsCf3/yXfxX2yaHR7jeKGzTkNvy3vgdO+pVlPTlOj6ky1tGmAAZ3n9p
	rhvXlLpj++gny0AaR1pYokzYoOEkqJ/T69iYeUimoQsFOO3SD9wf4FCx8rRPPL3MK8yt
	FkRnxXK+rWj1VBBHvvdFKJjUiTnsTQiT5inUvbw6GununRZMVjzf8zq6Fa0ZGdFF7FOq
	aDNseLvIfxUM2q0f3jBDmLmQiM3YtWEpYs1d9aV87GVyTU3F+cfrXplNvNE+JaCV1UXQ
	g5MHJHww/Cv6MZMgZZgaBCr3LQ/J+idMG5xan1dyGqWcWu1EO6yMw/jmfiU/hYWdCmbt
	RYPQ==
X-Gm-Message-State: ABuFfohvpK7Tz+Wi9eo1lo0kgB+A8cQIasv5c+3Epx7Euuxodt5wNgVw
	N9CUVk/Qhso2dg4QYPJcBA5R4w==
X-Google-Smtp-Source: ACcGV623SWEHZMw3yoMxIPZne5gS+SoIF2zUnnUxSU5/+OJ7RVI/e4ULQDgiIXVNf11hKukeiLLaNw==
X-Received: by 2002:a0c:c487:: with SMTP id u7mr18275237qvi.152.1539871744758; 
	Thu, 18 Oct 2018 07:09:04 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm3471698qkx.93.2018.10.18.07.09.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Oct 2018 07:09:03 -0700 (PDT)
Date: Thu, 18 Oct 2018 10:09:00 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181018140900.GZ1032@bill-the-cat>
References: <20181018054946.22407-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181018054946.22407-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: Alawys build with disabled PIE
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
X-List-Received-Date: Thu, 18 Oct 2018 14:09:07 -0000
X-Groupsio-MsgNum: 11444
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BkCcXYe/IK2urb/q"
Content-Disposition: inline

--BkCcXYe/IK2urb/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 10:49:46PM -0700, Khem Raj wrote:
> some OE distros can default to hardened toolchains which means PIE is
> added implicitly to compiler cmdline, here this options makes sure that
> whattever the default toolchain are, u-boot is not impacted
>=20
> Fixes errors e.g.
>=20
> | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit=
 in region `.sram'
> | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../0001-Always-build-with-fno-PIE.patch      | 35 +++++++++++++++++++
>  .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 recipes-bsp/u-boot/files/0001-Always-build-with-fno-P=
IE.patch
>=20
> diff --git a/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patc=
h b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
> new file mode 100644
> index 00000000..dfd99c66
> --- /dev/null
> +++ b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
> @@ -0,0 +1,35 @@
> +From ec81bbe3ea7e077512f4b9d2b4aa87e7f1494bcc Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 17 Oct 2018 22:32:57 -0700
> +Subject: [PATCH] Always build with -fno-PIE
> +
> +GNU Toolchains can be configured to generate PIE by default
> +while PIE could be ok, it is known that u-boot/SPL on ARM starts to
> +generate bigger code and starts to overflow the SRAM size, therefore
> +disabling PIE explcitly insulates against toolchain intrinsic defaults
> +
> +Fixes errors like
> +| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fi=
t in region `.sram'
> +| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Cc: Tom Rini <trini@konsulko.com>
> +---
> + Makefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 45cd751ba3..9eb8ac564e 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -592,6 +592,7 @@ KBUILD_CFLAGS	+=3D -O2
> + endif
> +=20
> + KBUILD_CFLAGS +=3D $(call cc-option,-fno-stack-protector)
> ++KBUILD_CFLAGS +=3D $(call cc-option,-fno-PIE)
> + KBUILD_CFLAGS +=3D $(call cc-option,-fno-delete-null-pointer-checks)
> +=20
> + KBUILD_CFLAGS	+=3D -g
> +--=20
> +2.19.1
> +
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bs=
p/u-boot/u-boot-ti-staging_2018.01.bb
> index cbb8857a..c9c97111 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> @@ -5,3 +5,5 @@ PR =3D "r24"
>  BRANCH =3D "ti-u-boot-2018.01"
> =20
>  SRCREV =3D "2cc52408bf1357f11b96548e78223a1df321c1ae"
> +
> +SRC_URI +=3D "file://0001-Always-build-with-fno-PIE.patch"

So does this end up being something that is appropriate to push
upstream?  Thanks!

--=20
Tom

--BkCcXYe/IK2urb/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbyJP8AAoJEIf59jXTHXZSCLcP+wbXoBm3ZkdbMO+WYCj+V9id
I/j4E9x5aSPuLptvodLcCBUrP9piMRbuCN/aZ9YAgimuZdouTXU2+q8v1AgWXEby
CzE48Q1sWnwPG1ohbOfacZpGUEycO7D3U8QGs0r6N66fHQyHMqRvFyA8G6LcMUfK
6X9wRuLDJBXdSuAoSjtDmw+ZPS6kPyb01aULBZ4UCMB7uOjeFdF++1/XdTWLOYyb
A3RgemYAeeaI/24++JYr/BNoTZNMj7buo0FE9ePIcRinnOQFw1x3TKW70ShYCn9W
VPsx2wfusyBTNyDcY2QBHqnbrkJCYkz16f6w3bwZNKMqzOa53PWNbi2aOhM/Ix5m
JzJCQ+dvWjVgxD5XUBu6VU8uKPtAo8DTeytXhfmlizQcPvn5Y2UDUWNNj8WD0LWY
ezkMs94sLzxuMJuzlETBlutMk1fdvNtEOz96W6RRDfag2eICnCzJp3SQXBJUPT6i
vLm54ifo4Gwz7PvU5vDyl3NcOPDYzFCvTJFNVLarXLVN90hFvGsjhQ7Xyi3h8St3
dkpYOxXshFgWjOlJ0IT4aeMCkhZia/gDzE4iR8UWVUleIh+Aymz6EjgqDAXknRny
ykK4Laymo2s06h1kIRZ2DGN/z3xxKxuFTzB7AvD8Q38pT4PMLnHS5ec5TUyzXVBD
CqLGgjKolhnUaQ9Z37/j
=SE+M
-----END PGP SIGNATURE-----

--BkCcXYe/IK2urb/q--
