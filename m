Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f176.google.com (mail-qy0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3E29E0072A
	for <meta-ti@yoctoproject.org>; Wed, 14 Dec 2011 06:38:39 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qcsc2 with SMTP id c2so647304qcs.35
	for <meta-ti@yoctoproject.org>; Wed, 14 Dec 2011 06:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=QiZpBffL7IABstPp3u4mgrNViQuRt7rFDSLyFvaAO38=;
	b=Hisgv6Q7T68AZY6NDi2+1lkL4k8xEuWK8d4MKoQOfZIPnfZiS/R54OIdSZja6oPzR4
	5DM6ulPpxSehByeK8eEzfyNKmRP1iXgMSJEI3w+VgN1B8fgffs/mWToyVfhG9dQH/2wu
	DDt9a1RVyFLVSSfvXKHy2V8pzAg02xlNDeV80=
MIME-Version: 1.0
Received: by 10.224.198.10 with SMTP id em10mr9831119qab.44.1323873518772;
	Wed, 14 Dec 2011 06:38:38 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Wed, 14 Dec 2011 06:38:38 -0800 (PST)
In-Reply-To: <1323858401-15332-1-git-send-email-schnitzeltony@gmx.de>
References: <1323858401-15332-1-git-send-email-schnitzeltony@gmx.de>
Date: Wed, 14 Dec 2011 07:38:38 -0700
Message-ID: <CA+M6bXkBesXqv2qG-xFD8JJkTStiqb60xdNLET8NDr7qPYxthg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmx.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] omap3.inc: adjust UBOOT_ENTRYPOINT and UBOOT_LOADADRESS to u-boot SPL changes
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
X-List-Received-Date: Wed, 14 Dec 2011 14:38:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2011 at 3:26 AM, Andreas M=FCller <schnitzeltony@gmx.de> wr=
ote:
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@gmx.de>
> ---
> =A0conf/machine/include/omap3.inc | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.=
inc
> index 4530ae1..2198281 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -7,8 +7,8 @@ MACHINE_KERNEL_PR =3D "r113"
>
> =A0KERNEL_IMAGETYPE =3D "uImage"
>
> -UBOOT_ENTRYPOINT =3D "0x80008000"
> -UBOOT_LOADADDRESS =3D "0x80008000"
> +UBOOT_ENTRYPOINT =3D "0x80010000"
> +UBOOT_LOADADDRESS =3D "0x80010000"

NAK, it's 0x8010 0000 not 0x8001 0000.   And we should consider making
these soft-assign (and if there's a previous soft assign, make that
??=3D) as there's at least one board today that uses the old entry/load
and just moves other parts of SPL to non-conflicting areas.  That may
however change to just using the same areas as everyone else (not sure
if his platform requires backwards compat with x-loader).  Thanks!

--=20
Tom

