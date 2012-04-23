Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE071E00596
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2012 13:26:00 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so2825346wib.11
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2012 13:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=gEXlgkqeLEfQL23KawYDjX+EQ7yMPRt5nj/N/ysVbKg=;
	b=HpgYgu8iWh53/WROtY578gxvnFShiNM8Ku30dhERS9W/vBKhYgyZBZNwokchzCaNm7
	wuW1NbXCrrbTfFkeR9bfaUVkSFJl9JIa7gC39GqBtF271Vx/ZKTqO7cPCP+lRkjaWxi/
	paoYTFuSHzpPSQG7oOJePj+JNTruWNy9UI7ltVoOO3oOINMhYYKS+Dvqd7nHhGAci2EZ
	wTWQheD2ol9+kmMdT8cXbet1D9rmtwMd90WhgrN/2J5pP7aEI/UYihbCPOcdBy8WkfvR
	X38DP3r6ol6gjeSoOk4fyrFEhk4CPYv4zk7cf3et/csco9Z0RJEGq3zHNIEyTLjrlst+
	P/Aw==
Received: by 10.180.77.4 with SMTP id o4mr5109705wiw.17.1335212759197;
	Mon, 23 Apr 2012 13:25:59 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm24839183wie.9.2012.04.23.13.25.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Apr 2012 13:25:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334849614-12816-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 23 Apr 2012 22:25:55 +0200
Message-Id: <728BA01E-6B0C-4FCC-A30F-75B1923B054F@dominion.thruhere.net>
References: <1334849614-12816-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk38UV4Z+Ew67urzSYJhSm/ar5tEfKXtXgyLPncw3rXgi7sYjsFAxnvag1fKVAvPS9qVD4K
Subject: Re: [PATCH 1/2] cloud9-gnome-image: same as cloud9-image, but with GNOME added to it
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
X-List-Received-Date: Mon, 23 Apr 2012 20:26:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping on this one, the rest is already in :)

Op 19 apr. 2012, om 17:33 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> recipes-misc/images/cloud9-gnome-image.bb |   19 +++++++++++++++++++
> 1 files changed, 19 insertions(+), 0 deletions(-)
> create mode 100644 recipes-misc/images/cloud9-gnome-image.bb
>=20
> diff --git a/recipes-misc/images/cloud9-gnome-image.bb =
b/recipes-misc/images/cloud9-gnome-image.bb
> new file mode 100644
> index 0000000..13638d7
> --- /dev/null
> +++ b/recipes-misc/images/cloud9-gnome-image.bb
> @@ -0,0 +1,19 @@
> +# Image with cloud9 ide, gfx and hw tools installed
> +
> +require cloud9-image.bb
> +
> +# SoC specific packages, mostly 3D or multimedia related
> +SOCSUPPORT =3D ""
> +SOCSUPPORT_omap3 =3D "xbmc libgles-omap3-x11demos gstreamer-ti =
omapfbplay"
> +SOCSUPPORT_ti33x =3D "xbmc libgles-omap3-x11demos gst-ffmpeg mplayer2 =
beaglebone-capes"
> +
> +IMAGE_INSTALL +=3D " \
> +                  angstrom-task-gnome gimp abiword gedit midori =
epiphany firefox matchbox-terminal \
> +                  ${SOCSUPPORT} \
> +                  ttf-dejavu-sans ttf-dejavu-sans-mono =
ttf-dejavu-common \
> +                  xinput-calibrator \
> +                  xterm \
> +                 "
> +
> +export IMAGE_BASENAME =3D "Cloud9-IDE-GNOME"
> +
> --=20
> 1.7.2.5
>=20


