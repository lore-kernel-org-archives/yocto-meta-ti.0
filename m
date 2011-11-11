Return-Path: <pabigot@gmail.com>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B184E006AF
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 12:02:08 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wyg34 with SMTP id 34so7020285wyg.35
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 12:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=t3QaUpu7HsNttJ8WcBLejnEyJFGjEnmAP/3x+ySLum8=;
	b=Horl6NWJPv0WiKKsfKmywL9uV0nCwYsv02tTF9S5yIr5TAwcPJrNzW8AhcPOJAiVRl
	acSBL8jgQgxxYn+Bz3mOf56m2CEYpNM6h3KpQl8gTanyXfeQNgxDHtGJMr+cEjR9Lpmr
	A6IRF8zLrkMBnBt+Mw1/VMIwnoVBGwsCsvS8g=
MIME-Version: 1.0
Received: by 10.216.134.18 with SMTP id r18mr2471040wei.40.1321041727141; Fri,
	11 Nov 2011 12:02:07 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.30.200 with HTTP; Fri, 11 Nov 2011 12:02:06 -0800 (PST)
In-Reply-To: <DF9F3F54-64A1-467E-B9C1-BFD29A4AE722@dominion.thruhere.net>
References: <1321040836-29819-1-git-send-email-bigotp@acm.org>
	<DF9F3F54-64A1-467E-B9C1-BFD29A4AE722@dominion.thruhere.net>
Date: Fri, 11 Nov 2011 14:02:06 -0600
X-Google-Sender-Auth: ZRKYybpFi-iLo-mAuuzn-dwaFd8
Message-ID: <CAPOJ94PgPPcxmf08_9dSnCro1k1RS8SXrKc0yONRPEyxN4cqtA@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sdcard_image bbclass: correct MLO path in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Fri, 11 Nov 2011 20:02:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2011 at 1:51 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 11 nov. 2011, om 20:47 heeft Peter A. Bigot het volgende geschreven:
>
>> From: "Peter A. Bigot" <bigotp@acm.org>
>>
>> The symlink created by x-load.inc for MLO in ${DEPLOY_DIR_IMAGE} include=
s
>> ${MACHINE}.
>
> This will break SPL builds, a better idea would be to patch the xloader r=
ecipe to generate a MLO symlink as well. It's on my todo do fix xload, uboo=
t(spl) and kernel to generate ready-to-use link like uImage, MLO and u-boot=
.{img,bin}. If someone beats me to it, great :)

As far as I can tell nobody would ever put an unadorned "MLO" into the
deploy directory (vice the install directory, which does get plain
MLO), so I can't see how the else branch could ever have worked, at
least not for MACHINE=3Dbeagleboard.  Must be more hidden magic
somewhere.

Peter

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk69fLAACgkQMkyGM64RGpFITQCfWIupy+vIyAC4LrwvUKETwvPG
> hr4An3TRAFTEVNXi6uvnk8mjda6TY2Gl
> =3DuIzI
> -----END PGP SIGNATURE-----
>
>

