Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55921E0074A
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 00:50:46 -0800 (PST)
Received: by werc1 with SMTP id c1so1406643wer.35
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 00:50:45 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.101.37 as permitted sender)
	client-ip=10.180.101.37; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.101.37 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.101.37])
	by 10.180.101.37 with SMTP id fd5mr18743029wib.1.1330332644996
	(num_hops = 1); Mon, 27 Feb 2012 00:50:44 -0800 (PST)
Received: by 10.180.101.37 with SMTP id fd5mr14740985wib.1.1330332644940;
	Mon, 27 Feb 2012 00:50:44 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s4sm44499684wiy.5.2012.02.27.00.50.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 00:50:43 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
Date: Mon, 27 Feb 2012 09:50:44 +0100
Message-Id: <3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
To: <Christian.Schulenberg@bmw.de> <Christian.Schulenberg@bmw.de>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn363ROlJsBO3i9re28Y1jEorX5znFR1rW5qV9mDJaMl1+7dKswyotv2j/6HzJPznaQgPCK
Cc: meta-ti@yoctoproject.org
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Mon, 27 Feb 2012 08:50:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 feb. 2012, om 09:26 heeft <Christian.Schulenberg@bmw.de> =
<Christian.Schulenberg@bmw.de> het volgende geschreven:

> I already added to following line to my local.conf:
> =20
> BBMASK =3D ".*/meta-ti/recipes-misc/"
> =20
> which helps to bypass the first build problem. The next show stopper =
is building the boot loader (denx version of u-boot):
> =20
> clocks.c:415:13: internal compiler error: in decode_addr_const, at =
varasm.c:2632
> =20
> This seems to be a problem with the used version of gcc. I guess there =
are two ways to work around this: Use older version of gcc (4.5) or =
change compiler optimization from -Os to -O0. Unfortunately, neither can =
I find the right place to switch from gcc 4.6 to 4.5, nor the place to =
change compiler flags.

Have you read the README in the meta-ti layer yet? That explains how to =
setup a working environment.

regards,

Koen=

