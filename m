Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82FEDE0070B
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 22:31:52 -0700 (PDT)
Received: by eekb45 with SMTP id b45so182922eek.35
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 22:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=vb9CBm58yfWQxDdeKmarvwHB8YDOEwC7b6AA0CIDtpI=;
	b=fL0CWgQllVIS23K+HZ5EFvOv8TNNFszztqH0t6S3OlTcCcz6pP5dg1heZAreef+kvN
	5UAeqZoILOqnEGPGuCFLU/XlBgdSyXvtxuNJ09zqHsEBlBLh3A/xbCNfqeMdpy2beUMl
	p2SZdJrESb2QFfhJKA0IfK5gH/fOhS16be9EJM2PulUs7T3I5pMB/8xFdMBmks46uH/F
	oBNLXb8bITGnQkxtixqEfYCcJX1J80UNLJg8RpNJX/Hn3QjsQT2Cl9kLZgiHX/KfGlkR
	K6JU6gwJl4tRp6ZeZvFiRy48Bspod5UhRvGaOGMfMKKDxr5VzYdu9boQILAIf9ivfm+W
	605A==
Received: by 10.14.47.9 with SMTP id s9mr2661158eeb.132.1338442310998;
	Wed, 30 May 2012 22:31:50 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f16sm6312308eec.2.2012.05.30.22.31.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 22:31:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1338416335-4453-1-git-send-email-denis@denix.org>
Date: Thu, 31 May 2012 07:31:47 +0200
Message-Id: <3AC869F5-7396-4906-9BDA-D673F2292CD1@dominion.thruhere.net>
References: <1338416335-4453-1-git-send-email-denis@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlUAt5xv1yP6gz56Phh63NaEixoocVdWmMFT2/y4uojxP8HtxShqDCXlJAz0PoPX+OstxGe
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] tipspkernel: add extra level to FILESPATH with major version in the name
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2012 05:31:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 mei 2012, om 00:18 heeft Denys Dmytriyenko het volgende =
geschreven:

> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Add PMV variable to contain major version by extracting first 2 =
numbers from PV
> Insert new level to FILESPATH - PN-PV-PR:PN-PV:PN-PMV:PN:files:.
> Allow keeping patches and configs generic for the series (i.e. 3.2) =
while
> incrementing stable releases (i.e. 3.2.18)
> Drop use of BP and BPN, as they don't change for the kernel
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Koen Kooi <koen@circuitco.com>

> ---
> recipes-kernel/linux/tipspkernel.inc |   19 +++++++++++++++++--
> 1 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/tipspkernel.inc =
b/recipes-kernel/linux/tipspkernel.inc
> index c23fa57..ba93530 100644
> --- a/recipes-kernel/linux/tipspkernel.inc
> +++ b/recipes-kernel/linux/tipspkernel.inc
> @@ -1,11 +1,26 @@
> # Include this file for kernel recipes that need to handle different =
defconfigs
> # and apply patches based on "tipspkernel" DISTRO_FEATURES
>=20
> +def get_major_pv(p):
> +	import re
> +	r =3D re.compile("([0-9]+\.[0-9]+).*")
> +	m =3D r.match(p);
> +	if m:
> +		return m.group(1)
> +	return None
> +
> +PMV =3D "${@get_major_pv(d.getVar('PV', True))}"
> +
> +# First of all, set own FILESPATH avoiding unnecessary BP and BPN, =
but adding
> +# extra level of major version
> +FILESPATH =3D "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", =
"${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}-${PMV}", \
> +"${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" =
], d)}"
> +
> # We don't want "tipspkernel" to be another OVERRIDE, but rather a new =
level of
> # FILESPATH with all the OVERRIDES applied to it
> CONFIGS_PSP =3D =
"${@base_set_filespath(["${FILE_DIRNAME}/${PF}/tipspkernel", =
"${FILE_DIRNAME}/${P}/tipspkernel", \
> -"${FILE_DIRNAME}/${PN}/tipspkernel", =
"${FILE_DIRNAME}/${BP}/tipspkernel", =
"${FILE_DIRNAME}/${BPN}/tipspkernel", \
> -"${FILE_DIRNAME}/files/tipspkernel", "${FILE_DIRNAME}/tipspkernel"], =
d)}:"
> +"${FILE_DIRNAME}/${PN}-${PMV}/tipspkernel", =
"${FILE_DIRNAME}/${PN}/tipspkernel", =
"${FILE_DIRNAME}/files/tipspkernel", \
> +"${FILE_DIRNAME}/tipspkernel"], d)}:"
>=20
> # When "tipspkernel" is ENABLED, prepend additional set of directories =
to FILESPATH
> FILESPATH =3D. "${@base_contains('DISTRO_FEATURES', 'tipspkernel', =
"${CONFIGS_PSP}", "", d)}"
> --=20
> 1.7.8.6
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


