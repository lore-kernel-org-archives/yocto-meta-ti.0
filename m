Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1BD9E01376
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:39:23 -0700 (PDT)
Received: by wwe5 with SMTP id 5so7581676wwe.11
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:39:22 -0700 (PDT)
Received: by 10.216.180.8 with SMTP id i8mr76926wem.26.1319438362162;
	Sun, 23 Oct 2011 23:39:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id es5sm37073654wbb.11.2011.10.23.23.39.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Oct 2011 23:39:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
Date: Mon, 24 Oct 2011 08:39:15 +0200
Message-Id: <6624351A-B53A-42B5-B693-DF76F4BB5A38@dominion.thruhere.net>
References: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
To: Joel A Fernandes <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org, jdk@ti.com
Subject: Re: [PATCH meta-ti 0/3] Update linux-ti33x-psp and beaglebone-tester to latest, add EEPROM patches.
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
X-List-Received-Date: Mon, 24 Oct 2011 06:39:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 okt. 2011, om 05:59 heeft Joel A Fernandes het volgende =
geschreven:

> Please apply these 3 patches which apart from other things also fixes =
the kernel build and adds EEPROM support.
>=20
> All changes have been build and runtime tested.
>=20
> Thanks!
>=20
> Joel A Fernandes (3):
>  sdcard_image: Copy uEnv.txt once again as the new bonetester also
>    checks for GPIO grounding
>  linux-ti33x-psp 3.1rc8: Update to latest SRCREV, add EEPROM patches
>  beaglebone-tester: Update to latest and bump PR

I did the uEnv change a bit different, but in the end all the above =
changes are in.

regards,

Koen=

