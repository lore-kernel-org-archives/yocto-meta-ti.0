Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A0F0E0044A
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 23:46:31 -0700 (PDT)
Received: by weyr3 with SMTP id r3so236876wey.35
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 23:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=DVlQHpodbtt/2OPvPGZTwZh9jmkth4OPoXECfystnpw=;
	b=Mqymn3SDC3yJRJjvFIZ7BSvAt4mDmecdwYCwjRIgfbqYRBR+Iz+5eJlesuCyV3iIcT
	naLIzg05FOZ5BNTzVXescdDlMZOSOIt2w8VNzHrEhLW4rczeORCly2S1Q8dFnJR+Y/UQ
	2DuQwYnhf3gluW0FssjhKE22X+6iPujEWpu9T76DcVwaqH0Hd5JUo/CAN4ItnkFg8UcO
	Z6IIInrIAdoWmbbMUvBveevnVzovG9i2HCUlJ/c9Nmtf2uVuueG/0Lf+LKEoFCHpymHH
	hTNy0giminBMU+VXQkvrf3psDJxK1mj5erF5w7b59e2CrZqVfjhr/BvOmi2crHashrq9
	HSLQ==
Received: by 10.180.104.168 with SMTP id gf8mr4575070wib.12.1336718789989;
	Thu, 10 May 2012 23:46:29 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h8sm13988307wix.4.2012.05.10.23.46.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 23:46:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336704080-23643-1-git-send-email-denis@denix.org>
Date: Fri, 11 May 2012 08:46:24 +0200
Message-Id: <F63AF365-5587-4FDC-A8CC-F47BD2E01DB8@dominion.thruhere.net>
References: <1336704080-23643-1-git-send-email-denis@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkL4uFCnRJ/SdzDXocO+i89eSEU6QtSYHPOy2ouE39rDkeLK4odvGVxv9zkMnEOs4Vx+ndD
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] linux-ti33x-psp 3.2: avoid gold linker for Thumb2 kernel
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
X-List-Received-Date: Fri, 11 May 2012 06:46:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2012, om 04:41 heeft Denys Dmytriyenko het volgende =
geschreven:

> From: Denys Dmytriyenko <denys@ti.com>
>=20
> BeagleBone kernel is required to be built in Thumb2 mode for fast =
boot.
> Gold linker is not yet perfect for this, giving an internal error:
>=20
> | arm-linux-gnueabi-ld: internal error in thumb_branch_common, at =
.../binutils-cross-2.22-r6/binutils-2.22/gold/arm.cc:4149
>=20
> While this fix can be put in generic linux.inc for all the kernels, =
it's
> better to test the Gold linker out as much as possible and only =
disable it
> for known issues, like this one (until it gets fixed, of course).
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Looks good to me.=

