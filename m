Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B5C1E0030B
	for <meta-ti@yoctoproject.org>; Mon, 12 Mar 2012 03:50:51 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so3175148wib.11
	for <meta-ti@yoctoproject.org>; Mon, 12 Mar 2012 03:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=THZhSQw6Ho9naZraSKv4Ql36LAEtDD0nkxwpDjarHII=;
	b=LZxkyvaZh9H8OCkpB6h1J9WGVEfJaYESEkiZolE3rsYYSs/ps8FFWn2B+jnDBDYhJy
	ILiAwo7U7oZ68tcp0OU5Q95dpCVljtWPb6hHm07bF6LUn51D+BBGcLTPWhkV6eXvlHdt
	okl486Bx6jE0ibxVFfI3MRy4gV+vbKW/fYWts0uv6Eg6khMTh1amCCMzRw6wjbfCW6O+
	3KLYkbLSRUEABgX5+M2LL4UMQH2xgthCSJ/hj1bHEg/iggfZgtbTrFL94t9vlFVERkcw
	gc8WQb6jYD3ziROGwdjd0KXJBUiN7huD71mOi3gc2qtlDDuWJ3lPrO5oyzzRYcy0GZxF
	+W4w==
Received: by 10.180.76.74 with SMTP id i10mr23712911wiw.2.1331549450624;
	Mon, 12 Mar 2012 03:50:50 -0700 (PDT)
Received: from [10.89.64.178] ([84.241.204.50])
	by mx.google.com with ESMTPS id 9sm56587283wid.2.2012.03.12.03.50.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Mar 2012 03:50:49 -0700 (PDT)
References: <1331544485-5050-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1331544485-5050-1-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <24D385C8-FC9D-4891-98E3-A1C49F6241FF@dominion.thruhere.net>
X-Mailer: iPhone Mail (9B179)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 12 Mar 2012 11:50:41 +0100
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQkW4Oq4p8Bn1N8uUPFQ0+IhX/Sp/d6oFSm3Z3b1247MkA/X64Tyfvqs+5BdZ6ULEUtbVqqi
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-eula-unpack: throw error message in case 32bit-glibc is missing
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
X-List-Received-Date: Mon, 12 Mar 2012 10:50:52 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

Op 12 mrt. 2012 om 10:28 heeft Andreas M=C3=BCller <schnitzeltony@googlemail=
.com> het volgende geschreven:

> TI installation tool requires 32bit glibc [1]
>=20
> [1] https://lists.yoctoproject.org/pipermail/meta-ti/2012-January/000357.h=
tml
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
> recipes-ti/includes/ti-eula-unpack.inc |    8 ++++++++
> 1 files changed, 8 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/=
ti-eula-unpack.inc
> index 7c6e7b7..310d19f 100644
> --- a/recipes-ti/includes/ti-eula-unpack.inc
> +++ b/recipes-ti/includes/ti-eula-unpack.inc
> @@ -19,6 +19,14 @@ python ti_bin_do_unpack() {
>=20
>     import os
>=20
> +    # InstallJammer requires 32bit version of glibc
> +    lib32path =3D '/lib'
> +    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path=
.islink('/lib') ):
> +       lib32path =3D '/lib32'
> +    if not os.path.exists('%s/libc.so.6' % lib32path):
> +    raise bb.build.FuncFailed, \
> +        "\nTI installer requires 32bit glibc libraries for proper operati=
on e.g on Fedora run 'yum install glibc.i686'"
> +
>     localdata =3D bb.data.createCopy(d)
>     bb.data.update_data(localdata)
>=20
> --=20
> 1.7.6.5
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

