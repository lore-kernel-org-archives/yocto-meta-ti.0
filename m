Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pz0-f43.google.com (mail-pz0-f43.google.com
	[209.85.210.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4EADE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:02:03 -0800 (PST)
Received: by mail-pz0-f43.google.com with SMTP id c16so5319456dam.2
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:02:03 -0800 (PST)
Received: by 10.68.222.194 with SMTP id qo2mr49695047pbc.20.1329156123585;
	Mon, 13 Feb 2012 10:02:03 -0800 (PST)
Received: from [10.10.0.62] ([108.60.121.129]) by mx.google.com with ESMTPS id
	li19sm41281608pbb.17.2012.02.13.10.02.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:02:03 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1329151888-7525-3-git-send-email-trini@ti.com>
Date: Mon, 13 Feb 2012 10:02:01 -0800
Message-Id: <808A2E17-433C-4910-8D70-66DCC744491E@dominion.thruhere.net>
References: <1329151888-7525-1-git-send-email-trini@ti.com>
	<1329151888-7525-3-git-send-email-trini@ti.com>
To: Tom Rini <trini@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmNUC2ySBC80tzocFaoNEPyUZMSoY3qnF6+fzfUfBhXTAJ8DOqNGodn6+ekxrv3hsWvkJYA
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 3/3] u-boot git: Update omap3-touchbook for u-boot-fw-utils change
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
X-List-Received-Date: Mon, 13 Feb 2012 18:02:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 feb. 2012, om 08:51 heeft Tom Rini het volgende geschreven:

> Signed-off-by: Tom Rini <trini@ti.com>
> ---
> recipes-bsp/u-boot/u-boot_git.bb |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_git.bb =
b/recipes-bsp/u-boot/u-boot_git.bb
> index 5abb6f5..90527f6 100644
> --- a/recipes-bsp/u-boot/u-boot_git.bb
> +++ b/recipes-bsp/u-boot/u-boot_git.bb
> @@ -1,5 +1,5 @@
> require u-boot.inc
> -PR =3D"r67"
> +PR =3D"r68"
>=20
> DEFAULT_PREFERENCE =3D "-1"
> DEFAULT_PREFERENCE_ti814x =3D "-1"
> @@ -42,6 +42,7 @@ SRC_URI_omap3-touchbook =3D =
"git://gitorious.org/u-boot-omap3/mainline.git;branch=3D
> "
> SRCREV_pn-${PN}_omap3-touchbook =3D =
"d363f9cb0918a1b6b92e2e20d01543d0c4f53274"
> PV_omap3-touchbook =3D "2009.05+${PR}+gitr${SRCREV}"
> +RRECOMMENDS_omap3-touchbook =3D "u-boot-fw-utils"

RECOMMENS_${PN}_foo and move it below do_install=

