Return-Path: <koen@dominion.thruhere.net>
Received: from mail-vx0-f176.google.com (mail-vx0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A754E00309
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 05:47:28 -0800 (PST)
Received: by vcbfl13 with SMTP id fl13so2689587vcb.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 05:47:27 -0800 (PST)
Received: by 10.220.191.67 with SMTP id dl3mr2653213vcb.96.1322574447309;
	Tue, 29 Nov 2011 05:47:27 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p17sm23973363vdj.4.2011.11.29.05.47.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 05:47:23 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322539316-26560-1-git-send-email-joelagnel@ti.com>
Date: Tue, 29 Nov 2011 14:47:21 +0100
Message-Id: <51C58A56-6DFE-42C2-BCAC-9395A67F68AF@dominion.thruhere.net>
References: <1322539316-26560-1-git-send-email-joelagnel@ti.com>
To: Joel A Fernandes <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org, Matt Porter <mporter@ti.com>
Subject: Re: [PATCH] linux-ti33x-psp 3.1: ADC support for beaglebone
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
X-List-Received-Date: Tue, 29 Nov 2011 13:47:28 -0000
X-Groupsio-MsgNum: 171
Content-Type: multipart/signed;
	boundary="Apple-Mail=_233457ED-3F84-4E44-B048-A276C40B0242";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_233457ED-3F84-4E44-B048-A276C40B0242
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 29 nov. 2011, om 05:01 heeft Joel A Fernandes het volgende geschreven:

> First 3 patches are cherry picks from PSP.
> Next 6 add support for gen purpose adc, MFD support, sysfs triggering etc.
> 
> Currently:
> cat /sys/bus/platform/tsc/ain* will trigger sampling
> Output will goto kernel logs.
> This is due to a small bug preventing synchronizing the sysfs readers
> with the adc interrupt.

This would seem to be s showstopper judging from your comments. 

> TODO list:
> 1. IIO driver support
> 2. Sysfs readers synchronizing with interrupt handler
> 
> The patchset will be updated continuously.

Do you want to have this applied or do you want to spin a v2 with more fixes?

regards,

Koen

--Apple-Mail=_233457ED-3F84-4E44-B048-A276C40B0242
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7U4mkACgkQMkyGM64RGpE26wCdH+jaxASjhUwGzBJm+iuoVDMx
6vcAn2ilBr3Uj+AdjAIjl3z+enb2icLd
=XBpL
-----END PGP SIGNATURE-----

--Apple-Mail=_233457ED-3F84-4E44-B048-A276C40B0242--
