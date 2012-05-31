Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B11BE00723
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 22:32:13 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so182922eek.35
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 22:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=10dc+kpD8SGxkthihb/GmxD1zoCEWbqS+ce6FiwexM4=;
	b=bsXEBT5VqNT3I5OxbPpEBo1QkAOUyQo7xRVsWXp/ukmqgcsPquWLpYXuoCFOBEJKY8
	gH2Xe6xw/Htbe9DvQ/BOK2k8K7ZH/Xvowb6D0RzGqNbaRivY8fW0UChU8TXJzab7LnVV
	Ku2vmLyIqiXurKvcIPsqAudAT60/0gV1B8zuo4wMrti3xbvLj1VA8vgK/jwDsrxTrkhY
	3iZoKeZOexBy5TZRIKwxk/XtzSnSI6bJQcqbT6tk4rzVm5HuDuB36y8q2BA1bdZuD0YM
	sk5PgwF5kBTfWUeegC05TQ55SlUp2pDFgSRwklTrgn47CddWxeacZ1ajE8463HZXJTsf
	bwPw==
Received: by 10.14.47.74 with SMTP id s50mr7532311eeb.114.1338442332837;
	Wed, 30 May 2012 22:32:12 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f16sm6312308eec.2.2012.05.30.22.32.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 22:32:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1338416335-4453-2-git-send-email-denis@denix.org>
Date: Thu, 31 May 2012 07:32:10 +0200
Message-Id: <EC8E24EE-EB20-4E8F-A647-984592975583@dominion.thruhere.net>
References: <1338416335-4453-1-git-send-email-denis@denix.org>
	<1338416335-4453-2-git-send-email-denis@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkFlYIZXESzjpP5VNiKgz/ZWdA/QLJmgDiOhAResarlppA3d7nUbUn5DlcIHl/OAhWpM/5s
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 2/2] linux-ti33x-psp 3.2: set PV accordingly, when not using tipspkernel
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
X-List-Received-Date: Thu, 31 May 2012 05:32:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 mei 2012, om 00:18 heeft Denys Dmytriyenko het volgende =
geschreven:

> From: Denys Dmytriyenko <denys@ti.com>
>=20
> The patchset in PATCHES_OVER_PSP updates the kernel to 3.2.x, so make =
PV match.
> This doesn't need PR or MACHINE_KERNEL_PR bumps since both the kernel =
ABI and
> file locations remain the same.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Koen Kooi <koen@circuitco.com>


> ---
> recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb =
b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> index 38202fa..cd10044 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -10,6 +10,9 @@ S =3D "${WORKDIR}/git"
>=20
> MULTI_CONFIG_BASE_SUFFIX =3D ""
>=20
> +# the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
> +PV =3D "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", =
"3.2.18", d)}"
> +
> BRANCH =3D "v3.2-staging"
> SRCREV =3D "720e07b4c1f687b61b147b31c698cb6816d72f01"
> MACHINE_KERNEL_PR_append =3D "c+gitr${SRCREV}"
> --=20
> 1.7.8.6
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


