Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1160E00746
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 05:09:36 -0800 (PST)
Received: by wibhq7 with SMTP id hq7so1307498wib.35
	for <meta-ti@yoctoproject.org>; Sun, 04 Mar 2012 05:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.133.93 as permitted sender)
	client-ip=10.216.133.93; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.133.93 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.133.93])
	by 10.216.133.93 with SMTP id p71mr4576871wei.10.1330866575534
	(num_hops = 1); Sun, 04 Mar 2012 05:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sT5Hpd5mB0zqvUN9j0mi7sW5OPsCtaZIXAYbUT6uwHE=;
	b=VpnG8l4GXqD8d66FZ+8P6XBh4xg4lMBUJGCakcFNhR9YVbTnTO0gkwqICP6idOruLV
	1D8QDInVqbHJ6BEH3UYQrr2dnBro9Uca5TgPBNWfrHpC5o56Esf6AsAsJhEXhUgzsLC4
	n/RVLzBHXJonVHdl0ew+ttZFWttBohIEYxd4Hew/yllKSoScOtBM+kWNOyjJkzYQtpFd
	NrqDlj/mm9ZaVfUm12H4U09jk5uksd99RY/Pwwz1R5GL2ZrTeDgmdQ3//bGdSRIMAi9J
	imBKSeW2/w7WRYAAjDVHZL20nhQOGaypwAha6vkEVpgirH/ZJ5yfBIH7CLm/NHktvPOk
	yFyQ==
Received: by 10.216.133.93 with SMTP id p71mr3666216wei.10.1330866575340;
	Sun, 04 Mar 2012 05:09:35 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cc3sm44410232wib.7.2012.03.04.05.09.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 05:09:34 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F5367ED.1060903@mlbassoc.com>
Date: Sun, 4 Mar 2012 14:09:30 +0100
Message-Id: <7AB88097-7498-4BEE-879A-D24894A4CB36@dominion.thruhere.net>
References: <4F5213E8.50108@mlbassoc.com>
	<89B59491-7BDB-4A5D-BDC0-D4E3863E417B@dominion.thruhere.net>
	<4F5367ED.1060903@mlbassoc.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnJqQmx54OaEwFq34+yurPrIQxHFFbNCdUFH0H8HCVewL/ZzH7URNgr+3P/eq5pqmi34flG
Cc: meta-ti@yoctoproject.org
Subject: Re: [Angstrom-devel] Can't build cloud9 image
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
X-List-Received-Date: Sun, 04 Mar 2012 13:09:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mrt. 2012, om 14:02 heeft Gary Thomas het volgende geschreven:

> On 2012-03-04 05:46, Koen Kooi wrote:
>>=20
>> Op 3 mrt. 2012, om 13:51 heeft Gary Thomas het volgende geschreven:
>>=20
>>> OE Build Configuration:
>>> BB_VERSION        =3D "1.15.1"
>>> TARGET_ARCH       =3D "arm"
>>> TARGET_OS         =3D "linux-gnueabi"
>>> MACHINE           =3D "beaglebone"
>>> DISTRO            =3D "angstrom"
>>> DISTRO_VERSION    =3D "v2012.03-core"
>>> TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
>>> TARGET_FPU        =3D "vfp-neon"
>>> meta-angstrom     =3D =
"master:2129eed920364abcc4f3f72d395333a041634e26"
>>> meta-oe
>>> meta-efl
>>> meta-gpe
>>> meta-gnome
>>> meta-xfce
>>> meta-initramfs    =3D =
"master:fdff8697ea2db6254d26510adb7d11e6352d950f"
>>> meta-opie         =3D =
"master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
>>> meta-java         =3D =
"master:d430de31c167cd264be74a1d82af4b732bb915dd"
>>> meta-mozilla      =3D =
"master:5737d9fa26a632a27b2aa760c0d01190f0a17d0e"
>>> meta-ti           =3D =
"master:020b6f893d13e36bccd7a2d8e6a0e6ab5e602450"
>>> meta-efikamx      =3D =
"master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
>>> meta-nslu2        =3D =
"master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
>>> meta-htc
>>> meta-nokia
>>> meta-openmoko
>>> meta-palm         =3D =
"master:cda19686a2a3573ce50c86733c3469d926124995"
>>> meta-handheld     =3D =
"master:fa1e6dcb524eb7ed29a6cd971a150d35c31e96e7"
>>> meta-intel
>>> meta-sugarbay
>>> meta-crownbay
>>> meta-emenlow
>>> meta-fishriver
>>> meta-jasperforest
>>> meta-n450         =3D =
"master:df18b721f86f0737c0f302e49b27ea232c70e683"
>>> meta              =3D =
"master:b24d4bcde21b013e48eaffea5f3a70d8b1df1047"
>>>=20
>>> Building of cloud9-image ends up with this error:
>>>  /etc/fstab entries need to be created with the user flag for the =
loop devices like:
>>>  /dev/loop2 =
/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angst=
rom-linux-gnueabi/cloud9-image-1.0-r0/tmp-mnt-boot vfat user 0 0
>>>=20
>>> My host is Fedora-16 (i386)
>>>=20
>>> How do I solve this so I can build the full cloud9-image?
>>=20
>> At the risk of responding to a practical joke: /etc/fstab entries =
need to be created with the user flag for the loop devices, the error =
message even includes the exact entry you need to add.
>=20
> I see that, but what if I'm "Joe user" who can't (or doesn't want to)
> edit /etc/fstab?

Then you can't build this image.

>  Everything else builds with no special "root" style
> privileges, why does this one image need it?

Simply put: because the tools suck. A this point in time there is no =
tool (or tools plural) that allows creating 2 partitions (vfat and extX) =
and concatenating them into a valid image with an MBR. The biggest lack =
is something like 'genfatfs', mcopy is a step in the right direction but =
is too limited to work in this scenario.
And genext2fs will likely OOM on a lot of buildmachines.

>  Also, what if I build
> in another tree/path?  Now, I have to edit /etc/fstab again?

Correct, it's the gift that keeps on giving :(

Anyway, why are you posting this to the angstrom list? The cloud9 recipe =
and offending bbclass live in meta-ti.=

