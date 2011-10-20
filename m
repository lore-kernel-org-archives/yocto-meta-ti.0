Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD009E00B11
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2011 00:19:26 -0700 (PDT)
Received: by mail-ey0-f176.google.com with SMTP id 5so3398295eyh.35
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2011 00:19:26 -0700 (PDT)
Received: by 10.14.4.160 with SMTP id 32mr1280213eej.234.1319095166477;
	Thu, 20 Oct 2011 00:19:26 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v3sm9490885eej.7.2011.10.20.00.19.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 00:19:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319093946-26283-1-git-send-email-joelagnel@ti.com>
Date: Thu, 20 Oct 2011 09:19:23 +0200
Message-Id: <23446F46-BF60-4AD1-9788-7C324D3D3DD1@dominion.thruhere.net>
References: <1319093946-26283-1-git-send-email-joelagnel@ti.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: Re: [Angstrom-devel] [PATCH v2 meta-ti] sdcard_image: Copy user.txt/uEnv.txt if it exists in /boot
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
X-List-Received-Date: Thu, 20 Oct 2011 07:19:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 08:59 heeft Joel A Fernandes het volgende =
geschreven:

> Fixed a bug where the U-boot environment files are not copied to the =
boot partition if they
> were installed in /boot by other recipes.
>=20
> We should copy the uEnv.txt and user.txt always without placing a =
condition for the presence
> of anything else in /boot. This is the original behavior of =
sdcard_image before the recent
> wave of changes to it.
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> v2:
> Updated commit summary

applied, thanks!=

